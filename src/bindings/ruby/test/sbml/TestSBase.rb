#
# @file    TestSBase.rb
# @brief   SBase unit tests
#
# @author  Akiya Jouraku (Ruby conversion)
# @author  Ben Bornstein 
#
# $Id$
# $HeadURL$
#
# This test file was converted from src/sbml/test/TestSBase.cpp
# with the help of conversion sciprt (ctest_converter.pl).
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
#--------------------------------------------------------------------------->*/
require 'test/unit'
require 'libSBML'

class TestSBase < Test::Unit::TestCase

  def setup
    @@s = LibSBML::Model.new(2,4)
    if (@@s == nil)
    end
  end

  def teardown
    @@s = nil
  end

  def test_SBase_CVTerms
    cv = LibSBML::CVTerm.new(LibSBML::BIOLOGICAL_QUALIFIER)
    cv.setBiologicalQualifierType(LibSBML::BQB_IS)
    cv.addResource( "foo")
    assert( @@s.getNumCVTerms() == 0 )
    assert( @@s.getCVTerms() == nil )
    @@s.setMetaId( "_id")
    @@s.addCVTerm(cv)
    assert( @@s.getNumCVTerms() == 1 )
    assert( @@s.getCVTerms() != nil )
    assert( @@s.getCVTerm(0) != cv )
    cv = nil
  end

  def test_SBase_addCVTerms
    cv = LibSBML::CVTerm.new(LibSBML::BIOLOGICAL_QUALIFIER)
    cv.setBiologicalQualifierType(LibSBML::BQB_ENCODES)
    cv.addResource( "foo")
    @@s.setMetaId( "sbase1")
    @@s.addCVTerm(cv)
    assert( @@s.getNumCVTerms() == 1 )
    assert( @@s.getCVTerms() != nil )
    res = @@s.getCVTerm(0).getResources()
    assert ((  "foo" == res.getValue(0) ))
    cv1 = LibSBML::CVTerm.new(LibSBML::BIOLOGICAL_QUALIFIER)
    cv1.setBiologicalQualifierType(LibSBML::BQB_IS)
    cv1.addResource( "bar")
    @@s.addCVTerm(cv1)
    assert( @@s.getNumCVTerms() == 2 )
    cv2 = LibSBML::CVTerm.new(LibSBML::BIOLOGICAL_QUALIFIER)
    cv2.setBiologicalQualifierType(LibSBML::BQB_IS)
    cv2.addResource( "bar1")
    @@s.addCVTerm(cv2)
    assert( @@s.getNumCVTerms() == 2 )
    res = @@s.getCVTerm(1).getResources()
    assert( res.getLength() == 2 )
    assert ((  "bar" == res.getValue(0) ))
    assert ((  "bar1" == res.getValue(1) ))
    cv4 = LibSBML::CVTerm.new(LibSBML::BIOLOGICAL_QUALIFIER)
    cv4.setBiologicalQualifierType(LibSBML::BQB_IS)
    cv4.addResource( "bar1")
    @@s.addCVTerm(cv4)
    assert( @@s.getNumCVTerms() == 2 )
    res = @@s.getCVTerm(1).getResources()
    assert( res.getLength() == 2 )
    assert ((  "bar" == res.getValue(0) ))
    assert ((  "bar1" == res.getValue(1) ))
    cv5 = LibSBML::CVTerm.new(LibSBML::BIOLOGICAL_QUALIFIER)
    cv5.setBiologicalQualifierType(LibSBML::BQB_HAS_PART)
    cv5.addResource( "bar1")
    @@s.addCVTerm(cv5)
    assert( @@s.getNumCVTerms() == 2 )
    res = @@s.getCVTerm(1).getResources()
    assert( res.getLength() == 2 )
    assert ((  "bar" == res.getValue(0) ))
    assert ((  "bar1" == res.getValue(1) ))
    cv = nil
    cv2 = nil
    cv1 = nil
    cv4 = nil
  end

  def test_SBase_appendNotes
    triple = LibSBML::XMLTriple.new("p", "", "")
    att = LibSBML::XMLAttributes.new()
    ns = LibSBML::XMLNamespaces.new()
    ns.add( "http://www.w3.org/1999/xhtml", "")
    token4 = LibSBML::XMLToken.new("This is my text")
    node4 = LibSBML::XMLNode.new(token4)
    token5 = LibSBML::XMLToken.new("This is additional text")
    node5 = LibSBML::XMLNode.new(token5)
    token = LibSBML::XMLToken.new(triple,att,ns)
    node = LibSBML::XMLNode.new(token)
    node.addChild(node4)
    @@s.setNotes(node)
    assert( @@s.isSetNotes() == true )
    token1 = LibSBML::XMLToken.new(triple,att,ns)
    node1 = LibSBML::XMLNode.new(token1)
    node1.addChild(node5)
    @@s.appendNotes(node1)
    assert( @@s.isSetNotes() == true )
    node2 = @@s.getNotes()
    assert( node2.getNumChildren() == 2 )
    assert ((  "p" == node2.getChild(0).getName() ))
    assert( node2.getChild(0).getNumChildren() == 1 )
    assert ((  "p" == node2.getChild(1).getName() ))
    assert( node2.getChild(1).getNumChildren() == 1 )
    chars1 = node2.getChild(0).getChild(0).getCharacters()
    chars2 = node2.getChild(1).getChild(0).getCharacters()
    assert ((  "This is my text" == chars1 ))
    assert ((  "This is additional text" == chars2 ))
    node = nil
    node1 = nil
  end

  def test_SBase_appendNotes1
    att = LibSBML::XMLAttributes.new()
    ns = LibSBML::XMLNamespaces.new()
    ns.add( "http://www.w3.org/1999/xhtml", "")
    html_triple = LibSBML::XMLTriple.new("html", "", "")
    head_triple = LibSBML::XMLTriple.new("head", "", "")
    title_triple = LibSBML::XMLTriple.new("title", "", "")
    body_triple = LibSBML::XMLTriple.new("body", "", "")
    p_triple = LibSBML::XMLTriple.new("p", "", "")
    html_token = LibSBML::XMLToken.new(html_triple,att,ns)
    head_token = LibSBML::XMLToken.new(head_triple,att)
    title_token = LibSBML::XMLToken.new(title_triple,att)
    body_token = LibSBML::XMLToken.new(body_triple,att)
    p_token = LibSBML::XMLToken.new(p_triple,att)
    text_token = LibSBML::XMLToken.new("This is my text")
    html_node = LibSBML::XMLNode.new(html_token)
    head_node = LibSBML::XMLNode.new(head_token)
    title_node = LibSBML::XMLNode.new(title_token)
    body_node = LibSBML::XMLNode.new(body_token)
    p_node = LibSBML::XMLNode.new(p_token)
    text_node = LibSBML::XMLNode.new(text_token)
    text_token1 = LibSBML::XMLToken.new("This is more text")
    html_node1 = LibSBML::XMLNode.new(html_token)
    head_node1 = LibSBML::XMLNode.new(head_token)
    title_node1 = LibSBML::XMLNode.new(title_token)
    body_node1 = LibSBML::XMLNode.new(body_token)
    p_node1 = LibSBML::XMLNode.new(p_token)
    text_node1 = LibSBML::XMLNode.new(text_token1)
    p_node.addChild(text_node)
    body_node.addChild(p_node)
    head_node.addChild(title_node)
    html_node.addChild(head_node)
    html_node.addChild(body_node)
    p_node1.addChild(text_node1)
    body_node1.addChild(p_node1)
    head_node1.addChild(title_node1)
    html_node1.addChild(head_node1)
    html_node1.addChild(body_node1)
    @@s.setNotes(html_node)
    @@s.appendNotes(html_node1)
    notes = @@s.getNotes()
    assert ((  "notes" == notes.getName() ))
    assert( notes.getNumChildren() == 1 )
    child = notes.getChild(0)
    assert ((  "html" == child.getName() ))
    assert( child.getNumChildren() == 2 )
    child = child.getChild(1)
    assert ((  "body" == child.getName() ))
    assert( child.getNumChildren() == 2 )
    child1 = child.getChild(0)
    assert ((  "p" == child1.getName() ))
    assert( child1.getNumChildren() == 1 )
    child1 = child1.getChild(0)
    assert ((  "This is my text" == child1.getCharacters() ))
    assert( child1.getNumChildren() == 0 )
    child1 = child.getChild(1)
    assert ((  "p" == child1.getName() ))
    assert( child1.getNumChildren() == 1 )
    child1 = child1.getChild(0)
    assert ((  "This is more text" == child1.getCharacters() ))
    assert( child1.getNumChildren() == 0 )
    att = nil
    ns = nil
    html_triple = nil
    head_triple = nil
    body_triple = nil
    p_triple = nil
    html_token = nil
    head_token = nil
    body_token = nil
    p_token = nil
    text_token = nil
    text_token1 = nil
    html_node = nil
    head_node = nil
    body_node = nil
    p_node = nil
    text_node = nil
    html_node1 = nil
    head_node1 = nil
    body_node1 = nil
    p_node1 = nil
    text_node1 = nil
  end

  def test_SBase_appendNotes2
    att = LibSBML::XMLAttributes.new()
    ns = LibSBML::XMLNamespaces.new()
    ns.add( "http://www.w3.org/1999/xhtml", "")
    html_triple = LibSBML::XMLTriple.new("html", "", "")
    head_triple = LibSBML::XMLTriple.new("head", "", "")
    title_triple = LibSBML::XMLTriple.new("title", "", "")
    body_triple = LibSBML::XMLTriple.new("body", "", "")
    p_triple = LibSBML::XMLTriple.new("p", "", "")
    html_token = LibSBML::XMLToken.new(html_triple,att,ns)
    head_token = LibSBML::XMLToken.new(head_triple,att)
    title_token = LibSBML::XMLToken.new(title_triple,att)
    body_token = LibSBML::XMLToken.new(body_triple,att)
    p_token = LibSBML::XMLToken.new(p_triple,att)
    text_token = LibSBML::XMLToken.new("This is my text")
    html_node = LibSBML::XMLNode.new(html_token)
    head_node = LibSBML::XMLNode.new(head_token)
    title_node = LibSBML::XMLNode.new(title_token)
    body_node = LibSBML::XMLNode.new(body_token)
    p_node = LibSBML::XMLNode.new(p_token)
    text_node = LibSBML::XMLNode.new(text_token)
    body_token1 = LibSBML::XMLToken.new(body_triple,att,ns)
    text_token1 = LibSBML::XMLToken.new("This is more text")
    body_node1 = LibSBML::XMLNode.new(body_token1)
    p_node1 = LibSBML::XMLNode.new(p_token)
    text_node1 = LibSBML::XMLNode.new(text_token1)
    p_node.addChild(text_node)
    body_node.addChild(p_node)
    head_node.addChild(title_node)
    html_node.addChild(head_node)
    html_node.addChild(body_node)
    p_node1.addChild(text_node1)
    body_node1.addChild(p_node1)
    @@s.setNotes(html_node)
    @@s.appendNotes(body_node1)
    notes = @@s.getNotes()
    assert ((  "notes" == notes.getName() ))
    assert( notes.getNumChildren() == 1 )
    child = notes.getChild(0)
    assert ((  "html" == child.getName() ))
    assert( child.getNumChildren() == 2 )
    child = child.getChild(1)
    assert ((  "body" == child.getName() ))
    assert( child.getNumChildren() == 2 )
    child1 = child.getChild(0)
    assert ((  "p" == child1.getName() ))
    assert( child1.getNumChildren() == 1 )
    child1 = child1.getChild(0)
    assert ((  "This is my text" == child1.getCharacters() ))
    assert( child1.getNumChildren() == 0 )
    child1 = child.getChild(1)
    assert ((  "p" == child1.getName() ))
    assert( child1.getNumChildren() == 1 )
    child1 = child1.getChild(0)
    assert ((  "This is more text" == child1.getCharacters() ))
    assert( child1.getNumChildren() == 0 )
    att = nil
    ns = nil
    html_triple = nil
    head_triple = nil
    body_triple = nil
    p_triple = nil
    html_token = nil
    head_token = nil
    body_token = nil
    p_token = nil
    text_token = nil
    text_token1 = nil
    body_token1 = nil
    html_node = nil
    head_node = nil
    body_node = nil
    p_node = nil
    text_node = nil
    body_node1 = nil
    p_node1 = nil
    text_node1 = nil
  end

  def test_SBase_appendNotes3
    att = LibSBML::XMLAttributes.new()
    ns = LibSBML::XMLNamespaces.new()
    ns.add( "http://www.w3.org/1999/xhtml", "")
    html_triple = LibSBML::XMLTriple.new("html", "", "")
    head_triple = LibSBML::XMLTriple.new("head", "", "")
    title_triple = LibSBML::XMLTriple.new("title", "", "")
    body_triple = LibSBML::XMLTriple.new("body", "", "")
    p_triple = LibSBML::XMLTriple.new("p", "", "")
    html_token = LibSBML::XMLToken.new(html_triple,att,ns)
    head_token = LibSBML::XMLToken.new(head_triple,att)
    title_token = LibSBML::XMLToken.new(title_triple,att)
    body_token = LibSBML::XMLToken.new(body_triple,att)
    p_token = LibSBML::XMLToken.new(p_triple,att)
    text_token = LibSBML::XMLToken.new("This is my text")
    html_node = LibSBML::XMLNode.new(html_token)
    head_node = LibSBML::XMLNode.new(head_token)
    title_node = LibSBML::XMLNode.new(title_token)
    body_node = LibSBML::XMLNode.new(body_token)
    p_node = LibSBML::XMLNode.new(p_token)
    text_node = LibSBML::XMLNode.new(text_token)
    p_token1 = LibSBML::XMLToken.new(p_triple,att,ns)
    text_token1 = LibSBML::XMLToken.new("This is more text")
    p_node1 = LibSBML::XMLNode.new(p_token1)
    text_node1 = LibSBML::XMLNode.new(text_token1)
    p_node.addChild(text_node)
    body_node.addChild(p_node)
    head_node.addChild(title_node)
    html_node.addChild(head_node)
    html_node.addChild(body_node)
    p_node1.addChild(text_node1)
    @@s.setNotes(html_node)
    @@s.appendNotes(p_node1)
    notes = @@s.getNotes()
    assert ((  "notes" == notes.getName() ))
    assert( notes.getNumChildren() == 1 )
    child = notes.getChild(0)
    assert ((  "html" == child.getName() ))
    assert( child.getNumChildren() == 2 )
    child = child.getChild(1)
    assert ((  "body" == child.getName() ))
    assert( child.getNumChildren() == 2 )
    child1 = child.getChild(0)
    assert ((  "p" == child1.getName() ))
    assert( child1.getNumChildren() == 1 )
    child1 = child1.getChild(0)
    assert ((  "This is my text" == child1.getCharacters() ))
    assert( child1.getNumChildren() == 0 )
    child1 = child.getChild(1)
    assert ((  "p" == child1.getName() ))
    assert( child1.getNumChildren() == 1 )
    child1 = child1.getChild(0)
    assert ((  "This is more text" == child1.getCharacters() ))
    assert( child1.getNumChildren() == 0 )
    att = nil
    ns = nil
    html_triple = nil
    head_triple = nil
    body_triple = nil
    p_triple = nil
    html_token = nil
    head_token = nil
    body_token = nil
    p_token = nil
    text_token = nil
    text_token1 = nil
    p_token1 = nil
    html_node = nil
    head_node = nil
    body_node = nil
    p_node = nil
    text_node = nil
    p_node1 = nil
    text_node1 = nil
  end

  def test_SBase_appendNotes4
    att = LibSBML::XMLAttributes.new()
    ns = LibSBML::XMLNamespaces.new()
    ns.add( "http://www.w3.org/1999/xhtml", "")
    html_triple = LibSBML::XMLTriple.new("html", "", "")
    head_triple = LibSBML::XMLTriple.new("head", "", "")
    title_triple = LibSBML::XMLTriple.new("title", "", "")
    body_triple = LibSBML::XMLTriple.new("body", "", "")
    p_triple = LibSBML::XMLTriple.new("p", "", "")
    html_token = LibSBML::XMLToken.new(html_triple,att,ns)
    head_token = LibSBML::XMLToken.new(head_triple,att)
    title_token = LibSBML::XMLToken.new(title_triple,att)
    body_token = LibSBML::XMLToken.new(body_triple,att)
    p_token = LibSBML::XMLToken.new(p_triple,att)
    body_token1 = LibSBML::XMLToken.new(body_triple,att,ns)
    text_token = LibSBML::XMLToken.new("This is my text")
    body_node = LibSBML::XMLNode.new(body_token1)
    p_node = LibSBML::XMLNode.new(p_token)
    text_node = LibSBML::XMLNode.new(text_token)
    text_token1 = LibSBML::XMLToken.new("This is more text")
    html_node1 = LibSBML::XMLNode.new(html_token)
    head_node1 = LibSBML::XMLNode.new(head_token)
    title_node1 = LibSBML::XMLNode.new(title_token)
    body_node1 = LibSBML::XMLNode.new(body_token)
    p_node1 = LibSBML::XMLNode.new(p_token)
    text_node1 = LibSBML::XMLNode.new(text_token1)
    p_node.addChild(text_node)
    body_node.addChild(p_node)
    p_node1.addChild(text_node1)
    body_node1.addChild(p_node1)
    head_node1.addChild(title_node1)
    html_node1.addChild(head_node1)
    html_node1.addChild(body_node1)
    @@s.setNotes(body_node)
    @@s.appendNotes(html_node1)
    notes = @@s.getNotes()
    assert ((  "notes" == notes.getName() ))
    assert( notes.getNumChildren() == 1 )
    child = notes.getChild(0)
    assert ((  "html" == child.getName() ))
    assert( child.getNumChildren() == 2 )
    child = child.getChild(1)
    assert ((  "body" == child.getName() ))
    assert( child.getNumChildren() == 2 )
    child1 = child.getChild(0)
    assert ((  "p" == child1.getName() ))
    assert( child1.getNumChildren() == 1 )
    child1 = child1.getChild(0)
    assert ((  "This is my text" == child1.getCharacters() ))
    assert( child1.getNumChildren() == 0 )
    child1 = child.getChild(1)
    assert ((  "p" == child1.getName() ))
    assert( child1.getNumChildren() == 1 )
    child1 = child1.getChild(0)
    assert ((  "This is more text" == child1.getCharacters() ))
    assert( child1.getNumChildren() == 0 )
    att = nil
    ns = nil
    html_triple = nil
    head_triple = nil
    body_triple = nil
    p_triple = nil
    body_token = nil
    p_token = nil
    text_token = nil
    text_token1 = nil
    body_token1 = nil
    body_node = nil
    p_node = nil
    text_node = nil
    html_node1 = nil
    head_node1 = nil
    body_node1 = nil
    p_node1 = nil
    text_node1 = nil
  end

  def test_SBase_appendNotes5
    att = LibSBML::XMLAttributes.new()
    ns = LibSBML::XMLNamespaces.new()
    ns.add( "http://www.w3.org/1999/xhtml", "")
    html_triple = LibSBML::XMLTriple.new("html", "", "")
    head_triple = LibSBML::XMLTriple.new("head", "", "")
    title_triple = LibSBML::XMLTriple.new("title", "", "")
    body_triple = LibSBML::XMLTriple.new("body", "", "")
    p_triple = LibSBML::XMLTriple.new("p", "", "")
    html_token = LibSBML::XMLToken.new(html_triple,att,ns)
    head_token = LibSBML::XMLToken.new(head_triple,att)
    title_token = LibSBML::XMLToken.new(title_triple,att)
    body_token = LibSBML::XMLToken.new(body_triple,att)
    p_token = LibSBML::XMLToken.new(p_triple,att)
    p_token1 = LibSBML::XMLToken.new(p_triple,att,ns)
    text_token = LibSBML::XMLToken.new("This is my text")
    p_node = LibSBML::XMLNode.new(p_token1)
    text_node = LibSBML::XMLNode.new(text_token)
    text_token1 = LibSBML::XMLToken.new("This is more text")
    html_node1 = LibSBML::XMLNode.new(html_token)
    head_node1 = LibSBML::XMLNode.new(head_token)
    title_node1 = LibSBML::XMLNode.new(title_token)
    body_node1 = LibSBML::XMLNode.new(body_token)
    p_node1 = LibSBML::XMLNode.new(p_token)
    text_node1 = LibSBML::XMLNode.new(text_token1)
    p_node.addChild(text_node)
    p_node1.addChild(text_node1)
    body_node1.addChild(p_node1)
    head_node1.addChild(title_node1)
    html_node1.addChild(head_node1)
    html_node1.addChild(body_node1)
    @@s.setNotes(p_node)
    @@s.appendNotes(html_node1)
    notes = @@s.getNotes()
    assert ((  "notes" == notes.getName() ))
    assert( notes.getNumChildren() == 1 )
    child = notes.getChild(0)
    assert ((  "html" == child.getName() ))
    assert( child.getNumChildren() == 2 )
    child = child.getChild(1)
    assert ((  "body" == child.getName() ))
    assert( child.getNumChildren() == 2 )
    child1 = child.getChild(0)
    assert ((  "p" == child1.getName() ))
    assert( child1.getNumChildren() == 1 )
    child1 = child1.getChild(0)
    assert ((  "This is my text" == child1.getCharacters() ))
    assert( child1.getNumChildren() == 0 )
    child1 = child.getChild(1)
    assert ((  "p" == child1.getName() ))
    assert( child1.getNumChildren() == 1 )
    child1 = child1.getChild(0)
    assert ((  "This is more text" == child1.getCharacters() ))
    assert( child1.getNumChildren() == 0 )
    att = nil
    ns = nil
    html_triple = nil
    head_triple = nil
    body_triple = nil
    p_triple = nil
    body_token = nil
    p_token = nil
    p_token1 = nil
    text_token = nil
    text_token1 = nil
    p_node = nil
    text_node = nil
    html_node1 = nil
    head_node1 = nil
    body_node1 = nil
    p_node1 = nil
    text_node1 = nil
  end

  def test_SBase_appendNotes6
    att = LibSBML::XMLAttributes.new()
    ns = LibSBML::XMLNamespaces.new()
    ns.add( "http://www.w3.org/1999/xhtml", "")
    body_triple = LibSBML::XMLTriple.new("body", "", "")
    p_triple = LibSBML::XMLTriple.new("p", "", "")
    body_token = LibSBML::XMLToken.new(body_triple,att,ns)
    p_token = LibSBML::XMLToken.new(p_triple,att)
    text_token = LibSBML::XMLToken.new("This is my text")
    body_node = LibSBML::XMLNode.new(body_token)
    p_node = LibSBML::XMLNode.new(p_token)
    text_node = LibSBML::XMLNode.new(text_token)
    text_token1 = LibSBML::XMLToken.new("This is more text")
    body_node1 = LibSBML::XMLNode.new(body_token)
    p_node1 = LibSBML::XMLNode.new(p_token)
    text_node1 = LibSBML::XMLNode.new(text_token1)
    p_node.addChild(text_node)
    body_node.addChild(p_node)
    p_node1.addChild(text_node1)
    body_node1.addChild(p_node1)
    @@s.setNotes(body_node)
    @@s.appendNotes(body_node1)
    notes = @@s.getNotes()
    assert ((  "notes" == notes.getName() ))
    assert( notes.getNumChildren() == 1 )
    child = notes.getChild(0)
    assert ((  "body" == child.getName() ))
    assert( child.getNumChildren() == 2 )
    child1 = child.getChild(0)
    assert ((  "p" == child1.getName() ))
    assert( child1.getNumChildren() == 1 )
    child1 = child1.getChild(0)
    assert ((  "This is my text" == child1.getCharacters() ))
    assert( child1.getNumChildren() == 0 )
    child1 = child.getChild(1)
    assert ((  "p" == child1.getName() ))
    assert( child1.getNumChildren() == 1 )
    child1 = child1.getChild(0)
    assert ((  "This is more text" == child1.getCharacters() ))
    assert( child1.getNumChildren() == 0 )
    att = nil
    ns = nil
    body_triple = nil
    p_triple = nil
    body_token = nil
    p_token = nil
    text_token = nil
    text_token1 = nil
    body_node = nil
    p_node = nil
    text_node = nil
    body_node1 = nil
    p_node1 = nil
    text_node1 = nil
  end

  def test_SBase_appendNotes7
    att = LibSBML::XMLAttributes.new()
    ns = LibSBML::XMLNamespaces.new()
    ns.add( "http://www.w3.org/1999/xhtml", "")
    body_triple = LibSBML::XMLTriple.new("body", "", "")
    p_triple = LibSBML::XMLTriple.new("p", "", "")
    body_token = LibSBML::XMLToken.new(body_triple,att,ns)
    p_token1 = LibSBML::XMLToken.new(p_triple,att,ns)
    text_token = LibSBML::XMLToken.new("This is my text")
    p_token = LibSBML::XMLToken.new(p_triple,att)
    p_node = LibSBML::XMLNode.new(p_token1)
    text_node = LibSBML::XMLNode.new(text_token)
    text_token1 = LibSBML::XMLToken.new("This is more text")
    body_node1 = LibSBML::XMLNode.new(body_token)
    p_node1 = LibSBML::XMLNode.new(p_token)
    text_node1 = LibSBML::XMLNode.new(text_token1)
    p_node.addChild(text_node)
    p_node1.addChild(text_node1)
    body_node1.addChild(p_node1)
    @@s.setNotes(p_node)
    @@s.appendNotes(body_node1)
    notes = @@s.getNotes()
    assert ((  "notes" == notes.getName() ))
    assert( notes.getNumChildren() == 1 )
    child = notes.getChild(0)
    assert ((  "body" == child.getName() ))
    assert( child.getNumChildren() == 2 )
    child1 = child.getChild(0)
    assert ((  "p" == child1.getName() ))
    assert( child1.getNumChildren() == 1 )
    child1 = child1.getChild(0)
    assert ((  "This is my text" == child1.getCharacters() ))
    assert( child1.getNumChildren() == 0 )
    child1 = child.getChild(1)
    assert ((  "p" == child1.getName() ))
    assert( child1.getNumChildren() == 1 )
    child1 = child1.getChild(0)
    assert ((  "This is more text" == child1.getCharacters() ))
    assert( child1.getNumChildren() == 0 )
    att = nil
    ns = nil
    body_triple = nil
    p_triple = nil
    body_token = nil
    p_token = nil
    p_token1 = nil
    text_token = nil
    text_token1 = nil
    p_node = nil
    text_node = nil
    body_node1 = nil
    p_node1 = nil
    text_node1 = nil
  end

  def test_SBase_appendNotes8
    att = LibSBML::XMLAttributes.new()
    ns = LibSBML::XMLNamespaces.new()
    ns.add( "http://www.w3.org/1999/xhtml", "")
    body_triple = LibSBML::XMLTriple.new("body", "", "")
    p_triple = LibSBML::XMLTriple.new("p", "", "")
    body_token = LibSBML::XMLToken.new(body_triple,att,ns)
    p_token = LibSBML::XMLToken.new(p_triple,att)
    text_token = LibSBML::XMLToken.new("This is my text")
    body_node = LibSBML::XMLNode.new(body_token)
    p_node = LibSBML::XMLNode.new(p_token)
    text_node = LibSBML::XMLNode.new(text_token)
    p_token1 = LibSBML::XMLToken.new(p_triple,att,ns)
    text_token1 = LibSBML::XMLToken.new("This is more text")
    p_node1 = LibSBML::XMLNode.new(p_token1)
    text_node1 = LibSBML::XMLNode.new(text_token1)
    p_node.addChild(text_node)
    body_node.addChild(p_node)
    p_node1.addChild(text_node1)
    @@s.setNotes(body_node)
    @@s.appendNotes(p_node1)
    notes = @@s.getNotes()
    assert ((  "notes" == notes.getName() ))
    assert( notes.getNumChildren() == 1 )
    child = notes.getChild(0)
    assert ((  "body" == child.getName() ))
    assert( child.getNumChildren() == 2 )
    child1 = child.getChild(0)
    assert ((  "p" == child1.getName() ))
    assert( child1.getNumChildren() == 1 )
    child1 = child1.getChild(0)
    assert ((  "This is my text" == child1.getCharacters() ))
    assert( child1.getNumChildren() == 0 )
    child1 = child.getChild(1)
    assert ((  "p" == child1.getName() ))
    assert( child1.getNumChildren() == 1 )
    child1 = child1.getChild(0)
    assert ((  "This is more text" == child1.getCharacters() ))
    assert( child1.getNumChildren() == 0 )
    att = nil
    ns = nil
    body_triple = nil
    p_triple = nil
    body_token = nil
    p_token = nil
    text_token = nil
    text_token1 = nil
    p_token1 = nil
    body_node = nil
    p_node = nil
    text_node = nil
    p_node1 = nil
    text_node1 = nil
  end

  def test_SBase_appendNotesString
    notes =  "<p xmlns=\"http://www.w3.org/1999/xhtml\">This is a test note </p>";
    taggednewnotes = "<notes>\n" + "  <p xmlns=\"http://www.w3.org/1999/xhtml\">This is a test note </p>\n" + 
    "  <p xmlns=\"http://www.w3.org/1999/xhtml\">This is more test notes </p>\n" + 
    "</notes>"
    taggednewnotes2 = "<notes>\n" + "  <p xmlns=\"http://www.w3.org/1999/xhtml\">This is a test note </p>\n" + 
    "  <p xmlns=\"http://www.w3.org/1999/xhtml\">This is more test notes 1</p>\n" + 
    "  <p xmlns=\"http://www.w3.org/1999/xhtml\">This is more test notes 2</p>\n" + 
    "</notes>"
    newnotes =  "<p xmlns=\"http://www.w3.org/1999/xhtml\">This is more test notes </p>";
    newnotes2 = "<p xmlns=\"http://www.w3.org/1999/xhtml\">This is more test notes 1</p>" + "<p xmlns=\"http://www.w3.org/1999/xhtml\">This is more test notes 2</p>";
    newnotes3 = "<notes>\n" + "  <p xmlns=\"http://www.w3.org/1999/xhtml\">This is more test notes </p>\n" + "</notes>";
    newnotes4 = "<notes>\n" + "  <p xmlns=\"http://www.w3.org/1999/xhtml\">This is more test notes 1</p>\n" + 
    "  <p xmlns=\"http://www.w3.org/1999/xhtml\">This is more test notes 2</p>\n" + 
    "</notes>"
    @@s.setNotes(notes)
    assert( @@s.isSetNotes() == true )
    @@s.appendNotes(newnotes)
    notes1 = @@s.getNotesString()
    assert( @@s.isSetNotes() == true )
    assert (( notes1 == taggednewnotes ))
    @@s.setNotes(notes)
    @@s.appendNotes(newnotes2)
    notes2 = @@s.getNotesString()
    assert( @@s.isSetNotes() == true )
    assert (( notes2 == taggednewnotes2 ))
    @@s.setNotes(notes)
    @@s.appendNotes(newnotes3)
    notes3 = @@s.getNotesString()
    assert( @@s.isSetNotes() == true )
    assert (( notes3 == taggednewnotes ))
    @@s.setNotes(notes)
    @@s.appendNotes(newnotes4)
    notes4 = @@s.getNotesString()
    assert( @@s.isSetNotes() == true )
    assert (( notes4 == taggednewnotes2 ))
  end

  def test_SBase_appendNotesString1
    notes = "<html xmlns=\"http://www.w3.org/1999/xhtml\">\n" + "  <head>\n" + 
    "    <title/>\n" + 
    "  </head>\n" + 
    "  <body>\n" + 
    "    <p>This is a test note </p>\n" + 
    "  </body>\n" + 
    "</html>"
    taggednewnotes = "<notes>\n" + 
    "  <html xmlns=\"http://www.w3.org/1999/xhtml\">\n" + 
    "    <head>\n" + 
    "      <title/>\n" + 
    "    </head>\n" + 
    "    <body>\n" + 
    "      <p>This is a test note </p>\n" + 
    "      <p>This is more test notes </p>\n" + 
    "    </body>\n" + 
    "  </html>\n" + 
    "</notes>"
    addnotes = "<html xmlns=\"http://www.w3.org/1999/xhtml\">\n" + "  <head>\n" + 
    "    <title/>\n" + 
    "  </head>\n" + 
    "  <body>\n" + 
    "    <p>This is more test notes </p>\n" + 
    "  </body>\n" + 
    "</html>"
    addnotes2 = "<notes>\n" + 
    "  <html xmlns=\"http://www.w3.org/1999/xhtml\">\n" + 
    "    <head>\n" + 
    "      <title/>\n" + 
    "    </head>\n" + 
    "    <body>\n" + 
    "      <p>This is more test notes </p>\n" + 
    "    </body>\n" + 
    "  </html>\n" + 
    "</notes>"
    @@s.setNotes(notes)
    @@s.appendNotes(addnotes)
    notes1 = @@s.getNotesString()
    assert( @@s.isSetNotes() == true )
    assert (( notes1 == taggednewnotes ))
    @@s.setNotes(notes)
    @@s.appendNotes(addnotes2)
    notes2 = @@s.getNotesString()
    assert( @@s.isSetNotes() == true )
    assert (( notes2 == taggednewnotes ))
  end

  def test_SBase_appendNotesString2
    notes = "<html xmlns=\"http://www.w3.org/1999/xhtml\">\n" + "  <head>\n" + 
    "    <title/>\n" + 
    "  </head>\n" + 
    "  <body>\n" + 
    "    <p>This is a test note </p>\n" + 
    "  </body>\n" + 
    "</html>"
    taggednewnotes = "<notes>\n" + 
    "  <html xmlns=\"http://www.w3.org/1999/xhtml\">\n" + 
    "    <head>\n" + 
    "      <title/>\n" + 
    "    </head>\n" + 
    "    <body>\n" + 
    "      <p>This is a test note </p>\n" + 
    "      <p>This is more test notes </p>\n" + 
    "    </body>\n" + 
    "  </html>\n" + 
    "</notes>"
    addnotes = "<body xmlns=\"http://www.w3.org/1999/xhtml\">\n" + "  <p>This is more test notes </p>\n" + "</body>\n";
    addnotes2 = "<notes>\n" + 
    "  <body xmlns=\"http://www.w3.org/1999/xhtml\">\n" + 
    "    <p>This is more test notes </p>\n" + 
    "  </body>\n" + 
    "</notes>"
    @@s.setNotes(notes)
    @@s.appendNotes(addnotes)
    notes1 = @@s.getNotesString()
    assert( @@s.isSetNotes() == true )
    assert (( notes1 == taggednewnotes ))
    @@s.setNotes(notes)
    @@s.appendNotes(addnotes2)
    notes2 = @@s.getNotesString()
    assert( @@s.isSetNotes() == true )
    assert (( notes2 == taggednewnotes ))
  end

  def test_SBase_appendNotesString3
    notes = "<html xmlns=\"http://www.w3.org/1999/xhtml\">\n" + "  <head>\n" + 
    "    <title/>\n" + 
    "  </head>\n" + 
    "  <body>\n" + 
    "    <p>This is a test note </p>\n" + 
    "  </body>\n" + 
    "</html>"
    taggednewnotes = "<notes>\n" + 
    "  <html xmlns=\"http://www.w3.org/1999/xhtml\">\n" + 
    "    <head>\n" + 
    "      <title/>\n" + 
    "    </head>\n" + 
    "    <body>\n" + 
    "      <p>This is a test note </p>\n" + 
    "      <p xmlns=\"http://www.w3.org/1999/xhtml\">This is more test notes </p>\n" + 
    "    </body>\n" + 
    "  </html>\n" + 
    "</notes>"
    taggednewnotes2 = "<notes>\n" + 
    "  <html xmlns=\"http://www.w3.org/1999/xhtml\">\n" + 
    "    <head>\n" + 
    "      <title/>\n" + 
    "    </head>\n" + 
    "    <body>\n" + 
    "      <p>This is a test note </p>\n" + 
    "      <p xmlns=\"http://www.w3.org/1999/xhtml\">This is more test notes 1</p>\n" + 
    "      <p xmlns=\"http://www.w3.org/1999/xhtml\">This is more test notes 2</p>\n" + 
    "    </body>\n" + 
    "  </html>\n" + 
    "</notes>"
    addnotes =  "<p xmlns=\"http://www.w3.org/1999/xhtml\">This is more test notes </p>\n";
    addnotes2 = "<p xmlns=\"http://www.w3.org/1999/xhtml\">This is more test notes 1</p>\n" + "<p xmlns=\"http://www.w3.org/1999/xhtml\">This is more test notes 2</p>";
    addnotes3 = "<notes>\n" + "  <p xmlns=\"http://www.w3.org/1999/xhtml\">This is more test notes </p>\n" + "</notes>";
    addnotes4 = "<notes>\n" + "  <p xmlns=\"http://www.w3.org/1999/xhtml\">This is more test notes 1</p>\n" + 
    "  <p xmlns=\"http://www.w3.org/1999/xhtml\">This is more test notes 2</p>\n" + 
    "</notes>"
    @@s.setNotes(notes)
    @@s.appendNotes(addnotes)
    notes1 = @@s.getNotesString()
    assert( @@s.isSetNotes() == true )
    assert (( notes1 == taggednewnotes ))
    @@s.setNotes(notes)
    @@s.appendNotes(addnotes2)
    notes2 = @@s.getNotesString()
    assert( @@s.isSetNotes() == true )
    assert (( notes2 == taggednewnotes2 ))
    @@s.setNotes(notes)
    @@s.appendNotes(addnotes3)
    notes3 = @@s.getNotesString()
    assert( @@s.isSetNotes() == true )
    assert (( notes3 == taggednewnotes ))
    @@s.setNotes(notes)
    @@s.appendNotes(addnotes4)
    notes4 = @@s.getNotesString()
    assert( @@s.isSetNotes() == true )
    assert (( notes4 == taggednewnotes2 ))
  end

  def test_SBase_appendNotesString4
    notes = "<body xmlns=\"http://www.w3.org/1999/xhtml\">\n" + "  <p>This is a test note </p>\n" + "</body>";
    taggednewnotes = "<notes>\n" + 
    "  <html xmlns=\"http://www.w3.org/1999/xhtml\">\n" + 
    "    <head>\n" + 
    "      <title/>\n" + 
    "    </head>\n" + 
    "    <body>\n" + 
    "      <p>This is a test note </p>\n" + 
    "      <p>This is more test notes </p>\n" + 
    "    </body>\n" + 
    "  </html>\n" + 
    "</notes>"
    addnotes = "<html xmlns=\"http://www.w3.org/1999/xhtml\">\n" + "  <head>\n" + 
    "    <title/>\n" + 
    "  </head>\n" + 
    "  <body>\n" + 
    "    <p>This is more test notes </p>\n" + 
    "  </body>\n" + 
    "</html>"
    addnotes2 = "<notes>\n" + 
    "  <html xmlns=\"http://www.w3.org/1999/xhtml\">\n" + 
    "    <head>\n" + 
    "      <title/>\n" + 
    "    </head>\n" + 
    "    <body>\n" + 
    "      <p>This is more test notes </p>\n" + 
    "    </body>\n" + 
    "  </html>\n" + 
    "</notes>"
    @@s.setNotes(notes)
    @@s.appendNotes(addnotes)
    notes1 = @@s.getNotesString()
    assert( @@s.isSetNotes() == true )
    assert (( notes1 == taggednewnotes ))
    @@s.setNotes(notes)
    @@s.appendNotes(addnotes2)
    notes2 = @@s.getNotesString()
    assert( @@s.isSetNotes() == true )
    assert (( notes2 == taggednewnotes ))
  end

  def test_SBase_appendNotesString5
    notes =  "<p xmlns=\"http://www.w3.org/1999/xhtml\">This is a test note </p>";
    taggednewnotes = "<notes>\n" + 
    "  <html xmlns=\"http://www.w3.org/1999/xhtml\">\n" + 
    "    <head>\n" + 
    "      <title/>\n" + 
    "    </head>\n" + 
    "    <body>\n" + 
    "      <p xmlns=\"http://www.w3.org/1999/xhtml\">This is a test note </p>\n" + 
    "      <p>This is more test notes </p>\n" + 
    "    </body>\n" + 
    "  </html>\n" + 
    "</notes>"
    addnotes = "<html xmlns=\"http://www.w3.org/1999/xhtml\">\n" + "  <head>\n" + 
    "    <title/>\n" + 
    "  </head>\n" + 
    "  <body>\n" + 
    "    <p>This is more test notes </p>\n" + 
    "  </body>\n" + 
    "</html>"
    addnotes2 = "<notes>\n" + 
    "  <html xmlns=\"http://www.w3.org/1999/xhtml\">\n" + 
    "    <head>\n" + 
    "      <title/>\n" + 
    "    </head>\n" + 
    "    <body>\n" + 
    "      <p>This is more test notes </p>\n" + 
    "    </body>\n" + 
    "  </html>\n" + 
    "</notes>"
    @@s.setNotes(notes)
    @@s.appendNotes(addnotes)
    notes1 = @@s.getNotesString()
    assert( @@s.isSetNotes() == true )
    assert (( notes1 == taggednewnotes ))
    @@s.setNotes(notes)
    @@s.appendNotes(addnotes2)
    notes2 = @@s.getNotesString()
    assert( @@s.isSetNotes() == true )
    assert (( notes2 == taggednewnotes ))
  end

  def test_SBase_appendNotesString6
    notes = "<body xmlns=\"http://www.w3.org/1999/xhtml\">\n" + "  <p>This is a test note </p>\n" + "</body>";
    taggednewnotes = "<notes>\n" + 
    "  <body xmlns=\"http://www.w3.org/1999/xhtml\">\n" + 
    "    <p>This is a test note </p>\n" + 
    "    <p>This is more test notes </p>\n" + 
    "  </body>\n" + 
    "</notes>"
    addnotes = "<body xmlns=\"http://www.w3.org/1999/xhtml\">\n" + "  <p>This is more test notes </p>\n" + "</body>";
    addnotes2 = "<notes>\n" + 
    "  <body xmlns=\"http://www.w3.org/1999/xhtml\">\n" + 
    "    <p>This is more test notes </p>\n" + 
    "  </body>\n" + 
    "</notes>"
    @@s.setNotes(notes)
    @@s.appendNotes(addnotes)
    notes1 = @@s.getNotesString()
    assert( @@s.isSetNotes() == true )
    assert (( notes1 == taggednewnotes ))
    @@s.setNotes(notes)
    @@s.appendNotes(addnotes2)
    notes2 = @@s.getNotesString()
    assert( @@s.isSetNotes() == true )
    assert (( notes2 == taggednewnotes ))
  end

  def test_SBase_appendNotesString7
    notes =  "<p xmlns=\"http://www.w3.org/1999/xhtml\">This is a test note </p>";
    taggednewnotes = "<notes>\n" + 
    "  <body xmlns=\"http://www.w3.org/1999/xhtml\">\n" + 
    "    <p xmlns=\"http://www.w3.org/1999/xhtml\">This is a test note </p>\n" + 
    "    <p>This is more test notes </p>\n" + 
    "  </body>\n" + 
    "</notes>"
    addnotes = "<body xmlns=\"http://www.w3.org/1999/xhtml\">\n" + "  <p>This is more test notes </p>\n" + "</body>";
    addnotes2 = "<notes>\n" + 
    "  <body xmlns=\"http://www.w3.org/1999/xhtml\">\n" + 
    "    <p>This is more test notes </p>\n" + 
    "  </body>\n" + 
    "</notes>"
    @@s.setNotes(notes)
    @@s.appendNotes(addnotes)
    notes1 = @@s.getNotesString()
    assert( @@s.isSetNotes() == true )
    assert (( notes1 == taggednewnotes ))
    @@s.setNotes(notes)
    @@s.appendNotes(addnotes2)
    notes2 = @@s.getNotesString()
    assert( @@s.isSetNotes() == true )
    assert (( notes2 == taggednewnotes ))
  end

  def test_SBase_appendNotesString8
    notes = "<body xmlns=\"http://www.w3.org/1999/xhtml\">\n" + "  <p>This is a test note </p>\n" + "</body>";
    taggednewnotes = "<notes>\n" + 
    "  <body xmlns=\"http://www.w3.org/1999/xhtml\">\n" + 
    "    <p>This is a test note </p>\n" + 
    "    <p xmlns=\"http://www.w3.org/1999/xhtml\">This is more test notes </p>\n" + 
    "  </body>\n" + 
    "</notes>"
    taggednewnotes2 = "<notes>\n" + 
    "  <body xmlns=\"http://www.w3.org/1999/xhtml\">\n" + 
    "    <p>This is a test note </p>\n" + 
    "    <p xmlns=\"http://www.w3.org/1999/xhtml\">This is more test notes 1</p>\n" + 
    "    <p xmlns=\"http://www.w3.org/1999/xhtml\">This is more test notes 2</p>\n" + 
    "  </body>\n" + 
    "</notes>"
    addnotes =  "<p xmlns=\"http://www.w3.org/1999/xhtml\">This is more test notes </p>";
    addnotes2 = "<p xmlns=\"http://www.w3.org/1999/xhtml\">This is more test notes 1</p>\n" + "<p xmlns=\"http://www.w3.org/1999/xhtml\">This is more test notes 2</p>";
    addnotes3 = "<notes>\n" + 
    "  <p xmlns=\"http://www.w3.org/1999/xhtml\">This is more test notes </p>\n" + 
    "</notes>"
    addnotes4 = "<notes>\n" + 
    "  <p xmlns=\"http://www.w3.org/1999/xhtml\">This is more test notes 1</p>\n" + 
    "  <p xmlns=\"http://www.w3.org/1999/xhtml\">This is more test notes 2</p>\n" + 
    "</notes>"
    @@s.setNotes(notes)
    @@s.appendNotes(addnotes)
    notes1 = @@s.getNotesString()
    assert( @@s.isSetNotes() == true )
    assert (( notes1 == taggednewnotes ))
    @@s.setNotes(notes)
    @@s.appendNotes(addnotes2)
    notes2 = @@s.getNotesString()
    assert( @@s.isSetNotes() == true )
    assert (( notes2 == taggednewnotes2 ))
    @@s.setNotes(notes)
    @@s.appendNotes(addnotes3)
    notes3 = @@s.getNotesString()
    assert( @@s.isSetNotes() == true )
    assert (( notes3 == taggednewnotes ))
    @@s.setNotes(notes)
    @@s.appendNotes(addnotes4)
    notes4 = @@s.getNotesString()
    assert( @@s.isSetNotes() == true )
    assert (( notes4 == taggednewnotes2 ))
  end

  def test_SBase_getQualifiersFromResources
    cv = LibSBML::CVTerm.new(LibSBML::BIOLOGICAL_QUALIFIER)
    cv.setBiologicalQualifierType(LibSBML::BQB_ENCODES)
    cv.addResource( "foo")
    @@s.setMetaId( "sbase1")
    @@s.addCVTerm(cv)
    assert( @@s.getResourceBiologicalQualifier( "foo") == LibSBML::BQB_ENCODES )
    cv1 = LibSBML::CVTerm.new(LibSBML::MODEL_QUALIFIER)
    cv1.setModelQualifierType(LibSBML::BQM_IS)
    cv1.addResource( "bar")
    @@s.addCVTerm(cv1)
    assert( @@s.getResourceModelQualifier( "bar") == LibSBML::BQM_IS )
    cv = nil
    cv1 = nil
  end

  def test_SBase_setAnnotation
    taggedannt =  "<annotation>This is a test note</annotation>";
    token = LibSBML::XMLToken.new("This is a test note")
    node = LibSBML::XMLNode.new(token)
    @@s.setAnnotation(node)
    assert( @@s.isSetAnnotation() == true )
    t1 = @@s.getAnnotation()
    assert( t1.getNumChildren() == 1 )
    assert ((  "This is a test note" == t1.getChild(0).getCharacters() ))
    if (@@s.getAnnotation() == node)
    end
    @@s.setAnnotation(@@s.getAnnotation())
    assert ((  "This is a test note" == @@s.getAnnotation().getChild(0).getCharacters() ))
    @@s.setAnnotation(nil)
    assert( @@s.isSetAnnotation() == false )
    if (@@s.getAnnotation() != nil)
    end
    @@s.setAnnotation(node)
    assert( @@s.isSetAnnotation() == true )
    @@s.unsetAnnotation()
    assert( @@s.isSetAnnotation() == false )
    triple = LibSBML::XMLTriple.new("annotation", "", "")
    node2 = LibSBML::XMLNode.new(triple)
    node2.addChild(node)
    sp = @@s.createSpecies()
    sp.setAnnotation(node2)
    assert( sp.isSetAnnotation() == true )
    assert (( taggedannt == sp.getAnnotationString() ))
    sp.unsetAnnotation()
    assert( sp.isSetAnnotation() == false )
    @@s.setAnnotation(node2)
    assert( @@s.isSetAnnotation() == true )
    assert (( taggedannt == @@s.getAnnotationString() ))
    @@s.unsetAnnotation()
    assert( @@s.isSetAnnotation() == false )
    token = LibSBML::XMLToken.new("(CR) &#0168; &#x00a8; &#x00A8; (NOT CR) &#; &#x; &#00a8; &#0168 &#x00a8")
    node = LibSBML::XMLNode.new(token)
    @@s.setAnnotation(node)
    t1 = @@s.getAnnotation()
    assert( t1.getNumChildren() == 1 )
    s = t1.getChild(0).toXMLString()
    expected =  "(CR) &#0168; &#x00a8; &#x00A8; (NOT CR) &amp;#; &amp;#x; &amp;#00a8; &amp;#0168 &amp;#x00a8";
    assert (( expected == s ))
    token = LibSBML::XMLToken.new("& ' > < \" &amp; &apos; &gt; &lt; &quot;")
    node = LibSBML::XMLNode.new(token)
    @@s.setAnnotation(node)
    t1 = @@s.getAnnotation()
    assert( t1.getNumChildren() == 1 )
    s2 = t1.getChild(0).toXMLString()
    expected2 =  "&amp; &apos; &gt; &lt; &quot; &amp; &apos; &gt; &lt; &quot;";
    assert (( expected2 == s2 ))
    token = nil
    node = nil
    node2 = nil
    triple = nil
  end

  def test_SBase_setAnnotationString
    annotation =  "This is a test note";
    taggedannotation =  "<annotation>This is a test note</annotation>";
    @@s.setAnnotation(annotation)
    assert( @@s.isSetAnnotation() == true )
    if (( taggedannotation != @@s.getAnnotationString() ))
    end
    t1 = @@s.getAnnotation()
    assert( t1.getNumChildren() == 1 )
    assert ((  "This is a test note" == t1.getChild(0).getCharacters() ))
    @@s.setAnnotation(@@s.getAnnotationString())
    t1 = @@s.getAnnotation()
    assert( t1.getNumChildren() == 1 )
    chars = @@s.getAnnotationString()
    assert (( taggedannotation == chars ))
    @@s.setAnnotation( "")
    assert( @@s.isSetAnnotation() == false )
    if (@@s.getAnnotationString() != nil)
    end
    @@s.setAnnotation(taggedannotation)
    assert( @@s.isSetAnnotation() == true )
    if (( taggedannotation != @@s.getAnnotationString() ))
    end
    t1 = @@s.getAnnotation()
    assert( t1.getNumChildren() == 1 )
    t2 = t1.getChild(0)
    assert ((  "This is a test note" == t2.getCharacters() ))
  end

  def test_SBase_setMetaId
    metaid =  "x12345";
    @@s.setMetaId(metaid)
    assert (( metaid == @@s.getMetaId() ))
    assert_equal true, @@s.isSetMetaId()
    if (@@s.getMetaId() == metaid)
    end
    @@s.setMetaId(@@s.getMetaId())
    assert (( metaid == @@s.getMetaId() ))
    @@s.setMetaId("")
    assert_equal false, @@s.isSetMetaId()
    if (@@s.getMetaId() != nil)
    end
  end

  def test_SBase_setNotes
    c = LibSBML::Model.new(1,2)
    token = LibSBML::XMLToken.new("This is a test note")
    node = LibSBML::XMLNode.new(token)
    c.setNotes(node)
    assert( c.isSetNotes() == true )
    if (c.getNotes() == node)
    end
    t1 = c.getNotes()
    assert( t1.getNumChildren() == 1 )
    assert ((  "This is a test note" == t1.getChild(0).getCharacters() ))
    c.setNotes(c.getNotes())
    t1 = c.getNotes()
    assert( t1.getNumChildren() == 1 )
    chars = t1.getChild(0).getCharacters()
    assert ((  "This is a test note" == chars ))
    c.setNotes(nil)
    assert( c.isSetNotes() == false )
    if (c.getNotes() != nil)
    end
    c.setNotes(node)
    assert( c.isSetNotes() == true )
    token = nil
    node = nil
    token = LibSBML::XMLToken.new("(CR) &#0168; &#x00a8; &#x00A8; (NOT CR) &#; &#x; &#00a8; &#0168 &#x00a8")
    node = LibSBML::XMLNode.new(token)
    @@s.setNotes(node)
    t1 = @@s.getNotes()
    assert( t1.getNumChildren() == 1 )
    s = t1.getChild(0).toXMLString()
    expected =  "(CR) &#0168; &#x00a8; &#x00A8; (NOT CR) &amp;#; &amp;#x; &amp;#00a8; &amp;#0168 &amp;#x00a8";
    assert (( expected == s ))
    token = LibSBML::XMLToken.new("& ' > < \" &amp; &apos; &gt; &lt; &quot;")
    node = LibSBML::XMLNode.new(token)
    @@s.setNotes(node)
    t1 = @@s.getNotes()
    assert( t1.getNumChildren() == 1 )
    s2 = t1.getChild(0).toXMLString()
    expected2 =  "&amp; &apos; &gt; &lt; &quot; &amp; &apos; &gt; &lt; &quot;";
    assert (( expected2 == s2 ))
    token = nil
    node = nil
  end

  def test_SBase_setNotesString
    c = LibSBML::Model.new(1,2)
    notes =  "This is a test note";
    taggednotes =  "<notes>This is a test note</notes>";
    c.setNotes(notes)
    assert( c.isSetNotes() == true )
    if (( taggednotes != c.getNotesString() ))
    end
    t1 = c.getNotes()
    assert( t1.getNumChildren() == 1 )
    t2 = t1.getChild(0)
    assert ((  "This is a test note" == t2.getCharacters() ))
    c.setNotes(c.getNotesString())
    t1 = c.getNotes()
    assert( t1.getNumChildren() == 1 )
    chars = c.getNotesString()
    assert (( taggednotes == chars ))
    c.setNotes( "")
    assert( c.isSetNotes() == false )
    if (c.getNotesString() != nil)
    end
    c.setNotes(taggednotes)
    assert( c.isSetNotes() == true )
    if (( taggednotes != c.getNotesString() ))
    end
    t1 = c.getNotes()
    assert( t1.getNumChildren() == 1 )
    t2 = t1.getChild(0)
    assert ((  "This is a test note" == t2.getCharacters() ))
  end

  def test_SBase_unsetAnnotationWithCVTerms
    annt = "<annotation>\n" + 
    "  <test:test xmlns:test=\"http://test.org/test\">this is a test node</test:test>\n" + 
    "</annotation>"
    annt_with_cvterm = "<annotation>\n" + 
    "  <test:test xmlns:test=\"http://test.org/test\">this is a test node</test:test>\n" + 
    "  <rdf:RDF xmlns:rdf=\"http://www.w3.org/1999/02/22-rdf-syntax-ns#\" " + 
    "xmlns:dc=\"http://purl.org/dc/elements/1.1/\" " + 
    "xmlns:dcterms=\"http://purl.org/dc/terms/\" " + 
    "xmlns:vCard=\"http://www.w3.org/2001/vcard-rdf/3.0#\" " + 
    "xmlns:bqbiol=\"http://biomodels.net/biology-qualifiers/\" " + 
    "xmlns:bqmodel=\"http://biomodels.net/model-qualifiers/\">\n" + 
    "    <rdf:Description rdf:about=\"#_000001\">\n" + 
    "      <bqbiol:is>\n" + 
    "        <rdf:Bag>\n" + 
    "          <rdf:li rdf:resource=\"http://www.geneontology.org/#GO:0005895\"/>\n" + 
    "        </rdf:Bag>\n" + 
    "      </bqbiol:is>\n" + 
    "    </rdf:Description>\n" + 
    "  </rdf:RDF>\n" + 
    "</annotation>"
    @@s.setAnnotation(annt)
    assert( @@s.isSetAnnotation() == true )
    assert (( annt == @@s.getAnnotationString() ))
    @@s.unsetAnnotation()
    assert( @@s.isSetAnnotation() == false )
    assert( @@s.getAnnotation() == nil )
    @@s.setAnnotation(annt)
    @@s.setMetaId( "_000001")
    cv = LibSBML::CVTerm.new(LibSBML::BIOLOGICAL_QUALIFIER)
    cv.setBiologicalQualifierType(LibSBML::BQB_IS)
    cv.addResource( "http://www.geneontology.org/#GO:0005895")
    @@s.addCVTerm(cv)
    assert( @@s.isSetAnnotation() == true )
    assert (( annt_with_cvterm == @@s.getAnnotationString() ))
    @@s.unsetAnnotation()
    assert( @@s.isSetAnnotation() == false )
    assert( @@s.getAnnotation() == nil )
    cv = nil
  end

  def test_SBase_unsetAnnotationWithModelHistory
    h = LibSBML::ModelHistory.new()
    c = LibSBML::ModelCreator.new()
    annt = "<annotation>\n" + 
    "  <test:test xmlns:test=\"http://test.org/test\">this is a test node</test:test>\n" + 
    "</annotation>"
    annt_with_modelhistory = "<annotation>\n" + 
    "  <test:test xmlns:test=\"http://test.org/test\">this is a test node</test:test>\n" + 
    "  <rdf:RDF xmlns:rdf=\"http://www.w3.org/1999/02/22-rdf-syntax-ns#\" " + 
    "xmlns:dc=\"http://purl.org/dc/elements/1.1/\" " + 
    "xmlns:dcterms=\"http://purl.org/dc/terms/\" " + 
    "xmlns:vCard=\"http://www.w3.org/2001/vcard-rdf/3.0#\" " + 
    "xmlns:bqbiol=\"http://biomodels.net/biology-qualifiers/\" " + 
    "xmlns:bqmodel=\"http://biomodels.net/model-qualifiers/\">\n" + 
    "    <rdf:Description rdf:about=\"#_000001\">\n" + 
    "      <dc:creator>\n" + 
    "        <rdf:Bag>\n" + 
    "          <rdf:li rdf:parseType=\"Resource\">\n" + 
    "            <vCard:N rdf:parseType=\"Resource\">\n" + 
    "              <vCard:Family>Keating</vCard:Family>\n" + 
    "              <vCard:Given>Sarah</vCard:Given>\n" + 
    "            </vCard:N>\n" + 
    "            <vCard:EMAIL>sbml-team@caltech.edu</vCard:EMAIL>\n" + 
    "          </rdf:li>\n" + 
    "        </rdf:Bag>\n" + 
    "      </dc:creator>\n" + 
    "      <dcterms:created rdf:parseType=\"Resource\">\n" + 
    "        <dcterms:W3CDTF>2005-12-29T12:15:45+02:00</dcterms:W3CDTF>\n" + 
    "      </dcterms:created>\n" + 
    "      <dcterms:modified rdf:parseType=\"Resource\">\n" + 
    "        <dcterms:W3CDTF>2005-12-30T12:15:45+02:00</dcterms:W3CDTF>\n" + 
    "      </dcterms:modified>\n" + 
    "    </rdf:Description>\n" + 
    "  </rdf:RDF>\n" + 
    "</annotation>"
    @@s.setAnnotation(annt)
    assert( @@s.isSetAnnotation() == true )
    assert (( annt == @@s.getAnnotationString() ))
    @@s.unsetAnnotation()
    assert( @@s.isSetAnnotation() == false )
    assert( @@s.getAnnotation() == nil )
    @@s.setAnnotation(annt)
    @@s.setMetaId( "_000001")
    c.setFamilyName("Keating")
    c.setGivenName("Sarah")
    c.setEmail("sbml-team@caltech.edu")
    h.addCreator(c)
    dc = LibSBML::Date.new(2005,12,29,12,15,45,1,2,0)
    h.setCreatedDate(dc)
    dm = LibSBML::Date.new(2005,12,30,12,15,45,1,2,0)
    h.setModifiedDate(dm)
    @@s.setModelHistory(h)
    assert( @@s.isSetAnnotation() == true )
    assert (( annt_with_modelhistory == @@s.getAnnotationString() ))
    @@s.unsetAnnotation()
    assert( @@s.isSetAnnotation() == false )
    assert( @@s.getAnnotation() == nil )
    c = nil
    h = nil
  end

  def test_SBase_unsetCVTerms
    cv = LibSBML::CVTerm.new(LibSBML::BIOLOGICAL_QUALIFIER)
    cv.setBiologicalQualifierType(LibSBML::BQB_ENCODES)
    cv.addResource( "foo")
    @@s.setMetaId( "sbase1")
    @@s.addCVTerm(cv)
    cv1 = LibSBML::CVTerm.new(LibSBML::BIOLOGICAL_QUALIFIER)
    cv1.setBiologicalQualifierType(LibSBML::BQB_IS)
    cv1.addResource( "bar")
    @@s.addCVTerm(cv1)
    cv2 = LibSBML::CVTerm.new(LibSBML::BIOLOGICAL_QUALIFIER)
    cv2.setBiologicalQualifierType(LibSBML::BQB_IS)
    cv2.addResource( "bar1")
    @@s.addCVTerm(cv2)
    cv4 = LibSBML::CVTerm.new(LibSBML::BIOLOGICAL_QUALIFIER)
    cv4.setBiologicalQualifierType(LibSBML::BQB_IS)
    cv4.addResource( "bar1")
    @@s.addCVTerm(cv4)
    assert( @@s.getNumCVTerms() == 2 )
    @@s.unsetCVTerms()
    assert( @@s.getNumCVTerms() == 0 )
    assert( @@s.getCVTerms() == nil )
    cv = nil
    cv2 = nil
    cv1 = nil
    cv4 = nil
  end

end
