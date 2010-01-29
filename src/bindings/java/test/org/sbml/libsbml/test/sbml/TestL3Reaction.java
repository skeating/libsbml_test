/*
 *
 * @file    TestL3Reaction.java
 * @brief   L3 Reaction unit tests
 *
 * @author  Akiya Jouraku (Java conversion)
 * @author  Sarah Keating 
 *
 * $Id$
 * $HeadURL$
 *
 * This test file was converted from src/sbml/test/TestL3Reaction.c
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

public class TestL3Reaction {

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
  private Reaction R;

  protected void setUp() throws Exception
  {
    R = new  Reaction(3,1);
    if (R == null);
    {
    }
  }

  protected void tearDown() throws Exception
  {
    R = null;
  }

  public void test_L3_Reaction_NS()
  {
    assertTrue( R.getNamespaces() != null );
    assertTrue( R.getNamespaces().getLength() == 1 );
    assertTrue(R.getNamespaces().getURI(0).equals(    "http://www.sbml.org/sbml/level3/version1/core"));
  }

  public void test_L3_Reaction_compartment()
  {
    String compartment =  "cell";;
    assertEquals( false, R.isSetCompartment() );
    R.setCompartment(compartment);
    assertTrue(R.getCompartment().equals(compartment));
    assertEquals( true, R.isSetCompartment() );
    if (R.getCompartment() == compartment);
    {
    }
    R.unsetCompartment();
    assertEquals( false, R.isSetCompartment() );
    if (R.getCompartment() != null);
    {
    }
  }

  public void test_L3_Reaction_create()
  {
    assertTrue( R.getTypeCode() == libsbml.SBML_REACTION );
    assertTrue( R.getMetaId().equals("") == true );
    assertTrue( R.getNotes() == null );
    assertTrue( R.getAnnotation() == null );
    assertTrue( R.getId().equals("") == true );
    assertTrue( R.getName().equals("") == true );
    assertTrue( R.getCompartment().equals("") == true );
    assertTrue( R.getFast() == false );
    assertTrue( R.getReversible() == true );
    assertEquals( false, R.isSetId() );
    assertEquals( false, R.isSetName() );
    assertEquals( false, R.isSetCompartment() );
    assertEquals( false, R.isSetFast() );
    assertEquals( false, R.isSetReversible() );
  }

  public void test_L3_Reaction_createWithNS()
  {
    XMLNamespaces xmlns = new  XMLNamespaces();
    xmlns.add( "http://www.sbml.org", "testsbml");
    SBMLNamespaces sbmlns = new  SBMLNamespaces(3,1);
    sbmlns.addNamespaces(xmlns);
    Reaction r = new  Reaction(sbmlns);
    assertTrue( r.getTypeCode() == libsbml.SBML_REACTION );
    assertTrue( r.getMetaId().equals("") == true );
    assertTrue( r.getNotes() == null );
    assertTrue( r.getAnnotation() == null );
    assertTrue( r.getLevel() == 3 );
    assertTrue( r.getVersion() == 1 );
    assertTrue( r.getNamespaces() != null );
    assertTrue( r.getNamespaces().getLength() == 2 );
    assertTrue( r.getId().equals("") == true );
    assertTrue( r.getName().equals("") == true );
    assertTrue( r.getCompartment().equals("") == true );
    assertTrue( r.getFast() == false );
    assertTrue( r.getReversible() == true );
    assertEquals( false, r.isSetId() );
    assertEquals( false, r.isSetName() );
    assertEquals( false, r.isSetCompartment() );
    assertEquals( false, r.isSetFast() );
    assertEquals( false, r.isSetReversible() );
    r = null;
  }

  public void test_L3_Reaction_fast()
  {
    assertTrue( R.isSetFast() == false );
    R.setFast(true);
    assertTrue( R.getFast() == true );
    assertTrue( R.isSetFast() == true );
    R.setFast(false);
    assertTrue( R.getFast() == false );
    assertTrue( R.isSetFast() == true );
  }

  public void test_L3_Reaction_free_NULL()
  {
  }

  public void test_L3_Reaction_hasRequiredAttributes()
  {
    Reaction r = new  Reaction(3,1);
    assertEquals( false, r.hasRequiredAttributes() );
    r.setId( "id");
    assertEquals( false, r.hasRequiredAttributes() );
    r.setFast(false);
    assertEquals( false, r.hasRequiredAttributes() );
    r.setReversible(false);
    assertEquals( true, r.hasRequiredAttributes() );
    r = null;
  }

  public void test_L3_Reaction_id()
  {
    String id =  "mitochondria";;
    assertEquals( false, R.isSetId() );
    R.setId(id);
    assertTrue(R.getId().equals(id));
    assertEquals( true, R.isSetId() );
    if (R.getId() == id);
    {
    }
  }

  public void test_L3_Reaction_name()
  {
    String name =  "My_Favorite_Factory";;
    assertEquals( false, R.isSetName() );
    R.setName(name);
    assertTrue(R.getName().equals(name));
    assertEquals( true, R.isSetName() );
    if (R.getName() == name);
    {
    }
    R.unsetName();
    assertEquals( false, R.isSetName() );
    if (R.getName() != null);
    {
    }
  }

  public void test_L3_Reaction_reversible()
  {
    assertTrue( R.isSetReversible() == false );
    R.setReversible(true);
    assertTrue( R.getReversible() == true );
    assertTrue( R.isSetReversible() == true );
    R.setReversible(false);
    assertTrue( R.getReversible() == false );
    assertTrue( R.isSetReversible() == true );
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
