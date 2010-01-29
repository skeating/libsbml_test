/*
 *
 * @file    TestKineticLaw.java
 * @brief   SBML KineticLaw unit tests
 *
 * @author  Akiya Jouraku (Java conversion)
 * @author  Ben Bornstein 
 *
 * $Id$
 * $HeadURL$
 *
 * This test file was converted from src/sbml/test/TestKineticLaw.c
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

public class TestKineticLaw {

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
  private KineticLaw kl;

  protected void setUp() throws Exception
  {
    kl = new  KineticLaw(2,4);
    if (kl == null);
    {
    }
  }

  protected void tearDown() throws Exception
  {
    kl = null;
  }

  public void test_KineticLaw_addParameter()
  {
    Parameter p = new  Parameter(2,4);
    p.setId( "p");
    kl.addParameter(p);
    assertTrue( kl.getNumParameters() == 1 );
    p = null;
  }

  public void test_KineticLaw_create()
  {
    assertTrue( kl.getTypeCode() == libsbml.SBML_KINETIC_LAW );
    assertTrue( kl.getMetaId().equals("") == true );
    assertTrue( kl.getNotes() == null );
    assertTrue( kl.getAnnotation() == null );
    assertTrue( kl.getFormula().equals("") == true );
    assertTrue( kl.getMath() == null );
    assertTrue( kl.getTimeUnits().equals("") == true );
    assertTrue( kl.getSubstanceUnits().equals("") == true );
    assertEquals( false, kl.isSetFormula() );
    assertEquals( false, kl.isSetMath() );
    assertEquals( false, kl.isSetTimeUnits() );
    assertEquals( false, kl.isSetSubstanceUnits() );
    assertTrue( kl.getNumParameters() == 0 );
  }

  public void test_KineticLaw_createWithNS()
  {
    XMLNamespaces xmlns = new  XMLNamespaces();
    xmlns.add( "http://www.sbml.org", "testsbml");
    SBMLNamespaces sbmlns = new  SBMLNamespaces(2,1);
    sbmlns.addNamespaces(xmlns);
    KineticLaw object = new  KineticLaw(sbmlns);
    assertTrue( object.getTypeCode() == libsbml.SBML_KINETIC_LAW );
    assertTrue( object.getMetaId().equals("") == true );
    assertTrue( object.getNotes() == null );
    assertTrue( object.getAnnotation() == null );
    assertTrue( object.getLevel() == 2 );
    assertTrue( object.getVersion() == 1 );
    assertTrue( object.getNamespaces() != null );
    assertTrue( object.getNamespaces().getLength() == 2 );
    object = null;
  }

  public void test_KineticLaw_free_NULL()
  {
  }

  public void test_KineticLaw_getParameter()
  {
    Parameter k1 = new  Parameter(2,4);
    Parameter k2 = new  Parameter(2,4);
    k1.setId( "k1");
    k2.setId( "k2");
    k1.setValue(3.14);
    k2.setValue(2.72);
    kl.addParameter(k1);
    kl.addParameter(k2);
    k1 = null;
    k2 = null;
    assertTrue( kl.getNumParameters() == 2 );
    k1 = kl.getParameter(0);
    k2 = kl.getParameter(1);
    assertTrue(k1.getId().equals( "k1"));
    assertTrue(k2.getId().equals( "k2"));
    assertTrue( k1.getValue() == 3.14 );
    assertTrue( k2.getValue() == 2.72 );
  }

  public void test_KineticLaw_getParameterById()
  {
    Parameter k1 = new  Parameter(2,4);
    Parameter k2 = new  Parameter(2,4);
    k1.setId( "k1");
    k2.setId( "k2");
    k1.setValue(3.14);
    k2.setValue(2.72);
    kl.addParameter(k1);
    kl.addParameter(k2);
    k1 = null;
    k2 = null;
    assertTrue( kl.getNumParameters() == 2 );
    k1 = kl.getParameter( "k1");
    k2 = kl.getParameter( "k2");
    assertTrue(k1.getId().equals( "k1"));
    assertTrue(k2.getId().equals( "k2"));
    assertTrue( k1.getValue() == 3.14 );
    assertTrue( k2.getValue() == 2.72 );
  }

  public void test_KineticLaw_removeParameter()
  {
    Parameter o1,o2,o3;
    o1 = kl.createParameter();
    o2 = kl.createParameter();
    o3 = kl.createParameter();
    o3.setId("test");
    assertTrue( kl.removeParameter(0).equals(o1) );
    assertTrue( kl.getNumParameters() == 2 );
    assertTrue( kl.removeParameter(0).equals(o2) );
    assertTrue( kl.getNumParameters() == 1 );
    assertTrue( kl.removeParameter("test").equals(o3) );
    assertTrue( kl.getNumParameters() == 0 );
    o1 = null;
    o2 = null;
    o3 = null;
  }

  public void test_KineticLaw_setBadFormula()
  {
    String formula =  "k1 X0";;
    kl.setFormula(formula);
    assertEquals( false, kl.isSetFormula() );
    assertEquals( false, kl.isSetMath() );
  }

  public void test_KineticLaw_setFormula()
  {
    String formula =  "k1*X0";;
    kl.setFormula(formula);
    assertTrue(kl.getFormula().equals(formula));
    assertEquals( true, kl.isSetFormula() );
    if (kl.getFormula() == formula);
    {
    }
    kl.setFormula(kl.getFormula());
    assertTrue(kl.getFormula().equals(formula));
    kl.setFormula("");
    assertEquals( false, kl.isSetFormula() );
    if (kl.getFormula() != null);
    {
    }
  }

  public void test_KineticLaw_setFormulaFromMath()
  {
    ASTNode math = libsbml.parseFormula("k1 * X0");
    assertEquals( false, kl.isSetMath() );
    assertEquals( false, kl.isSetFormula() );
    kl.setMath(math);
    assertEquals( true, kl.isSetMath() );
    assertEquals( true, kl.isSetFormula() );
    assertTrue(kl.getFormula().equals( "k1 * X0"));
    math = null;
  }

  public void test_KineticLaw_setMath()
  {
    ASTNode math = libsbml.parseFormula("k3 / k2");
    String formula;
    ASTNode math1;
    kl.setMath(math);
    math1 = kl.getMath();
    assertTrue( math1 != null );
    formula = libsbml.formulaToString(math1);
    assertTrue( formula != null );
    assertTrue(formula.equals( "k3 / k2"));
    assertTrue( !kl.getMath().equals(math) );
    assertEquals( true, kl.isSetMath() );
    kl.setMath(kl.getMath());
    math1 = kl.getMath();
    assertTrue( math1 != null );
    formula = libsbml.formulaToString(math1);
    assertTrue( formula != null );
    assertTrue(formula.equals( "k3 / k2"));
    assertTrue( !kl.getMath().equals(math) );
    kl.setMath(null);
    assertEquals( false, kl.isSetMath() );
    if (kl.getMath() != null);
    {
    }
    math = null;
  }

  public void test_KineticLaw_setMathFromFormula()
  {
    String formula =  "k3 / k2";;
    assertEquals( false, kl.isSetMath() );
    assertEquals( false, kl.isSetFormula() );
    kl.setFormula(formula);
    assertEquals( true, kl.isSetMath() );
    assertEquals( true, kl.isSetFormula() );
    formula = libsbml.formulaToString(kl.getMath());
    assertTrue(formula.equals( "k3 / k2"));
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
