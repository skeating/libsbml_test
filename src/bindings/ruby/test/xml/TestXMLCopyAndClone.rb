#
# @file    TestXMLCopyAndClone.rb
# @brief   Read SBML unit tests
#
# @author  Akiya Jouraku (Ruby conversion)
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
require 'test/unit'
require 'libSBML'

class TestXMLCopyAndClone < Test::Unit::TestCase

  def test_NS_assignmentOperator
    ns = LibSBML::XMLNamespaces.new()
    ns.add("http://test1.org/", "test1")
    assert( ns.getLength() == 1 )
    assert( ns.isEmpty() == false )
    assert( ns.getPrefix(0) ==  "test1" )
    assert( ns.getURI("test1") ==  "http://test1.org/" )
    ns2 = LibSBML::XMLNamespaces.new()
    ns2 = ns
    assert( ns2.getLength() == 1 )
    assert( ns2.isEmpty() == false )
    assert( ns2.getPrefix(0) ==  "test1" )
    assert( ns2.getURI("test1") ==  "http://test1.org/" )
    ns2 = nil
    ns = nil
  end

  def test_NS_clone
    ns = LibSBML::XMLNamespaces.new()
    ns.add("http://test1.org/", "test1")
    assert( ns.getLength() == 1 )
    assert( ns.isEmpty() == false )
    assert( ns.getPrefix(0) ==  "test1" )
    assert( ns.getURI("test1") ==  "http://test1.org/" )
    ns2 = ns.clone()
    assert( ns2.getLength() == 1 )
    assert( ns2.isEmpty() == false )
    assert( ns2.getPrefix(0) ==  "test1" )
    assert( ns2.getURI("test1") ==  "http://test1.org/" )
    ns2 = nil
    ns = nil
  end

  def test_NS_copyConstructor
    ns = LibSBML::XMLNamespaces.new()
    ns.add("http://test1.org/", "test1")
    assert( ns.getLength() == 1 )
    assert( ns.isEmpty() == false )
    assert( ns.getPrefix(0) ==  "test1" )
    assert( ns.getURI("test1") ==  "http://test1.org/" )
    ns2 = LibSBML::XMLNamespaces.new(ns)
    assert( ns2.getLength() == 1 )
    assert( ns2.isEmpty() == false )
    assert( ns2.getPrefix(0) ==  "test1" )
    assert( ns2.getURI("test1") ==  "http://test1.org/" )
    ns2 = nil
    ns = nil
  end

  def test_Node_assignmentOperator
    att = LibSBML::XMLAttributes.new()
    t = LibSBML::XMLTriple.new("sarah", "http://foo.org/", "bar")
    token = LibSBML::XMLToken.new(t,att,3,4)
    node = LibSBML::XMLNode.new(token)
    child = LibSBML::XMLNode.new()
    node.addChild(child)
    assert( node.getNumChildren() == 1 )
    assert( node.getName() ==  "sarah" )
    assert( node.getURI() ==  "http://foo.org/" )
    assert( node.getPrefix() ==  "bar" )
    assert( node.isEnd() == false )
    assert( node.isEOF() == false )
    assert( node.getLine() == 3 )
    assert( node.getColumn() == 4 )
    node2 = LibSBML::XMLNode.new()
    node2 = node
    assert( node2.getNumChildren() == 1 )
    assert( node2.getName() ==  "sarah" )
    assert( node2.getURI() ==  "http://foo.org/" )
    assert( node2.getPrefix() ==  "bar" )
    assert( node2.isEnd() == false )
    assert( node2.isEOF() == false )
    assert( node2.getLine() == 3 )
    assert( node2.getColumn() == 4 )
    t = nil
    token = nil
    node = nil
    node2 = nil
  end

  def test_Node_clone
    att = LibSBML::XMLAttributes.new()
    t = LibSBML::XMLTriple.new("sarah", "http://foo.org/", "bar")
    token = LibSBML::XMLToken.new(t,att,3,4)
    node = LibSBML::XMLNode.new(token)
    child = LibSBML::XMLNode.new()
    node.addChild(child)
    assert( node.getNumChildren() == 1 )
    assert( node.getName() ==  "sarah" )
    assert( node.getURI() ==  "http://foo.org/" )
    assert( node.getPrefix() ==  "bar" )
    assert( node.isEnd() == false )
    assert( node.isEOF() == false )
    assert( node.getLine() == 3 )
    assert( node.getColumn() == 4 )
    node2 = node.clone()
    assert( node2.getNumChildren() == 1 )
    assert( node2.getName() ==  "sarah" )
    assert( node2.getURI() ==  "http://foo.org/" )
    assert( node2.getPrefix() ==  "bar" )
    assert( node2.isEnd() == false )
    assert( node2.isEOF() == false )
    assert( node2.getLine() == 3 )
    assert( node2.getColumn() == 4 )
    t = nil
    token = nil
    node = nil
    node2 = nil
  end

  def test_Node_copyConstructor
    att = LibSBML::XMLAttributes.new()
    t = LibSBML::XMLTriple.new("sarah", "http://foo.org/", "bar")
    token = LibSBML::XMLToken.new(t,att,3,4)
    node = LibSBML::XMLNode.new(token)
    child = LibSBML::XMLNode.new()
    node.addChild(child)
    assert( node.getNumChildren() == 1 )
    assert( node.getName() ==  "sarah" )
    assert( node.getURI() ==  "http://foo.org/" )
    assert( node.getPrefix() ==  "bar" )
    assert( node.isEnd() == false )
    assert( node.isEOF() == false )
    assert( node.getLine() == 3 )
    assert( node.getColumn() == 4 )
    node2 = LibSBML::XMLNode.new(node)
    assert( node2.getNumChildren() == 1 )
    assert( node2.getName() ==  "sarah" )
    assert( node2.getURI() ==  "http://foo.org/" )
    assert( node2.getPrefix() ==  "bar" )
    assert( node2.isEnd() == false )
    assert( node2.isEOF() == false )
    assert( node2.getLine() == 3 )
    assert( node2.getColumn() == 4 )
    t = nil
    token = nil
    node = nil
    node2 = nil
  end

  def test_Token_assignmentOperator
    t = LibSBML::XMLTriple.new("sarah", "http://foo.org/", "bar")
    token = LibSBML::XMLToken.new(t,3,4)
    assert( token.getName() ==  "sarah" )
    assert( token.getURI() ==  "http://foo.org/" )
    assert( token.getPrefix() ==  "bar" )
    assert( token.isEnd() == true )
    assert( token.isEOF() == false )
    assert( token.getLine() == 3 )
    assert( token.getColumn() == 4 )
    token2 = LibSBML::XMLToken.new()
    token2 = token
    assert( token2.getName() ==  "sarah" )
    assert( token2.getURI() ==  "http://foo.org/" )
    assert( token2.getPrefix() ==  "bar" )
    assert( token2.isEnd() == true )
    assert( token2.isEOF() == false )
    assert( token2.getLine() == 3 )
    assert( token2.getColumn() == 4 )
    t = nil
    token = nil
    token2 = nil
  end

  def test_Token_clone
    t = LibSBML::XMLTriple.new("sarah", "http://foo.org/", "bar")
    token = LibSBML::XMLToken.new(t,3,4)
    assert( token.getName() ==  "sarah" )
    assert( token.getURI() ==  "http://foo.org/" )
    assert( token.getPrefix() ==  "bar" )
    assert( token.isEnd() == true )
    assert( token.isEOF() == false )
    assert( token.getLine() == 3 )
    assert( token.getColumn() == 4 )
    token2 = token.clone()
    assert( token2.getName() ==  "sarah" )
    assert( token2.getURI() ==  "http://foo.org/" )
    assert( token2.getPrefix() ==  "bar" )
    assert( token2.isEnd() == true )
    assert( token2.isEOF() == false )
    assert( token2.getLine() == 3 )
    assert( token2.getColumn() == 4 )
    t = nil
    token = nil
    token2 = nil
  end

  def test_Token_copyConstructor
    t = LibSBML::XMLTriple.new("sarah", "http://foo.org/", "bar")
    token = LibSBML::XMLToken.new(t,3,4)
    assert( token.getName() ==  "sarah" )
    assert( token.getURI() ==  "http://foo.org/" )
    assert( token.getPrefix() ==  "bar" )
    assert( token.isEnd() == true )
    assert( token.isEOF() == false )
    assert( token.getLine() == 3 )
    assert( token.getColumn() == 4 )
    token2 = LibSBML::XMLToken.new(token)
    assert( token2.getName() ==  "sarah" )
    assert( token2.getURI() ==  "http://foo.org/" )
    assert( token2.getPrefix() ==  "bar" )
    assert( token2.isEnd() == true )
    assert( token2.isEOF() == false )
    assert( token2.getLine() == 3 )
    assert( token2.getColumn() == 4 )
    t = nil
    token = nil
    token2 = nil
  end

  def test_Triple_assignmentOperator
    t = LibSBML::XMLTriple.new("sarah", "http://foo.org/", "bar")
    assert( t.getName() ==  "sarah" )
    assert( t.getURI() ==  "http://foo.org/" )
    assert( t.getPrefix() ==  "bar" )
    t2 = LibSBML::XMLTriple.new()
    t2 = t
    assert( t2.getName() ==  "sarah" )
    assert( t2.getURI() ==  "http://foo.org/" )
    assert( t2.getPrefix() ==  "bar" )
    t = nil
    t2 = nil
  end

  def test_Triple_clone
    t = LibSBML::XMLTriple.new("sarah", "http://foo.org/", "bar")
    assert( t.getName() ==  "sarah" )
    assert( t.getURI() ==  "http://foo.org/" )
    assert( t.getPrefix() ==  "bar" )
    t2 = t.clone()
    assert( t2.getName() ==  "sarah" )
    assert( t2.getURI() ==  "http://foo.org/" )
    assert( t2.getPrefix() ==  "bar" )
    t = nil
    t2 = nil
  end

  def test_Triple_copyConstructor
    t = LibSBML::XMLTriple.new("sarah", "http://foo.org/", "bar")
    assert( t.getName() ==  "sarah" )
    assert( t.getURI() ==  "http://foo.org/" )
    assert( t.getPrefix() ==  "bar" )
    t2 = LibSBML::XMLTriple.new(t)
    assert( t2.getName() ==  "sarah" )
    assert( t2.getURI() ==  "http://foo.org/" )
    assert( t2.getPrefix() ==  "bar" )
    t = nil
    t2 = nil
  end

end
