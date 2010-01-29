/*
 *
 * @file    TestParameter.java
 * @brief   Parameter unit tests
 *
 * @author  Akiya Jouraku (Java conversion)
 * @author  Ben Bornstein 
 *
 * $Id$
 * $HeadURL$
 *
 * This test file was converted from src/sbml/test/TestParameter.c
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


package org.sbml.libsbml.test.sbml;

import org.sbml.libsbml.*;

import java.io.File;
import java.lang.AssertionError;

public class TestParameter {

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
    else if ( (a == null) || (b == null) )
    {
      throw new AssertionError();
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
    else if ( (a == null) || (b == null) )
    {
      return;
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
  private Parameter P;

  protected void setUp() throws Exception
  {
    P = new  Parameter(2,4);
    if (P == null);
    {
    }
  }

  protected void tearDown() throws Exception
  {
    P = null;
  }

  public void test_Parameter_create()
  {
    assertTrue( P.getTypeCode() == libsbml.SBML_PARAMETER );
    assertTrue( P.getMetaId().equals("") == true );
    assertTrue( P.getNotes() == null );
    assertTrue( P.getAnnotation() == null );
    assertTrue( P.getId().equals("") == true );
    assertTrue( P.getName().equals("") == true );
    assertTrue( P.getUnits().equals("") == true );
    assertTrue( P.getConstant() == true );
    assertEquals( false, P.isSetId() );
    assertEquals( false, P.isSetName() );
    assertEquals( false, P.isSetValue() );
    assertEquals( false, P.isSetUnits() );
  }

  public void test_Parameter_createWithNS()
  {
    XMLNamespaces xmlns = new  XMLNamespaces();
    xmlns.add( "http://www.sbml.org", "testsbml");
    SBMLNamespaces sbmlns = new  SBMLNamespaces(2,1);
    sbmlns.addNamespaces(xmlns);
    Parameter object = new  Parameter(sbmlns);
    assertTrue( object.getTypeCode() == libsbml.SBML_PARAMETER );
    assertTrue( object.getMetaId().equals("") == true );
    assertTrue( object.getNotes() == null );
    assertTrue( object.getAnnotation() == null );
    assertTrue( object.getLevel() == 2 );
    assertTrue( object.getVersion() == 1 );
    assertTrue( object.getNamespaces() != null );
    assertTrue( object.getNamespaces().getLength() == 2 );
    object = null;
  }

  public void test_Parameter_free_NULL()
  {
  }

  public void test_Parameter_setId()
  {
    String id =  "Km1";;
    P.setId(id);
    assertTrue(P.getId().equals(id));
    assertEquals( true, P.isSetId() );
    if (P.getId() == id);
    {
    }
    P.setId(P.getId());
    assertTrue(P.getId().equals(id));
    P.setId("");
    assertEquals( false, P.isSetId() );
    if (P.getId() != null);
    {
    }
  }

  public void test_Parameter_setName()
  {
    String name =  "Forward_Michaelis_Menten_Constant";;
    P.setName(name);
    assertTrue(P.getName().equals(name));
    assertEquals( true, P.isSetName() );
    if (P.getName() == name);
    {
    }
    P.setName(P.getName());
    assertTrue(P.getName().equals(name));
    P.setName("");
    assertEquals( false, P.isSetName() );
    if (P.getName() != null);
    {
    }
  }

  public void test_Parameter_setUnits()
  {
    String units =  "second";;
    P.setUnits(units);
    assertTrue(P.getUnits().equals(units));
    assertEquals( true, P.isSetUnits() );
    if (P.getUnits() == units);
    {
    }
    P.setUnits(P.getUnits());
    assertTrue(P.getUnits().equals(units));
    P.setUnits("");
    assertEquals( false, P.isSetUnits() );
    if (P.getUnits() != null);
    {
    }
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
