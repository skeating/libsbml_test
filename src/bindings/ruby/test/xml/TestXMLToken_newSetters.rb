#
# @file    TestXMLToken_newSetters.rb
# @brief   XMLToken_newSetters unit tests
#
# @author  Akiya Jouraku (Ruby conversion)
# @author  Sarah Keating 
#
# $Id$
# $HeadURL$
#
# This test file was converted from src/sbml/test/TestXMLToken_newSetters.c
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

class TestXMLToken_newSetters < Test::Unit::TestCase

  def test_XMLToken_newSetters_addAttributes1
    triple = LibSBML::XMLTriple.new("test","","")
    attr = LibSBML::XMLAttributes.new()
    token = LibSBML::XMLToken.new(triple,attr)
    xt2 = LibSBML::XMLTriple.new("name3", "http://name3.org/", "p3")
    i = token.addAttr( "name1", "val1")
    assert( i == LibSBML::LIBSBML_OPERATION_SUCCESS )
    assert( token.getAttributesLength() == 1 )
    assert( token.isAttributesEmpty() == false )
    assert( (  "name1" != token.getAttrName(0) ) == false )
    assert( (  "val1"  != token.getAttrValue(0) ) == false )
    i = token.addAttr( "name2", "val2", "http://name1.org/", "p1")
    assert( i == LibSBML::LIBSBML_OPERATION_SUCCESS )
    assert( token.getAttributesLength() == 2 )
    assert( token.isAttributesEmpty() == false )
    assert( (  "name2" != token.getAttrName(1) ) == false )
    assert( (  "val2"  != token.getAttrValue(1) ) == false )
    assert( (  "http://name1.org/" != token.getAttrURI(1) ) == false )
    assert( (  "p1"    != token.getAttrPrefix(1) ) == false )
    i = token.addAttr(xt2, "val2")
    assert( i == LibSBML::LIBSBML_OPERATION_SUCCESS )
    assert( token.getAttributesLength() == 3 )
    assert( token.isAttributesEmpty() == false )
    assert( (  "name3" != token.getAttrName(2) ) == false )
    assert( (  "val2"  != token.getAttrValue(2) ) == false )
    assert( (  "http://name3.org/" != token.getAttrURI(2) ) == false )
    assert( (  "p3"    != token.getAttrPrefix(2) ) == false )
    xt2 = nil
    triple = nil
    attr = nil
    token = nil
  end

  def test_XMLToken_newSetters_addAttributes2
    triple = LibSBML::XMLTriple.new("test","","")
    token = LibSBML::XMLToken.new(triple)
    xt2 = LibSBML::XMLTriple.new("name3", "http://name3.org/", "p3")
    i = token.addAttr( "name1", "val1")
    assert( i == LibSBML::LIBSBML_INVALID_XML_OPERATION )
    assert( token.getAttributesLength() == 0 )
    assert( token.isAttributesEmpty() == true )
    i = token.addAttr( "name2", "val2", "http://name1.org/", "p1")
    assert( i == LibSBML::LIBSBML_INVALID_XML_OPERATION )
    assert( token.getAttributesLength() == 0 )
    assert( token.isAttributesEmpty() == true )
    i = token.addAttr(xt2, "val2")
    assert( i == LibSBML::LIBSBML_INVALID_XML_OPERATION )
    assert( token.getAttributesLength() == 0 )
    assert( token.isAttributesEmpty() == true )
    xt2 = nil
    triple = nil
    token = nil
  end

  def test_XMLToken_newSetters_addNamespaces1
    triple = LibSBML::XMLTriple.new("test","","")
    attr = LibSBML::XMLAttributes.new()
    token = LibSBML::XMLToken.new(triple,attr)
    assert( token.getNamespacesLength() == 0 )
    assert( token.isNamespacesEmpty() == true )
    i = token.addNamespace( "http://test1.org/", "test1")
    assert( i == LibSBML::LIBSBML_OPERATION_SUCCESS )
    assert( token.getNamespacesLength() == 1 )
    assert( token.isNamespacesEmpty() == false )
    attr = nil
    triple = nil
    token = nil
  end

  def test_XMLToken_newSetters_addNamespaces2
    triple = LibSBML::XMLTriple.new("test","","")
    token = LibSBML::XMLToken.new(triple)
    assert( token.getNamespacesLength() == 0 )
    assert( token.isNamespacesEmpty() == true )
    i = token.addNamespace( "http://test1.org/", "test1")
    assert( i == LibSBML::LIBSBML_INVALID_XML_OPERATION )
    assert( token.getNamespacesLength() == 0 )
    assert( token.isNamespacesEmpty() == true )
    triple = nil
    token = nil
  end

  def test_XMLToken_newSetters_clearAttributes1
    triple = LibSBML::XMLTriple.new("test","","")
    attr = LibSBML::XMLAttributes.new()
    token = LibSBML::XMLToken.new(triple,attr)
    nattr = LibSBML::XMLAttributes.new()
    xt1 = LibSBML::XMLTriple.new("name1", "http://name1.org/", "p1")
    nattr.add(xt1, "val1")
    i = token.setAttributes(nattr)
    assert( i == LibSBML::LIBSBML_OPERATION_SUCCESS )
    assert( token.isAttributesEmpty() == false )
    i = token.clearAttributes()
    assert( i == LibSBML::LIBSBML_OPERATION_SUCCESS )
    assert( token.isAttributesEmpty() == true )
    nattr = nil
    attr = nil
    triple = nil
    token = nil
    xt1 = nil
  end

  def test_XMLToken_newSetters_clearNamespaces1
    triple = LibSBML::XMLTriple.new("test","","")
    attr = LibSBML::XMLAttributes.new()
    token = LibSBML::XMLToken.new(triple,attr)
    ns = LibSBML::XMLNamespaces.new()
    assert( token.getNamespacesLength() == 0 )
    assert( token.isNamespacesEmpty() == true )
    ns.add( "http://test1.org/", "test1")
    i = token.setNamespaces(ns)
    assert( i == LibSBML::LIBSBML_OPERATION_SUCCESS )
    assert( token.getNamespacesLength() == 1 )
    assert( token.isNamespacesEmpty() == false )
    i = token.clearNamespaces()
    assert( i == LibSBML::LIBSBML_OPERATION_SUCCESS )
    assert( token.getNamespacesLength() == 0 )
    assert( token.isNamespacesEmpty() == true )
    attr = nil
    triple = nil
    token = nil
    ns = nil
  end

  def test_XMLToken_newSetters_removeAttributes1
    triple = LibSBML::XMLTriple.new("test","","")
    attr = LibSBML::XMLAttributes.new()
    token = LibSBML::XMLToken.new(triple,attr)
    xt2 = LibSBML::XMLTriple.new("name3", "http://name3.org/", "p3")
    xt1 = LibSBML::XMLTriple.new("name5", "http://name5.org/", "p5")
    i = token.addAttr( "name1", "val1")
    i = token.addAttr( "name2", "val2", "http://name1.org/", "p1")
    i = token.addAttr(xt2, "val2")
    i = token.addAttr( "name4", "val4")
    assert( token.getAttributes().getLength() == 4 )
    i = token.removeAttr(7)
    assert( i == LibSBML::LIBSBML_INDEX_EXCEEDS_SIZE )
    i = token.removeAttr( "name7")
    assert( i == LibSBML::LIBSBML_INDEX_EXCEEDS_SIZE )
    i = token.removeAttr( "name7", "namespaces7")
    assert( i == LibSBML::LIBSBML_INDEX_EXCEEDS_SIZE )
    i = token.removeAttr(xt1)
    assert( i == LibSBML::LIBSBML_INDEX_EXCEEDS_SIZE )
    assert( token.getAttributes().getLength() == 4 )
    i = token.removeAttr(3)
    assert( i == LibSBML::LIBSBML_OPERATION_SUCCESS )
    assert( token.getAttributes().getLength() == 3 )
    i = token.removeAttr( "name1")
    assert( i == LibSBML::LIBSBML_OPERATION_SUCCESS )
    assert( token.getAttributes().getLength() == 2 )
    i = token.removeAttr( "name2", "http://name1.org/")
    assert( i == LibSBML::LIBSBML_OPERATION_SUCCESS )
    assert( token.getAttributes().getLength() == 1 )
    i = token.removeAttr(xt2)
    assert( i == LibSBML::LIBSBML_OPERATION_SUCCESS )
    assert( token.getAttributes().getLength() == 0 )
    xt1 = nil
    xt2 = nil
    triple = nil
    attr = nil
    token = nil
  end

  def test_XMLToken_newSetters_removeNamespaces
    triple = LibSBML::XMLTriple.new("test","","")
    attr = LibSBML::XMLAttributes.new()
    token = LibSBML::XMLToken.new(triple,attr)
    token.addNamespace( "http://test1.org/", "test1")
    assert( token.getNamespacesLength() == 1 )
    i = token.removeNamespace(4)
    assert( i == LibSBML::LIBSBML_INDEX_EXCEEDS_SIZE )
    assert( token.getNamespacesLength() == 1 )
    i = token.removeNamespace(0)
    assert( i == LibSBML::LIBSBML_OPERATION_SUCCESS )
    assert( token.getNamespacesLength() == 0 )
    token = nil
    triple = nil
    attr = nil
  end

  def test_XMLToken_newSetters_removeNamespaces1
    triple = LibSBML::XMLTriple.new("test","","")
    attr = LibSBML::XMLAttributes.new()
    token = LibSBML::XMLToken.new(triple,attr)
    token.addNamespace( "http://test1.org/", "test1")
    assert( token.getNamespacesLength() == 1 )
    i = token.removeNamespace( "test2")
    assert( i == LibSBML::LIBSBML_INDEX_EXCEEDS_SIZE )
    assert( token.getNamespacesLength() == 1 )
    i = token.removeNamespace( "test1")
    assert( i == LibSBML::LIBSBML_OPERATION_SUCCESS )
    assert( token.getNamespacesLength() == 0 )
    token = nil
    triple = nil
    attr = nil
  end

  def test_XMLToken_newSetters_setAttributes1
    triple = LibSBML::XMLTriple.new("test","","")
    attr = LibSBML::XMLAttributes.new()
    token = LibSBML::XMLToken.new(triple,attr)
    nattr = LibSBML::XMLAttributes.new()
    xt1 = LibSBML::XMLTriple.new("name1", "http://name1.org/", "p1")
    nattr.add(xt1, "val1")
    i = token.setAttributes(nattr)
    assert( i == LibSBML::LIBSBML_OPERATION_SUCCESS )
    assert( token.isAttributesEmpty() == false )
    nattr = nil
    attr = nil
    triple = nil
    token = nil
    xt1 = nil
  end

  def test_XMLToken_newSetters_setAttributes2
    triple = LibSBML::XMLTriple.new("test","","")
    token = LibSBML::XMLToken.new(triple)
    nattr = LibSBML::XMLAttributes.new()
    xt1 = LibSBML::XMLTriple.new("name1", "http://name1.org/", "p1")
    nattr.add(xt1, "val1")
    i = token.setAttributes(nattr)
    assert( i == LibSBML::LIBSBML_INVALID_XML_OPERATION )
    assert( token.isAttributesEmpty() == true )
    nattr = nil
    triple = nil
    token = nil
    xt1 = nil
  end

  def test_XMLToken_newSetters_setEOF
    token = LibSBML::XMLToken.new()
    assert( token.isEnd() == false )
    i = token.setEOF()
    assert( i == LibSBML::LIBSBML_OPERATION_SUCCESS )
    assert( token.isEnd() == false )
    assert( token.isStart() == false )
    assert( token.isText() == false )
    token = nil
  end

  def test_XMLToken_newSetters_setEnd
    token = LibSBML::XMLToken.new()
    assert( token.isEnd() == false )
    i = token.setEnd()
    assert( i == LibSBML::LIBSBML_OPERATION_SUCCESS )
    assert( token.isEnd() == true )
    i = token.unsetEnd()
    assert( i == LibSBML::LIBSBML_OPERATION_SUCCESS )
    assert( token.isEnd() == false )
    token = nil
  end

  def test_XMLToken_newSetters_setNamespaces1
    triple = LibSBML::XMLTriple.new("test","","")
    attr = LibSBML::XMLAttributes.new()
    token = LibSBML::XMLToken.new(triple,attr)
    ns = LibSBML::XMLNamespaces.new()
    assert( token.getNamespacesLength() == 0 )
    assert( token.isNamespacesEmpty() == true )
    ns.add( "http://test1.org/", "test1")
    i = token.setNamespaces(ns)
    assert( i == LibSBML::LIBSBML_OPERATION_SUCCESS )
    assert( token.getNamespacesLength() == 1 )
    assert( token.isNamespacesEmpty() == false )
    attr = nil
    triple = nil
    token = nil
    ns = nil
  end

  def test_XMLToken_newSetters_setNamespaces2
    triple = LibSBML::XMLTriple.new("test","","")
    token = LibSBML::XMLToken.new(triple)
    ns = LibSBML::XMLNamespaces.new()
    assert( token.getNamespacesLength() == 0 )
    assert( token.isNamespacesEmpty() == true )
    ns.add( "http://test1.org/", "test1")
    i = token.setNamespaces(ns)
    assert( i == LibSBML::LIBSBML_INVALID_XML_OPERATION )
    assert( token.getNamespacesLength() == 0 )
    assert( token.isNamespacesEmpty() == true )
    triple = nil
    token = nil
    ns = nil
  end

  def test_XMLToken_newSetters_setTriple1
    triple = LibSBML::XMLTriple.new("test","","")
    token = LibSBML::XMLToken.new()
    i = token.setTriple(triple)
    assert( i == LibSBML::LIBSBML_OPERATION_SUCCESS )
    assert ((  "test" == token.getName() ))
    triple = nil
    token = nil
  end

  def test_XMLToken_newSetters_setTriple2
    triple = LibSBML::XMLTriple.new("test","","")
    token = LibSBML::XMLToken.new("This is text")
    i = token.setTriple(triple)
    assert( i == LibSBML::LIBSBML_INVALID_XML_OPERATION )
    triple = nil
    token = nil
  end

end
