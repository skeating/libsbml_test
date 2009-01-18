#!/usr/bin/env python
#
# @file   swigdoc.py
# @brief  Creates documentation for Java, Python, and Perl.
# @author Ben Bornstein
# @author Christoph Flamm
# @author Akiya Jouraku
# @author Michael Hucka
#
# $Id$
# $HeadURL$
#
#<!---------------------------------------------------------------------------
# This file is part of libSBML.  Please visit http://sbml.org for more
# information about SBML, and the latest version of libSBML.
#
# Copyright 2005-2009 California Institute of Technology.
# Copyright 2002-2005 California Institute of Technology and
#                     Japan Science and Technology Corporation.
# 
# This library is free software; you can redistribute it and/or modify it
# under the terms of the GNU Lesser General Public License as published by
# the Free Software Foundation.  A copy of the license agreement is provided
# in the file named "LICENSE.txt" included with this software distribution
# and also available online as http://sbml.org/software/libsbml/license.html
#----------------------------------------------------------------------- -->*/

import sys, string, os.path, re

#
# Globally-scoped variables
#

docincpath = ''

#
# Methods
#

class CHeader:
  """CHeader encapsulates the C++ class and C function definitions
  found within a C header file.  It has the following public
  attributes:

    - classes
    - functions
  """

  def __init__ (self, stream):
    """CHeader (stream=None) -> CHeader

    Creates a new CHeader reading from the given stream.
    """
    self.classes   = [ ]
    self.functions = [ ]
    self.classDocs = [ ]

    if stream is not None:
      self.read(stream)


  def read (self, stream):
    """read (PushBackStream)

    Reads a C/C++ header file from the given stream.
    """
    inClass     = False
    inClassDocs = False
    inDocs      = False
    inFunc      = False
    inSkip      = False

    docstring   = ''
    lines       = ''

    for line in stream.xreadlines():
      stripped = line.strip()

      if stripped      == '#ifndef SWIG': inSkip = True
      if stripped[0:6] == '#endif'      : inSkip = False
      if inSkip: continue

      # Watch for class description, usually at top of file.

      if (not inClassDocs) and stripped.startswith('* @class'):
        inClassDocs = True
        classname = stripped[8:].strip()
        if classname.endswith('.'):
          classname = classname[:-1]
        docstring = ''
        continue

      if inClassDocs:
        if stripped.startswith('* @brief'):
          docstring += ' * ' + stripped[9:].strip() + '\n'
          continue
        elif not stripped.endswith('*/') and not stripped.startswith('* @class'):
          docstring += line
          continue
        else:
          docstring = '/**\n' + docstring + ' */'
          doc = CClassDoc(docstring, classname)
          self.classDocs.append(doc)

        # There may be more class docs in the same comment.
        if stripped.startswith('* @class'):
          classname = stripped[8:].strip()
          if classname.endswith('.'):
            classname = classname[:-1]          
        else:
          inClassDocs = False

        docstring = ''
        continue

      # Watch for class definition and methods.

      if stripped == '':
        docstring = ''
        lines     = ''
        inDocs    = False
        inFunc    = False
        continue

      if stripped.startswith('class ') and not stripped.endswith(';'):
        inClass   = True
        classname = line[6:].split(':')[0].strip()
        if classname[:6] == 'LIBSBM' or classname[:6] == 'LIBLAX':
          classname = classname.split(' ')[1].strip()
        self.classes.append( CClass(classname) )
        continue

      if stripped == '};':
        inClass = False
        continue

      if stripped == '/**':
        inDocs = True
        if inClass:
          inFunc = True
      else:
        if inClass and not inFunc:
          continue

      if inDocs:
        docstring += line
        inDocs     = (stripped != '*/')
        continue

      if inClass:
        if inFunc:
          cppcomment = stripped.find('//')
          if cppcomment != -1:
            stripped = stripped[:cppcomment]
        lines += stripped + ' '         # Space avoids jamming code together.

      if inFunc and (stripped.endswith(';') or stripped.endswith(')')):
        # It might be an enum.  Skip it.
        if not stripped.startswith('enum'):
          stop = lines.rfind('(')
          name = lines[:stop].split()[-1]
          args = lines[stop:lines.rfind(')')+1]

          # Swig doesn't seem to mind C++ argument lists, even though they
          # have "const", "&", etc.  So I'm leaving the arg list unmodified.
          func = CFunction(docstring, name, args)

          if inClass:
            self.classes[-1].methods.append(func)
          else:
            self.functions.append(func)

          inFunc = False



class CClass:
  """A CClass encapsulates a C++ class.  It has the following public
  attributes:

    - name
    - methods
  """

  def __init__ (self, name):
    """CClass(name) -> CClass

    Creates a new CClass with the given name.
    """
    self.name    = name
    self.methods = [ ]



class CFunction:
  """A CFunction encapsulates a C/C++ function.  Currently, it has the
  following public attributes:

    - docstring
    - name
    - args
  """

  def __init__ (self, docstring, name, args):
    """CFunction(docstring, name, args) -> CFunction

    Creates a new CFunction with the given docstring, name and args.
    """
    self.docstring = docstring
    self.name      = name
    if not args.strip() == '()':
      self.args = args
    else:
      self.args = ''



class CClassDoc:
  """Encapsulates documentation for a class.  Currently, it has the
  following public attributes:

    - docstring
    - name
  """

  def __init__ (self, docstring, name):
    """CClassDoc(docstring, name) -> CClassDoc

    Creates a new CClassDoc with the given docstring and name.
    """

    # Take out excess leading blank lines.
    docstring = re.sub('/\*\*(\s+\*)+', r'/** \n *', docstring)

    self.docstring = docstring
    self.name      = name


def fixUpIncludePath(line):
  # All our paths start with 'sbml/...'.  Look to see if there's any other
  # slash, as an indication the path is 'sbml/xml/foo.h' and not 'sbml/foo.h'.

  if string.find(line[5:], '/') > 0:
    return line[5:]
  else:
    return line


def getHeadersFromSWIG (filename):
  """getHeadersFromSWIG (filename) -> (filename1, filename2, .., filenameN)

  Reads the list of %include directives from the given SWIG (.i).  The
  list of C/C++ headers (.h) included is returned.
  """
  stream = open(filename)
  lines  = stream.readlines()

  lines  = filter(lambda line: line.strip().startswith('%include'), lines)
  lines  = filter(lambda line: line.strip().endswith('.h')        , lines)
  lines  = map(lambda line: line.replace('%include', '').strip(), lines)

  # We have a weird source setup.  The following accounts for it so that we
  # use the source tree directly rather than the "include" copy as was
  # previously done.  The latter may fall out of date while working on the
  # documentation and then lead to hard-to-track down inconsistencies
  # between the docs and the source tree.  (I've wasted hours trying to
  # figure out why doxygen wasn't picking up a recent change on separate
  # occasions, only to realize I forgot to run 'make' or 'make include' in
  # the source tree after a change.)

  lines  = map(fixUpIncludePath, lines)

  stream.close()

  return lines



def processHeader (filename, ostream, language):
  """processHeader (filename, ostream, language='java'|'python')

  Reads the the given header file and writes to ostream the necessary
  SWIG incantation to annotate each method (or function) with a
  docstring appropriate for the given language.
  """
  istream = open(filename)
  header  = CHeader(istream)
  istream.close()

  for c in header.classDocs:
    writeClassDocstring(ostream, language, c.docstring, c.name)

  for c in header.classes:
    for m in c.methods:
      if not m.name.startswith('~'):
        writeDocstring(ostream, language, m.docstring, m.name, c.name, m.args)

  for f in header.functions:
    writeDocstring(ostream, language, f.docstring, f.name, None, f.args)



def translateVerbatim (match):
  text = match.group()
  if re.search('@verbatim', text) != None:
    tagName = 'verbatim'
  else:
    tagName = 'code'
  text = text.replace('<p>', '')
  text = text.replace('<', '&lt;')
  text = text.replace('>', '&gt;')

  regexp = '@' + tagName + '[ \t]*'
  text = re.sub(regexp, r"<div class='fragment'><pre>", text)

  regexp = '(\s*\*\s*)*@end' + tagName
  p = re.compile(regexp, re.MULTILINE)
  text = p.sub(r'</pre></div>', text)

  return text


def translateInclude (match):
  global docincpath

  text    = match.group()
  file    = match.group(1)
  stream  = open(docincpath + '/' + file, 'r')
  content = stream.read()
  stream.close()

  return content


def translateIfJava (match):
  text = match.group()
  if match.group(1) == 'java':
    text =  match.group(2)
  else:
    text = ''
  return text


def translateIfPerl (match):
  text = match.group()
  if match.group(1) == 'perl':
    text =  match.group(2)
  else:
    text = ''
  return text


def translateIfPython (match):
  text = match.group()
  if match.group(1) == 'python':
    text =  match.group(2)
  else:
    text = ''
  return text


def translateJavaCrossRef (match):
  prior = match.group(1)
  classname = match.group(2)
  method = match.group(3)
  return prior + '{@link ' + classname + '#' + method + '}'


def sanitizeForHTML (docstring, language):
  """sanitizeForHTML (docstring, language) -> docstring

  Performs HTML transformations on the C++/Doxygen docstring.
  """

  # First do conditional section inclusion based on the current language.

  p = re.compile('@if\s+doxygen-(java|python|perl|clike)-only\s+(.+?)@endif', re.DOTALL)
  if language == 'java':
    docstring = p.sub(translateIfJava, docstring)
  elif language == 'perl':
    docstring = p.sub(translateIfPerl, docstring)
  elif language == 'python':
    docstring = p.sub(translateIfPython, docstring)

  # Replace blank lines between paragraphs with <p>.  There are two main
  # cases: comments blocks whose lines always begin with an asterix (e.g.,
  # C/C++), and comment blocks where they don't (e.g., Python).  The third
  # substitution below does the same thing for blank lines, except for the
  # very end of the doc string.

  p = re.compile('^(\s+)\*\s*$', re.MULTILINE)
  docstring = p.sub(r'\1* <p>', docstring)
  p = re.compile('^((?!\s+\Z)\s+)$', re.MULTILINE)
  docstring = p.sub(r'\1<p>', docstring)
  p = re.compile('^(?!\Z)$', re.MULTILINE)
  docstring = p.sub(r'<p>', docstring)

  # There's no verbatim or @code/@endcode equivalent, so we have to convert
  # it to raw HTML and transform the content too.  This requires helpers.
  # The following treats both @verbatim and @code the same way.

  p = re.compile('@verbatim.+?@endverbatim', re.DOTALL)
  docstring = p.sub(translateVerbatim, docstring)
  p = re.compile('@code.+?@endcode', re.DOTALL)
  docstring = p.sub(translateVerbatim, docstring)

  # Javadoc doesn't have a @section or @subsection commands.

  p = re.compile('@section\s+[^\s]+\s+(.*)$', re.MULTILINE)
  docstring = p.sub(r'<h2>\1</h2>', docstring)
  p = re.compile('@subsection\s+[^\s]+\s+(.*)$', re.MULTILINE)
  docstring = p.sub(r'<h3>\1</h3>', docstring)
  p = re.compile('@subsubsection\s+[^\s]+\s+(.*)$', re.MULTILINE)
  docstring = p.sub(r'<h4>\1</h4>', docstring)

  # Javadoc doesn't have an @htmlinclude command.  Slurp the file
  # directly in at the point.

  p = re.compile('@htmlinclude\s+([^\s]+).*$', re.MULTILINE)
  docstring = p.sub(translateInclude, docstring)

  # Javadoc doesn't have an @image command.  We translate @image html
  # but ditch @image latex.

  p = re.compile('@image\s+html+\s+([^\s]+).*$', re.MULTILINE)
  docstring = p.sub(r"<center><img src='\1'></center><br>", docstring)
  p = re.compile('@image\s+latex+\s+([^\s]+).*$', re.MULTILINE)
  docstring = p.sub(r'', docstring)

  # Javadoc doesn't have the %foo quoting mechanism, either.

  docstring = re.sub('(\s)%(\w)', r'\1\2', docstring)

  # Doxygen doesn't understand HTML character codes like &ge;, so we've
  # been using doxygen's Latex facility to get special mathematical
  # characters into the documentation, but as luck would have it, Javadoc
  # doesn't understand the Latex markup.  All of this is getting old.

  docstring = re.sub(r'\\f\$\\geq\\f\$', '&#8805;', docstring)
  docstring = re.sub(r'\\f\$\\leq\\f\$', '&#8804;', docstring)
  docstring = re.sub(r'\\f\$\\times\\f\$', '&#215;', docstring)

  # Miscellaneous other javadoc adaption.
  # The following are done in pairs because I couldn't come up with a
  # better way to catch the case where @c and @em end up alone at the end
  # of a line and the thing to be formatted starts on the next one after
  # the comment '*' character on the beginning of the line.

  docstring = re.sub('@c *([^ ,.:;()/*\n\t]+)', r'<code>\1</code>', docstring)
  docstring = re.sub('@c(\n[ \t]*\*[ \t]*)([^ ,.:;()/*\n\t]+)', r'\1<code>\2</code>', docstring)
  docstring = re.sub('@p +([^ ,.:;()/*\n\t]+)', r'<code>\1</code>', docstring)
  docstring = re.sub('@p(\n[ \t]*\*[ \t]+)([^ ,.:;()/*\n\t]+)', r'\1<code>\2</code>', docstring)
  docstring = re.sub('@em *([^ ,.:;()/*\n\t]+)', r'<em>\1</em>', docstring)
  docstring = re.sub('@em(\n[ \t]*\*[ \t]*)([^ ,.:;()/*\n\t]+)', r'\1<em>\2</em>', docstring)

  docstring = re.sub(r'@li\b', '<li>', docstring)

  docstring = re.sub(r'\s*\Z', '\n', docstring)

  # Massage method cross-references.

  p = re.compile('(\s+)(\S+?)::([^)]+?\))', re.MULTILINE)
  docstring = p.sub(translateJavaCrossRef, docstring)

  return docstring


def removeStar (match):
  text = match.group()
  text = text.replace('*', '')
  return text


def sanitizeForJava (docstring):
  """sanitizeForJava (docstring) -> docstring

  Performs some mimimal javadoc-specific sanitizations on the
  C++/Doxygen docstring.
  """

  docstring = sanitizeForHTML(docstring, 'java')

  # Try to rewrite some of the data type references to equivalent Java types.

  docstring = docstring.replace(r'const char *', 'string ')
  docstring = docstring.replace(r'const char* ', 'string ')

  # Inside of @see, change double colons to pound signs.

  docstring = re.sub('(@see\s+\w+)::', r'\1#', docstring)

  # The syntax for @see is slightly different: method names need to have a
  # leading pound sign character.  This particular bit of code only handles
  # a single @see foo(), which means the docs have to be written that way.
  # Maybe someday in the future it should be expanded to handle
  # @see foo(), bar(), etc., but I don't have time right now to do it.

  docstring = re.sub('(@see\s+)([\w:.]+)\(', r'\1#\2(', docstring)

  # Remove the '*' character that Javadoc doesn't want to see in @see's.
  # (This doesn't make a difference; javadoc still can't match up the refs.)

  #  p = re.compile('@see[\s\w.:,()#]+[*][\s\w.:,()*#]')
  #  docstring = p.sub(removeStar, docstring)

  # The syntax for @link is vastly different.
  
  p = re.compile('@link([\s/*]+[\w\s,.:#()*]+[\s/*]+[\w():#]+[\s/*]+)@endlink', re.DOTALL)
  docstring = p.sub(r'{@link \1}', docstring)

  # Outside of @see and other constructs, dot is used to reference members
  # instead of C++'s double colon.

  docstring = docstring.replace(r'::', '.')

  # Need to escape the quotation marks:

  docstring = docstring.replace('"', "'")
  docstring = docstring.replace(r"'", r"\'")

  return docstring



def indentVerbatimForPython (match):
  text = match.group()

  p = re.compile('^(.)', re.MULTILINE)
  text = p.sub(r'  \1', text)

  return text



def sanitizeForPython (docstring):
  """sanitizeForPython (docstring) -> docstring

  Performs some mimimal Python specific sanitizations on the
  C++/Doxygen docstring.

  Note: this is not the only processing performed for the Python
  documentation.  In docs/src, the doxygen-based code has an additional,
  more elaborate filter that processes the output of *this* filter.
  """

  docstring = docstring.replace('/**', '').replace('*/', '')
  p = re.compile('^(\s*)\*([ \t]*)', re.MULTILINE)
  docstring = p.sub(r'\2', docstring)

  # Need to escape the quotation marks:
  docstring = docstring.replace('"', "'")
  docstring = docstring.replace(r"'", r"\'")

  # Friggin' doxygen escapes HTML character codes, so the hack we have to
  # do for Javadoc turns out doesn't work for the Python documentation.
  # Kluge around it.

  docstring = re.sub(r'\\f\$\\geq\\f\$', '>=', docstring)
  docstring = re.sub(r'\\f\$\\leq\\f\$', '<=', docstring)
  docstring = re.sub(r'\\f\$\\times\\f\$', '*', docstring)

  # SWIG does some bizarre truncation of leading characters that
  # happens to hit us because of how we have to format verbatim's.
  # This tries to kluge around it:  
  p = re.compile('@verbatim.+?@endverbatim', re.DOTALL)
  docstring = p.sub(indentVerbatimForPython, docstring)

  return docstring



def sanitizeForPerl (docstring):
  """sanitizeForPerl (docstring) -> docstring

  Performs some mimimal Perl specific sanitizations on the
  C++/Doxygen docstring.
  """

  # Get rid of the /** ... */ and leading *'s.
  docstring = docstring.replace('/**', '').replace('*/', '').replace('*', ' ')

  # Get rid of indentation
  p = re.compile('^\s+(\S*\s*)', re.MULTILINE)
  docstring = p.sub(r'\1', docstring)

  # Get rid of paragraph indentation not caught by the code above.
  p = re.compile('^[ \t]+(\S)', re.MULTILINE)
  docstring = p.sub(r'\1', docstring)

  # Get rid of blank lines.
  p = re.compile('^[ \t]+$', re.MULTILINE)
  docstring = p.sub(r'', docstring)

  # Get rid of the %foo quoting.
  docstring = re.sub('(\s)%(\w)', r'\1\2', docstring)

  # The following are done in pairs because I couldn't come up with a
  # better way to catch the case where @c and @em end up alone at the end
  # of a line and the thing to be formatted starts on the next one after
  # the comment '*' character on the beginning of the line.

  docstring = re.sub('@c *([^ ,.:;()/*\n\t]+)', r'C<\1>', docstring)
  docstring = re.sub('@c(\n[ \t]*\*[ \t]*)([^ ,.:;()/*\n\t]+)', r'\1C<\2>', docstring)
  docstring = re.sub('@p +([^ ,.:;()/*\n\t]+)', r'C<\1>', docstring)
  docstring = re.sub('@p(\n[ \t]*\*[ \t]+)([^ ,.:;()/*\n\t]+)', r'\1C<\2>', docstring)
  docstring = re.sub('@em *([^ ,.:;()/*\n\t]+)', r'I<\1>', docstring)
  docstring = re.sub('@em(\n[ \t]*\*[ \t]*)([^ ,.:;()/*\n\t]+)', r'\1I<\2>', docstring)

  docstring = docstring.replace('<ul>', '\n=over\n')
  docstring = docstring.replace('<li> ', '\n=item\n\n')
  docstring = docstring.replace('</ul>', '\n=back\n')

  docstring = docstring.replace('@return', 'Returns')
  docstring = docstring.replace(' < ', ' E<lt> ').replace(' > ', ' E<gt> ')
  docstring = re.sub('<code>([^<]*)</code>', r'C<\1>', docstring)
  docstring = re.sub('<b>([^<]*)</b>', r'B<\1>', docstring)  

  return docstring



def writeDocstring (ostream, language, docstring, methodname, classname, args=None):
  """writeDocstring (ostream, language='java'|'python'|'perl', docstring,
  methodname, classname='')

  Writes to ostream the necessary SWIG incantation to annotate the
  given class method (or function) with a docstring appropriate for
  the given language.
  """

  if language == 'java':
    pre  = '%javamethodmodifiers'
    post = ' public'
  elif language == 'perl':
    pre  = '=item'
    post = ''
  else:
    pre  = '%feature("docstring")'
    post = ''

  if language == 'java':
    docstring = sanitizeForJava(docstring)
  elif language == 'python':
    docstring = sanitizeForPython(docstring)
  elif language == 'perl':
    docstring = sanitizeForPerl(docstring)  

  output = pre + ' '

  if classname:
    output += classname + '::'

  if language == 'perl':
    output += '%s\n\n%s%s\n\n'   % (methodname, docstring, post)
  elif language == 'python':
    output += '%s "\n%s%s";\n\n' % (methodname, docstring, post)
  else:
    output += '%s%s "\n%s%s";\n\n' % (methodname, args, docstring, post)

  ostream.write(output)
  ostream.flush()



def writeClassDocstring (ostream, language, docstring, classname):
  if language == 'java':
    pre = '%typemap(javaimports) '
    docstring = sanitizeForJava(docstring)    
    output = pre + classname + ' "\n' + docstring + '"\n\n'

  elif language == 'python':
    pre = '%feature("docstring") '
    docstring = sanitizeForPython(docstring)
    output = pre + classname + ' "\n' + docstring + '"\n\n'

  elif language == 'perl':
    docstring = sanitizeForPerl(docstring)
    output = '=back\n\n=head2 ' + classname + '\n\n' + docstring + '\n\n=over\n\n'

  ostream.write(output)
  ostream.flush()



def main (args):
  """usage: swigdoc.py [java | python | perl] -Ipath -Dpath libsbml.i docstrings.i

  java | python | perl  generate docstrings for this language module.
  path                  is the path to the libsbml src/ directory.
  libsbml.i             is the master libsbml SWIG interface file.
  docstrings.i          is the file to output the SWIG docstrings.
  """

  if len(args) != 6:
    print main.__doc__
    sys.exit(1)

  global docincpath

  language    = args[1]
  includepath = string.replace(args[2], '-I', '')
  docincpath  = string.replace(args[3], '-D', '')
  headers     = getHeadersFromSWIG(args[4])
  stream      = open(args[5], 'w')

  if language == 'perl':
    infile = open(os.path.abspath('LibSBML.txt'), 'r')
    stream.write(infile.read())
    stream.write('=head1 FUNCTION INDEX\n\n=over 8\n\n')

  for file in headers:
    filename = os.path.normpath(os.path.join(includepath, file))
    processHeader(filename, stream, language)

  if language == 'perl':
   stream.write('=cut\n')

  stream.close()


if __name__ == '__main__':
  main(sys.argv)
 
