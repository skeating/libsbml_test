/*
 *
 * @file    TestAlgebraicRule.java
 * @brief   AlgebraicRule unit tests
 *
 * @author  Akiya Jouraku (Java conversion)
 * @author  Ben Bornstein 
 *
 * $Id$
 * $HeadURL$
 *
 * This test file was converted from src/sbml/test/TestAlgebraicRule.c
 * with the help of conversion sciprt (ctest_converter.pl).
 *
 *<!---------------------------------------------------------------------------
 * This file is part of libSBML.  Please visit http://sbml.org for more
 * information about SBML, and the latest version of libSBML.
 *
 * Copyright 2005-2009 California Institute of Technology.
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

public class TestAlgebraicRule {

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
  private Rule AR;

  protected void setUp() throws Exception
  {
    AR = new  AlgebraicRule(2,4);
    if (AR == null);
    {
    }
  }

  protected void tearDown() throws Exception
  {
    AR = null;
  }

  public void test_AlgebraicRule_create()
  {
    assertTrue( AR.getTypeCode() == libsbml.SBML_ALGEBRAIC_RULE );
    assertTrue( AR.getMetaId().equals("") == true );
    assertTrue( AR.getNotes() == null );
    assertTrue( AR.getAnnotation() == null );
    assertTrue( AR.getFormula().equals("") == true );
    assertTrue( AR.getMath() == null );
  }

  public void test_AlgebraicRule_createWithFormula()
  {
    ASTNode math;
    String formula;
    Rule ar = new  AlgebraicRule(2,4);
    ar.setFormula( "1 + 1");
    assertTrue( ar.getTypeCode() == libsbml.SBML_ALGEBRAIC_RULE );
    assertTrue( ar.getMetaId().equals("") == true );
    math = ar.getMath();
    assertTrue( math != null );
    formula = libsbml.formulaToString(math);
    assertTrue( formula != null );
    assertTrue(formula.equals( "1 + 1"));
    assertTrue(ar.getFormula().equals(formula));
    ar = null;
  }

  public void test_AlgebraicRule_createWithMath()
  {
    ASTNode math = libsbml.parseFormula("1 + 1");
    Rule ar = new  AlgebraicRule(2,4);
    ar.setMath(math);
    assertTrue( ar.getTypeCode() == libsbml.SBML_ALGEBRAIC_RULE );
    assertTrue( ar.getMetaId().equals("") == true );
    assertTrue(ar.getFormula().equals( "1 + 1"));
    assertTrue( !ar.getMath().equals(math) );
    ar = null;
  }

  public void test_AlgebraicRule_createWithNS()
  {
    XMLNamespaces xmlns = new  XMLNamespaces();
    xmlns.add( "http://www.sbml.org", "testsbml");
    SBMLNamespaces sbmlns = new  SBMLNamespaces(2,3);
    sbmlns.addNamespaces(xmlns);
    Rule r = new  AlgebraicRule(sbmlns);
    assertTrue( r.getTypeCode() == libsbml.SBML_ALGEBRAIC_RULE );
    assertTrue( r.getMetaId().equals("") == true );
    assertTrue( r.getNotes() == null );
    assertTrue( r.getAnnotation() == null );
    assertTrue( r.getLevel() == 2 );
    assertTrue( r.getVersion() == 3 );
    assertTrue( r.getNamespaces() != null );
    assertTrue( r.getNamespaces().getLength() == 2 );
    r = null;
  }

  public void test_AlgebraicRule_free_NULL()
  {
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
