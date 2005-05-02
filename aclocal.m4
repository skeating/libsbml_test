# generated automatically by aclocal 1.7.6 -*- Autoconf -*-

# Copyright (C) 1996, 1997, 1998, 1999, 2000, 2001, 2002
# Free Software Foundation, Inc.
# This file is free software; the Free Software Foundation
# gives unlimited permission to copy and/or distribute it,
# with or without modifications, as long as this notice is preserved.

# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY, to the extent permitted by law; without
# even the implied warranty of MERCHANTABILITY or FITNESS FOR A
# PARTICULAR PURPOSE.

dnl
dnl Filename    : runldpath.m4
dnl Description : Autoconf macro to set special variable RUN_LDPATH
dnl Author(s)   : Mike Hucka
dnl Created     : 2005-04-30
dnl Revision    : $Id$
dnl Source      : $Source$
dnl
dnl Copyright 2005 California Institute of Technology
dnl
dnl This library is free software; you can redistribute it and/or modify it
dnl under the terms of the GNU Lesser General Public License as published
dnl by the Free Software Foundation; either version 2.1 of the License, or
dnl any later version.
dnl
dnl This library is distributed in the hope that it will be useful, but
dnl WITHOUT ANY WARRANTY, WITHOUT EVEN THE IMPLIED WARRANTY OF
dnl MERCHANTABILITY OR FITNESS FOR A PARTICULAR PURPOSE.  The software and
dnl documentation provided hereunder is on an "as is" basis, and the
dnl California Institute of Technology and Japan Science and Technology
dnl Corporation have no obligations to provide maintenance, support,
dnl updates, enhancements or modifications.  In no event shall the
dnl California Institute of Technology or the Japan Science and Technology
dnl Corporation be liable to any party for direct, indirect, special,
dnl incidental or consequential damages, including lost profits, arising
dnl out of the use of this software and its documentation, even if the
dnl California Institute of Technology and/or Japan Science and Technology
dnl Corporation have been advised of the possibility of such damage.  See
dnl the GNU Lesser General Public License for more details.
dnl
dnl You should have received a copy of the GNU Lesser General Public License
dnl along with this library; if not, write to the Free Software Foundation,
dnl Inc., 59 Temple Place, Suite 330, Boston, MA 02111-1307 USA.
dnl
dnl The original code contained here was initially developed by:
dnl
dnl     Mike Hucka
dnl     The SBML Team
dnl     Control and Dynamical Systems, MC 107-81
dnl     California Institute of Technology
dnl     Pasadena, CA, 91125, USA
dnl
dnl     http://sbml.org
dnl     mailto:sbml-team@caltech.edu
dnl
dnl Contributor(s):

dnl CONFIG_LDPATH needs to be called from configure.ac to initialize the 
dnl internal variable.  It needs to be called fairly early.

AC_DEFUN([CONFIG_LDPATH],
[
  AC_DEFINE([RUN_LDPATH])

  dnl The initial value is the user's LD_LIBRARY_PATH or DYLD_LIBRARY_PATH

  case $host in
  *darwin*) 
    RUN_LDPATH="$DYLD_LIBRARY_PATH"
    ;;
  *)
    RUN_LDPATH="$LD_LIBRARY_PATH"
    ;;
  esac

  AC_SUBST(RUN_LDPATH)
])


dnl CONFIG_ADD_LDPATH(path) adds "path" to list of paths used to set
dnl LD_LIBRARY_PATH.

AC_DEFUN([CONFIG_ADD_LDPATH],
[
  RUN_LDPATH="$RUN_LDPATH:$1"
])


dnl
dnl Filename    : swig.m4
dnl Description : Autoconf macro to check for SWIG
dnl Author(s)   : Michael Hucka <mhucka@caltech.edu>
dnl Created     : 2004-06-18
dnl Revision    : $Id$
dnl Source      : $Source$
dnl
dnl This code originally came from the Autoconf Macro archive
dnl (ac-archive.sf.net) on 2004-06-18.  It has been modified somewhat in
dnl order to fit with the rest of libsbml.

dnl The original code contained here was initially developed by:
dnl Andrew Collier <colliera@nu.ac.za>.
dnl Copyright (C) 2003 Andrew Collier
dnl 
dnl They are distributed in the hope that they will be useful, but WITHOUT ANY
dnl WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS
dnl FOR A PARTICULAR PURPOSE. See the GNU General Public License for more
dnl details. (You should have received a copy of the GNU General Public License
dnl along with this program; if not, write to the Free Software Foundation,
dnl Inc., 59 Temple Place -- Suite 330, Boston, MA 02111-1307, USA.)
dnl 
dnl As a special exception, the Free Software Foundation gives unlimited
dnl permission to copy, distribute and modify the configure scripts that are
dnl the output of Autoconf. You need not follow the terms of the GNU General
dnl Public License when using or distributing such scripts, even though
dnl portions of the text of Autoconf appear in them. The GNU General Public
dnl License (GPL) does govern all other use of the material that constitutes
dnl the Autoconf program.
dnl 
dnl Certain portions of the Autoconf source text are designed to be copied (in
dnl certain cases, depending on the input) into the output of Autoconf. We call
dnl these the "data" portions. The rest of the Autoconf source text consists of
dnl comments plus executable code that decides which of the data portions to
dnl output in any given case. We call these comments and executable code the
dnl "non-data" portions. Autoconf never copies any of the non-data portions
dnl into its output.
dnl 
dnl This special exception to the GPL applies to versions of Autoconf released
dnl by the Free Software Foundation. When you make and distribute a modified
dnl version of Autoconf, you may extend this special exception to the GPL to
dnl apply to your modified version as well, *unless* your modified version has
dnl the potential to copy into its output some of the text that was the
dnl non-data portion of the version that you started with. (In other words,
dnl unless your change moves or copies text from the non-data portions to the
dnl data portions.) If your modification has such potential, you must delete
dnl any notice of this special exception to the GPL from your modified version.


dnl From the original description on ac-archive.sf.net:
dnl
dnl @synopsis AC_PKG_SWIG([major.minor.micro],[c++],[raw])
dnl
dnl This macro searches for a SWIG installation on your system.  If the
dnl version argument is given (e.g. 1.3.17), AC_PKG_SWIG checks that the
dnl swig package is this version number or higher.
dnl
dnl In configure.in, use as:
dnl
dnl		AC_PKG_SWIG(1.3.17)
dnl		AC_PROG_LN_S
dnl		AC_PROG_CXX
dnl		AC_PROG_LIBTOOL
dnl
dnl Acknowledgements:
dnl
dnl o stuff from a posting by Sebastian Huber <sebastian-huber@web.de> on Swig
dnl   digest, Vol 1 #1157 (3 Jan 2003).
dnl
dnl @version $Id$
dnl @author Andrew Collier <colliera@nu.ac.za>

AC_DEFUN([CONFIG_PROG_SWIG],
[
  AC_ARG_WITH(swig,
              AC_HELP_STRING([--with-swig=PREFIX],
                             [Regenerate SWIG wrappers [[default=no]]]),
	      [with_swig=$withval],
	      [with_swig=no])

  if test $with_swig != no;
  then

    SWIG_REQUEST_VERSION=

    changequote(<<, >>)

    for a in $1 $2 $3 $4 $5 $6 $7 $8 $9 x; do
        case "$a" in
            x) break;;
            [0-9]*.[0-9]*.[0-9]*) SWIG_REQUEST_VERSION="$a";;
    	c++) SWIGFLAGS="$SWIGFLAGS -c++";;
    	raw) SWIGFLAGS="$SWIGFLAGS -c";;
        esac
    done

    changequote([, ])

    if test $with_swig != yes;
    then
      AC_PATH_PROG([SWIG], [swig], [$with_swig/bin/swig],
                     [no-swig-found], [$with_swig/bin])
    else
      AC_PATH_PROG([SWIG], [swig])
    fi

    if test -n "$SWIG";
    then
    	SWIGLIB=`$SWIG -swiglib`

	AC_SUBST(SWIG)
	AC_SUBST(SWIGLIB)
	AC_SUBST(SWIGFLAGS)

	AC_MSG_CHECKING(swig version)

	changequote(<<, >>)
	swig_version=`$SWIG -version 2>&1 | sed 's/.* \([0-9]*\.[0-9]*\.[0-9]*\).*/\1/p; d'`
	swig_major_ver=`expr $swig_version : '\([0-9]*\)\.[0-9]*\.[0-9]*'`
	swig_minor_ver=`expr $swig_version : '[0-9]*\.\([0-9]*\)\.[0-9]*'`
	swig_micro_ver=`expr $swig_version : '[0-9]*\.[0-9]*\.\([0-9]*\)' '|' 0`
	changequote([, ])

	AC_MSG_RESULT($swig_version)

	SWIGVERNUM=`printf "%02d%02d%02d" $swig_major_ver $swig_minor_ver $swig_micro_ver`
	# SWIGVERNUM=`echo $SWIG_REQUEST_VERSION | awk '{ split($[1],a,"\."); print [a[1]*1000000+a[2]*1000+a[3]] }' 2>/dev/null`

	if test -n "$SWIG_REQUEST_VERSION";
	then
		AC_MSG_CHECKING(requested swig version ($SWIG_REQUEST_VERSION))

		changequote(<<, >>)
		swig_major_req=`expr $SWIG_REQUEST_VERSION : '\([0-9]*\)\.[0-9]*\.[0-9]*'`
		swig_minor_req=`expr $SWIG_REQUEST_VERSION : '[0-9]*\.\([0-9]*\)\.[0-9]*'`
		swig_micro_req=`expr $SWIG_REQUEST_VERSION : '[0-9]*\.[0-9]*\.\([0-9]*\)'`
		changequote([, ])

		if test $swig_major_ver -ge $swig_major_req &&
		   test $swig_minor_ver -ge $swig_minor_req &&
		   test $swig_micro_ver -ge $swig_micro_req
		then
			AC_MSG_RESULT(yes)
		else
			AC_MSG_RESULT(no)
			AC_MSG_ERROR(installed version of swig is too old!)
		fi
	fi

      AC_DEFINE([USE_SWIG], 1, [Define to 1 to use SWIG])
      AC_SUBST(USE_SWIG, 1)

      AC_SUBST(SWIG_CPPFLAGS)
      AC_SUBST(SWIG_LDFLAGS)
      AC_SUBST(SWIG_LIBS)

    fi
  fi

  dnl We record the USE_XXX flag, for later testing in Makefiles.

  LIBSBML_OPTIONS="$LIBSBML_OPTIONS USE_SWIG"

])

dnl
dnl Filename    : python.m4
dnl Description : Autoconf macro to check for Python
dnl Author(s)   : SBML Team <sbml-team@caltech.edu>
dnl Organization: California Institute of Technology
dnl Created     : 2004-06-18
dnl Revision    : $Id$
dnl Source      : $Source$
dnl
dnl Portions of this code originally came from the aclocal 1.7
dnl distribution.  The main macro was named AM_PATH_PYTHON, but I (Mike
dnl Hucka) changed the names of this and various variables it defines
dnl because it is being used outside of automake.

dnl Portions of the code contained here was initially developed by:
dnl Andrew Dalke and James Henstridge.
dnl Copyright 1999, 2000, 2001, 2002  Free Software Foundation, Inc.
dnl
dnl This program is free software; you can redistribute it and/or modify
dnl it under the terms of the GNU General Public License as published by
dnl the Free Software Foundation; either version 2, or (at your option)
dnl any later version.
dnl
dnl This program is distributed in the hope that it will be useful,
dnl but WITHOUT ANY WARRANTY; without even the implied warranty of
dnl MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
dnl GNU General Public License for more details.
dnl
dnl You should have received a copy of the GNU General Public License
dnl along with this program; if not, write to the Free Software
dnl Foundation, Inc., 59 Temple Place - Suite 330, Boston, MA
dnl 02111-1307, USA.

AC_DEFUN([CONFIG_PROG_PYTHON],
[
  AC_ARG_VAR([PYTHON])

  AC_ARG_WITH(python,
              AC_HELP_STRING([--with-python=PREFIX],
                             [Generate Python interface library [[default=no]]]),
	      [with_python=$withval],
	      [with_python=no])

  if test $with_python != no; then

    dnl Find a python executable.

    if test $with_python != yes;
    then
      AC_PATH_PROG([PYTHON], [python], [$with_python/bin/python],
                     [no-python-found], [$with_python/bin])
    else
      AC_PATH_PROG([PYTHON], [python])
    fi

    dnl check version if required
    m4_ifvaln([$1], [
        AC_MSG_CHECKING($PYTHON version >= $1)
        if test `$PYTHON -c ["import sys; print sys.version[:3] >= \"$1\" and \"OK\" or \"OLD\""]` = "OK"
        then
          AC_MSG_RESULT(ok)
        else
          AC_MSG_RESULT(no)
        fi
      fi])

    AC_MSG_CHECKING(for Python prefix)
    PYTHON_PREFIX=`($PYTHON -c "import sys; print sys.prefix") 2>/dev/null`
    AC_MSG_RESULT($PYTHON_PREFIX)

    changequote(<<, >>)
    PYTHON_VERSION=`$PYTHON -c "import sys; print sys.version[:3]"`
    changequote([, ])

    PYTHON_NAME="python${PYTHON_VERSION}"

    dnl Figure out the last bits for linking.
    dnl This comes in part from SWIG 1.3.31's configure.ac file.

    case $host in
    *darwin*) 
	dnl Got an ugly situation on MacOS X: need different args depending
	dnl on whether the system-installed or Fink-installed version of
	dnl Python is being used.  The following is a heuristic approach
	dnl that may not be correct for all situations.  The heuristic is:
	dnl if the Python executable is /usr/something, assume it's the
	dnl system-installed version and use -framework; otherwise, assume
	dnl it's either the Fink version or something else, and don't use
	dnl -framework.

	if test `expr ${PYTHON} ':' '/usr/bin/.*'` -ne 0; then
	  dnl MacOSX-installed version of Python (we hope).
   	  PYTHON_CPPFLAGS="-I${PYTHON_PREFIX}/include/${PYTHON_NAME}"
	  PYTHON_LDFLAGS="-L${PYTHON_PREFIX}/lib/${PYTHON_NAME}/lib-dynload -framework Python"
	else
	  dnl Fink-installed version of Python, or something else.
   	  PYTHON_CPPFLAGS="-I${PYTHON_PREFIX}/include/${PYTHON_NAME}"
	  PYTHON_LDFLAGS="-L${PYTHON_PREFIX}/lib/${PYTHON_NAME}/lib-dynload -bundle_loader ${PYTHON}"
	fi
        CONFIG_ADD_LDPATH(${PYTHON_PREFIX}/lib/${PYTHON_NAME}/lib-dynload)
	;;
    *cygwin* | *mingw*) 
	PYTHON_CPPFLAGS="-I${PYTHON_PREFIX}/include/${PYTHON_NAME} -DUSE_DL_IMPORT"
	PYTHON_LDFLAGS="-L${PYTHON_PREFIX}/lib/${PYTHON_NAME}/config"
        PYTHON_LIBS="-l${PYTHON_NAME}"
	CONFIG_ADD_LDPATH(${PYTHON_PREFIX}/lib/${PYTHON_NAME}/config)
	;;
    *)
	PYTHON_CPPFLAGS="-I${PYTHON_PREFIX}/include/${PYTHON_NAME}"
        PYTHON_LDFLAGS="-L${PYTHON_PREFIX}/lib/${PYTHON_NAME}/config"
        PYTHON_LIBS="-l${PYTHON_NAME}"
	CONFIG_ADD_LDPATH(${PYTHON_PREFIX}/lib/${PYTHON_NAME}/config)
	;;
    esac

    AC_DEFINE([USE_PYTHON], 1, [Define to 1 to use Python])
    AC_SUBST(USE_PYTHON, 1)

    AC_SUBST(PYTHON_CPPFLAGS)
    AC_SUBST(PYTHON_LDFLAGS)
    AC_SUBST(PYTHON_LIBS)

  fi

  dnl We record the USE_XXX flag, for later testing in Makefiles.

  LIBSBML_OPTIONS="$LIBSBML_OPTIONS USE_PYTHON"

])


dnl
dnl Filename    : perl.m4
dnl Description : Autoconf macro to check for existence of Perl
dnl Author(s)   : Mike Hucka
dnl Organization: SBML Team
dnl Created     : 2005-05-01
dnl Revision    : $Id$
dnl Source      : $Source$
dnl
dnl Copyright 2005 California Institute of Technology and
dnl Japan Science and Technology Corporation.
dnl
dnl This library is free software; you can redistribute it and/or modify it
dnl under the terms of the GNU Lesser General Public License as published
dnl by the Free Software Foundation; either version 2.1 of the License, or
dnl any later version.
dnl
dnl This library is distributed in the hope that it will be useful, but
dnl WITHOUT ANY WARRANTY, WITHOUT EVEN THE IMPLIED WARRANTY OF
dnl MERCHANTABILITY OR FITNESS FOR A PARTICULAR PURPOSE.  The software and
dnl documentation provided hereunder is on an "as is" basis, and the
dnl California Institute of Technology and Japan Science and Technology
dnl Corporation have no obligations to provide maintenance, support,
dnl updates, enhancements or modifications.  In no event shall the
dnl California Institute of Technology or the Japan Science and Technology
dnl Corporation be liable to any party for direct, indirect, special,
dnl incidental or consequential damages, including lost profits, arising
dnl out of the use of this software and its documentation, even if the
dnl California Institute of Technology and/or Japan Science and Technology
dnl Corporation have been advised of the possibility of such damage.  See
dnl the GNU Lesser General Public License for more details.
dnl
dnl You should have received a copy of the GNU Lesser General Public License
dnl along with this library; if not, write to the Free Software Foundation,
dnl Inc., 59 Temple Place, Suite 330, Boston, MA 02111-1307 USA.
dnl
dnl The original code contained here was initially developed by:
dnl
dnl     Michael Hucka
dnl     SBML Team
dnl     Control and Dynamical Systems, MC 107-81
dnl     California Institute of Technology
dnl     Pasadena, CA, 91125, USA
dnl
dnl     http://www.sbml.org
dnl     mailto:sbml-team@caltech.edu
dnl
dnl Contributor(s):
dnl

dnl
dnl Check --with-perl[=PREFIX]
dnl

AC_DEFUN([CONFIG_PROG_PERL],
[
  AC_ARG_VAR([PERL])

  AC_ARG_WITH(perl,
              AC_HELP_STRING([--with-perl=PREFIX],
                             [Generate Perl interface library [[default=no]]]),
	      [with_perl=$withval],
	      [with_perl=no])

  if test $with_perl != no; then

    dnl Find a perl executable.

    if test $with_perl != yes; then
      AC_PATH_PROG([PERL], [perl], [$with_perl/bin/perl],
                     [no-perl-found], [$with_perl/bin])
    else
      AC_PATH_PROG([PERL], [perl])
    fi

    AC_DEFINE([USE_PERL], 1, [Define to 1 to use Perl])
    AC_SUBST(USE_PERL, 1)

    AC_SUBST(PERL_CPPFLAGS)
    AC_SUBST(PERL_LDFLAGS)
    AC_SUBST(PERL_LIBS)

  fi

  dnl We record the USE_XXX flag, for later testing in Makefiles.

  LIBSBML_OPTIONS="$LIBSBML_OPTIONS USE_PERL"

])

dnl
dnl Filename    : java.m4
dnl Description : Autoconf macro to check for existence of Java
dnl Author(s)   : SBML Team <sbml-team@caltech.edu>
dnl Organization: California Institute of Technology
dnl Created     : 2004-07-07
dnl Revision    : $Id$
dnl Source      : $Source$
dnl
dnl Copyright 2004 California Institute of Technology and
dnl Japan Science and Technology Corporation.
dnl
dnl This library is free software; you can redistribute it and/or modify it
dnl under the terms of the GNU Lesser General Public License as published
dnl by the Free Software Foundation; either version 2.1 of the License, or
dnl any later version.
dnl
dnl This library is distributed in the hope that it will be useful, but
dnl WITHOUT ANY WARRANTY, WITHOUT EVEN THE IMPLIED WARRANTY OF
dnl MERCHANTABILITY OR FITNESS FOR A PARTICULAR PURPOSE.  The software and
dnl documentation provided hereunder is on an "as is" basis, and the
dnl California Institute of Technology and Japan Science and Technology
dnl Corporation have no obligations to provide maintenance, support,
dnl updates, enhancements or modifications.  In no event shall the
dnl California Institute of Technology or the Japan Science and Technology
dnl Corporation be liable to any party for direct, indirect, special,
dnl incidental or consequential damages, including lost profits, arising
dnl out of the use of this software and its documentation, even if the
dnl California Institute of Technology and/or Japan Science and Technology
dnl Corporation have been advised of the possibility of such damage.  See
dnl the GNU Lesser General Public License for more details.
dnl
dnl You should have received a copy of the GNU Lesser General Public License
dnl along with this library; if not, write to the Free Software Foundation,
dnl Inc., 59 Temple Place, Suite 330, Boston, MA 02111-1307 USA.
dnl
dnl The original code contained here was initially developed by:
dnl
dnl     Michael Hucka
dnl     SBML Team
dnl     Control and Dynamical Systems, MC 107-81
dnl     California Institute of Technology
dnl     Pasadena, CA, 91125, USA
dnl
dnl     http://www.sbml.org
dnl     mailto:sbml-team@caltech.edu
dnl
dnl Contributor(s):
dnl

AC_DEFUN([CONFIG_PROG_JAVA],
[
  AC_ARG_WITH([java],
    AC_HELP_STRING([--with-java=PREFIX],
                   [Generate Java interface library [[default=no]]]),
    [with_java=$withval],
    [with_java=no])

  if test $with_java != no; then

    if test $with_java != yes;
    then
      dnl Users seems to have supplied a prefix directory path.  See if we can 
      dnl find Java somewhere in the given tree.

      AC_PATH_PROG([JAVA], [java], [$with_java/bin/java],
                     [no-java-found], [$with_java/bin])
      AC_PATH_PROG([JAVAC], [javac], [$with_java/bin/javac],
                     [no-javac-found], [$with_java/bin])
      AC_PATH_PROG([JAR], [jar], [$with_java/bin/jar],
                     [no-jar-found], [$with_java/bin])
    else
      AC_PATH_PROG([JAVA], [java])
      AC_PATH_PROG([JAVAC], [javac])
      AC_PATH_PROG([JAR], [jar])
    fi

    dnl Sanity checks.

    if test -z $JAVA; then
      AC_MSG_ERROR([Could not find `java' executable.])
    fi    
    if test -z $JAVAC; then
      AC_MSG_ERROR([Could not find `javac' executable.])
    fi    

    dnl Check version if required.

    m4_ifvaln([$1], [
        AC_MSG_CHECKING($JAVA version >= $1)
        changequote(<<, >>)
	rx=`echo $1 | sed -e 's/\([0-9]\)\.\([0-9]\)\.\([0-9]\).*/\1/'`
	ry=`echo $1 | sed -e 's/\([0-9]\)\.\([0-9]\)\.\([0-9]\).*/\2/'`
	rz=`echo $1 | sed -e 's/\([0-9]\)\.\([0-9]\)\.\([0-9]\).*/\3/'`
	version=`$JAVA -version 2>&1 | head -1`
	jx=`echo $version | sed -e 's/java version \"\([0-9]\)\.\([0-9]\)\.\([0-9]\).*/\1/'`
	jy=`echo $version | sed -e 's/java version \"\([0-9]\)\.\([0-9]\)\.\([0-9]\).*/\2/'`
	jz=`echo $version | sed -e 's/java version \"\([0-9]\)\.\([0-9]\)\.\([0-9]\).*/\3/'`
        changequote([, ])

	dnl The following long expression (which I couldn't figure out how
	dnl to break across multiple lines in this autoconf script --
	dnl sorry) checks that the Java major version is greater than or
	dnl equal to the requested version and either (1) the minor version
	dnl number is greater than the requested minor version number, or
	dnl (2) the minor version number is equal to the requested number
	dnl and the subminor Java version number is greater than or equal
	dnl to the requested subminor version number.

        if test '(' $jx -ge $rx -a '(' '(' $jy -gt $ry ')' -o '(' '(' $jy -eq $ry ')' -a '(' $jz -ge $rz ')' ')' ')' ')' ; then
          AC_MSG_RESULT(ok)
        else
          AC_MSG_RESULT(no)
          AC_MSG_ERROR([Need Java version $1 but only found version $version.])
        fi

	dnl Retain these for use below.

	JAVA_VER_MAJOR=$jx
	JAVA_VER_MINOR=$jy
	JAVA_VER_SUBMINOR=$jz
    ])

    dnl Look for the path to the include files for Java.
    dnl This macro will set JAVA_CPPFLAGS appropriately.

    AC_JAVA_INCLUDE_DIRS

    dnl On MacOS X, JNI libraries loaded by Java need to be created as bundles.

    case $host in
    *darwin*) 
	JAVA_LDFLAGS="${JAVA_LDFLAGS} -bundle_loader ${JAVA}"
	;;
    *)
	JAVA_LDFLAGS=
	;;
    esac

    dnl On MacOS X, the JNI library needs an oddball extension.

    case $host in
    *darwin*) 
	JNIEXT="jnilib"
	;;
    *)
	JNIEXT="so"
	;;
    esac

    dnl There is currently nothing to add for LIBS.

    JAVA_LIBS=

    AC_DEFINE([USE_JAVA], 1, [Define to 1 to use Java])
    AC_SUBST(USE_JAVA, 1)

    AC_SUBST(JAVA_CPPFLAGS)
    AC_SUBST(JAVA_LDFLAGS)
    AC_SUBST(JAVA_LIBS)
    AC_SUBST(JNIEXT)

  fi

  dnl We record the USE_XXX flag, for later testing in Makefiles.

  LIBSBML_OPTIONS="$LIBSBML_OPTIONS USE_JAVA"

])


dnl The following was originally AC_JNI_INCLUDE_DIR, 
dnl Available from the GNU Autoconf Macro Archive at:
dnl http://www.gnu.org/software/ac-archive/htmldoc/ac_jni_include_dirs.html

AC_DEFUN([AC_JAVA_INCLUDE_DIRS],[
  
  test "x$JAVAC" = x && AC_MSG_ERROR(['$JAVAC' undefined])
  
  _AC_JAVA_FOLLOW_SYMLINKS("$JAVAC")
  _jtopdir=`echo "$JAVA_FOLLOWED" | sed -e 's://*:/:g' -e 's:/[[^/]]*$::'`
  case "$host_os" in
    *darwin*)
	dnl MacOS X's installation of Java 1.4.2 is broken: the header
	dnl files are missing entirely, and there are dangling symlinks.
	dnl The following are ugly kludges to try to do the best we can.
	dnl One of the things this does deliberately is use the 1.4.1
	dnl headers directory on the Mac even for Java 1.4.2 if the 
	dnl 1.4.2 headers directory can't be found.  Yuck.
	dnl 2004-07-07 <mhucka@caltech.edu>

	java_bail=no
	java_mac_prefix="/System/Library/Frameworks/JavaVM.framework"
	case $JAVA_VER_MINOR in
	  4)
	    if test $JAVA_VER_SUBMINOR -eq 2; then
	      if test -e "$java_mac_prefix/Versions/1.4.2/Headers"; then
	        _jinc="$java_mac_prefix/Versions/1.4.2/Headers"
              elif test -e "$java_mac_prefix/Versions/1.4.1/Headers"; then
	        _jinc="$java_mac_prefix/Versions/1.4.1/Headers"
              else
	        java_bail=yes
	      fi;
	    elif test $JAVA_VER_SUBMINOR -eq 1; then
	      if test -e "$java_mac_prefix/Versions/1.4.1/Headers"; then
	        _jinc="$java_mac_prefix/Versions/1.4.1/Headers"
              else
	        java_bail=yes
	      fi;
            else
	      java_bail=yes
	    fi
	    ;;
	  3) 
	    if test -e "$java_mac_prefix/Versions/1.3.1/Headers"; then
	      _jinc="$java_mac_prefix/Versions/1.3.1/Headers"
	    elif test -e "$java_mac_prefix/Versions/1.3/Headers"; then
	      _jinc="$java_mac_prefix/Versions/1.3/Headers"
	    else
	      java_bail=yes
	    fi
	    ;;
	  *)
             _jtopdir=`echo "$_jtopdir" | sed -e 's:/[[^/]]*$::'`
	     _jinc="$_jtopdir/Versions/Headers"
	     ;;
	esac

	if test $java_bail = yes; then
          AC_MSG_ERROR([Cannot find Java include files.])
          AC_MSG_ERROR([MacOS X 10.3.x has known problems with its Java 1.4 installation.])
          AC_MSG_ERROR([See http://developer.apple.com/java/faq.])
	fi
	;;
    *) 
        _jinc="$_jtopdir/include"
	;;
  esac
  if test -e "$_jinc/jni.h"; then
    JAVA_CPPFLAGS="$JAVA_CPPFLAGS -I$_jinc"
  else
    _jtopdir=`echo "$_jtopdir" | sed -e 's:/[[^/]]*$::'`
    if test -e "$_jtopdir/include/jni.h"; then
      JAVA_CPPFLAGS="$JAVA_CPPFLAGS -I$_jtopdir/include"
    else
      AC_MSG_ERROR([Cannot find Java include files.])
    fi
  fi
  
  dnl Get the likely subdirectories for system specific Java includes.
  case "$host_os" in
    bsdi*)    _java_inc_subdirs="bsdos";;
    linux*)   _java_inc_subdirs="linux genunix";;
    osf*)     _java_inc_subdirs="alpha";;
    solaris*) _java_inc_subdirs="solaris";;
    *)        _java_inc_subdirs="genunix";;
  esac
  
  dnl Add any subdirectories that are present.
  for jsubdir in $_java_inc_subdirs; do
    if test -d "$_jtopdir/include/$jsubdir"; then
      JAVA_CPPFLAGS="$JAVA_CPPFLAGS -I$_jtopdir/include/$jsubdir"
    fi
  done
])

dnl _AC_JAVA_FOLLOW_SYMLINKS <path>
dnl Follows symbolic links on <path>,
dnl finally setting variable _AC_JAVA_FOLLOWED
dnl --------------------
AC_DEFUN([_AC_JAVA_FOLLOW_SYMLINKS],[
  dnl find the include directory relative to the javac executable
  _cur="$1"
  while ls -ld "$_cur" 2>/dev/null | grep " -> " >/dev/null; do
        AC_MSG_CHECKING(symlink for $_cur)
        _slink=`ls -ld "$_cur" | sed 's/.* -> //'`
        case "$_slink" in
          /*) _cur="$_slink";;
          dnl 'X' avoids triggering unwanted echo options.
          *) _cur=`echo "X$_cur" | sed -e 's/^X//' -e 's:[[^/]]*$::'`"$_slink";;
        esac
        AC_MSG_RESULT($_cur)
  done
  JAVA_FOLLOWED="$_cur"
])# _AC_JAVA

dnl
dnl Filename    : matlab.m4
dnl Description : Autoconf macro for MATLAB configuration
dnl Author(s)   : Mike Hucka
dnl Created     : 2004-08-02
dnl Revision    : $Id$
dnl Source      : $Source$
dnl
dnl Copyright 2004 California Institute of Technology
dnl
dnl This library is free software; you can redistribute it and/or modify it
dnl under the terms of the GNU Lesser General Public License as published
dnl by the Free Software Foundation; either version 2.1 of the License, or
dnl any later version.
dnl
dnl This library is distributed in the hope that it will be useful, but
dnl WITHOUT ANY WARRANTY, WITHOUT EVEN THE IMPLIED WARRANTY OF
dnl MERCHANTABILITY OR FITNESS FOR A PARTICULAR PURPOSE.  The software and
dnl documentation provided hereunder is on an "as is" basis, and the
dnl California Institute of Technology and Japan Science and Technology
dnl Corporation have no obligations to provide maintenance, support,
dnl updates, enhancements or modifications.  In no event shall the
dnl California Institute of Technology or the Japan Science and Technology
dnl Corporation be liable to any party for direct, indirect, special,
dnl incidental or consequential damages, including lost profits, arising
dnl out of the use of this software and its documentation, even if the
dnl California Institute of Technology and/or Japan Science and Technology
dnl Corporation have been advised of the possibility of such damage.  See
dnl the GNU Lesser General Public License for more details.
dnl
dnl You should have received a copy of the GNU Lesser General Public License
dnl along with this library; if not, write to the Free Software Foundation,
dnl Inc., 59 Temple Place, Suite 330, Boston, MA 02111-1307 USA.
dnl
dnl The original code contained here was initially developed by:
dnl
dnl     Michael Hucka
dnl
dnl     The SBML Team
dnl     Control and Dynamical Systems, MC 107-81
dnl     California Institute of Technology
dnl     Pasadena, CA, 91125, USA
dnl
dnl     http://sbml.org
dnl     mailto:sbml-team@caltech.edu
dnl
dnl Contributor(s):
dnl

AC_DEFUN([CONFIG_PROG_MATLAB],
[
  AC_ARG_WITH([matlab],
    AC_HELP_STRING([--with-matlab=PREFIX],
                   [Generate MATLAB interface library [[default=no]]]),
    [with_matlab=$withval],
    [with_matlab=no])

  if test $with_matlab != no; then

    if test $with_matlab != yes;
    then
      AC_PATH_PROG([MEX], [mex], [$with_matlab/bin/mex],
                     [no-mex-found], [$with_matlab/bin])
      AC_PATH_PROG([MATLAB], [matlab], [$with_matlab/bin/matlab],
                     [no-matlab-found], [$with_matlab/bin])
    else
      AC_PATH_PROG([MEX], [mex])
      AC_PATH_PROG([MATLAB], [matlab])
    fi

    if test -z "$MATLAB"; then
      AC_MSG_ERROR([Could not find 'matlab' executable for MATLAB.])
    elif  test -z "$MEX"; then
      AC_MSG_ERROR([Could not find 'mex' executable for MATLAB.])
    fi

    case $host in
    *darwin*) 
      MEXEXT="mexmac"
      ;;
    *cygwin*) 
      MEXEXT="dll"
      ;;
    *) 
      MEXEXT="mexglx"
      ;;
    esac

    AC_DEFINE([USE_MATLAB], 1, [Define to 1 to use Matlab])
    AC_SUBST(USE_MATLAB, 1)

    AC_SUBST(MATLAB_CPPFLAGS)
    AC_SUBST(MATLAB_LDFLAGS)
    AC_SUBST(MATLAB_LIBS)
    AC_SUBST(MEX_FLAGS)
    AC_SUBST(MEXEXT)

  fi

  dnl We record the USE_XXX flag, for later testing in Makefiles.

  LIBSBML_OPTIONS="$LIBSBML_OPTIONS USE_MATLAB"

])

dnl
dnl Filename    : lisp.m4
dnl Description : Autoconf macro to check for lisp and lisp-stuff
dnl Author(s)   : Martin Ginkel <martin.ginkel@epost.de>
dnl Organization: Max-Planck-Institute Magdeburg
dnl Created     : 2004-08-26 
dnl Revision    : $Id$
dnl Source      : $Source$
dnl
dnl Copyright 2004 Max-Planck-Institute Magdeburg
dnl
dnl This is free software; you can redistribute it and/or modify it
dnl under the terms of the GNU Lesser General Public License as published
dnl by the Free Software Foundation; either version 2.1 of the License, or
dnl any later version.
dnl 
dnl You should have received a copy of the GNU Lesser General Public License
dnl along with this library; if not, write to the Free Software Foundation,
dnl Inc., 59 Temple Place, Suite 330, Boston, MA 02111-1307 USA.
dnl 
dnl THIS SOFTWARE IS PROVIDED BY THE AUTHORS AND CONTRIBUTORS ``AS IS'' AND
dnl ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
dnl IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE
dnl ARE DISCLAIMED.  IN NO EVENT SHALL THE AUTHORS OR CONTRIBUTORS BE LIABLE
dnl FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL
dnl DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS
dnl OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION)
dnl HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT
dnl LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY
dnl OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF
dnl SUCH DAMAGE.


dnl CONFIG_PROG_LISP
dnl Wrapper combining the most common configuration macros into a single call.
AC_DEFUN([CONFIG_PROG_LISP],
[
  CONFIG_WITH_LISP
  CONFIG_LISP_EXIT
  CONFIG_ASDF_CHECK
  CONFIG_UFFI_CHECK
  CONFIG_CPARSE_CHECK
  CONFIG_FASL
])

dnl CONFIG_WITH_LISP
dnl find a common lisp, sets $LISP
dnl searches $PATH and common places
dnl introduces --with-lisp
AC_DEFUN([CONFIG_WITH_LISP],
[
  AC_SUBST(LISP)
  AC_ARG_WITH(lisp,
    AC_HELP_STRING([--with-lisp=<binary>],
                   [Use this Lisp program (default: autodetect)]),
    [with_lisp=$withval],
    [with_lisp=no]
  )

  if test $with_lisp != no; then
    if test $with_lisp != yes; then
      LISP_PATH="`dirname $with_lisp`" 
      LISP_PROGS="`basename $with_lisp`"
    else
      LISP_PATH="$PATH"
      LISP_PROGS='alisp lisp cl clisp'
    fi

    AC_PATH_PROGS(LISP,$LISP_PROGS,no-lisp,${LISP_PATH})
  
    dnl Test whether the batch flag is accepted without error
    dnl CMU CL needs this to exit on EOF
  
    if test $LISP != no-lisp; then
      AC_DEFINE([USE_LISP], 1, [Define to 1 to use Lisp])
      AC_SUBST(USE_LISP)
  
      dnl Test lisp run
      USE_LISP=1
      if test "`basename $LISP`" = 'sbcl'; then
        LISP="$LISP --disable-debugger"
        if $LISP 2>&5 1>&5 </dev/null ; then
          true
        else
          AC_MSG_WARN([Lisp $LISP does not run properly -- see config.log for details])
          LISP=no-lisp
          USE_LISP=""
        fi
      elif $LISP -batch </dev/null 2>&5 1>&5 ; then
        LISP="$LISP -batch"
      fi
    else
      USE_LISP=
    fi
  fi
  
  dnl We record the USE_XXX flag, for later testing in Makefiles.

  LIBSBML_OPTIONS="$LIBSBML_OPTIONS USE_LISP"

])


dnl AC_LISP_EXIT
dnl determine the exit function of the lisp implementation
dnl sets $LISPEXIT to the function name 
AC_DEFUN([CONFIG_LISP_EXIT],
[
  AC_SUBST(LISPEXIT)
  if test "$USE_LISP" = "1" ; then
    AC_CACHE_CHECK(lisp exit, ac_cv_FUNC_LISPEXIT,
    ac_cv_FUNC_LISPEXIT=no-exit
dnl for now, leave the sbcl test first, since it seems to ignore --batch
    for ex in "sb-ext:quit :unix-status" "lisp:exit" "excl:exit" "sys:exit" "ext:quit" "unix:unix-exit" "no-exit" ; do
      echo "configure:__oline__ trying $ex ..." >&5
      echo "(ignore-errors ($ex 127))"|$LISP 2>&5 1>&5
      if test "$?" = "127" ; then
        ac_cv_FUNC_LISPEXIT=$ex 
        break
      fi
    done
    )
    LISPEXIT="$ac_cv_FUNC_LISPEXIT"
    if test "$LISPEXIT" = "no-exit"; then
      AC_MSG_ERROR([Lisp exit function cannot be determined -- see config.log for details] )
    fi
  fi
])

dnl AC_LISP_RUN(message,variable,code)
dnl prints checking message
dnl sets variable to 'ok' or 'failed' depending on 
dnl whether code exits lisp with 0 or >0
dnl cares for caching
dnl uses program $LISP
AC_DEFUN([CONFIG_LISP_RUN],
[
  AC_CACHE_CHECK($1, ac_cv_$2,
    ac_cv_$2="ok"
    echo "$3"|$LISP 1>&5 2>&5|| ac_cv_$2="failed")
  $2="$ac_cv_$2"
]
)

dnl AC_LISP_OUTPUT(message,variable,code,prefix)
dnl prints checking message
dnl sets variable to output of code or 'failed' depending on 
dnl whether code exits lisp with 0 or 1
dnl prepare is lisp code, done out of all error handlers
dnl cares for caching
dnl uses program $LISP and $LISPEXIT
AC_DEFUN([CONFIG_LISP_OUTPUT],
[
  ac_prepare="$4"
  ac_code="$3"
  ac_outfile=ac_out$$		
  ac_ltest="$ac_prepare(handler-bind ((serious-condition #'(lambda (ex) (ignore-errors (apply #'format (list t (simple-condition-format-control ex) (simple-condition-format-arguments ex)))) ($LISPEXIT 1)))) (with-open-file (cl:*standard-output* \"$ac_outfile\" :direction :output :if-exists :new-version) $ac_code ) )($LISPEXIT 0)"
  AC_CACHE_CHECK($1, ac_cv_$2,
    if echo "$ac_ltest"|$LISP 1>&5 2>&5 && test -f $ac_outfile ; then
      ac_cv_$2="`cat $ac_outfile`"
    else
      ac_cv_$2="failed"
    fi
    test -f $ac_outfile && rm $ac_outfile
  )
  if test "$ac_cv_$2" = failed; then
    echo "Failed lisp code was: " >&5
    echo "$ac_code"|sed 's/^/\|/' >&5
    test -f $ac_outfile && rm $ac_outfile
  fi
  $2="$ac_cv_$2"
]
)



dnl AC_LISP_CHECK(message,variable,code,prepare)
dnl uses AC_LISP_RUN
dnl checks whether the code produces an condition in $LISP
dnl or runs through
dnl uses program $LISP and lisp function $LISPEXIT
dnl prepare is done before code to initialize
AC_DEFUN([CONFIG_LISP_CHECK],
[
  ac_prepare="$4"
  ac_code="$3"
  ac_ltest="$ac_prepare(handler-bind ((serious-condition #'(lambda (ex) (ignore-errors (apply #'format (list t (simple-condition-format-control ex) (simple-condition-format-arguments ex)))) ($LISPEXIT 1)))) ${ac_code} )($LISPEXIT 0)"
  CONFIG_LISP_RUN($1,$2,$ac_ltest)
  if test "[$]$2" = failed; then
    echo "Failed lisp code was: " >&5
    echo "$ac_code"|sed 's/^/\|/' >&5
  fi
])


dnl find out the suffix of binary lisp files (fasl, x86f, fas, ...)
dnl This sets FASLEXT 
AC_DEFUN([CONFIG_FASL],
[ 
  AC_SUBST(FASLEXT)
  if test "$USE_LISP" = "1" ; then
    CONFIG_LISP_OUTPUT(lisp binary-extension,FASLEXT,(format t \"~a\" (pathname-type (compile-file-pathname \"bla.lisp\"))),t)
  fi
])


dnl check for compilation tool asdf
dnl sets ASDF and EXT_ASDF to the directory where asdf is
dnl installed
AC_DEFUN([CONFIG_ASDF_CHECK],
[
  AC_SUBST(EXT_ASDF)
  AC_SUBST(ASDF)
  AC_SUBST(ASDF_RUN)
  if test "$USE_LISP" = "1" ; then
    AC_ARG_WITH(asdf,
      AC_HELP_STRING([--with-asdf=<pathname>],
	             [Use asdf at <pathname> (default:src/bindings/lisp/tps/asdf)]),
      ASDFPATH="$with_asdf:`dirname ${with_asdf}`"
     ,
      ASDFPATH="${srcdir}/src/bindings/lisp/tps/asdf"
    )
    AC_PATH_PROG(ASDF,asdf.lisp,failed,$ASDFPATH)
    if test $ASDF = failed; then
      AC_MSG_ERROR([Asdf not found in one of $ASDFPATH])
    fi
    CONFIG_LISP_CHECK(asdf load,RUN_ASDF,(load \"$ASDF\"),t)
    if test $RUN_ASDF = failed; then
      AC_MSG_ERROR([Asdf cannot be loaded -- see config.log for details] )
    fi
    ASDF=`dirname $ASDF`/
    if test "$ASDF" = "${srcdir}/src/bindings/lisp/tps/asdf/"; then
      ASDF_RUN="@final_libdir@/lisp/asdf/"
    else
      EXT_ASDF=1
    fi
    ac_old_dir="`pwd`"
    cd $ASDF
    ASDF="`pwd`/"
    cd $ac_old_dir
    if test -z "$ASDF_RUN"; then
      ASDF_RUN="$ASDF"
    fi
  fi
])

dnl check for uffi 
dnl sets UFFI to the directory of uffi
dnl also links the uffi.asd to the src/bindings/lisp
AC_DEFUN([CONFIG_UFFI_CHECK],
[
  AC_SUBST(UFFI)
  AC_SUBST(UFFI_RUN)
  AC_SUBST(EXT_UFFI)
  if test "$USE_LISP" = "1" ; then
    AC_ARG_WITH(uffi,
      AC_HELP_STRING([--with-uffi=<pathname>],
                     [Use uffi at <pathname> (default:src/bindings/lisp/tps/uffi)]), 
        UFFIPATH="${with_uffi}:`dirname ${with_uffi}`"
	,
        UFFIPATH="${srcdir}/src/bindings/lisp/tps/uffi"
    )
    AC_PATH_PROG(UFFI,uffi.asd,failed,$UFFIPATH)
    if test $UFFI = failed; then
      AC_MSG_ERROR([Uffi not found in one of $UFFIPATH])
    fi

    CONFIG_LISP_CHECK(uffi load,RUN_UFFI,(progn (load \"${UFFI}\") (asdf:operate 'asdf:load-op :uffi)),(require :asdf \"${ASDF}/asdf.lisp\"))

    if test $RUN_UFFI = failed; then
      AC_MSG_ERROR([uffi cannot be loaded -- see config.log for details] )
    fi

    UFFI="`dirname $UFFI`/"
    if test "$UFFI" = "${srcdir}/src/bindings/lisp/tps/uffi/"; then
      UFFI_RUN="@final_libdir@/lisp/uffi/"
    else
      EXT_UFFI=1
    fi
    ac_old_dir="`pwd`"
    cd $UFFI
    UFFI="`pwd`/"
    cd $ac_old_dir
    if test -z "$UFFI_RUN"; then
      UFFI_RUN="$UFFI"
    fi
    if test -h ${srcdir}/src/bindings/lisp/uffi.asd ; then
      rm ${srcdir}/src/bindings/lisp/uffi.asd
    fi
    ln -s ${UFFI}uffi.asd ${srcdir}/src/bindings/lisp/
  fi
])

dnl check for cparse
dnl sets CPARSE to the directory of cparse
dnl also links the cparse.asd to the src/bindings/lisp
AC_DEFUN([CONFIG_CPARSE_CHECK],
[
  AC_SUBST(CPARSE)
  AC_SUBST(EXT_CPARSE)
  if test "$USE_LISP" = "1" ; then
    AC_ARG_WITH(cparse,
      AC_HELP_STRING([--with-cparse=<pathname>],
        [Use cparse at <pathname> (default:src/bindings/lisp/tps/cparse, don't change)]), 
        CPARSEPATH="$with_cparse"
	,
        CPARSEPATH="${srcdir}/src/bindings/lisp/tps/cparse"
    )
    AC_PATH_PROG(CPARSE,cparse.asd,failed,$CPARSEPATH)
    if test $CPARSE = failed; then
      AC_MSG_ERROR([Cparse not found in one of $CPARSEPATH])
    fi

    CONFIG_LISP_CHECK(cparse load,RUN_CPARSE,(progn (load \"${CPARSE}\")(asdf:operate 'asdf:load-op :cparse)),(require :asdf \"${ASDF}/asdf.lisp\"))
    if test $RUN_CPARSE = failed; then
      AC_MSG_ERROR([cparse cannot be loaded -- see config.log for details] )
    fi
    CPARSE="`dirname $CPARSE`/"
    if test "$CPARSE" != "${srcdir}/src/bindings/lisp/tps/cparse/" ; then
      EXT_CPARSE=1
    fi
    ac_old_dir="`pwd`"
    cd $CPARSE
    CPARSE="`pwd`/"
    cd $ac_old_dir
    if test -h ${srcdir}/src/bindings/lisp/cparse.asd ; then
      rm ${srcdir}/src/bindings/lisp/cparse.asd
    fi
    ln -s ${CPARSE}cparse.asd ${srcdir}/src/bindings/lisp/
  fi
])

dnl
dnl Filename    : expat.m4
dnl Description : Autoconf macro to check for existence of Expat library
dnl Author(s)   : Stephan Hoops, Ben Bornstein, Mike Hucka
dnl Created     : 2003-11-05
dnl Revision    : $Id$
dnl Source      : $Source$
dnl
dnl Copyright 2003 California Institute of Technology and
dnl Japan Science and Technology Corporation.
dnl
dnl This library is free software; you can redistribute it and/or modify it
dnl under the terms of the GNU Lesser General Public License as published
dnl by the Free Software Foundation; either version 2.1 of the License, or
dnl any later version.
dnl
dnl This library is distributed in the hope that it will be useful, but
dnl WITHOUT ANY WARRANTY, WITHOUT EVEN THE IMPLIED WARRANTY OF
dnl MERCHANTABILITY OR FITNESS FOR A PARTICULAR PURPOSE.  The software and
dnl documentation provided hereunder is on an "as is" basis, and the
dnl California Institute of Technology and Japan Science and Technology
dnl Corporation have no obligations to provide maintenance, support,
dnl updates, enhancements or modifications.  In no event shall the
dnl California Institute of Technology or the Japan Science and Technology
dnl Corporation be liable to any party for direct, indirect, special,
dnl incidental or consequential damages, including lost profits, arising
dnl out of the use of this software and its documentation, even if the
dnl California Institute of Technology and/or Japan Science and Technology
dnl Corporation have been advised of the possibility of such damage.  See
dnl the GNU Lesser General Public License for more details.
dnl
dnl You should have received a copy of the GNU Lesser General Public License
dnl along with this library; if not, write to the Free Software Foundation,
dnl Inc., 59 Temple Place, Suite 330, Boston, MA 02111-1307 USA.
dnl
dnl The original code contained here was initially developed by:
dnl
dnl     Stephan Hoops, Ben Bornstein, Mike Hucka
dnl
dnl     The SBML Team
dnl     Control and Dynamical Systems, MC 107-81
dnl     California Institute of Technology
dnl     Pasadena, CA, 91125, USA
dnl
dnl     http://sbml.org
dnl     mailto:sbml-team@caltech.edu
dnl
dnl Contributor(s):
dnl   Stephan Hoops
dnl   Mike Hucka <mhucka@caltech.edu> Enhancements to this file.

dnl
dnl Check --with-expat[=PREFIX] is specified and Expat 1.95.0 or greater
dnl is installed.
dnl

AC_DEFUN([CONFIG_LIB_EXPAT],
[
  AC_ARG_WITH([expat],
    AC_HELP_STRING([--with-expat=PREFIX],
                   [Use Expat XML Library [[default=no]]]),
    [with_expat=$withval],
    [with_expat=no])

  if test $with_expat != no; then

    AC_LANG_PUSH(C)

    if test $with_expat != yes; then
      expat_root="$with_expat"
      CONFIG_ADD_LDPATH($expat_root/lib)
    else
      dnl On the Macs, if the user has installed expat via Fink and they
      dnl used the default Fink install path of /sw, the following should
      dnl catch it.  We do this so that Mac users are more likely to find
      dnl success even if they only type --with-expat.

      case $host in
      *darwin*) 
        expat_root="/sw"
        CONFIG_ADD_LDPATH($expat_root/lib)
	;;
      esac    

      dnl Note that CONFIG_ADD_LDPATH is deliberately not called in cases
      dnl other than the two above.
    fi

    EXPAT_CPPFLAGS="-I$expat_root/include"
    EXPAT_LDFLAGS="-I$expat_root/lib"
    EXPAT_LIBS="-lexpat"

    dnl The following is grungy but I don't know how else to make 
    dnl AC_CHECK_LIB use particular library and include paths without
    dnl permanently resetting CPPFLAGS etc.

    tmp_CPPFLAGS=$CPPFLAGS
    tmp_LDFLAGS=$LDFLAGS
    CPPFLAGS="$CPPFLAGS $EXPAT_CPPFLAGS"
    LDFLAGS="$LDFLAGS $EXPAT_LDFLAGS"

    AC_CHECK_LIB(expat, XML_ParserCreate, [expat_found=yes], [expat_found=no])

    if test $expat_found = no; then
      AC_MSG_ERROR([Could not find the Expat XML library.])
    fi       

    AC_CHECK_HEADERS(expat.h, [expat_found=yes], [expat_found=no])

    if test $expat_found = no; then
      AC_MSG_ERROR([Could not find the file expat.h.])
    fi

    CPPFLAGS=$tmp_CPPFLAGS
    LDFLAGS=$tmp_LDFLAGS

    AC_LANG_POP(C)

    AC_DEFINE([USE_EXPAT], 1, [Define to 1 to use the Expat XML library])
    AC_SUBST(USE_EXPAT, 1)

    AC_SUBST(EXPAT_CPPFLAGS)
    AC_SUBST(EXPAT_LDFLAGS)
    AC_SUBST(EXPAT_LIBS)

  fi

  if test $with_expat != no; then
    with_xerces=no
  fi

  dnl We record the USE_XXX flag, for later testing in Makefiles.

  LIBSBML_OPTIONS="$LIBSBML_OPTIONS USE_EXPAT"

])

dnl
dnl Filename    : xercesc.m4
dnl Description : Autoconf macro to check for existence of Xerces-C library
dnl Author(s)   : Ben Bornstein, Mike Hucka
dnl Created     : 2003-02-14
dnl Revision    : $Id$
dnl Source      : $Source$
dnl
dnl Copyright 2002 California Institute of Technology and
dnl Japan Science and Technology Corporation.
dnl
dnl This library is free software; you can redistribute it and/or modify it
dnl under the terms of the GNU Lesser General Public License as published
dnl by the Free Software Foundation; either version 2.1 of the License, or
dnl any later version.
dnl
dnl This library is distributed in the hope that it will be useful, but
dnl WITHOUT ANY WARRANTY, WITHOUT EVEN THE IMPLIED WARRANTY OF
dnl MERCHANTABILITY OR FITNESS FOR A PARTICULAR PURPOSE.  The software and
dnl documentation provided hereunder is on an "as is" basis, and the
dnl California Institute of Technology and Japan Science and Technology
dnl Corporation have no obligations to provide maintenance, support,
dnl updates, enhancements or modifications.  In no event shall the
dnl California Institute of Technology or the Japan Science and Technology
dnl Corporation be liable to any party for direct, indirect, special,
dnl incidental or consequential damages, including lost profits, arising
dnl out of the use of this software and its documentation, even if the
dnl California Institute of Technology and/or Japan Science and Technology
dnl Corporation have been advised of the possibility of such damage.  See
dnl the GNU Lesser General Public License for more details.
dnl
dnl You should have received a copy of the GNU Lesser General Public License
dnl along with this library; if not, write to the Free Software Foundation,
dnl Inc., 59 Temple Place, Suite 330, Boston, MA 02111-1307 USA.
dnl
dnl The original code contained here was initially developed by:
dnl
dnl     Ben Bornstein
dnl
dnl     The SBML Team
dnl     Control and Dynamical Systems, MC 107-81
dnl     California Institute of Technology
dnl     Pasadena, CA, 91125, USA
dnl
dnl     http://sbml.org
dnl     mailto:sbml-team@caltech.edu
dnl
dnl Contributor(s):
dnl   Mike Hucka <mhucka@caltech.edu> Enhancements to this file.
dnl

dnl
dnl Check --with-xerces[=PREFIX] is specified and Xerces-C++ is installed.
dnl

AC_DEFUN([CONFIG_LIB_XERCES],
[
  AC_ARG_WITH([xerces],
    AC_HELP_STRING([--with-xerces=PREFIX],
                   [Use Xerces XML Library [[default=yes]]]),
    [with_xerces=$withval],
    [with_xerces=yes])

  if test $with_expat != no; then
    with_xerces=no
  fi

  if test $with_xerces != no; then

    AC_MSG_CHECKING([for Apache's Xerces-C XML library])

    AC_LANG_PUSH(C++)

    if test $with_xerces != yes; then
      xerces_root="$with_xerces"
      CONFIG_ADD_LDPATH($xerces_root/lib)

      XERCES_CPPFLAGS="-I$xerces_root/include"
      XERCES_LDFLAGS="-L$xerces_root/lib"
    fi

    XERCES_LIBS="-lxerces-c"

    dnl The following is grungy but I don't know how else to make 
    dnl AC_CHECK_LIB use particular library and include paths.

    tmp_CPPFLAGS=$CPPFLAGS
    tmp_LDFLAGS=$LDFLAGS
    tmp_LIBS=$LIBS
    CPPFLAGS="$CPPFLAGS $XERCES_CPPFLAGS"
    LDFLAGS="$LDFLAGS $XERCES_LDFLAGS"
    LIBS="$LIBS $XERCES_LIBS"

    AC_TRY_LINK([
#include <xercesc/util/XercesDefs.hpp>
#include <xercesc/util/PlatformUtils.hpp>
#ifndef XERCES_HAS_CPP_NAMESPACE
#define XERCES_CPP_NAMESPACE_QUALIFIER
#endif
      ],
      [XERCES_CPP_NAMESPACE_QUALIFIER XMLPlatformUtils::Initialize();],
      [xerces_found=yes],
      [xerces_found=no])

    if test $xerces_found = yes; then
      AC_MSG_RESULT([yes])
    else
      AC_MSG_ERROR([Could not find the Xerces XML library.])
    fi

    CPPFLAGS=$tmp_CPPFLAGS
    LDFLAGS=$tmp_LDFLAGS
    LIBS=$tmp_LIBS

    AC_LANG_POP

    AC_DEFINE([USE_XERCES], 1, [Define to 1 to use the Xerces XML library])
    AC_SUBST(USE_XERCES, 1)

    AC_SUBST(XERCES_CPPFLAGS)
    AC_SUBST(XERCES_LDFLAGS)
    AC_SUBST(XERCES_LIBS)

  fi

  dnl We record the USE_XXX flag, for later testing in Makefiles.

  LIBSBML_OPTIONS="$LIBSBML_OPTIONS USE_XERCES"

])

dnl
dnl Filename    : libcheck.m4
dnl Description : Autoconf macro to check for existence of libcheck library
dnl Author(s)   : Ben Bornstein
dnl Organization: Machine Learning Systems Group, JPL
dnl Created     : 2004-02-18
dnl Revision    : $Id$
dnl Source      : $Source$
dnl
dnl Copyright 2004 California Institute of Technology.  ALL RIGHTS RESERVED.
dnl U.S. Government Sponsorship acknowledged.
dnl


dnl
dnl Check --with-check[=PREFIX] is specified and libcheck is installed.
dnl

AC_DEFUN([CONFIG_LIB_LIBCHECK],
[
  AC_ARG_WITH([check],
    AC_HELP_STRING([--with-check=PREFIX],
                   [Build the test suite using libcheck (default=no)]),
    [with_libcheck=$withval],
    [with_libcheck=no])

  libcheck_found=no

  if test $with_libcheck != no; then

    AC_LANG_PUSH(C)

    if test $with_libcheck != yes; then
      libcheck_root="$with_libcheck"
      CONFIG_ADD_LDPATH($libcheck_root/lib)
    else
      dnl On the Macs, if the user has installed libcheck via Fink and they
      dnl used the default Fink install path of /sw, the following should
      dnl catch it.  We do this so that Mac users are more likely to find
      dnl success even if they only type --with-check.

      case $host in
      *darwin*) 
        libcheck_root="/sw"
        CONFIG_ADD_LDPATH($libcheck_root/lib)
	;;
      esac    

    fi

    LIBCHECK_CPPFLAGS="-I$with_libcheck/include"
    LIBCHECK_LDFLAGS="-L$with_libcheck/lib"
    LIBCHECK_LIBS="-lcheck"

    dnl The following is grungy but I don't know how else to make 
    dnl AC_CHECK_LIB use particular library and include paths without
    dnl permanently resetting CPPFLAGS etc.

    tmp_CPPFLAGS=$CPPFLAGS
    tmp_LDFLAGS=$LDFLAGS
    CPPFLAGS="$LIBCHECK_CPPFLAGS $CPPFLAGS"
    LDFLAGS="$LIBCHECK_LDFLAGS $LDFLAGS"

    AC_CHECK_HEADERS([check.h], [libcheck_found=yes], [libcheck_found=no])

    if test $libcheck_found = no; then
      AC_CHECK_LIB([check], [srunner_create],
        [libcheck_found=yes],
        [libcheck_found=no])
    fi

    if test $libcheck_found = no; then
      AC_MSG_ERROR([Could not find the libcheck library.])
    fi

    CPPFLAGS=$tmp_CPPFLAGS
    LDFLAGS=$tmp_LDFLAGS
    LIBS=$tmp_LIBS

    AC_LANG_POP(C)

    AC_DEFINE([USE_LIBCHECK], 1, [Define to 1 to use the check library])
    AC_SUBST(USE_LIBCHECK, 1)

    AC_SUBST(LIBCHECK_CPPFLAGS)
    AC_SUBST(LIBCHECK_LDFLAGS)
    AC_SUBST(LIBCHECK_LIBS)

  fi

  dnl We record the USE_XXX flag, for later testing in Makefiles.

  LIBSBML_OPTIONS="$LIBSBML_OPTIONS USE_LIBCHECK"

])

