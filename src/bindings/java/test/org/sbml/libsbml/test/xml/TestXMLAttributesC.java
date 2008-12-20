/*
 *
 * @file    TestXMLAttributesC.java
 * @brief   XMLAttributes unit tests, C version
 *
 * @author  Akiya Jouraku (Java conversion)
 * @author  Sarah Keating 
 *
 * $Id:$
 * $HeadURL:$
 *
 * This test file was converted from src/sbml/test/TestXMLAttributesC.c
 * with the help of conversion sciprt (ctest_converter.pl).
 *
 *<!---------------------------------------------------------------------------
 * This file is part of libSBML.  Please visit http://sbml.org for more
 * information about SBML, and the latest version of libSBML.
 *
 * Copyright 2005-2008 California Institute of Technology.
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

public class TestXMLAttributesC {

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

  public void test_XMLAttributes_add_remove_qname_C()
  {
    XMLAttributes xa = new  XMLAttributes();
    XMLTriple xt1 = new  XMLTriple("name1", "http://name1.org/", "p1");
    XMLTriple xt2 = new  XMLTriple("name2", "http://name2.org/", "p2");
    XMLTriple xt3 = new  XMLTriple("name3", "http://name3.org/", "p3");
    XMLTriple xt1a = new  XMLTriple("name1", "http://name1a.org/", "p1a");
    XMLTriple xt2a = new  XMLTriple("name2", "http://name2a.org/", "p2a");
    xa.add( "name1", "val1", "http://name1.org/", "p1");
    xa.add(xt2, "val2");
    assertTrue( xa.getLength() == 2 );
    assertTrue( xa.isEmpty() == false );
    assertTrue( !xa.getName(0).equals( "name1") == false );
    assertTrue( !xa.getValue(0).equals( "val1" ) == false );
    assertTrue( !xa.getURI(0).equals( "http://name1.org/") == false );
    assertTrue( !xa.getPrefix(0).equals( "p1"   ) == false );
    assertTrue( !xa.getName(1).equals( "name2") == false );
    assertTrue( !xa.getValue(1).equals( "val2" ) == false );
    assertTrue( !xa.getURI(1).equals( "http://name2.org/") == false );
    assertTrue( !xa.getPrefix(1).equals( "p2"   ) == false );
    assertTrue( !xa.getValue( "name1").equals( "val1" ) == false );
    assertTrue( !xa.getValue( "name2").equals( "val2" ) == false );
    assertTrue( !xa.getValue( "name1", "http://name1.org/").equals( "val1" ) == false );
    assertTrue( !xa.getValue( "name2", "http://name2.org/").equals( "val2" ) == false );
    assertTrue( !xa.getValue(xt1).equals( "val1" ) == false );
    assertTrue( !xa.getValue(xt2).equals( "val2" ) == false );
    assertTrue( xa.hasAttribute(-1) == false );
    assertTrue( xa.hasAttribute(2) == false );
    assertTrue( xa.hasAttribute(0) == true );
    assertTrue( xa.hasAttribute( "name1", "http://name1.org/") == true );
    assertTrue( xa.hasAttribute( "name2", "http://name2.org/") == true );
    assertTrue( xa.hasAttribute( "name3", "http://name3.org/") == false );
    assertTrue( xa.hasAttribute(xt1) == true );
    assertTrue( xa.hasAttribute(xt2) == true );
    assertTrue( xa.hasAttribute(xt3) == false );
    xa.add( "noprefix", "val3");
    assertTrue( xa.getLength() == 3 );
    assertTrue( xa.isEmpty() == false );
    assertTrue( !xa.getName(2).equals( "noprefix") == false );
    assertTrue( !xa.getValue(2).equals( "val3"    ) == false );
    assertTrue( xa.getURI(2).equals("") == true );
    assertTrue( xa.getPrefix(2).equals("") == true );
    assertTrue( !xa.getValue( "noprefix", "").equals( "val3" ) == false );
    assertTrue( xa.hasAttribute( "noprefix"    ) == true );
    assertTrue( xa.hasAttribute( "noprefix", "") == true );
    xa.add(xt1, "mval1");
    xa.add( "name2", "mval2", "http://name2.org/", "p2");
    xa.add( "noprefix", "mval3");
    assertTrue( xa.getLength() == 3 );
    assertTrue( xa.isEmpty() == false );
    assertTrue( !xa.getName(0).equals( "name1") == false );
    assertTrue( !xa.getValue(0).equals( "mval1") == false );
    assertTrue( !xa.getURI(0).equals( "http://name1.org/") == false );
    assertTrue( !xa.getPrefix(0).equals( "p1"   ) == false );
    assertTrue( !xa.getName(1).equals( "name2"   ) == false );
    assertTrue( !xa.getValue(1).equals( "mval2"   ) == false );
    assertTrue( !xa.getURI(1).equals( "http://name2.org/") == false );
    assertTrue( !xa.getPrefix(1).equals( "p2"      ) == false );
    assertTrue( !xa.getName(2).equals( "noprefix") == false );
    assertTrue( !xa.getValue(2).equals( "mval3"   ) == false );
    assertTrue( xa.getURI(2).equals("") == true );
    assertTrue( xa.getPrefix(2).equals("") == true );
    assertTrue( xa.hasAttribute(xt1) == true );
    assertTrue( xa.hasAttribute( "name1", "http://name1.org/") == true );
    assertTrue( xa.hasAttribute( "noprefix") == true );
    xa.add(xt1a, "val1a");
    xa.add(xt2a, "val2a");
    assertTrue( xa.getLength() == 5 );
    assertTrue( !xa.getName(3).equals( "name1") == false );
    assertTrue( !xa.getValue(3).equals( "val1a") == false );
    assertTrue( !xa.getURI(3).equals( "http://name1a.org/") == false );
    assertTrue( !xa.getPrefix(3).equals( "p1a") == false );
    assertTrue( !xa.getName(4).equals( "name2") == false );
    assertTrue( !xa.getValue(4).equals( "val2a") == false );
    assertTrue( !xa.getURI(4).equals( "http://name2a.org/") == false );
    assertTrue( !xa.getPrefix(4).equals( "p2a") == false );
    assertTrue( !xa.getValue( "name1").equals( "mval1" ) == false );
    assertTrue( !xa.getValue( "name2").equals( "mval2" ) == false );
    assertTrue( !xa.getValue( "name1", "http://name1a.org/").equals( "val1a" ) == false );
    assertTrue( !xa.getValue( "name2", "http://name2a.org/").equals( "val2a" ) == false );
    assertTrue( !xa.getValue(xt1a).equals( "val1a" ) == false );
    assertTrue( !xa.getValue(xt2a).equals( "val2a" ) == false );
    xa.remove(xt1a);
    xa.remove(xt2a);
    assertTrue( xa.getLength() == 3 );
    xa.remove( "name1", "http://name1.org/");
    assertTrue( xa.getLength() == 2 );
    assertTrue( xa.isEmpty() == false );
    assertTrue( !xa.getName(0).equals( "name2") == false );
    assertTrue( !xa.getValue(0).equals( "mval2") == false );
    assertTrue( !xa.getURI(0).equals( "http://name2.org/") == false );
    assertTrue( !xa.getPrefix(0).equals( "p2") == false );
    assertTrue( !xa.getName(1).equals( "noprefix") == false );
    assertTrue( !xa.getValue(1).equals( "mval3") == false );
    assertTrue( xa.getURI(1).equals("") == true );
    assertTrue( xa.getPrefix(1).equals("") == true );
    assertTrue( xa.hasAttribute( "name1", "http://name1.org/") == false );
    xa.remove(xt2);
    assertTrue( xa.getLength() == 1 );
    assertTrue( xa.isEmpty() == false );
    assertTrue( !xa.getName(0).equals( "noprefix") == false );
    assertTrue( !xa.getValue(0).equals( "mval3") == false );
    assertTrue( xa.getURI(0).equals("") == true );
    assertTrue( xa.getPrefix(0).equals("") == true );
    assertTrue( xa.hasAttribute(xt2) == false );
    assertTrue( xa.hasAttribute( "name2", "http://name2.org/") == false );
    xa.remove( "noprefix", "");
    assertTrue( xa.getLength() == 0 );
    assertTrue( xa.isEmpty() == true );
    assertTrue( xa.hasAttribute( "noprefix"    ) == false );
    assertTrue( xa.hasAttribute( "noprefix", "") == false );
    xa = null;
    xt1 = null;
    xt2 = null;
    xt3 = null;
    xt1a = null;
    xt2a = null;
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
