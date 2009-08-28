#
# @file    TestXMLNode.rb
# @brief   XMLNode unit tests
#
# @author  Akiya Jouraku (Ruby conversion)
# @author  Michael Hucka <mhucka@caltech.edu> 
#
# $Id$
# $HeadURL$
#
# This test file was converted from src/sbml/test/TestXMLNode.c
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

class TestXMLNode < Test::Unit::TestCase

  def test_XMLNode_attribute_add_remove
    triple = LibSBML::XMLTriple.new("test","","")
    attr = LibSBML::XMLAttributes.new()
    node = LibSBML::XMLNode.new(triple,attr)
    xt1 = LibSBML::XMLTriple.new("name1", "http://name1.org/", "p1")
    xt2 = LibSBML::XMLTriple.new("name2", "http://name2.org/", "p2")
    xt3 = LibSBML::XMLTriple.new("name3", "http://name3.org/", "p3")
    xt1a = LibSBML::XMLTriple.new("name1", "http://name1a.org/", "p1a")
    xt2a = LibSBML::XMLTriple.new("name2", "http://name2a.org/", "p2a")
    node.addAttr( "name1", "val1", "http://name1.org/", "p1")
    node.addAttr(xt2, "val2")
    assert( node.getAttributesLength() == 2 )
    assert( node.isAttributesEmpty() == false )
    assert( (  "name1" != node.getAttrName(0) ) == false )
    assert( (  "val1"  != node.getAttrValue(0) ) == false )
    assert( (  "http://name1.org/" != node.getAttrURI(0) ) == false )
    assert( (  "p1"    != node.getAttrPrefix(0) ) == false )
    assert( (  "name2" != node.getAttrName(1) ) == false )
    assert( (  "val2"  != node.getAttrValue(1) ) == false )
    assert( (  "http://name2.org/" != node.getAttrURI(1) ) == false )
    assert( (  "p2"    != node.getAttrPrefix(1) ) == false )
    assert( node.getAttrValue( "name1") == "" )
    assert( node.getAttrValue( "name2") == "" )
    assert( (  "val1"  != node.getAttrValue( "name1", "http://name1.org/") ) == false )
    assert( (  "val2"  != node.getAttrValue( "name2", "http://name2.org/") ) == false )
    assert( (  "val1"  != node.getAttrValue(xt1) ) == false )
    assert( (  "val2"  != node.getAttrValue(xt2) ) == false )
    assert( node.hasAttr(-1) == false )
    assert( node.hasAttr(2) == false )
    assert( node.hasAttr(0) == true )
    assert( node.hasAttr( "name1", "http://name1.org/") == true )
    assert( node.hasAttr( "name2", "http://name2.org/") == true )
    assert( node.hasAttr( "name3", "http://name3.org/") == false )
    assert( node.hasAttr(xt1) == true )
    assert( node.hasAttr(xt2) == true )
    assert( node.hasAttr(xt3) == false )
    node.addAttr( "noprefix", "val3")
    assert( node.getAttributesLength() == 3 )
    assert( node.isAttributesEmpty() == false )
    assert( (  "noprefix" != node.getAttrName(2) ) == false )
    assert( (  "val3"     != node.getAttrValue(2) ) == false )
    assert( node.getAttrURI(2) == "" )
    assert( node.getAttrPrefix(2) == "" )
    assert( (      "val3"  != node.getAttrValue( "noprefix") ) == false )
    assert( (  "val3"  != node.getAttrValue( "noprefix", "") ) == false )
    assert( node.hasAttr( "noprefix"    ) == true )
    assert( node.hasAttr( "noprefix", "") == true )
    node.addAttr(xt1, "mval1")
    node.addAttr( "name2", "mval2", "http://name2.org/", "p2")
    assert( node.getAttributesLength() == 3 )
    assert( node.isAttributesEmpty() == false )
    assert( (  "name1" != node.getAttrName(0) ) == false )
    assert( (  "mval1" != node.getAttrValue(0) ) == false )
    assert( (  "http://name1.org/" != node.getAttrURI(0) ) == false )
    assert( (  "p1"    != node.getAttrPrefix(0) ) == false )
    assert( (  "name2"    != node.getAttrName(1) ) == false )
    assert( (  "mval2"    != node.getAttrValue(1) ) == false )
    assert( (  "http://name2.org/" != node.getAttrURI(1) ) == false )
    assert( (  "p2"       != node.getAttrPrefix(1) ) == false )
    assert( node.hasAttr(xt1) == true )
    assert( node.hasAttr( "name1", "http://name1.org/") == true )
    node.addAttr( "noprefix", "mval3")
    assert( node.getAttributesLength() == 3 )
    assert( node.isAttributesEmpty() == false )
    assert( (  "noprefix" != node.getAttrName(2) ) == false )
    assert( (  "mval3"    != node.getAttrValue(2) ) == false )
    assert( node.getAttrURI(2) == "" )
    assert( node.getAttrPrefix(2) == "" )
    assert( node.hasAttr( "noprefix") == true )
    assert( node.hasAttr( "noprefix", "") == true )
    node.addAttr(xt1a, "val1a")
    node.addAttr(xt2a, "val2a")
    assert( node.getAttributesLength() == 5 )
    assert( (  "name1" != node.getAttrName(3) ) == false )
    assert( (  "val1a" != node.getAttrValue(3) ) == false )
    assert( (  "http://name1a.org/" != node.getAttrURI(3) ) == false )
    assert( (  "p1a" != node.getAttrPrefix(3) ) == false )
    assert( (  "name2" != node.getAttrName(4) ) == false )
    assert( (  "val2a" != node.getAttrValue(4) ) == false )
    assert( (  "http://name2a.org/" != node.getAttrURI(4) ) == false )
    assert( (  "p2a" != node.getAttrPrefix(4) ) == false )
    assert( (  "val1a"  != node.getAttrValue( "name1", "http://name1a.org/") ) == false )
    assert( (  "val2a"  != node.getAttrValue( "name2", "http://name2a.org/") ) == false )
    assert( (  "val1a"  != node.getAttrValue(xt1a) ) == false )
    assert( (  "val2a"  != node.getAttrValue(xt2a) ) == false )
    node.removeAttr(xt1a)
    node.removeAttr(xt2a)
    assert( node.getAttributesLength() == 3 )
    node.removeAttr( "name1", "http://name1.org/")
    assert( node.getAttributesLength() == 2 )
    assert( node.isAttributesEmpty() == false )
    assert( (  "name2" != node.getAttrName(0) ) == false )
    assert( (  "mval2" != node.getAttrValue(0) ) == false )
    assert( (  "http://name2.org/" != node.getAttrURI(0) ) == false )
    assert( (  "p2" != node.getAttrPrefix(0) ) == false )
    assert( (  "noprefix" != node.getAttrName(1) ) == false )
    assert( (  "mval3" != node.getAttrValue(1) ) == false )
    assert( node.getAttrURI(1) == "" )
    assert( node.getAttrPrefix(1) == "" )
    assert( node.hasAttr( "name1", "http://name1.org/") == false )
    node.removeAttr(xt2)
    assert( node.getAttributesLength() == 1 )
    assert( node.isAttributesEmpty() == false )
    assert( (  "noprefix" != node.getAttrName(0) ) == false )
    assert( (  "mval3" != node.getAttrValue(0) ) == false )
    assert( node.getAttrURI(0) == "" )
    assert( node.getAttrPrefix(0) == "" )
    assert( node.hasAttr(xt2) == false )
    assert( node.hasAttr( "name2", "http://name2.org/") == false )
    node.removeAttr( "noprefix")
    assert( node.getAttributesLength() == 0 )
    assert( node.isAttributesEmpty() == true )
    assert( node.hasAttr( "noprefix"    ) == false )
    assert( node.hasAttr( "noprefix", "") == false )
    node = nil
    xt1 = nil
    xt2 = nil
    xt3 = nil
    xt1a = nil
    xt2a = nil
    triple = nil
    attr = nil
  end

  def test_XMLNode_attribute_set_clear
    triple = LibSBML::XMLTriple.new("test","","")
    attr = LibSBML::XMLAttributes.new()
    node = LibSBML::XMLNode.new(triple,attr)
    nattr = LibSBML::XMLAttributes.new()
    xt1 = LibSBML::XMLTriple.new("name1", "http://name1.org/", "p1")
    xt2 = LibSBML::XMLTriple.new("name2", "http://name2.org/", "p2")
    xt3 = LibSBML::XMLTriple.new("name3", "http://name3.org/", "p3")
    xt4 = LibSBML::XMLTriple.new("name4", "http://name4.org/", "p4")
    xt5 = LibSBML::XMLTriple.new("name5", "http://name5.org/", "p5")
    nattr.add(xt1, "val1")
    nattr.add(xt2, "val2")
    nattr.add(xt3, "val3")
    nattr.add(xt4, "val4")
    nattr.add(xt5, "val5")
    node.setAttributes(nattr)
    assert( node.getAttributesLength() == 5 )
    assert( node.isAttributesEmpty() == false )
    assert( (  "name1" != node.getAttrName(0) ) == false )
    assert( (  "val1"  != node.getAttrValue(0) ) == false )
    assert( (  "http://name1.org/" != node.getAttrURI(0) ) == false )
    assert( (  "p1"    != node.getAttrPrefix(0) ) == false )
    assert( (  "name2" != node.getAttrName(1) ) == false )
    assert( (  "val2"  != node.getAttrValue(1) ) == false )
    assert( (  "http://name2.org/" != node.getAttrURI(1) ) == false )
    assert( (  "p2"    != node.getAttrPrefix(1) ) == false )
    assert( (  "name3" != node.getAttrName(2) ) == false )
    assert( (  "val3"  != node.getAttrValue(2) ) == false )
    assert( (  "http://name3.org/" != node.getAttrURI(2) ) == false )
    assert( (  "p3"    != node.getAttrPrefix(2) ) == false )
    assert( (  "name4" != node.getAttrName(3) ) == false )
    assert( (  "val4"  != node.getAttrValue(3) ) == false )
    assert( (  "http://name4.org/" != node.getAttrURI(3) ) == false )
    assert( (  "p4"    != node.getAttrPrefix(3) ) == false )
    assert( (  "name5" != node.getAttrName(4) ) == false )
    assert( (  "val5"  != node.getAttrValue(4) ) == false )
    assert( (  "http://name5.org/" != node.getAttrURI(4) ) == false )
    assert( (  "p5"    != node.getAttrPrefix(4) ) == false )
    ntriple = LibSBML::XMLTriple.new("test2","http://test2.org/","p2")
    node.setTriple(ntriple)
    assert( (    "test2" != node.getName() ) == false )
    assert( (     "http://test2.org/" != node.getURI() ) == false )
    assert( (  "p2" != node.getPrefix() ) == false )
    node.clearAttributes()
    assert( node.getAttributesLength() == 0 )
    assert( node.isAttributesEmpty() != false )
    triple = nil
    ntriple = nil
    node = nil
    attr = nil
    nattr = nil
    xt1 = nil
    xt2 = nil
    xt3 = nil
    xt4 = nil
    xt5 = nil
  end

  def test_XMLNode_convert
    xmlstr = "<annotation>\n" + "  <test xmlns=\"http://test.org/\" id=\"test\">test</test>\n" + "</annotation>";
    node = LibSBML::XMLNode.convertStringToXMLNode(xmlstr,nil)
    child = node.getChild(0)
    gchild = child.getChild(0)
    attr = child.getAttributes()
    ns = child.getNamespaces()
    assert( (  "annotation" != node.getName() ) == false )
    assert( ( "test"  != child.getName() ) == false )
    assert( ( "test"  != gchild.getCharacters() ) == false )
    assert( (  "id"    != attr.getName(0) ) == false )
    assert( (  "test"  != attr.getValue(0) ) == false )
    assert( (  "http://test.org/"  != ns.getURI(0) ) == false )
    assert( ns.getPrefix(0) == "" )
    toxmlstring = node.toXMLString()
    assert( ( xmlstr != toxmlstring ) == false )
    node = nil
  end

  def test_XMLNode_convert_dummyroot
    xmlstr_nodummy1 = "<notes>\n" + "  <p>test</p>\n" + "</notes>";
    xmlstr_nodummy2 = "<html>\n" + "  <p>test</p>\n" + "</html>";
    xmlstr_nodummy3 = "<body>\n" + "  <p>test</p>\n" + "</body>";
    xmlstr_nodummy4 =  "<p>test</p>";
    xmlstr_nodummy5 = "<test1>\n" + "  <test2>test</test2>\n" + "</test1>";
    xmlstr_dummy1 =  "<p>test1</p><p>test2</p>";
    xmlstr_dummy2 =  "<test1>test1</test1><test2>test2</test2>";
    rootnode = LibSBML::XMLNode.convertStringToXMLNode(xmlstr_nodummy1,nil)
    assert( rootnode.getNumChildren() == 1 )
    child = rootnode.getChild(0)
    gchild = child.getChild(0)
    assert( (  "notes" != rootnode.getName() ) == false )
    assert( ( "p"  != child.getName() ) == false )
    assert( ( "test"  != gchild.getCharacters() ) == false )
    toxmlstring = rootnode.toXMLString()
    assert( ( xmlstr_nodummy1 != toxmlstring ) == false )
    rootnode = nil
    rootnode = LibSBML::XMLNode.convertStringToXMLNode(xmlstr_nodummy2,nil)
    assert( rootnode.getNumChildren() == 1 )
    child = rootnode.getChild(0)
    gchild = child.getChild(0)
    assert( (  "html" != rootnode.getName() ) == false )
    assert( ( "p"  != child.getName() ) == false )
    assert( ( "test"  != gchild.getCharacters() ) == false )
    toxmlstring = rootnode.toXMLString()
    assert( ( xmlstr_nodummy2 != toxmlstring ) == false )
    rootnode = nil
    rootnode = LibSBML::XMLNode.convertStringToXMLNode(xmlstr_nodummy3,nil)
    assert( rootnode.getNumChildren() == 1 )
    child = rootnode.getChild(0)
    gchild = child.getChild(0)
    assert( (  "body" != rootnode.getName() ) == false )
    assert( ( "p"  != child.getName() ) == false )
    assert( ( "test"  != gchild.getCharacters() ) == false )
    toxmlstring = rootnode.toXMLString()
    assert( ( xmlstr_nodummy3 != toxmlstring ) == false )
    rootnode = nil
    rootnode = LibSBML::XMLNode.convertStringToXMLNode(xmlstr_nodummy4,nil)
    assert( rootnode.getNumChildren() == 1 )
    child = rootnode.getChild(0)
    assert( (  "p" != rootnode.getName() ) == false )
    assert( ( "test"  != child.getCharacters() ) == false )
    toxmlstring = rootnode.toXMLString()
    assert( ( xmlstr_nodummy4 != toxmlstring ) == false )
    rootnode = nil
    rootnode = LibSBML::XMLNode.convertStringToXMLNode(xmlstr_nodummy5,nil)
    assert( rootnode.getNumChildren() == 1 )
    child = rootnode.getChild(0)
    gchild = child.getChild(0)
    assert( (  "test1" != rootnode.getName() ) == false )
    assert( ( "test2"  != child.getName() ) == false )
    assert( ( "test"  != gchild.getCharacters() ) == false )
    toxmlstring = rootnode.toXMLString()
    assert( ( xmlstr_nodummy5 != toxmlstring ) == false )
    rootnode = nil
    rootnode = LibSBML::XMLNode.convertStringToXMLNode(xmlstr_dummy1,nil)
    assert( rootnode.isEOF() == true )
    assert( rootnode.getNumChildren() == 2 )
    child = rootnode.getChild(0)
    gchild = child.getChild(0)
    assert( (  "p" != child.getName() ) == false )
    assert( ( "test1"  != gchild.getCharacters() ) == false )
    child = rootnode.getChild(1)
    gchild = child.getChild(0)
    assert( (  "p" != child.getName() ) == false )
    assert( ( "test2"  != gchild.getCharacters() ) == false )
    toxmlstring = rootnode.toXMLString()
    assert( ( xmlstr_dummy1 != toxmlstring ) == false )
    rootnode = nil
    rootnode = LibSBML::XMLNode.convertStringToXMLNode(xmlstr_dummy2,nil)
    assert( rootnode.isEOF() == true )
    assert( rootnode.getNumChildren() == 2 )
    child = rootnode.getChild(0)
    gchild = child.getChild(0)
    assert( (  "test1" != child.getName() ) == false )
    assert( ( "test1"  != gchild.getCharacters() ) == false )
    child = rootnode.getChild(1)
    gchild = child.getChild(0)
    assert( (  "test2" != child.getName() ) == false )
    assert( ( "test2"  != gchild.getCharacters() ) == false )
    toxmlstring = rootnode.toXMLString()
    assert( ( xmlstr_dummy2 != toxmlstring ) == false )
    rootnode = nil
  end

  def test_XMLNode_create
    node = LibSBML::XMLNode.new()
    assert( node != nil )
    assert( node.getNumChildren() == 0 )
    node = nil
    node = LibSBML::XMLNode.new()
    assert( node != nil )
    node2 = LibSBML::XMLNode.new()
    assert( node2 != nil )
    node.addChild(node2)
    assert( node.getNumChildren() == 1 )
    node3 = LibSBML::XMLNode.new()
    assert( node3 != nil )
    node.addChild(node3)
    assert( node.getNumChildren() == 2 )
    node = nil
    node2 = nil
    node3 = nil
  end

  def test_XMLNode_createElement
    name =  "test";
    uri =  "http://test.org/";
    prefix =  "p";
    text =  "text node";
    triple = LibSBML::XMLTriple.new(name,uri,prefix)
    ns = LibSBML::XMLNamespaces.new()
    attr = LibSBML::XMLAttributes.new()
    ns.add(uri,prefix)
    attr.add("id", "value",uri,prefix)
    snode = LibSBML::XMLNode.new(triple,attr,ns)
    assert( snode != nil )
    assert( snode.getNumChildren() == 0 )
    assert( ( name != snode.getName() ) == false )
    assert( ( prefix != snode.getPrefix() ) == false )
    assert( ( uri != snode.getURI() ) == false )
    assert( snode.isElement() == true )
    assert( snode.isStart() == true )
    assert( snode.isEnd() == false )
    assert( snode.isText() == false )
    snode.setEnd()
    assert( snode.isEnd() == true )
    snode.unsetEnd()
    assert( snode.isEnd() == false )
    cattr = snode.getAttributes()
    assert( cattr != nil )
    assert( (  "id"    != cattr.getName(0) ) == false )
    assert( (  "value" != cattr.getValue(0) ) == false )
    assert( ( prefix != cattr.getPrefix(0) ) == false )
    assert( ( uri != cattr.getURI(0) ) == false )
    triple = nil
    attr = nil
    ns = nil
    snode = nil
    attr = LibSBML::XMLAttributes.new()
    attr.add("id", "value")
    triple = LibSBML::XMLTriple.new(name, "", "")
    snode = LibSBML::XMLNode.new(triple,attr)
    assert( snode != nil )
    assert( snode.getNumChildren() == 0 )
    assert( (  "test" != snode.getName() ) == false )
    assert( snode.getPrefix() == "" )
    assert( snode.getURI() == "" )
    assert( snode.isElement() == true )
    assert( snode.isStart() == true )
    assert( snode.isEnd() == false )
    assert( snode.isText() == false )
    cattr = snode.getAttributes()
    assert( cattr != nil )
    assert( (  "id"    != cattr.getName(0) ) == false )
    assert( (  "value" != cattr.getValue(0) ) == false )
    assert( cattr.getPrefix(0) == "" )
    assert( cattr.getURI(0) == "" )
    enode = LibSBML::XMLNode.new(triple)
    assert( enode != nil )
    assert( enode.getNumChildren() == 0 )
    assert( (  "test" != enode.getName() ) == false )
    assert( enode.getPrefix() == "" )
    assert( enode.getURI() == "" )
    assert( enode.isElement() == true )
    assert( enode.isStart() == false )
    assert( enode.isEnd() == true )
    assert( enode.isText() == false )
    tnode = LibSBML::XMLNode.new(text)
    assert( tnode != nil )
    assert( ( text != tnode.getCharacters() ) == false )
    assert( tnode.getNumChildren() == 0 )
    assert( tnode.getName() == "" )
    assert( tnode.getPrefix() == "" )
    assert( tnode.getURI() == "" )
    assert( tnode.isElement() == false )
    assert( tnode.isStart() == false )
    assert( tnode.isEnd() == false )
    assert( tnode.isText() == true )
    triple = nil
    attr = nil
    snode = nil
    enode = nil
    tnode = nil
  end

  def test_XMLNode_createFromToken
    triple = LibSBML::XMLTriple.new("attr", "uri", "prefix")
    token = LibSBML::XMLToken.new(triple)
    node = LibSBML::XMLNode.new(token)
    assert( node != nil )
    assert( node.getNumChildren() == 0 )
    assert( (  "attr" != node.getName() ) == false )
    assert( (  "prefix" != node.getPrefix() ) == false )
    assert( (  "uri" != node.getURI() ) == false )
    assert( node.getChild(1) != nil )
    token = nil
    triple = nil
    node = nil
  end

  def test_XMLNode_getters
    ns = LibSBML::XMLNamespaces.new()
    ns.add( "http://test1.org/", "test1")
    token = LibSBML::XMLToken.new("This is a test")
    node = LibSBML::XMLNode.new(token)
    assert( node != nil )
    assert( node.getNumChildren() == 0 )
    assert( (  "This is a test" != node.getCharacters() ) == false )
    assert( node.getChild(1) != nil )
    attr = LibSBML::XMLAttributes.new()
    assert( attr != nil )
    attr.add( "attr2", "value")
    triple = LibSBML::XMLTriple.new("attr", "uri", "prefix")
    token = LibSBML::XMLToken.new(triple,attr)
    assert( token != nil )
    node = LibSBML::XMLNode.new(token)
    assert( (  "attr" != node.getName() ) == false )
    assert( (  "uri" != node.getURI() ) == false )
    assert( (  "prefix" != node.getPrefix() ) == false )
    returnattr = node.getAttributes()
    assert( (  "attr2" != returnattr.getName(0) ) == false )
    assert( (  "value" != returnattr.getValue(0) ) == false )
    token = LibSBML::XMLToken.new(triple,attr,ns)
    node = LibSBML::XMLNode.new(token)
    returnNS = node.getNamespaces()
    assert( returnNS.getLength() == 1 )
    assert( returnNS.isEmpty() == false )
    triple = nil
    token = nil
    node = nil
  end

  def test_XMLNode_insert
    attr = LibSBML::XMLAttributes.new()
    trp_p = LibSBML::XMLTriple.new("parent","","")
    trp_c1 = LibSBML::XMLTriple.new("child1","","")
    trp_c2 = LibSBML::XMLTriple.new("child2","","")
    trp_c3 = LibSBML::XMLTriple.new("child3","","")
    trp_c4 = LibSBML::XMLTriple.new("child4","","")
    trp_c5 = LibSBML::XMLTriple.new("child5","","")
    p = LibSBML::XMLNode.new(trp_p,attr)
    c1 = LibSBML::XMLNode.new(trp_c1,attr)
    c2 = LibSBML::XMLNode.new(trp_c2,attr)
    c3 = LibSBML::XMLNode.new(trp_c3,attr)
    c4 = LibSBML::XMLNode.new(trp_c4,attr)
    c5 = LibSBML::XMLNode.new(trp_c5,attr)
    p.addChild(c2)
    p.addChild(c4)
    p.insertChild(0,c1)
    p.insertChild(2,c3)
    p.insertChild(4,c5)
    assert( p.getNumChildren() == 5 )
    assert( (  "child1" != p.getChild(0).getName() ) == false )
    assert( (  "child2" != p.getChild(1).getName() ) == false )
    assert( (  "child3" != p.getChild(2).getName() ) == false )
    assert( (  "child4" != p.getChild(3).getName() ) == false )
    assert( (  "child5" != p.getChild(4).getName() ) == false )
    p.removeChildren()
    p.insertChild(0,c1)
    p.insertChild(0,c2)
    p.insertChild(0,c3)
    p.insertChild(0,c4)
    p.insertChild(0,c5)
    assert( p.getNumChildren() == 5 )
    assert( (  "child5" != p.getChild(0).getName() ) == false )
    assert( (  "child4" != p.getChild(1).getName() ) == false )
    assert( (  "child3" != p.getChild(2).getName() ) == false )
    assert( (  "child2" != p.getChild(3).getName() ) == false )
    assert( (  "child1" != p.getChild(4).getName() ) == false )
    p.removeChildren()
    p.insertChild(1,c1)
    p.insertChild(2,c2)
    p.insertChild(3,c3)
    p.insertChild(4,c4)
    p.insertChild(5,c5)
    assert( p.getNumChildren() == 5 )
    assert( (  "child1" != p.getChild(0).getName() ) == false )
    assert( (  "child2" != p.getChild(1).getName() ) == false )
    assert( (  "child3" != p.getChild(2).getName() ) == false )
    assert( (  "child4" != p.getChild(3).getName() ) == false )
    assert( (  "child5" != p.getChild(4).getName() ) == false )
    p.removeChildren()
    tmp = p.insertChild(0,c1)
    assert( ( "child1" != tmp.getName() ) == false )
    tmp = p.insertChild(0,c2)
    assert( ( "child2" != tmp.getName() ) == false )
    tmp = p.insertChild(0,c3)
    assert( ( "child3" != tmp.getName() ) == false )
    tmp = p.insertChild(0,c4)
    assert( ( "child4" != tmp.getName() ) == false )
    tmp = p.insertChild(0,c5)
    assert( ( "child5" != tmp.getName() ) == false )
    p.removeChildren()
    tmp = p.insertChild(1,c1)
    assert( ( "child1" != tmp.getName() ) == false )
    tmp = p.insertChild(2,c2)
    assert( ( "child2" != tmp.getName() ) == false )
    tmp = p.insertChild(3,c3)
    assert( ( "child3" != tmp.getName() ) == false )
    tmp = p.insertChild(4,c4)
    assert( ( "child4" != tmp.getName() ) == false )
    tmp = p.insertChild(5,c5)
    assert( ( "child5" != tmp.getName() ) == false )
    p = nil
    c1 = nil
    c2 = nil
    c3 = nil
    c4 = nil
    c5 = nil
    attr = nil
    trp_p = nil
    trp_c1 = nil
    trp_c2 = nil
    trp_c3 = nil
    trp_c4 = nil
    trp_c5 = nil
  end

  def test_XMLNode_namespace_add
    triple = LibSBML::XMLTriple.new("test","","")
    attr = LibSBML::XMLAttributes.new()
    node = LibSBML::XMLNode.new(triple,attr)
    assert( node.getNamespacesLength() == 0 )
    assert( node.isNamespacesEmpty() == true )
    node.addNamespace( "http://test1.org/", "test1")
    assert( node.getNamespacesLength() == 1 )
    assert( node.isNamespacesEmpty() == false )
    node.addNamespace( "http://test2.org/", "test2")
    assert( node.getNamespacesLength() == 2 )
    assert( node.isNamespacesEmpty() == false )
    node.addNamespace( "http://test1.org/", "test1a")
    assert( node.getNamespacesLength() == 3 )
    assert( node.isNamespacesEmpty() == false )
    node.addNamespace( "http://test1.org/", "test1a")
    assert( node.getNamespacesLength() == 3 )
    assert( node.isNamespacesEmpty() == false )
    assert( !( node.getNamespaceIndex( "http://test1.org/") == -1) )
    node = nil
    triple = nil
    attr = nil
  end

  def test_XMLNode_namespace_get
    triple = LibSBML::XMLTriple.new("test","","")
    attr = LibSBML::XMLAttributes.new()
    node = LibSBML::XMLNode.new(triple,attr)
    node.addNamespace( "http://test1.org/", "test1")
    node.addNamespace( "http://test2.org/", "test2")
    node.addNamespace( "http://test3.org/", "test3")
    node.addNamespace( "http://test4.org/", "test4")
    node.addNamespace( "http://test5.org/", "test5")
    node.addNamespace( "http://test6.org/", "test6")
    node.addNamespace( "http://test7.org/", "test7")
    node.addNamespace( "http://test8.org/", "test8")
    node.addNamespace( "http://test9.org/", "test9")
    assert( node.getNamespacesLength() == 9 )
    assert( node.getNamespaceIndex( "http://test1.org/") == 0 )
    assert( (  "test2" != node.getNamespacePrefix(1) ) == false )
    assert( ( 		      "test1" != node.getNamespacePrefix( "http://test1.org/") ) == false )
    assert( (  "http://test2.org/" != node.getNamespaceURI(1) ) == false )
    assert( ( 		      "http://test2.org/" != node.getNamespaceURI( "test2") ) == false )
    assert( node.getNamespaceIndex( "http://test1.org/") == 0 )
    assert( node.getNamespaceIndex( "http://test2.org/") == 1 )
    assert( node.getNamespaceIndex( "http://test5.org/") == 4 )
    assert( node.getNamespaceIndex( "http://test9.org/") == 8 )
    assert( node.getNamespaceIndex( "http://testX.org/") == -1 )
    assert( node.hasNamespaceURI( "http://test1.org/") != false )
    assert( node.hasNamespaceURI( "http://test2.org/") != false )
    assert( node.hasNamespaceURI( "http://test5.org/") != false )
    assert( node.hasNamespaceURI( "http://test9.org/") != false )
    assert( node.hasNamespaceURI( "http://testX.org/") == false )
    assert( node.getNamespaceIndexByPrefix( "test1") == 0 )
    assert( node.getNamespaceIndexByPrefix( "test5") == 4 )
    assert( node.getNamespaceIndexByPrefix( "test9") == 8 )
    assert( node.getNamespaceIndexByPrefix( "testX") == -1 )
    assert( node.hasNamespacePrefix( "test1") != false )
    assert( node.hasNamespacePrefix( "test5") != false )
    assert( node.hasNamespacePrefix( "test9") != false )
    assert( node.hasNamespacePrefix( "testX") == false )
    assert( node.hasNamespaceNS( "http://test1.org/", "test1") != false )
    assert( node.hasNamespaceNS( "http://test5.org/", "test5") != false )
    assert( node.hasNamespaceNS( "http://test9.org/", "test9") != false )
    assert( node.hasNamespaceNS( "http://testX.org/", "testX") == false )
    node = nil
    triple = nil
    attr = nil
  end

  def test_XMLNode_namespace_remove
    triple = LibSBML::XMLTriple.new("test","","")
    attr = LibSBML::XMLAttributes.new()
    node = LibSBML::XMLNode.new(triple,attr)
    node.addNamespace( "http://test1.org/", "test1")
    node.addNamespace( "http://test2.org/", "test2")
    node.addNamespace( "http://test3.org/", "test3")
    node.addNamespace( "http://test4.org/", "test4")
    node.addNamespace( "http://test5.org/", "test5")
    assert( node.getNamespacesLength() == 5 )
    node.removeNamespace(4)
    assert( node.getNamespacesLength() == 4 )
    node.removeNamespace(3)
    assert( node.getNamespacesLength() == 3 )
    node.removeNamespace(2)
    assert( node.getNamespacesLength() == 2 )
    node.removeNamespace(1)
    assert( node.getNamespacesLength() == 1 )
    node.removeNamespace(0)
    assert( node.getNamespacesLength() == 0 )
    node.addNamespace( "http://test1.org/", "test1")
    node.addNamespace( "http://test2.org/", "test2")
    node.addNamespace( "http://test3.org/", "test3")
    node.addNamespace( "http://test4.org/", "test4")
    node.addNamespace( "http://test5.org/", "test5")
    assert( node.getNamespacesLength() == 5 )
    node.removeNamespace(0)
    assert( node.getNamespacesLength() == 4 )
    node.removeNamespace(0)
    assert( node.getNamespacesLength() == 3 )
    node.removeNamespace(0)
    assert( node.getNamespacesLength() == 2 )
    node.removeNamespace(0)
    assert( node.getNamespacesLength() == 1 )
    node.removeNamespace(0)
    assert( node.getNamespacesLength() == 0 )
    node = nil
    triple = nil
    attr = nil
  end

  def test_XMLNode_namespace_remove_by_prefix
    triple = LibSBML::XMLTriple.new("test","","")
    attr = LibSBML::XMLAttributes.new()
    node = LibSBML::XMLNode.new(triple,attr)
    node.addNamespace( "http://test1.org/", "test1")
    node.addNamespace( "http://test2.org/", "test2")
    node.addNamespace( "http://test3.org/", "test3")
    node.addNamespace( "http://test4.org/", "test4")
    node.addNamespace( "http://test5.org/", "test5")
    assert( node.getNamespacesLength() == 5 )
    node.removeNamespace( "test1")
    assert( node.getNamespacesLength() == 4 )
    node.removeNamespace( "test2")
    assert( node.getNamespacesLength() == 3 )
    node.removeNamespace( "test3")
    assert( node.getNamespacesLength() == 2 )
    node.removeNamespace( "test4")
    assert( node.getNamespacesLength() == 1 )
    node.removeNamespace( "test5")
    assert( node.getNamespacesLength() == 0 )
    node.addNamespace( "http://test1.org/", "test1")
    node.addNamespace( "http://test2.org/", "test2")
    node.addNamespace( "http://test3.org/", "test3")
    node.addNamespace( "http://test4.org/", "test4")
    node.addNamespace( "http://test5.org/", "test5")
    assert( node.getNamespacesLength() == 5 )
    node.removeNamespace( "test5")
    assert( node.getNamespacesLength() == 4 )
    node.removeNamespace( "test4")
    assert( node.getNamespacesLength() == 3 )
    node.removeNamespace( "test3")
    assert( node.getNamespacesLength() == 2 )
    node.removeNamespace( "test2")
    assert( node.getNamespacesLength() == 1 )
    node.removeNamespace( "test1")
    assert( node.getNamespacesLength() == 0 )
    node.addNamespace( "http://test1.org/", "test1")
    node.addNamespace( "http://test2.org/", "test2")
    node.addNamespace( "http://test3.org/", "test3")
    node.addNamespace( "http://test4.org/", "test4")
    node.addNamespace( "http://test5.org/", "test5")
    assert( node.getNamespacesLength() == 5 )
    node.removeNamespace( "test3")
    assert( node.getNamespacesLength() == 4 )
    node.removeNamespace( "test1")
    assert( node.getNamespacesLength() == 3 )
    node.removeNamespace( "test4")
    assert( node.getNamespacesLength() == 2 )
    node.removeNamespace( "test5")
    assert( node.getNamespacesLength() == 1 )
    node.removeNamespace( "test2")
    assert( node.getNamespacesLength() == 0 )
    node = nil
    triple = nil
    attr = nil
  end

  def test_XMLNode_namespace_set_clear
    triple = LibSBML::XMLTriple.new("test","","")
    attr = LibSBML::XMLAttributes.new()
    node = LibSBML::XMLNode.new(triple,attr)
    ns = LibSBML::XMLNamespaces.new()
    assert( node.getNamespacesLength() == 0 )
    assert( node.isNamespacesEmpty() == true )
    ns.add( "http://test1.org/", "test1")
    ns.add( "http://test2.org/", "test2")
    ns.add( "http://test3.org/", "test3")
    ns.add( "http://test4.org/", "test4")
    ns.add( "http://test5.org/", "test5")
    node.setNamespaces(ns)
    assert( node.getNamespacesLength() == 5 )
    assert( node.isNamespacesEmpty() == false )
    assert( (  "test1" != node.getNamespacePrefix(0) ) == false )
    assert( (  "test2" != node.getNamespacePrefix(1) ) == false )
    assert( (  "test3" != node.getNamespacePrefix(2) ) == false )
    assert( (  "test4" != node.getNamespacePrefix(3) ) == false )
    assert( (  "test5" != node.getNamespacePrefix(4) ) == false )
    assert( (  "http://test1.org/" != node.getNamespaceURI(0) ) == false )
    assert( (  "http://test2.org/" != node.getNamespaceURI(1) ) == false )
    assert( (  "http://test3.org/" != node.getNamespaceURI(2) ) == false )
    assert( (  "http://test4.org/" != node.getNamespaceURI(3) ) == false )
    assert( (  "http://test5.org/" != node.getNamespaceURI(4) ) == false )
    node.clearNamespaces()
    assert( node.getNamespacesLength() == 0 )
    assert( node.isAttributesEmpty() != false )
    ns = nil
    node = nil
    triple = nil
    attr = nil
  end

  def test_XMLNode_remove
    attr = LibSBML::XMLAttributes.new()
    trp_p = LibSBML::XMLTriple.new("parent","","")
    trp_c1 = LibSBML::XMLTriple.new("child1","","")
    trp_c2 = LibSBML::XMLTriple.new("child2","","")
    trp_c3 = LibSBML::XMLTriple.new("child3","","")
    trp_c4 = LibSBML::XMLTriple.new("child4","","")
    trp_c5 = LibSBML::XMLTriple.new("child5","","")
    p = LibSBML::XMLNode.new(trp_p,attr)
    c1 = LibSBML::XMLNode.new(trp_c1,attr)
    c2 = LibSBML::XMLNode.new(trp_c2,attr)
    c3 = LibSBML::XMLNode.new(trp_c3,attr)
    c4 = LibSBML::XMLNode.new(trp_c4,attr)
    c5 = LibSBML::XMLNode.new(trp_c5,attr)
    p.addChild(c1)
    p.addChild(c2)
    p.addChild(c3)
    p.addChild(c4)
    p.addChild(c5)
    r = p.removeChild(5)
    assert( r == nil )
    r = p.removeChild(1)
    assert( p.getNumChildren() == 4 )
    assert( ( "child2" != r.getName() ) == false )
    r = nil
    r = p.removeChild(3)
    assert( p.getNumChildren() == 3 )
    assert( ( "child5" != r.getName() ) == false )
    r = nil
    r = p.removeChild(0)
    assert( p.getNumChildren() == 2 )
    assert( ( "child1" != r.getName() ) == false )
    r = nil
    r = p.removeChild(1)
    assert( p.getNumChildren() == 1 )
    assert( ( "child4" != r.getName() ) == false )
    r = nil
    r = p.removeChild(0)
    assert( p.getNumChildren() == 0 )
    assert( ( "child3" != r.getName() ) == false )
    r = nil
    p.addChild(c1)
    p.addChild(c2)
    p.addChild(c3)
    p.addChild(c4)
    p.addChild(c5)
    r = p.removeChild(4)
    assert( p.getNumChildren() == 4 )
    assert( ( "child5" != r.getName() ) == false )
    r = nil
    r = p.removeChild(3)
    assert( p.getNumChildren() == 3 )
    assert( ( "child4" != r.getName() ) == false )
    r = nil
    r = p.removeChild(2)
    assert( p.getNumChildren() == 2 )
    assert( ( "child3" != r.getName() ) == false )
    r = nil
    r = p.removeChild(1)
    assert( p.getNumChildren() == 1 )
    assert( ( "child2" != r.getName() ) == false )
    r = nil
    r = p.removeChild(0)
    assert( p.getNumChildren() == 0 )
    assert( ( "child1" != r.getName() ) == false )
    r = nil
    p.addChild(c1)
    p.addChild(c2)
    p.addChild(c3)
    p.addChild(c4)
    p.addChild(c5)
    r = p.removeChild(0)
    assert( p.getNumChildren() == 4 )
    assert( ( "child1" != r.getName() ) == false )
    r = nil
    r = p.removeChild(0)
    assert( p.getNumChildren() == 3 )
    assert( ( "child2" != r.getName() ) == false )
    r = nil
    r = p.removeChild(0)
    assert( p.getNumChildren() == 2 )
    assert( ( "child3" != r.getName() ) == false )
    r = nil
    r = p.removeChild(0)
    assert( p.getNumChildren() == 1 )
    assert( ( "child4" != r.getName() ) == false )
    r = nil
    r = p.removeChild(0)
    assert( p.getNumChildren() == 0 )
    assert( ( "child5" != r.getName() ) == false )
    r = nil
    p.addChild(c1)
    p.addChild(c2)
    p.addChild(c3)
    p.addChild(c4)
    p.addChild(c5)
    r = p.removeChild(0)
    assert( ( "child1" != r.getName() ) == false )
    p.insertChild(0,r)
    assert( p.getNumChildren() == 5 )
    assert( ( "child1" != p.getChild(0).getName() ) == false )
    r = nil
    r = p.removeChild(1)
    assert( ( "child2" != r.getName() ) == false )
    p.insertChild(1,r)
    assert( p.getNumChildren() == 5 )
    assert( ( "child2" != p.getChild(1).getName() ) == false )
    r = nil
    r = p.removeChild(2)
    assert( ( "child3" != r.getName() ) == false )
    p.insertChild(2,r)
    assert( p.getNumChildren() == 5 )
    assert( ( "child3" != p.getChild(2).getName() ) == false )
    r = nil
    r = p.removeChild(3)
    assert( ( "child4" != r.getName() ) == false )
    p.insertChild(3,r)
    assert( p.getNumChildren() == 5 )
    assert( ( "child4" != p.getChild(3).getName() ) == false )
    r = nil
    r = p.removeChild(4)
    assert( ( "child5" != r.getName() ) == false )
    p.insertChild(4,r)
    assert( p.getNumChildren() == 5 )
    assert( ( "child5" != p.getChild(4).getName() ) == false )
    r = nil
    p = nil
    c1 = nil
    c2 = nil
    c3 = nil
    c4 = nil
    c5 = nil
    attr = nil
    trp_p = nil
    trp_c1 = nil
    trp_c2 = nil
    trp_c3 = nil
    trp_c4 = nil
    trp_c5 = nil
  end

end
