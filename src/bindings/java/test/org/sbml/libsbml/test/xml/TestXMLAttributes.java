/*
 *
 * @file    TestXMLAttributes.java
 * @brief   TestXMLAttributes unit tests
 *
 * @author  Akiya Jouraku (Java conversion)
 * @author  Ben Bornstein 
 *
 * $Id$
 * $HeadURL$
 *
 * This test file was converted from src/sbml/test/TestXMLAttributes.cpp
 * with the help of conversion sciprt (ctest_converter.pl).
 *
 *<!---------------------------------------------------------------------------
 * This file is part of libSBML.  Please visit http://sbml.org for more
 * information about SBML, and the latest version of libSBML.
 *
 * Copyright 2005-2010 California Institute of Technology.
 * Copyright 2002-2005 California Institute of Technology and
 *                     Japan Science and Technology Corporation.
 * 
 * This library is free software; you can redistribute it and/or modify it
 * under the terms of the GNU Lesser General Public License as published by
 * the Free Software Foundation.  A copy of the license agreement is provided
 * in the file named "LICENSE.txt" included with this software distribution
 * and also available online as http://sbml.org/software/libsbml/license.html
 *--------------------------------------------------------------------------->*/


package org.sbml.libsbml.test.xml;

import org.sbml.libsbml.*;

import java.io.File;
import java.lang.AssertionError;

public class TestXMLAttributes {

  static void assertTrue(boolean condition) throws AssertionError
  {
    if (condition == true)
    {
      return;
    }
    throw new AssertionError();
  }

  static void assertEquals(Object a, Object b) throws AssertionError
  {
    if ( (a == null) && (b == null) )
    {
      return;
    }
    else if (a.equals(b))
    {
      return;
    }

    throw new AssertionError();
  }

  static void assertNotEquals(Object a, Object b) throws AssertionError
  {
    if ( (a == null) && (b == null) )
    {
      throw new AssertionError();
    }
    else if (a.equals(b))
    {
      throw new AssertionError();
    }
  }

  static void assertEquals(boolean a, boolean b) throws AssertionError
  {
    if ( a == b )
    {
      return;
    }
    throw new AssertionError();
  }

  static void assertNotEquals(boolean a, boolean b) throws AssertionError
  {
    if ( a != b )
    {
      return;
    }
    throw new AssertionError();
  }

  static void assertEquals(int a, int b) throws AssertionError
  {
    if ( a == b )
    {
      return;
    }
    throw new AssertionError();
  }

  static void assertNotEquals(int a, int b) throws AssertionError
  {
    if ( a != b )
    {
      return;
    }
    throw new AssertionError();
  }


  public double util_NaN()
  {
    double z = 0.0;
    return 0.0/z;
  }

  public double util_PosInf()
  {
    double z = 0.0;
    return 1.0/z;
  }

  public double util_NegInf()
  {
    double z = 0.0;
    return -1.0/z;
  }

  public void test_XMLAttributes_add_get()
  {
    XMLAttributes attrs = new XMLAttributes();
    assertTrue( attrs.getLength() == 0 );
    assertEquals( true, attrs.isEmpty() );
    attrs.add("xmlns", "http://foo.org/");
    assertTrue( attrs.getLength() == 1 );
    assertTrue( attrs.isEmpty() == false );
    attrs.add("foo", "bar");
    assertTrue( attrs.getLength() == 2 );
    assertTrue( attrs.isEmpty() == false );
    assertTrue( attrs.getIndex("xmlns") == 0 );
    assertTrue( attrs.getIndex("foo"  ) == 1 );
    assertTrue( attrs.getIndex("bar"  ) == -1 );
    assertTrue( attrs.getValue("xmlns").equals( "http://foo.org/" ) );
    assertTrue( attrs.getValue("foo"  ).equals( "bar"             ) );
    assertTrue( attrs.getValue("bar"  ).equals( ""                ) );
    assertTrue( attrs.getName(0).equals( "xmlns" ) );
    assertTrue( attrs.getName(1).equals( "foo"   ) );
    assertTrue( attrs.getName(2).equals( ""      ) );
  }

/*
  public void test_XMLAttributes_add_removeResource()
  {
    XMLAttributes att1 = new XMLAttributes();
    att1.add("rdf", "http://foo.org/");
    att1.add("rdf", "http://foo1.org/");
    assertTrue( att1.getLength() == 2 );
    assertTrue( att1.isEmpty() == false );
    assertTrue( att1.getName(0).equals(  "rdf" ) );
    assertTrue( att1.getValue(0).equals( "http://foo.org/" ) );
    assertTrue( att1.getName(1).equals(  "rdf" ) );
    assertTrue( att1.getValue(1).equals( "http://foo1.org/" ) );
    att1.add("rdf", "http://foo2.org/");
    assertTrue( att1.getLength() == 3 );
    assertTrue( att1.isEmpty() == false );
    assertTrue( att1.getName(2).equals(  "rdf" ) );
    assertTrue( att1.getValue(2).equals( "http://foo2.org/" ) );
    att1.removeResource(1);
    assertTrue( att1.getLength() == 2 );
    assertTrue( att1.isEmpty() == false );
    assertTrue( att1.getName(0).equals(  "rdf" ) );
    assertTrue( att1.getValue(0).equals( "http://foo.org/" ) );
    assertTrue( att1.getName(1).equals(  "rdf" ) );
    assertTrue( att1.getValue(1).equals( "http://foo2.org/" ) );
  }
*/

  public void test_XMLAttributes_assignment()
  {
    XMLAttributes att1 = new XMLAttributes();
    att1.add("xmlns", "http://foo.org/");
    assertTrue( att1.getLength() == 1 );
    assertTrue( att1.isEmpty() == false );
    assertTrue( att1.getIndex("xmlns") == 0 );
    assertTrue( att1.getName(0).equals(  "xmlns" ) );
    assertTrue( att1.getValue("xmlns").equals( "http://foo.org/" ) );
    XMLAttributes att2 = new XMLAttributes();
    att2 = att1;
    assertTrue( att2.getLength() == 1 );
    assertTrue( att2.isEmpty() == false );
    assertTrue( att2.getIndex("xmlns") == 0 );
    assertTrue( att2.getName(0).equals(  "xmlns" ) );
    assertTrue( att2.getValue("xmlns").equals( "http://foo.org/" ) );
    att2 = null;
    att1 = null;
  }

  public void test_XMLAttributes_clone()
  {
    XMLAttributes att1 = new XMLAttributes();
    att1.add("xmlns", "http://foo.org/");
    assertTrue( att1.getLength() == 1 );
    assertTrue( att1.isEmpty() == false );
    assertTrue( att1.getIndex("xmlns") == 0 );
    assertTrue( att1.getName(0).equals(  "xmlns" ) );
    assertTrue( att1.getValue("xmlns").equals( "http://foo.org/" ) );
    XMLAttributes att2 = (XMLAttributes) att1.cloneObject();
    assertTrue( att2.getLength() == 1 );
    assertTrue( att2.isEmpty() == false );
    assertTrue( att2.getIndex("xmlns") == 0 );
    assertTrue( att2.getName(0).equals(  "xmlns" ) );
    assertTrue( att2.getValue("xmlns").equals( "http://foo.org/" ) );
    att2 = null;
    att1 = null;
  }

  public void test_XMLAttributes_copy()
  {
    XMLAttributes att1 = new XMLAttributes();
    att1.add("xmlns", "http://foo.org/");
    assertTrue( att1.getLength() == 1 );
    assertTrue( att1.isEmpty() == false );
    assertTrue( att1.getIndex("xmlns") == 0 );
    assertTrue( att1.getName(0).equals(  "xmlns" ) );
    assertTrue( att1.getValue("xmlns").equals( "http://foo.org/" ) );
    XMLAttributes att2 = new XMLAttributes(att1);
    assertTrue( att2.getLength() == 1 );
    assertTrue( att2.isEmpty() == false );
    assertTrue( att2.getIndex("xmlns") == 0 );
    assertTrue( att2.getName(0).equals(  "xmlns" ) );
    assertTrue( att2.getValue("xmlns").equals( "http://foo.org/" ) );
    att2 = null;
    att1 = null;
  }

  /**
   * Loads the SWIG-generated libSBML Java module when this class is
   * loaded, or reports a sensible diagnostic message about why it failed.
   */
  static
  {
    String varname;
    String shlibname;

    if (System.getProperty("mrj.version") != null)
    {
      varname = "DYLD_LIBRARY_PATH";    // We're on a Mac.
      shlibname = "libsbmlj.jnilib and/or libsbml.dylib";
    }
    else
    {
      varname = "LD_LIBRARY_PATH";      // We're not on a Mac.
      shlibname = "libsbmlj.so and/or libsbml.so";
    }

    try
    {
      System.loadLibrary("sbmlj");
      // For extra safety, check that the jar file is in the classpath.
      Class.forName("org.sbml.libsbml.libsbml");
    }
    catch (SecurityException e)
    {
      e.printStackTrace();
      System.err.println("Could not load the libSBML library files due to a"+
                         " security exception.\n");
      System.exit(1);
    }
    catch (UnsatisfiedLinkError e)
    {
      e.printStackTrace();
      System.err.println("Error: could not link with the libSBML library files."+
                         " It is likely\nyour " + varname +
                         " environment variable does not include the directories\n"+
                         "containing the " + shlibname + " library files.\n");
      System.exit(1);
    }
    catch (ClassNotFoundException e)
    {
      e.printStackTrace();
      System.err.println("Error: unable to load the file libsbmlj.jar."+
                         " It is likely\nyour -classpath option and CLASSPATH" +
                         " environment variable\n"+
                         "do not include the path to libsbmlj.jar.\n");
      System.exit(1);
    }
  }
}
