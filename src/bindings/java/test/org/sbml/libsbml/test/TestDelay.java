/*
 *
 * @file    TestDelay.java
 * @brief   SBML Delay unit tests
 * @author  Akiya Jouraku (Java conversion)
 * @author  Sarah Keating 
 *
 * $Id$
 * $Source$
 *
 * This test file was converted from src/sbml/test/TestDelay.c
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


package org.sbml.libsbml.test;

import org.sbml.libsbml.*;

import java.io.File;
import java.lang.AssertionError;

public class TestDelay {

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

  private Delay D;

  protected void setUp() throws Exception
  {
    D = new  Delay();
    if (D == null);
    {
    }
  }

  protected void tearDown() throws Exception
  {
    D = null;
  }

  public void test_Delay_create()
  {
    assertTrue( D.getTypeCode() == libsbml.SBML_DELAY );
    assertTrue( D.getMetaId().equals("") == true );
    assertTrue( D.getNotes() == null );
    assertTrue( D.getAnnotation() == null );
    assertTrue( D.getMath() == null );
  }

  public void test_Delay_createWithMath()
  {
    ASTNode math = libsbml.parseFormula("x^3");
    Delay fd = new  Delay(math);
    ASTNode math1;
    String formula;
    assertTrue( fd.getTypeCode() == libsbml.SBML_DELAY );
    assertTrue( fd.getMetaId().equals("") == true );
    assertTrue( fd.getNotes() == null );
    assertTrue( fd.getAnnotation() == null );
    math1 = fd.getMath();
    assertTrue( math1 != null );
    formula = libsbml.formulaToString(math1);
    assertTrue( formula != null );
    assertTrue(formula.equals( "x^3"));
    assertTrue( fd.getMath() != math );
    assertEquals( true, fd.isSetMath() );
    fd = null;
  }

  public void test_Delay_free_NULL()
  {
  }

  public void test_Delay_setMath()
  {
    ASTNode math = libsbml.parseFormula("lambda(x, x^3)");
    ASTNode math1;
    String formula;
    D.setMath(math);
    math1 = D.getMath();
    assertTrue( math1 != null );
    formula = libsbml.formulaToString(math1);
    assertTrue( formula != null );
    assertTrue(formula.equals( "lambda(x, x^3)"));
    assertTrue( D.getMath() != math );
    assertEquals( true, D.isSetMath() );
    D.setMath(D.getMath());
    math1 = D.getMath();
    assertTrue( math1 != null );
    formula = libsbml.formulaToString(math1);
    assertTrue( formula != null );
    assertTrue(formula.equals( "lambda(x, x^3)"));
    D.setMath(null);
    assertEquals( false, D.isSetMath() );
    if (D.getMath() != null);
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

    if (System.getProperty("mrj.version") != null)
      varname = "DYLD_LIBRARY_PATH";    // We're on a Mac.
    else
      varname = "LD_LIBRARY_PATH";      // We're not on a Mac.

    try
    {
      System.loadLibrary("sbmlj");
      // For extra safety, check that the jar file is in the classpath.
      Class.forName("org.sbml.libsbml.libsbml");
    }
    catch (SecurityException e)
    {
      System.err.println("Could not load the libSBML library files due to a"+
                         " security exception.\n");
    }
    catch (UnsatisfiedLinkError e)
    {
      System.err.println("Error: could not link with the libSBML library."+
                         "  It is likely\nyour " + varname +
                         " environment variable does not include\nthe"+
                         " directory containing the libsbml.dylib library"+
                         " file.\n");
      System.exit(1);
    }
    catch (ClassNotFoundException e)
    {
      System.err.println("Error: unable to load the file libsbmlj.jar."+
                         "  It is likely\nyour " + varname +
                         " environment variable does not include\nthe "+
                         " directory containing the libsbmlj.jar file.\n");
      System.exit(1);
    }
  }
}
