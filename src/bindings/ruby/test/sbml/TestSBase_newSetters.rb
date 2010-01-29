#
# @file    TestSBase_newSetters.rb
# @brief   SBase unit tests for new set API
#
# @author  Akiya Jouraku (Ruby conversion)
# @author  Sarah Keating 
#
# $Id$
# $HeadURL$
#
# This test file was converted from src/sbml/test/TestSBase_newSetters.cpp
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

class TestSBase_newSetters < Test::Unit::TestCase

  @@INT_MAX=2147483647

  def setup
    @@s = LibSBML::Model.new(2,4)
    if (@@s == nil)
    end
  end

  def teardown
    @@s = nil
  end

  def test_SBase_addCVTerms
    cv = LibSBML::CVTerm.new(LibSBML::BIOLOGICAL_QUALIFIER)
    cv.setBiologicalQualifierType(LibSBML::BQB_ENCODES)
    cv.addResource( "foo")
    i = @@s.addCVTerm(cv)
    assert( i == LibSBML::LIBSBML_UNEXPECTED_ATTRIBUTE )
    assert( @@s.getNumCVTerms() == 0 )
    @@s.setMetaId( "_id")
    i = @@s.addCVTerm(cv)
    assert( i == LibSBML::LIBSBML_OPERATION_SUCCESS )
    assert( @@s.getNumCVTerms() == 1 )
    assert( @@s.getCVTerms() != nil )
    i = @@s.addCVTerm(nil)
    assert( i == LibSBML::LIBSBML_OPERATION_FAILED )
    assert( @@s.getNumCVTerms() == 1 )
    assert( @@s.getCVTerms() != nil )
    cv2 = LibSBML::CVTerm.new(LibSBML::MODEL_QUALIFIER)
    i = @@s.addCVTerm(cv2)
    assert( i == LibSBML::LIBSBML_INVALID_OBJECT )
    assert( @@s.getNumCVTerms() == 1 )
    assert( @@s.getCVTerms() != nil )
    cv = nil
    cv2 = nil
  end

  def test_SBase_appendAnnotation
    token = LibSBML::XMLToken.new("This is a test note")
    node = LibSBML::XMLNode.new(token)
    token1 = LibSBML::XMLToken.new("This is additional")
    node1 = LibSBML::XMLNode.new(token1)
    i = @@s.setAnnotation(node)
    assert( i == LibSBML::LIBSBML_OPERATION_SUCCESS )
    i = @@s.appendAnnotation(node1)
    t1 = @@s.getAnnotation()
    assert( t1.getNumChildren() == 2 )
    assert ((     "This is a test note" == t1.getChild(0).getCharacters() ))
    assert ((     "This is additional" == t1.getChild(1).getCharacters() ))
  end

  def test_SBase_appendAnnotationString
    token = LibSBML::XMLToken.new("This is a test note")
    node = LibSBML::XMLNode.new(token)
    i = @@s.setAnnotation(node)
    assert( i == LibSBML::LIBSBML_OPERATION_SUCCESS )
    i = @@s.appendAnnotation( "This is additional")
    t1 = @@s.getAnnotation()
    assert( t1.getNumChildren() == 2 )
    assert ((     "This is a test note" == t1.getChild(0).getCharacters() ))
    c1 = t1.getChild(1)
    assert( c1.getNumChildren() == 0 )
    assert ((  "This is additional" == c1.getCharacters() ))
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
    i = @@s.setNotes(node)
    assert( i == LibSBML::LIBSBML_OPERATION_SUCCESS )
    assert( @@s.isSetNotes() == true )
    token1 = LibSBML::XMLToken.new(triple,att,ns)
    node1 = LibSBML::XMLNode.new(token1)
    node1.addChild(node5)
    i = @@s.appendNotes(node1)
    assert( i == LibSBML::LIBSBML_OPERATION_SUCCESS )
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
    i = @@s.setNotes(html_node)
    i = @@s.appendNotes(html_node1)
    assert( i == LibSBML::LIBSBML_OPERATION_SUCCESS )
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
    i = @@s.setNotes(html_node)
    i = @@s.appendNotes(body_node1)
    assert( i == LibSBML::LIBSBML_OPERATION_SUCCESS )
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
    i = @@s.setNotes(html_node)
    i = @@s.appendNotes(p_node1)
    assert( i == LibSBML::LIBSBML_OPERATION_SUCCESS )
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
    i = @@s.setNotes(body_node)
    i = @@s.appendNotes(html_node1)
    assert( i == LibSBML::LIBSBML_OPERATION_SUCCESS )
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
    i = @@s.setNotes(p_node)
    i = @@s.appendNotes(html_node1)
    assert( i == LibSBML::LIBSBML_OPERATION_SUCCESS )
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
    i = @@s.setNotes(body_node)
    i = @@s.appendNotes(body_node1)
    assert( i == LibSBML::LIBSBML_OPERATION_SUCCESS )
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
    i = @@s.setNotes(p_node)
    i = @@s.appendNotes(body_node1)
    assert( i == LibSBML::LIBSBML_OPERATION_SUCCESS )
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
    i = @@s.setNotes(body_node)
    i = @@s.appendNotes(p_node1)
    assert( i == LibSBML::LIBSBML_OPERATION_SUCCESS )
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
    taggednotes = "<notes>\n" + "  <p xmlns=\"http://www.w3.org/1999/xhtml\">This is a test note </p>\n" + "</notes>";
    taggednewnotes = "<notes>\n" + "  <p xmlns=\"http://www.w3.org/1999/xhtml\">This is a test note </p>\n" + 
    "  <p xmlns=\"http://www.w3.org/1999/xhtml\">This is more test notes </p>\n" + 
    "</notes>"
    badnotes =  "<notes>This is a test note</notes>";
    newnotes =  "<p xmlns=\"http://www.w3.org/1999/xhtml\">This is more test notes </p>";
    i = @@s.setNotes(notes)
    assert( i == LibSBML::LIBSBML_OPERATION_SUCCESS )
    assert( @@s.isSetNotes() == true )
    i = @@s.appendNotes(badnotes)
    notes1 = @@s.getNotesString()
    assert( i == LibSBML::LIBSBML_INVALID_OBJECT )
    assert( @@s.isSetNotes() == true )
    assert (( notes1 == taggednotes ))
    i = @@s.appendNotes(newnotes)
    notes1 = @@s.getNotesString()
    assert( i == LibSBML::LIBSBML_OPERATION_SUCCESS )
    assert( @@s.isSetNotes() == true )
    assert (( notes1 == taggednewnotes ))
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
    i = @@s.setNotes(notes)
    i = @@s.appendNotes(addnotes)
    notes1 = @@s.getNotesString()
    assert( i == LibSBML::LIBSBML_OPERATION_SUCCESS )
    assert( @@s.isSetNotes() == true )
    assert (( notes1 == taggednewnotes ))
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
    i = @@s.setNotes(notes)
    i = @@s.appendNotes(addnotes)
    notes1 = @@s.getNotesString()
    assert( i == LibSBML::LIBSBML_OPERATION_SUCCESS )
    assert( @@s.isSetNotes() == true )
    assert (( notes1 == taggednewnotes ))
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
    addnotes =  "<p xmlns=\"http://www.w3.org/1999/xhtml\">This is more test notes </p>";
    i = @@s.setNotes(notes)
    i = @@s.appendNotes(addnotes)
    notes1 = @@s.getNotesString()
    assert( i == LibSBML::LIBSBML_OPERATION_SUCCESS )
    assert( @@s.isSetNotes() == true )
    assert (( notes1 == taggednewnotes ))
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
    i = @@s.setNotes(notes)
    i = @@s.appendNotes(addnotes)
    notes1 = @@s.getNotesString()
    assert( i == LibSBML::LIBSBML_OPERATION_SUCCESS )
    assert( @@s.isSetNotes() == true )
    assert (( notes1 == taggednewnotes ))
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
    i = @@s.setNotes(notes)
    i = @@s.appendNotes(addnotes)
    notes1 = @@s.getNotesString()
    assert( i == LibSBML::LIBSBML_OPERATION_SUCCESS )
    assert( @@s.isSetNotes() == true )
    assert (( notes1 == taggednewnotes ))
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
    i = @@s.setNotes(notes)
    i = @@s.appendNotes(addnotes)
    notes1 = @@s.getNotesString()
    assert( i == LibSBML::LIBSBML_OPERATION_SUCCESS )
    assert( @@s.isSetNotes() == true )
    assert (( notes1 == taggednewnotes ))
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
    i = @@s.setNotes(notes)
    i = @@s.appendNotes(addnotes)
    notes1 = @@s.getNotesString()
    assert( i == LibSBML::LIBSBML_OPERATION_SUCCESS )
    assert( @@s.isSetNotes() == true )
    assert (( notes1 == taggednewnotes ))
  end

  def test_SBase_appendNotesString8
    notes = "<body xmlns=\"http://www.w3.org/1999/xhtml\">\n" + "  <p>This is a test note </p>\n" + "</body>";
    taggednewnotes = "<notes>\n" + 
    "  <body xmlns=\"http://www.w3.org/1999/xhtml\">\n" + 
    "    <p>This is a test note </p>\n" + 
    "    <p xmlns=\"http://www.w3.org/1999/xhtml\">This is more test notes </p>\n" + 
    "  </body>\n" + 
    "</notes>"
    addnotes =  "<p xmlns=\"http://www.w3.org/1999/xhtml\">This is more test notes </p>";
    i = @@s.setNotes(notes)
    i = @@s.appendNotes(addnotes)
    notes1 = @@s.getNotesString()
    assert( i == LibSBML::LIBSBML_OPERATION_SUCCESS )
    assert( @@s.isSetNotes() == true )
    assert (( notes1 == taggednewnotes ))
  end

  def test_SBase_setAnnotation
    token = LibSBML::XMLToken.new("This is a test note")
    node = LibSBML::XMLNode.new(token)
    i = @@s.setAnnotation(node)
    assert( i == LibSBML::LIBSBML_OPERATION_SUCCESS )
    assert( @@s.isSetAnnotation() == true )
    i = @@s.unsetAnnotation()
    assert( i == LibSBML::LIBSBML_OPERATION_SUCCESS )
    @@s.unsetAnnotation()
    assert( @@s.isSetAnnotation() == false )
    i = @@s.setAnnotation(node)
    i = @@s.setAnnotation(nil)
    assert( i == LibSBML::LIBSBML_OPERATION_SUCCESS )
    assert( @@s.isSetAnnotation() == false )
  end

  def test_SBase_setAnnotationString
    annotation =  "This is a test note";
    taggedannotation =  "<annotation>This is a test note</annotation>";
    i = @@s.setAnnotation(annotation)
    assert( i == LibSBML::LIBSBML_OPERATION_SUCCESS )
    assert( @@s.isSetAnnotation() == true )
    i = @@s.setAnnotation( "")
    assert( i == LibSBML::LIBSBML_OPERATION_SUCCESS )
    assert( @@s.isSetAnnotation() == false )
    i = @@s.setAnnotation(taggedannotation)
    assert( i == LibSBML::LIBSBML_OPERATION_SUCCESS )
    assert( @@s.isSetAnnotation() == true )
    i = @@s.unsetAnnotation()
    assert( i == LibSBML::LIBSBML_OPERATION_SUCCESS )
    assert( @@s.isSetAnnotation() == false )
  end

  def test_SBase_setMetaId1
    c = LibSBML::Compartment.new(1,2)
    i = c.setMetaId( "cell")
    assert( i == LibSBML::LIBSBML_UNEXPECTED_ATTRIBUTE )
    assert_equal false, c.isSetMetaId()
    c = nil
  end

  def test_SBase_setMetaId2
    i = @@s.setMetaId( "1cell")
    assert( i == LibSBML::LIBSBML_INVALID_ATTRIBUTE_VALUE )
    assert_equal false, @@s.isSetMetaId()
    i = @@s.unsetMetaId()
    assert( i == LibSBML::LIBSBML_OPERATION_SUCCESS )
    assert_equal false, @@s.isSetMetaId()
  end

  def test_SBase_setMetaId3
    i = @@s.setMetaId( "cell")
    assert( i == LibSBML::LIBSBML_OPERATION_SUCCESS )
    assert_equal true, @@s.isSetMetaId()
    assert ((  "cell"  == @@s.getMetaId() ))
    i = @@s.unsetMetaId()
    assert( i == LibSBML::LIBSBML_OPERATION_SUCCESS )
    assert_equal false, @@s.isSetMetaId()
  end

  def test_SBase_setMetaId4
    i = @@s.setMetaId( "cell")
    assert( i == LibSBML::LIBSBML_OPERATION_SUCCESS )
    assert_equal true, @@s.isSetMetaId()
    assert ((  "cell"  == @@s.getMetaId() ))
    i = @@s.setMetaId("")
    assert( i == LibSBML::LIBSBML_OPERATION_SUCCESS )
    assert_equal false, @@s.isSetMetaId()
  end

  def test_SBase_setNamespaces
    ns = LibSBML::XMLNamespaces.new()
    ns.add("url", "name")
    i = @@s.setNamespaces(ns)
    assert( i == LibSBML::LIBSBML_OPERATION_SUCCESS )
    assert( @@s.getNamespaces().getLength() == 1 )
    i = @@s.setNamespaces(nil)
    assert( i == LibSBML::LIBSBML_OPERATION_SUCCESS )
    assert( @@s.getNamespaces() == nil )
  end

  def test_SBase_setNotes
    triple = LibSBML::XMLTriple.new("p", "", "")
    att = LibSBML::XMLAttributes.new()
    ns = LibSBML::XMLNamespaces.new()
    ns.add( "http://www.w3.org/1999/xhtml", "")
    tt = LibSBML::XMLToken.new("This is my text")
    n1 = LibSBML::XMLNode.new(tt)
    token = LibSBML::XMLToken.new(triple,att,ns)
    node = LibSBML::XMLNode.new(token)
    node.addChild(n1)
    i = @@s.setNotes(node)
    assert( i == LibSBML::LIBSBML_OPERATION_SUCCESS )
    assert( @@s.isSetNotes() == true )
    i = @@s.unsetNotes()
    assert( i == LibSBML::LIBSBML_OPERATION_SUCCESS )
    assert( ! @@s.isSetNotes() == true )
    token = LibSBML::XMLToken.new("This is a test note")
    node = LibSBML::XMLNode.new(token)
    i = @@s.setNotes(node)
    assert( i == LibSBML::LIBSBML_INVALID_OBJECT )
    assert( ! @@s.isSetNotes() == true )
    token = LibSBML::XMLToken.new(triple,att,ns)
    node = LibSBML::XMLNode.new(token)
    node.addChild(n1)
    i = @@s.setNotes(node)
    assert( i == LibSBML::LIBSBML_OPERATION_SUCCESS )
    assert( @@s.isSetNotes() == true )
    i = @@s.setNotes(nil)
    assert( i == LibSBML::LIBSBML_OPERATION_SUCCESS )
    assert( ! @@s.isSetNotes() == true )
    node = nil
  end

  def test_SBase_setNotes1
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
    p_node.addChild(text_node)
    body_node.addChild(p_node)
    head_node.addChild(title_node)
    html_node.addChild(head_node)
    html_node.addChild(body_node)
    i = @@s.setNotes(html_node)
    assert( i == LibSBML::LIBSBML_OPERATION_SUCCESS )
    notes = @@s.getNotes()
    assert ((  "notes" == notes.getName() ))
    assert( notes.getNumChildren() == 1 )
    child = notes.getChild(0)
    assert ((  "html" == child.getName() ))
    assert( child.getNumChildren() == 2 )
    child = child.getChild(1)
    assert ((  "body" == child.getName() ))
    assert( child.getNumChildren() == 1 )
    child = child.getChild(0)
    assert ((  "p" == child.getName() ))
    assert( child.getNumChildren() == 1 )
    child = child.getChild(0)
    assert ((  "This is my text" == child.getCharacters() ))
    assert( child.getNumChildren() == 0 )
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
    html_node = nil
    head_node = nil
    body_node = nil
    p_node = nil
    text_node = nil
  end

  def test_SBase_setNotes2
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
    p_node.addChild(text_node)
    body_node.addChild(p_node)
    i = @@s.setNotes(body_node)
    assert( i == LibSBML::LIBSBML_OPERATION_SUCCESS )
    notes = @@s.getNotes()
    assert ((  "notes" == notes.getName() ))
    assert( notes.getNumChildren() == 1 )
    child = notes.getChild(0)
    assert ((  "body" == child.getName() ))
    assert( child.getNumChildren() == 1 )
    child = child.getChild(0)
    assert ((  "p" == child.getName() ))
    assert( child.getNumChildren() == 1 )
    child = child.getChild(0)
    assert ((  "This is my text" == child.getCharacters() ))
    assert( child.getNumChildren() == 0 )
    att = nil
    ns = nil
    body_triple = nil
    p_triple = nil
    body_token = nil
    p_token = nil
    text_token = nil
    body_node = nil
    p_node = nil
    text_node = nil
  end

  def test_SBase_setNotes3
    att = LibSBML::XMLAttributes.new()
    ns = LibSBML::XMLNamespaces.new()
    ns.add( "http://www.w3.org/1999/xhtml", "")
    p_triple = LibSBML::XMLTriple.new("p", "", "")
    p_token = LibSBML::XMLToken.new(p_triple,att,ns)
    text_token = LibSBML::XMLToken.new("This is my text")
    p_node = LibSBML::XMLNode.new(p_token)
    text_node = LibSBML::XMLNode.new(text_token)
    p_node.addChild(text_node)
    i = @@s.setNotes(p_node)
    assert( i == LibSBML::LIBSBML_OPERATION_SUCCESS )
    notes = @@s.getNotes()
    assert ((  "notes" == notes.getName() ))
    assert( notes.getNumChildren() == 1 )
    child = notes.getChild(0)
    assert ((  "p" == child.getName() ))
    assert( child.getNumChildren() == 1 )
    child = child.getChild(0)
    assert ((  "This is my text" == child.getCharacters() ))
    assert( child.getNumChildren() == 0 )
    att = nil
    ns = nil
    p_triple = nil
    p_token = nil
    text_token = nil
    p_node = nil
    text_node = nil
  end

  def test_SBase_setNotesString
    notes =  "<p xmlns=\"http://www.w3.org/1999/xhtml\">This is a test note </p>";
    taggednotes =  "<notes><p xmlns=\"http://www.w3.org/1999/xhtml\">This is a test note </p></notes>";
    badnotes =  "<notes>This is a test note</notes>";
    i = @@s.setNotes(notes)
    assert( i == LibSBML::LIBSBML_OPERATION_SUCCESS )
    assert( @@s.isSetNotes() == true )
    i = @@s.unsetNotes()
    assert( i == LibSBML::LIBSBML_OPERATION_SUCCESS )
    assert( ! @@s.isSetNotes() == true )
    i = @@s.setNotes(taggednotes)
    assert( i == LibSBML::LIBSBML_OPERATION_SUCCESS )
    assert( @@s.isSetNotes() == true )
    i = @@s.setNotes(nil)
    assert( i == LibSBML::LIBSBML_OPERATION_SUCCESS )
    assert( ! @@s.isSetNotes() == true )
    i = @@s.setNotes(badnotes)
    assert( i == LibSBML::LIBSBML_INVALID_OBJECT )
    assert( ! @@s.isSetNotes() == true )
  end

  def test_SBase_setSBOTerm1
    c = LibSBML::Compartment.new(1,2)
    i = c.setSBOTerm(2)
    assert( i == LibSBML::LIBSBML_UNEXPECTED_ATTRIBUTE )
    assert_equal false, c.isSetSBOTerm()
    c = nil
  end

  def test_SBase_setSBOTerm2
    i = @@s.setSBOTerm(5)
    assert( i == LibSBML::LIBSBML_OPERATION_SUCCESS )
    assert_equal true, @@s.isSetSBOTerm()
    assert( @@s.getSBOTerm() == 5 )
    assert( (  "SBO:0000005" != @@s.getSBOTermID() ) == false )
    i = @@s.unsetSBOTerm()
    assert( i == LibSBML::LIBSBML_OPERATION_SUCCESS )
    assert_equal false, @@s.isSetSBOTerm()
    i = @@s.setSBOTerm(0)
    assert( i == LibSBML::LIBSBML_OPERATION_SUCCESS )
    assert_equal true, @@s.isSetSBOTerm()
    assert( @@s.getSBOTerm() == 0 )
    assert( (  "SBO:0000000" != @@s.getSBOTermID() ) == false )
    i = @@s.setSBOTerm(9999999)
    assert( i == LibSBML::LIBSBML_OPERATION_SUCCESS )
    assert_equal true, @@s.isSetSBOTerm()
    assert( @@s.getSBOTerm() == 9999999 )
    assert( (  "SBO:9999999" != @@s.getSBOTermID() ) == false )
    i = @@s.setSBOTerm( "SBO:0000005")
    assert( i == LibSBML::LIBSBML_OPERATION_SUCCESS )
    assert_equal true, @@s.isSetSBOTerm()
    assert( @@s.getSBOTerm() == 5 )
    assert( (  "SBO:0000005" != @@s.getSBOTermID() ) == false )
    i = @@s.unsetSBOTerm()
    assert( i == LibSBML::LIBSBML_OPERATION_SUCCESS )
    assert_equal false, @@s.isSetSBOTerm()
    i = @@s.setSBOTerm( "SBO:0000000")
    assert( i == LibSBML::LIBSBML_OPERATION_SUCCESS )
    assert_equal true, @@s.isSetSBOTerm()
    assert( @@s.getSBOTerm() == 0 )
    assert( (  "SBO:0000000" != @@s.getSBOTermID() ) == false )
    i = @@s.setSBOTerm( "SBO:9999999")
    assert( i == LibSBML::LIBSBML_OPERATION_SUCCESS )
    assert_equal true, @@s.isSetSBOTerm()
    assert( @@s.getSBOTerm() == 9999999 )
    assert( (  "SBO:9999999" != @@s.getSBOTermID() ) == false )
    i = @@s.setSBOTerm(@@INT_MAX)
    assert( i == LibSBML::LIBSBML_INVALID_ATTRIBUTE_VALUE )
    assert_equal false, @@s.isSetSBOTerm()
    assert( @@s.getSBOTermID() == "" )
    i = @@s.setSBOTerm(-1)
    assert( i == LibSBML::LIBSBML_INVALID_ATTRIBUTE_VALUE )
    assert_equal false, @@s.isSetSBOTerm()
    assert( @@s.getSBOTermID() == "" )
    i = @@s.setSBOTerm(10000000)
    assert( i == LibSBML::LIBSBML_INVALID_ATTRIBUTE_VALUE )
    assert_equal false, @@s.isSetSBOTerm()
    assert( @@s.getSBOTermID() == "" )
  end

  def test_SBase_unsetCVTerms
    cv = LibSBML::CVTerm.new(LibSBML::BIOLOGICAL_QUALIFIER)
    cv.setBiologicalQualifierType(LibSBML::BQB_ENCODES)
    cv.addResource( "foo")
    @@s.setMetaId( "_id")
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
    i = @@s.unsetCVTerms()
    assert( i == LibSBML::LIBSBML_OPERATION_SUCCESS )
    assert( @@s.getNumCVTerms() == 0 )
    assert( @@s.getCVTerms() == nil )
    cv = nil
    cv2 = nil
    cv1 = nil
    cv4 = nil
  end

end
