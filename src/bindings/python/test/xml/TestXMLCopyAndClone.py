#
# @file    TestXMLCopyAndClone.py
# @brief   Read SBML unit tests
#
# @author  Akiya Jouraku (Python conversion)
# @author  Ben Bornstein 
#
# $Id$
# $HeadURL$
#
# This test file was converted from src/sbml/test/TestCopyAndClone.cpp
# with the help of conversion sciprt (ctest_converter.pl).
#
#<!---------------------------------------------------------------------------
# This file is part of libSBML.  Please visit http://sbml.org for more
# information about SBML, and the latest version of libSBML.
#
# Copyright 2005-2010 California Institute of Technology.
# Copyright 2002-2005 California Institute of Technology and
#                     Japan Science and Technology Corporation.
# 
# This library is free software; you can redistribute it and/or modify it
# under the terms of the GNU Lesser General Public License as published by
# the Free Software Foundation.  A copy of the license agreement is provided
# in the file named "LICENSE.txt" included with this software distribution
# and also available online as http://sbml.org/software/libsbml/license.html
#--------------------------------------------------------------------------->*/
import sys
import unittest
import libsbml

class TestXMLCopyAndClone(unittest.TestCase):


  def test_NS_assignmentOperator(self):
    ns = libsbml.XMLNamespaces()
    ns.add("http://test1.org/", "test1")
    self.assert_( ns.getLength() == 1 )
    self.assert_( ns.isEmpty() == False )
    self.assert_( ns.getPrefix(0) ==  "test1" )
    self.assert_( ns.getURI("test1") ==  "http://test1.org/" )
    ns2 = libsbml.XMLNamespaces()
    ns2 = ns
    self.assert_( ns2.getLength() == 1 )
    self.assert_( ns2.isEmpty() == False )
    self.assert_( ns2.getPrefix(0) ==  "test1" )
    self.assert_( ns2.getURI("test1") ==  "http://test1.org/" )
    ns2 = None
    ns = None
    pass  

  def test_NS_clone(self):
    ns = libsbml.XMLNamespaces()
    ns.add("http://test1.org/", "test1")
    self.assert_( ns.getLength() == 1 )
    self.assert_( ns.isEmpty() == False )
    self.assert_( ns.getPrefix(0) ==  "test1" )
    self.assert_( ns.getURI("test1") ==  "http://test1.org/" )
    ns2 = ns.clone()
    self.assert_( ns2.getLength() == 1 )
    self.assert_( ns2.isEmpty() == False )
    self.assert_( ns2.getPrefix(0) ==  "test1" )
    self.assert_( ns2.getURI("test1") ==  "http://test1.org/" )
    ns2 = None
    ns = None
    pass  

  def test_NS_copyConstructor(self):
    ns = libsbml.XMLNamespaces()
    ns.add("http://test1.org/", "test1")
    self.assert_( ns.getLength() == 1 )
    self.assert_( ns.isEmpty() == False )
    self.assert_( ns.getPrefix(0) ==  "test1" )
    self.assert_( ns.getURI("test1") ==  "http://test1.org/" )
    ns2 = libsbml.XMLNamespaces(ns)
    self.assert_( ns2.getLength() == 1 )
    self.assert_( ns2.isEmpty() == False )
    self.assert_( ns2.getPrefix(0) ==  "test1" )
    self.assert_( ns2.getURI("test1") ==  "http://test1.org/" )
    ns2 = None
    ns = None
    pass  

  def test_Node_assignmentOperator(self):
    att = libsbml.XMLAttributes()
    t = libsbml.XMLTriple("sarah", "http://foo.org/", "bar")
    token = libsbml.XMLToken(t,att,3,4)
    node = libsbml.XMLNode(token)
    child = libsbml.XMLNode()
    node.addChild(child)
    self.assert_( node.getNumChildren() == 1 )
    self.assert_( node.getName() ==  "sarah" )
    self.assert_( node.getURI() ==  "http://foo.org/" )
    self.assert_( node.getPrefix() ==  "bar" )
    self.assert_( node.isEnd() == False )
    self.assert_( node.isEOF() == False )
    self.assert_( node.getLine() == 3 )
    self.assert_( node.getColumn() == 4 )
    node2 = libsbml.XMLNode()
    node2 = node
    self.assert_( node2.getNumChildren() == 1 )
    self.assert_( node2.getName() ==  "sarah" )
    self.assert_( node2.getURI() ==  "http://foo.org/" )
    self.assert_( node2.getPrefix() ==  "bar" )
    self.assert_( node2.isEnd() == False )
    self.assert_( node2.isEOF() == False )
    self.assert_( node2.getLine() == 3 )
    self.assert_( node2.getColumn() == 4 )
    t = None
    token = None
    node = None
    node2 = None
    pass  

  def test_Node_clone(self):
    att = libsbml.XMLAttributes()
    t = libsbml.XMLTriple("sarah", "http://foo.org/", "bar")
    token = libsbml.XMLToken(t,att,3,4)
    node = libsbml.XMLNode(token)
    child = libsbml.XMLNode()
    node.addChild(child)
    self.assert_( node.getNumChildren() == 1 )
    self.assert_( node.getName() ==  "sarah" )
    self.assert_( node.getURI() ==  "http://foo.org/" )
    self.assert_( node.getPrefix() ==  "bar" )
    self.assert_( node.isEnd() == False )
    self.assert_( node.isEOF() == False )
    self.assert_( node.getLine() == 3 )
    self.assert_( node.getColumn() == 4 )
    node2 = node.clone()
    self.assert_( node2.getNumChildren() == 1 )
    self.assert_( node2.getName() ==  "sarah" )
    self.assert_( node2.getURI() ==  "http://foo.org/" )
    self.assert_( node2.getPrefix() ==  "bar" )
    self.assert_( node2.isEnd() == False )
    self.assert_( node2.isEOF() == False )
    self.assert_( node2.getLine() == 3 )
    self.assert_( node2.getColumn() == 4 )
    t = None
    token = None
    node = None
    node2 = None
    pass  

  def test_Node_copyConstructor(self):
    att = libsbml.XMLAttributes()
    t = libsbml.XMLTriple("sarah", "http://foo.org/", "bar")
    token = libsbml.XMLToken(t,att,3,4)
    node = libsbml.XMLNode(token)
    child = libsbml.XMLNode()
    node.addChild(child)
    self.assert_( node.getNumChildren() == 1 )
    self.assert_( node.getName() ==  "sarah" )
    self.assert_( node.getURI() ==  "http://foo.org/" )
    self.assert_( node.getPrefix() ==  "bar" )
    self.assert_( node.isEnd() == False )
    self.assert_( node.isEOF() == False )
    self.assert_( node.getLine() == 3 )
    self.assert_( node.getColumn() == 4 )
    node2 = libsbml.XMLNode(node)
    self.assert_( node2.getNumChildren() == 1 )
    self.assert_( node2.getName() ==  "sarah" )
    self.assert_( node2.getURI() ==  "http://foo.org/" )
    self.assert_( node2.getPrefix() ==  "bar" )
    self.assert_( node2.isEnd() == False )
    self.assert_( node2.isEOF() == False )
    self.assert_( node2.getLine() == 3 )
    self.assert_( node2.getColumn() == 4 )
    t = None
    token = None
    node = None
    node2 = None
    pass  

  def test_Token_assignmentOperator(self):
    t = libsbml.XMLTriple("sarah", "http://foo.org/", "bar")
    token = libsbml.XMLToken(t,3,4)
    self.assert_( token.getName() ==  "sarah" )
    self.assert_( token.getURI() ==  "http://foo.org/" )
    self.assert_( token.getPrefix() ==  "bar" )
    self.assert_( token.isEnd() == True )
    self.assert_( token.isEOF() == False )
    self.assert_( token.getLine() == 3 )
    self.assert_( token.getColumn() == 4 )
    token2 = libsbml.XMLToken()
    token2 = token
    self.assert_( token2.getName() ==  "sarah" )
    self.assert_( token2.getURI() ==  "http://foo.org/" )
    self.assert_( token2.getPrefix() ==  "bar" )
    self.assert_( token2.isEnd() == True )
    self.assert_( token2.isEOF() == False )
    self.assert_( token2.getLine() == 3 )
    self.assert_( token2.getColumn() == 4 )
    t = None
    token = None
    token2 = None
    pass  

  def test_Token_clone(self):
    t = libsbml.XMLTriple("sarah", "http://foo.org/", "bar")
    token = libsbml.XMLToken(t,3,4)
    self.assert_( token.getName() ==  "sarah" )
    self.assert_( token.getURI() ==  "http://foo.org/" )
    self.assert_( token.getPrefix() ==  "bar" )
    self.assert_( token.isEnd() == True )
    self.assert_( token.isEOF() == False )
    self.assert_( token.getLine() == 3 )
    self.assert_( token.getColumn() == 4 )
    token2 = token.clone()
    self.assert_( token2.getName() ==  "sarah" )
    self.assert_( token2.getURI() ==  "http://foo.org/" )
    self.assert_( token2.getPrefix() ==  "bar" )
    self.assert_( token2.isEnd() == True )
    self.assert_( token2.isEOF() == False )
    self.assert_( token2.getLine() == 3 )
    self.assert_( token2.getColumn() == 4 )
    t = None
    token = None
    token2 = None
    pass  

  def test_Token_copyConstructor(self):
    t = libsbml.XMLTriple("sarah", "http://foo.org/", "bar")
    token = libsbml.XMLToken(t,3,4)
    self.assert_( token.getName() ==  "sarah" )
    self.assert_( token.getURI() ==  "http://foo.org/" )
    self.assert_( token.getPrefix() ==  "bar" )
    self.assert_( token.isEnd() == True )
    self.assert_( token.isEOF() == False )
    self.assert_( token.getLine() == 3 )
    self.assert_( token.getColumn() == 4 )
    token2 = libsbml.XMLToken(token)
    self.assert_( token2.getName() ==  "sarah" )
    self.assert_( token2.getURI() ==  "http://foo.org/" )
    self.assert_( token2.getPrefix() ==  "bar" )
    self.assert_( token2.isEnd() == True )
    self.assert_( token2.isEOF() == False )
    self.assert_( token2.getLine() == 3 )
    self.assert_( token2.getColumn() == 4 )
    t = None
    token = None
    token2 = None
    pass  

  def test_Triple_assignmentOperator(self):
    t = libsbml.XMLTriple("sarah", "http://foo.org/", "bar")
    self.assert_( t.getName() ==  "sarah" )
    self.assert_( t.getURI() ==  "http://foo.org/" )
    self.assert_( t.getPrefix() ==  "bar" )
    t2 = libsbml.XMLTriple()
    t2 = t
    self.assert_( t2.getName() ==  "sarah" )
    self.assert_( t2.getURI() ==  "http://foo.org/" )
    self.assert_( t2.getPrefix() ==  "bar" )
    t = None
    t2 = None
    pass  

  def test_Triple_clone(self):
    t = libsbml.XMLTriple("sarah", "http://foo.org/", "bar")
    self.assert_( t.getName() ==  "sarah" )
    self.assert_( t.getURI() ==  "http://foo.org/" )
    self.assert_( t.getPrefix() ==  "bar" )
    t2 = t.clone()
    self.assert_( t2.getName() ==  "sarah" )
    self.assert_( t2.getURI() ==  "http://foo.org/" )
    self.assert_( t2.getPrefix() ==  "bar" )
    t = None
    t2 = None
    pass  

  def test_Triple_copyConstructor(self):
    t = libsbml.XMLTriple("sarah", "http://foo.org/", "bar")
    self.assert_( t.getName() ==  "sarah" )
    self.assert_( t.getURI() ==  "http://foo.org/" )
    self.assert_( t.getPrefix() ==  "bar" )
    t2 = libsbml.XMLTriple(t)
    self.assert_( t2.getName() ==  "sarah" )
    self.assert_( t2.getURI() ==  "http://foo.org/" )
    self.assert_( t2.getPrefix() ==  "bar" )
    t = None
    t2 = None
    pass  

def suite():
  suite = unittest.TestSuite()
  suite.addTest(unittest.makeSuite(TestXMLCopyAndClone))

  return suite

if __name__ == "__main__":
  if unittest.TextTestRunner(verbosity=1).run(suite()).wasSuccessful() :
    sys.exit(0)
  else:
    sys.exit(1)
