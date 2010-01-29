/// 
///  @file    TestXMLToken.cs
///  @brief   XMLToken unit tests
///  @author  Frank Bergmann (Csharp conversion)
///  @author  Akiya Jouraku (Csharp conversion)
///  @author  Michael Hucka <mhucka@caltech.edu> 
/// 
///  $Id$
///  $HeadURL$
/// 
///  This test file was converted from src/sbml/test/TestXMLToken.c
///  with the help of conversion sciprt (ctest_converter.pl).
/// 
/// <!---------------------------------------------------------------------------
///  This file is part of libSBML.  Please visit http://sbml.org for more
///  information about SBML, and the latest version of libSBML.
/// 
///  Copyright 2005-2010 California Institute of Technology.
///  Copyright 2002-2005 California Institute of Technology and
///                      Japan Science and Technology Corporation.
///  
///  This library is free software; you can redistribute it and/or modify it
///  under the terms of the GNU Lesser General Public License as published by
///  the Free Software Foundation.  A copy of the license agreement is provided
///  in the file named "LICENSE.txt" included with this software distribution
///  and also available online as http://sbml.org/software/libsbml/license.html
/// --------------------------------------------------------------------------->*/


namespace LibSBMLCSTest {

  using libsbml;

  using  System.IO;

  public class TestXMLToken {
    public class AssertionError : System.Exception 
    {
      public AssertionError() : base()
      {
        
      }
    }


    static void assertTrue(bool condition)
    {
      if (condition == true)
      {
        return;
      }
      throw new AssertionError();
    }

    static void assertEquals(object a, object b)
    {
      if ( (a == null) && (b == null) )
      {
        return;
      }
      else if (a.Equals(b))
      {
        return;
      }
  
      throw new AssertionError();
    }

    static void assertNotEquals(object a, object b)
    {
      if ( (a == null) && (b == null) )
      {
        throw new AssertionError();
      }
      else if (a.Equals(b))
      {
        throw new AssertionError();
      }
    }

    static void assertEquals(bool a, bool b)
    {
      if ( a == b )
      {
        return;
      }
      throw new AssertionError();
    }

    static void assertNotEquals(bool a, bool b)
    {
      if ( a != b )
      {
        return;
      }
      throw new AssertionError();
    }

    static void assertEquals(int a, int b)
    {
      if ( a == b )
      {
        return;
      }
      throw new AssertionError();
    }

    static void assertNotEquals(int a, int b)
    {
      if ( a != b )
      {
        return;
      }
      throw new AssertionError();
    }


    public void test_XMLToken_attribute_add_remove()
    {
      XMLTriple triple = new  XMLTriple("test","","");
      XMLAttributes attr = new  XMLAttributes();
      XMLToken token = new  XMLToken(triple,attr);
      XMLTriple xt1 = new  XMLTriple("name1", "http://name1.org/", "p1");
      XMLTriple xt2 = new  XMLTriple("name2", "http://name2.org/", "p2");
      XMLTriple xt3 = new  XMLTriple("name3", "http://name3.org/", "p3");
      XMLTriple xt1a = new  XMLTriple("name1", "http://name1a.org/", "p1a");
      XMLTriple xt2a = new  XMLTriple("name2", "http://name2a.org/", "p2a");
      token.addAttr( "name1", "val1", "http://name1.org/", "p1");
      token.addAttr(xt2, "val2");
      assertTrue( token.getAttributesLength() == 2 );
      assertTrue( token.isAttributesEmpty() == false );
      assertTrue( (  "name1" != token.getAttrName(0) ) == false );
      assertTrue( (  "val1"  != token.getAttrValue(0) ) == false );
      assertTrue( (  "http://name1.org/" != token.getAttrURI(0) ) == false );
      assertTrue( (  "p1"    != token.getAttrPrefix(0) ) == false );
      assertTrue( (  "name2" != token.getAttrName(1) ) == false );
      assertTrue( (  "val2"  != token.getAttrValue(1) ) == false );
      assertTrue( (  "http://name2.org/" != token.getAttrURI(1) ) == false );
      assertTrue( (  "p2"    != token.getAttrPrefix(1) ) == false );
      assertTrue( token.getAttrValue( "name1") == "" );
      assertTrue( token.getAttrValue( "name2") == "" );
      assertTrue( (  "val1"  != token.getAttrValue( "name1", "http://name1.org/") ) == false );
      assertTrue( (  "val2"  != token.getAttrValue( "name2", "http://name2.org/") ) == false );
      assertTrue( (  "val1"  != token.getAttrValue(xt1) ) == false );
      assertTrue( (  "val2"  != token.getAttrValue(xt2) ) == false );
      assertTrue( token.hasAttr(-1) == false );
      assertTrue( token.hasAttr(2) == false );
      assertTrue( token.hasAttr(0) == true );
      assertTrue( token.hasAttr( "name1", "http://name1.org/") == true );
      assertTrue( token.hasAttr( "name2", "http://name2.org/") == true );
      assertTrue( token.hasAttr( "name3", "http://name3.org/") == false );
      assertTrue( token.hasAttr(xt1) == true );
      assertTrue( token.hasAttr(xt2) == true );
      assertTrue( token.hasAttr(xt3) == false );
      token.addAttr( "noprefix", "val3");
      assertTrue( token.getAttributesLength() == 3 );
      assertTrue( token.isAttributesEmpty() == false );
      assertTrue( (  "noprefix" != token.getAttrName(2) ) == false );
      assertTrue( (  "val3"     != token.getAttrValue(2) ) == false );
      assertTrue( token.getAttrURI(2) == "" );
      assertTrue( token.getAttrPrefix(2) == "" );
      assertTrue( (      "val3"  != token.getAttrValue( "noprefix") ) == false );
      assertTrue( (  "val3"  != token.getAttrValue( "noprefix", "") ) == false );
      assertTrue( token.hasAttr( "noprefix"    ) == true );
      assertTrue( token.hasAttr( "noprefix", "") == true );
      token.addAttr(xt1, "mval1");
      token.addAttr( "name2", "mval2", "http://name2.org/", "p2");
      assertTrue( token.getAttributesLength() == 3 );
      assertTrue( token.isAttributesEmpty() == false );
      assertTrue( (  "name1" != token.getAttrName(0) ) == false );
      assertTrue( (  "mval1" != token.getAttrValue(0) ) == false );
      assertTrue( (  "http://name1.org/" != token.getAttrURI(0) ) == false );
      assertTrue( (  "p1"    != token.getAttrPrefix(0) ) == false );
      assertTrue( (  "name2"    != token.getAttrName(1) ) == false );
      assertTrue( (  "mval2"    != token.getAttrValue(1) ) == false );
      assertTrue( (  "http://name2.org/" != token.getAttrURI(1) ) == false );
      assertTrue( (  "p2"       != token.getAttrPrefix(1) ) == false );
      assertTrue( token.hasAttr(xt1) == true );
      assertTrue( token.hasAttr( "name1", "http://name1.org/") == true );
      token.addAttr( "noprefix", "mval3");
      assertTrue( token.getAttributesLength() == 3 );
      assertTrue( token.isAttributesEmpty() == false );
      assertTrue( (  "noprefix" != token.getAttrName(2) ) == false );
      assertTrue( (  "mval3"    != token.getAttrValue(2) ) == false );
      assertTrue( token.getAttrURI(2) == "" );
      assertTrue( token.getAttrPrefix(2) == "" );
      assertTrue( token.hasAttr( "noprefix") == true );
      assertTrue( token.hasAttr( "noprefix", "") == true );
      token.addAttr(xt1a, "val1a");
      token.addAttr(xt2a, "val2a");
      assertTrue( token.getAttributesLength() == 5 );
      assertTrue( (  "name1" != token.getAttrName(3) ) == false );
      assertTrue( (  "val1a" != token.getAttrValue(3) ) == false );
      assertTrue( (  "http://name1a.org/" != token.getAttrURI(3) ) == false );
      assertTrue( (  "p1a" != token.getAttrPrefix(3) ) == false );
      assertTrue( (  "name2" != token.getAttrName(4) ) == false );
      assertTrue( (  "val2a" != token.getAttrValue(4) ) == false );
      assertTrue( (  "http://name2a.org/" != token.getAttrURI(4) ) == false );
      assertTrue( (  "p2a" != token.getAttrPrefix(4) ) == false );
      assertTrue( (  "val1a"  != token.getAttrValue( "name1", "http://name1a.org/") ) == false );
      assertTrue( (  "val2a"  != token.getAttrValue( "name2", "http://name2a.org/") ) == false );
      assertTrue( (  "val1a"  != token.getAttrValue(xt1a) ) == false );
      assertTrue( (  "val2a"  != token.getAttrValue(xt2a) ) == false );
      token.removeAttr(xt1a);
      token.removeAttr(xt2a);
      assertTrue( token.getAttributesLength() == 3 );
      token.removeAttr( "name1", "http://name1.org/");
      assertTrue( token.getAttributesLength() == 2 );
      assertTrue( token.isAttributesEmpty() == false );
      assertTrue( (  "name2" != token.getAttrName(0) ) == false );
      assertTrue( (  "mval2" != token.getAttrValue(0) ) == false );
      assertTrue( (  "http://name2.org/" != token.getAttrURI(0) ) == false );
      assertTrue( (  "p2" != token.getAttrPrefix(0) ) == false );
      assertTrue( (  "noprefix" != token.getAttrName(1) ) == false );
      assertTrue( (  "mval3" != token.getAttrValue(1) ) == false );
      assertTrue( token.getAttrURI(1) == "" );
      assertTrue( token.getAttrPrefix(1) == "" );
      assertTrue( token.hasAttr( "name1", "http://name1.org/") == false );
      token.removeAttr(xt2);
      assertTrue( token.getAttributesLength() == 1 );
      assertTrue( token.isAttributesEmpty() == false );
      assertTrue( (  "noprefix" != token.getAttrName(0) ) == false );
      assertTrue( (  "mval3" != token.getAttrValue(0) ) == false );
      assertTrue( token.getAttrURI(0) == "" );
      assertTrue( token.getAttrPrefix(0) == "" );
      assertTrue( token.hasAttr(xt2) == false );
      assertTrue( token.hasAttr( "name2", "http://name2.org/") == false );
      token.removeAttr( "noprefix");
      assertTrue( token.getAttributesLength() == 0 );
      assertTrue( token.isAttributesEmpty() == true );
      assertTrue( token.hasAttr( "noprefix"    ) == false );
      assertTrue( token.hasAttr( "noprefix", "") == false );
      token = null;
      xt1 = null;
      xt2 = null;
      xt3 = null;
      xt1a = null;
      xt2a = null;
      triple = null;
      attr = null;
    }

    public void test_XMLToken_attribute_set_clear()
    {
      XMLTriple triple = new  XMLTriple("test","","");
      XMLAttributes attr = new  XMLAttributes();
      XMLToken token = new  XMLToken(triple,attr);
      XMLAttributes nattr = new  XMLAttributes();
      XMLTriple xt1 = new  XMLTriple("name1", "http://name1.org/", "p1");
      XMLTriple xt2 = new  XMLTriple("name2", "http://name2.org/", "p2");
      XMLTriple xt3 = new  XMLTriple("name3", "http://name3.org/", "p3");
      XMLTriple xt4 = new  XMLTriple("name4", "http://name4.org/", "p4");
      XMLTriple xt5 = new  XMLTriple("name5", "http://name5.org/", "p5");
      nattr.add(xt1, "val1");
      nattr.add(xt2, "val2");
      nattr.add(xt3, "val3");
      nattr.add(xt4, "val4");
      nattr.add(xt5, "val5");
      token.setAttributes(nattr);
      assertTrue( token.getAttributesLength() == 5 );
      assertTrue( token.isAttributesEmpty() == false );
      assertTrue( (  "name1" != token.getAttrName(0) ) == false );
      assertTrue( (  "val1"  != token.getAttrValue(0) ) == false );
      assertTrue( (  "http://name1.org/" != token.getAttrURI(0) ) == false );
      assertTrue( (  "p1"    != token.getAttrPrefix(0) ) == false );
      assertTrue( (  "name2" != token.getAttrName(1) ) == false );
      assertTrue( (  "val2"  != token.getAttrValue(1) ) == false );
      assertTrue( (  "http://name2.org/" != token.getAttrURI(1) ) == false );
      assertTrue( (  "p2"    != token.getAttrPrefix(1) ) == false );
      assertTrue( (  "name3" != token.getAttrName(2) ) == false );
      assertTrue( (  "val3"  != token.getAttrValue(2) ) == false );
      assertTrue( (  "http://name3.org/" != token.getAttrURI(2) ) == false );
      assertTrue( (  "p3"    != token.getAttrPrefix(2) ) == false );
      assertTrue( (  "name4" != token.getAttrName(3) ) == false );
      assertTrue( (  "val4"  != token.getAttrValue(3) ) == false );
      assertTrue( (  "http://name4.org/" != token.getAttrURI(3) ) == false );
      assertTrue( (  "p4"    != token.getAttrPrefix(3) ) == false );
      assertTrue( (  "name5" != token.getAttrName(4) ) == false );
      assertTrue( (  "val5"  != token.getAttrValue(4) ) == false );
      assertTrue( (  "http://name5.org/" != token.getAttrURI(4) ) == false );
      assertTrue( (  "p5"    != token.getAttrPrefix(4) ) == false );
      XMLTriple ntriple = new  XMLTriple("test2","http://test2.org/","p2");
      token.setTriple(ntriple);
      assertTrue( (    "test2" != token.getName() ) == false );
      assertTrue( (     "http://test2.org/" != token.getURI() ) == false );
      assertTrue( (  "p2" != token.getPrefix() ) == false );
      token.clearAttributes();
      assertTrue( token.getAttributesLength() == 0 );
      assertTrue( token.isAttributesEmpty() != false );
      nattr = null;
      triple = null;
      ntriple = null;
      attr = null;
      token = null;
      xt1 = null;
      xt2 = null;
      xt3 = null;
      xt4 = null;
      xt5 = null;
    }

    public void test_XMLToken_chars()
    {
      XMLToken token;
      token = new  XMLToken("This is text");
      assertTrue( token.isElement() == false );
      assertTrue( token.isEnd() == false );
      assertTrue( token.isStart() == false );
      assertTrue( token.isText() == true );
      assertTrue( token.isEOF() == false );
      assertTrue( (  "This is text" != token.getCharacters() ) == false );
      token = null;
    }

    public void test_XMLToken_create()
    {
      XMLToken token;
      XMLTriple triple;
      XMLAttributes attr;
      token = new  XMLToken();
      assertTrue( token != null );
      token = null;
      triple = new  XMLTriple("attr", "uri", "prefix");
      token = new  XMLToken(triple);
      assertTrue( token != null );
      assertTrue( (  "attr" != token.getName() ) == false );
      assertTrue( (  "prefix" != token.getPrefix() ) == false );
      assertTrue( (  "uri" != token.getURI() ) == false );
      token = null;
      attr = new  XMLAttributes();
      assertTrue( attr != null );
      attr.add( "attr2", "value");
      token = new  XMLToken(triple,attr);
      assertTrue( token != null );
      XMLAttributes returnattr = token.getAttributes();
      assertTrue( (  "attr2" != returnattr.getName(0) ) == false );
      token = null;
      triple = null;
      attr = null;
    }

    public void test_XMLToken_fields()
    {
      XMLTriple triple;
      XMLToken token;
      triple = new  XMLTriple("attr", "uri", "prefix");
      token = new  XMLToken(triple);
      assertTrue( token.isElement() == true );
      assertTrue( token.isEnd() == true );
      assertTrue( token.isStart() == false );
      assertTrue( token.isText() == false );
      assertTrue( token.isEOF() == false );
      assertTrue( (  "attr" != token.getName() ) == false );
      assertTrue( (  "uri" != token.getURI() ) == false );
      assertTrue( (  "prefix" != token.getPrefix() ) == false );
      token = null;
      triple = null;
    }

    public void test_XMLToken_namespace_add()
    {
      XMLTriple triple = new  XMLTriple("test","","");
      XMLAttributes attr = new  XMLAttributes();
      XMLToken token = new  XMLToken(triple,attr);
      assertTrue( token.getNamespacesLength() == 0 );
      assertTrue( token.isNamespacesEmpty() == true );
      token.addNamespace( "http://test1.org/", "test1");
      assertTrue( token.getNamespacesLength() == 1 );
      assertTrue( token.isNamespacesEmpty() == false );
      token.addNamespace( "http://test2.org/", "test2");
      assertTrue( token.getNamespacesLength() == 2 );
      assertTrue( token.isNamespacesEmpty() == false );
      token.addNamespace( "http://test1.org/", "test1a");
      assertTrue( token.getNamespacesLength() == 3 );
      assertTrue( token.isNamespacesEmpty() == false );
      token.addNamespace( "http://test1.org/", "test1a");
      assertTrue( token.getNamespacesLength() == 3 );
      assertTrue( token.isNamespacesEmpty() == false );
      assertTrue( ! (token.getNamespaceIndex( "http://test1.org/") == -1) );
      token = null;
      triple = null;
      attr = null;
    }

    public void test_XMLToken_namespace_get()
    {
      XMLTriple triple = new  XMLTriple("test","","");
      XMLAttributes attr = new  XMLAttributes();
      XMLToken token = new  XMLToken(triple,attr);
      token.addNamespace( "http://test1.org/", "test1");
      token.addNamespace( "http://test2.org/", "test2");
      token.addNamespace( "http://test3.org/", "test3");
      token.addNamespace( "http://test4.org/", "test4");
      token.addNamespace( "http://test5.org/", "test5");
      token.addNamespace( "http://test6.org/", "test6");
      token.addNamespace( "http://test7.org/", "test7");
      token.addNamespace( "http://test8.org/", "test8");
      token.addNamespace( "http://test9.org/", "test9");
      assertTrue( token.getNamespacesLength() == 9 );
      assertTrue( token.getNamespaceIndex( "http://test1.org/") == 0 );
      assertTrue( (  "test2" != token.getNamespacePrefix(1) ) == false );
      assertTrue( ( 		      "test1" != token.getNamespacePrefix( "http://test1.org/") ) == false );
      assertTrue( (  "http://test2.org/" != token.getNamespaceURI(1) ) == false );
      assertTrue( ( 		      "http://test2.org/" != token.getNamespaceURI( "test2") ) == false );
      assertTrue( token.getNamespaceIndex( "http://test1.org/") == 0 );
      assertTrue( token.getNamespaceIndex( "http://test2.org/") == 1 );
      assertTrue( token.getNamespaceIndex( "http://test5.org/") == 4 );
      assertTrue( token.getNamespaceIndex( "http://test9.org/") == 8 );
      assertTrue( token.getNamespaceIndex( "http://testX.org/") == -1 );
      assertTrue( token.hasNamespaceURI( "http://test1.org/") != false );
      assertTrue( token.hasNamespaceURI( "http://test2.org/") != false );
      assertTrue( token.hasNamespaceURI( "http://test5.org/") != false );
      assertTrue( token.hasNamespaceURI( "http://test9.org/") != false );
      assertTrue( token.hasNamespaceURI( "http://testX.org/") == false );
      assertTrue( token.getNamespaceIndexByPrefix( "test1") == 0 );
      assertTrue( token.getNamespaceIndexByPrefix( "test5") == 4 );
      assertTrue( token.getNamespaceIndexByPrefix( "test9") == 8 );
      assertTrue( token.getNamespaceIndexByPrefix( "testX") == -1 );
      assertTrue( token.hasNamespacePrefix( "test1") != false );
      assertTrue( token.hasNamespacePrefix( "test5") != false );
      assertTrue( token.hasNamespacePrefix( "test9") != false );
      assertTrue( token.hasNamespacePrefix( "testX") == false );
      assertTrue( token.hasNamespaceNS( "http://test1.org/", "test1") != false );
      assertTrue( token.hasNamespaceNS( "http://test5.org/", "test5") != false );
      assertTrue( token.hasNamespaceNS( "http://test9.org/", "test9") != false );
      assertTrue( token.hasNamespaceNS( "http://testX.org/", "testX") == false );
      token = null;
      triple = null;
      attr = null;
    }

    public void test_XMLToken_namespace_remove()
    {
      XMLTriple triple = new  XMLTriple("test","","");
      XMLAttributes attr = new  XMLAttributes();
      XMLToken token = new  XMLToken(triple,attr);
      token.addNamespace( "http://test1.org/", "test1");
      token.addNamespace( "http://test2.org/", "test2");
      token.addNamespace( "http://test3.org/", "test3");
      token.addNamespace( "http://test4.org/", "test4");
      token.addNamespace( "http://test5.org/", "test5");
      assertTrue( token.getNamespacesLength() == 5 );
      token.removeNamespace(4);
      assertTrue( token.getNamespacesLength() == 4 );
      token.removeNamespace(3);
      assertTrue( token.getNamespacesLength() == 3 );
      token.removeNamespace(2);
      assertTrue( token.getNamespacesLength() == 2 );
      token.removeNamespace(1);
      assertTrue( token.getNamespacesLength() == 1 );
      token.removeNamespace(0);
      assertTrue( token.getNamespacesLength() == 0 );
      token.addNamespace( "http://test1.org/", "test1");
      token.addNamespace( "http://test2.org/", "test2");
      token.addNamespace( "http://test3.org/", "test3");
      token.addNamespace( "http://test4.org/", "test4");
      token.addNamespace( "http://test5.org/", "test5");
      assertTrue( token.getNamespacesLength() == 5 );
      token.removeNamespace(0);
      assertTrue( token.getNamespacesLength() == 4 );
      token.removeNamespace(0);
      assertTrue( token.getNamespacesLength() == 3 );
      token.removeNamespace(0);
      assertTrue( token.getNamespacesLength() == 2 );
      token.removeNamespace(0);
      assertTrue( token.getNamespacesLength() == 1 );
      token.removeNamespace(0);
      assertTrue( token.getNamespacesLength() == 0 );
      token = null;
      triple = null;
      attr = null;
    }

    public void test_XMLToken_namespace_remove_by_prefix()
    {
      XMLTriple triple = new  XMLTriple("test","","");
      XMLAttributes attr = new  XMLAttributes();
      XMLToken token = new  XMLToken(triple,attr);
      token.addNamespace( "http://test1.org/", "test1");
      token.addNamespace( "http://test2.org/", "test2");
      token.addNamespace( "http://test3.org/", "test3");
      token.addNamespace( "http://test4.org/", "test4");
      token.addNamespace( "http://test5.org/", "test5");
      assertTrue( token.getNamespacesLength() == 5 );
      token.removeNamespace( "test1");
      assertTrue( token.getNamespacesLength() == 4 );
      token.removeNamespace( "test2");
      assertTrue( token.getNamespacesLength() == 3 );
      token.removeNamespace( "test3");
      assertTrue( token.getNamespacesLength() == 2 );
      token.removeNamespace( "test4");
      assertTrue( token.getNamespacesLength() == 1 );
      token.removeNamespace( "test5");
      assertTrue( token.getNamespacesLength() == 0 );
      token.addNamespace( "http://test1.org/", "test1");
      token.addNamespace( "http://test2.org/", "test2");
      token.addNamespace( "http://test3.org/", "test3");
      token.addNamespace( "http://test4.org/", "test4");
      token.addNamespace( "http://test5.org/", "test5");
      assertTrue( token.getNamespacesLength() == 5 );
      token.removeNamespace( "test5");
      assertTrue( token.getNamespacesLength() == 4 );
      token.removeNamespace( "test4");
      assertTrue( token.getNamespacesLength() == 3 );
      token.removeNamespace( "test3");
      assertTrue( token.getNamespacesLength() == 2 );
      token.removeNamespace( "test2");
      assertTrue( token.getNamespacesLength() == 1 );
      token.removeNamespace( "test1");
      assertTrue( token.getNamespacesLength() == 0 );
      token.addNamespace( "http://test1.org/", "test1");
      token.addNamespace( "http://test2.org/", "test2");
      token.addNamespace( "http://test3.org/", "test3");
      token.addNamespace( "http://test4.org/", "test4");
      token.addNamespace( "http://test5.org/", "test5");
      assertTrue( token.getNamespacesLength() == 5 );
      token.removeNamespace( "test3");
      assertTrue( token.getNamespacesLength() == 4 );
      token.removeNamespace( "test1");
      assertTrue( token.getNamespacesLength() == 3 );
      token.removeNamespace( "test4");
      assertTrue( token.getNamespacesLength() == 2 );
      token.removeNamespace( "test5");
      assertTrue( token.getNamespacesLength() == 1 );
      token.removeNamespace( "test2");
      assertTrue( token.getNamespacesLength() == 0 );
      token = null;
      triple = null;
      attr = null;
    }

    public void test_XMLToken_namespace_set_clear()
    {
      XMLTriple triple = new  XMLTriple("test","","");
      XMLAttributes attr = new  XMLAttributes();
      XMLToken token = new  XMLToken(triple,attr);
      XMLNamespaces ns = new  XMLNamespaces();
      assertTrue( token.getNamespacesLength() == 0 );
      assertTrue( token.isNamespacesEmpty() == true );
      ns.add( "http://test1.org/", "test1");
      ns.add( "http://test2.org/", "test2");
      ns.add( "http://test3.org/", "test3");
      ns.add( "http://test4.org/", "test4");
      ns.add( "http://test5.org/", "test5");
      token.setNamespaces(ns);
      assertTrue( token.getNamespacesLength() == 5 );
      assertTrue( token.isNamespacesEmpty() == false );
      assertTrue( (  "test1" != token.getNamespacePrefix(0) ) == false );
      assertTrue( (  "test2" != token.getNamespacePrefix(1) ) == false );
      assertTrue( (  "test3" != token.getNamespacePrefix(2) ) == false );
      assertTrue( (  "test4" != token.getNamespacePrefix(3) ) == false );
      assertTrue( (  "test5" != token.getNamespacePrefix(4) ) == false );
      assertTrue( (  "http://test1.org/" != token.getNamespaceURI(0) ) == false );
      assertTrue( (  "http://test2.org/" != token.getNamespaceURI(1) ) == false );
      assertTrue( (  "http://test3.org/" != token.getNamespaceURI(2) ) == false );
      assertTrue( (  "http://test4.org/" != token.getNamespaceURI(3) ) == false );
      assertTrue( (  "http://test5.org/" != token.getNamespaceURI(4) ) == false );
      token.clearNamespaces();
      assertTrue( token.getNamespacesLength() == 0 );
      ns = null;
      token = null;
      triple = null;
      attr = null;
    }

  }
}
