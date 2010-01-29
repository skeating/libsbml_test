#
# @file    TestXMLNode_newSetters.rb
# @brief   XMLNode unit tests
#
# @author  Akiya Jouraku (Ruby conversion)
# @author  Sarah Keating 
#
# $Id$
# $HeadURL$
#
# This test file was converted from src/sbml/test/TestXMLNode_newSetters.c
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

class TestXMLNode_newSetters < Test::Unit::TestCase

  def test_XMLNode_addChild1
    node = LibSBML::XMLNode.new()
    node2 = LibSBML::XMLNode.new()
    i = node.addChild(node2)
    assert( i == LibSBML::LIBSBML_OPERATION_SUCCESS )
    assert( node.getNumChildren() == 1 )
    node = nil
    node2 = nil
  end

  def test_XMLNode_addChild2
    triple = LibSBML::XMLTriple.new("test","","")
    attr = LibSBML::XMLAttributes.new()
    node = LibSBML::XMLNode.new(triple,attr)
    node2 = LibSBML::XMLNode.new()
    i = node.addChild(node2)
    assert( i == LibSBML::LIBSBML_OPERATION_SUCCESS )
    assert( node.getNumChildren() == 1 )
    triple = nil
    attr = nil
    node = nil
    node2 = nil
  end

  def test_XMLNode_addChild3
    triple = LibSBML::XMLTriple.new("test","","")
    node = LibSBML::XMLNode.new(triple)
    node2 = LibSBML::XMLNode.new()
    i = node.addChild(node2)
    assert( i == LibSBML::LIBSBML_INVALID_XML_OPERATION )
    assert( node.getNumChildren() == 0 )
    triple = nil
    node = nil
    node2 = nil
  end

  def test_XMLNode_clearAttributes
    triple = LibSBML::XMLTriple.new("test","","")
    attr = LibSBML::XMLAttributes.new()
    node = LibSBML::XMLNode.new(triple,attr)
    xt2 = LibSBML::XMLTriple.new("name3", "http://name3.org/", "p3")
    xt1 = LibSBML::XMLTriple.new("name5", "http://name5.org/", "p5")
    i = node.addAttr( "name1", "val1")
    assert( i == LibSBML::LIBSBML_OPERATION_SUCCESS )
    assert( node.getAttributes().getLength() == 1 )
    i = node.addAttr( "name2", "val2", "http://name1.org/", "p1")
    assert( i == LibSBML::LIBSBML_OPERATION_SUCCESS )
    assert( node.getAttributes().getLength() == 2 )
    i = node.addAttr(xt2, "val2")
    assert( i == LibSBML::LIBSBML_OPERATION_SUCCESS )
    assert( node.getAttributes().getLength() == 3 )
    i = node.addAttr( "name4", "val4")
    assert( i == LibSBML::LIBSBML_OPERATION_SUCCESS )
    assert( node.getAttributes().getLength() == 4 )
    i = node.clearAttributes()
    assert( i == LibSBML::LIBSBML_OPERATION_SUCCESS )
    assert( node.getAttributes().getLength() == 0 )
    xt1 = nil
    xt2 = nil
    triple = nil
    attr = nil
    node = nil
  end

  def test_XMLNode_clearNamespaces
    triple = LibSBML::XMLTriple.new("test","","")
    attr = LibSBML::XMLAttributes.new()
    node = LibSBML::XMLNode.new(triple,attr)
    i = node.addNamespace( "http://test1.org/", "test1")
    assert( i == LibSBML::LIBSBML_OPERATION_SUCCESS )
    assert( node.getNamespaces().getLength() == 1 )
    i = node.addNamespace( "http://test2.org/", "test2")
    assert( i == LibSBML::LIBSBML_OPERATION_SUCCESS )
    assert( node.getNamespaces().getLength() == 2 )
    i = node.clearNamespaces()
    assert( i == LibSBML::LIBSBML_OPERATION_SUCCESS )
    assert( node.getNamespaces().getLength() == 0 )
    triple = nil
    attr = nil
    node = nil
  end

  def test_XMLNode_removeAttributes
    triple = LibSBML::XMLTriple.new("test","","")
    attr = LibSBML::XMLAttributes.new()
    node = LibSBML::XMLNode.new(triple,attr)
    xt2 = LibSBML::XMLTriple.new("name3", "http://name3.org/", "p3")
    xt1 = LibSBML::XMLTriple.new("name5", "http://name5.org/", "p5")
    i = node.addAttr( "name1", "val1")
    assert( i == LibSBML::LIBSBML_OPERATION_SUCCESS )
    assert( node.getAttributes().getLength() == 1 )
    i = node.addAttr( "name2", "val2", "http://name1.org/", "p1")
    assert( i == LibSBML::LIBSBML_OPERATION_SUCCESS )
    assert( node.getAttributes().getLength() == 2 )
    i = node.addAttr(xt2, "val2")
    assert( i == LibSBML::LIBSBML_OPERATION_SUCCESS )
    assert( node.getAttributes().getLength() == 3 )
    i = node.addAttr( "name4", "val4")
    assert( i == LibSBML::LIBSBML_OPERATION_SUCCESS )
    assert( node.getAttributes().getLength() == 4 )
    i = node.removeAttr(7)
    assert( i == LibSBML::LIBSBML_INDEX_EXCEEDS_SIZE )
    i = node.removeAttr( "name7")
    assert( i == LibSBML::LIBSBML_INDEX_EXCEEDS_SIZE )
    i = node.removeAttr( "name7", "namespaces7")
    assert( i == LibSBML::LIBSBML_INDEX_EXCEEDS_SIZE )
    i = node.removeAttr(xt1)
    assert( i == LibSBML::LIBSBML_INDEX_EXCEEDS_SIZE )
    assert( node.getAttributes().getLength() == 4 )
    i = node.removeAttr(3)
    assert( i == LibSBML::LIBSBML_OPERATION_SUCCESS )
    assert( node.getAttributes().getLength() == 3 )
    i = node.removeAttr( "name1")
    assert( i == LibSBML::LIBSBML_OPERATION_SUCCESS )
    assert( node.getAttributes().getLength() == 2 )
    i = node.removeAttr( "name2", "http://name1.org/")
    assert( i == LibSBML::LIBSBML_OPERATION_SUCCESS )
    assert( node.getAttributes().getLength() == 1 )
    i = node.removeAttr(xt2)
    assert( i == LibSBML::LIBSBML_OPERATION_SUCCESS )
    assert( node.getAttributes().getLength() == 0 )
    xt1 = nil
    xt2 = nil
    triple = nil
    attr = nil
    node = nil
  end

  def test_XMLNode_removeChildren
    node = LibSBML::XMLNode.new()
    node2 = LibSBML::XMLNode.new()
    node3 = LibSBML::XMLNode.new()
    node.addChild(node2)
    node.addChild(node3)
    assert( node.getNumChildren() == 2 )
    i = node.removeChildren()
    assert( i == LibSBML::LIBSBML_OPERATION_SUCCESS )
    assert( node.getNumChildren() == 0 )
    node = nil
    node2 = nil
    node3 = nil
  end

  def test_XMLNode_removeNamespaces
    triple = LibSBML::XMLTriple.new("test","","")
    attr = LibSBML::XMLAttributes.new()
    node = LibSBML::XMLNode.new(triple,attr)
    i = node.addNamespace( "http://test1.org/", "test1")
    assert( i == LibSBML::LIBSBML_OPERATION_SUCCESS )
    assert( node.getNamespaces().getLength() == 1 )
    i = node.addNamespace( "http://test2.org/", "test2")
    assert( i == LibSBML::LIBSBML_OPERATION_SUCCESS )
    assert( node.getNamespaces().getLength() == 2 )
    i = node.removeNamespace(7)
    assert( i == LibSBML::LIBSBML_INDEX_EXCEEDS_SIZE )
    assert( node.getNamespaces().getLength() == 2 )
    i = node.removeNamespace( "name7")
    assert( i == LibSBML::LIBSBML_INDEX_EXCEEDS_SIZE )
    assert( node.getNamespaces().getLength() == 2 )
    i = node.removeNamespace(0)
    assert( i == LibSBML::LIBSBML_OPERATION_SUCCESS )
    assert( node.getNamespaces().getLength() == 1 )
    i = node.removeNamespace( "test2")
    assert( i == LibSBML::LIBSBML_OPERATION_SUCCESS )
    assert( node.getNamespaces().getLength() == 0 )
    triple = nil
    attr = nil
    node = nil
  end

end
