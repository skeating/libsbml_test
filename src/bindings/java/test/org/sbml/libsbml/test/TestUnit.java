/*
 *
 * @file    TestUnit.java
 * @brief   Unit unit tests
 * @author  Akiya Jouraku (Java conversion)
 * @author  Ben Bornstein 
 *
 * $Id$
 * $Source$
 *
 * This test file was converted from src/sbml/test/TestUnit.c
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

public class TestUnit {

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

  private Unit U;

  protected void setUp() throws Exception
  {
    U = new  Unit();
    if (U == null);
    {
    }
  }

  protected void tearDown() throws Exception
  {
    U = null;
  }

  public void test_Unit_create()
  {
    assertTrue( U.getTypeCode() == libsbml.SBML_UNIT );
    assertTrue( U.getMetaId().equals("") == true );
    assertTrue( U.getNotes() == null );
    assertTrue( U.getAnnotation() == null );
    assertTrue( U.getKind() == libsbml.UNIT_KIND_INVALID );
    assertTrue( U.getExponent() == 1 );
    assertTrue( U.getScale() == 0 );
    assertTrue( U.getMultiplier() == 1.0 );
    assertEquals( false, U.isSetKind() );
  }

  public void test_Unit_createWith()
  {
    Unit u = new  Unit(libsbml.UNIT_KIND_SECOND,-2,1);
    assertTrue( u.getTypeCode() == libsbml.SBML_UNIT );
    assertTrue( u.getMetaId().equals("") == true );
    assertTrue( u.getNotes() == null );
    assertTrue( u.getAnnotation() == null );
    assertTrue( u.getKind() == libsbml.UNIT_KIND_SECOND );
    assertTrue( u.getExponent() == -2 );
    assertTrue( u.getScale() == 1 );
    assertTrue( u.getMultiplier() == 1.0 );
    assertTrue( u.getOffset() == 0.0 );
    assertEquals( true, u.isSetKind() );
    u = null;
  }

  public void test_Unit_free_NULL()
  {
  }

  public void test_Unit_isBuiltIn()
  {
    assertEquals( true, Unit.isBuiltIn( "substance",1) );
    assertEquals( true, Unit.isBuiltIn( "volume"   ,1) );
    assertEquals( false, Unit.isBuiltIn( "area"     ,1) );
    assertEquals( false, Unit.isBuiltIn( "length"   ,1) );
    assertEquals( true, Unit.isBuiltIn( "time"     ,1) );
    assertEquals( true, Unit.isBuiltIn( "substance",2) );
    assertEquals( true, Unit.isBuiltIn( "volume"   ,2) );
    assertEquals( true, Unit.isBuiltIn( "area"     ,2) );
    assertEquals( true, Unit.isBuiltIn( "length"   ,2) );
    assertEquals( true, Unit.isBuiltIn( "time"     ,2) );
    assertEquals( false, Unit.isBuiltIn("",1) );
    assertEquals( false, Unit.isBuiltIn( ""       ,1) );
    assertEquals( false, Unit.isBuiltIn( "volt"   ,1) );
    assertEquals( false, Unit.isBuiltIn( "foobar" ,1) );
    assertEquals( false, Unit.isBuiltIn("",2) );
    assertEquals( false, Unit.isBuiltIn( ""       ,2) );
    assertEquals( false, Unit.isBuiltIn( "volt"   ,2) );
    assertEquals( false, Unit.isBuiltIn( "foobar" ,2) );
  }

  public void test_Unit_isXXX()
  {
    assertEquals( false, U.isSetKind() );
    U.setKind(libsbml.UNIT_KIND_AMPERE);
    assertEquals( true, U.isAmpere() );
    U.setKind(libsbml.UNIT_KIND_BECQUEREL);
    assertEquals( true, U.isBecquerel() );
    U.setKind(libsbml.UNIT_KIND_CANDELA);
    assertEquals( true, U.isCandela() );
    U.setKind(libsbml.UNIT_KIND_CELSIUS);
    assertEquals( true, U.isCelsius() );
    U.setKind(libsbml.UNIT_KIND_COULOMB);
    assertEquals( true, U.isCoulomb() );
    U.setKind(libsbml.UNIT_KIND_DIMENSIONLESS);
    assertEquals( true, U.isDimensionless() );
    U.setKind(libsbml.UNIT_KIND_FARAD);
    assertEquals( true, U.isFarad() );
    U.setKind(libsbml.UNIT_KIND_GRAM);
    assertEquals( true, U.isGram() );
    U.setKind(libsbml.UNIT_KIND_GRAY);
    assertEquals( true, U.isGray() );
    U.setKind(libsbml.UNIT_KIND_HENRY);
    assertEquals( true, U.isHenry() );
    U.setKind(libsbml.UNIT_KIND_HERTZ);
    assertEquals( true, U.isHertz() );
    U.setKind(libsbml.UNIT_KIND_ITEM);
    assertEquals( true, U.isItem() );
    U.setKind(libsbml.UNIT_KIND_JOULE);
    assertEquals( true, U.isJoule() );
    U.setKind(libsbml.UNIT_KIND_KATAL);
    assertEquals( true, U.isKatal() );
    U.setKind(libsbml.UNIT_KIND_KELVIN);
    assertEquals( true, U.isKelvin() );
    U.setKind(libsbml.UNIT_KIND_KILOGRAM);
    assertEquals( true, U.isKilogram() );
    U.setKind(libsbml.UNIT_KIND_LITRE);
    assertEquals( true, U.isLitre() );
    U.setKind(libsbml.UNIT_KIND_LUMEN);
    assertEquals( true, U.isLumen() );
    U.setKind(libsbml.UNIT_KIND_LUX);
    assertEquals( true, U.isLux() );
    U.setKind(libsbml.UNIT_KIND_METRE);
    assertEquals( true, U.isMetre() );
    U.setKind(libsbml.UNIT_KIND_MOLE);
    assertEquals( true, U.isMole() );
    U.setKind(libsbml.UNIT_KIND_NEWTON);
    assertEquals( true, U.isNewton() );
    U.setKind(libsbml.UNIT_KIND_OHM);
    assertEquals( true, U.isOhm() );
    U.setKind(libsbml.UNIT_KIND_PASCAL);
    assertEquals( true, U.isPascal() );
    U.setKind(libsbml.UNIT_KIND_RADIAN);
    assertEquals( true, U.isRadian() );
    U.setKind(libsbml.UNIT_KIND_SECOND);
    assertEquals( true, U.isSecond() );
    U.setKind(libsbml.UNIT_KIND_SIEMENS);
    assertEquals( true, U.isSiemens() );
    U.setKind(libsbml.UNIT_KIND_SIEVERT);
    assertEquals( true, U.isSievert() );
    U.setKind(libsbml.UNIT_KIND_STERADIAN);
    assertEquals( true, U.isSteradian() );
    U.setKind(libsbml.UNIT_KIND_TESLA);
    assertEquals( true, U.isTesla() );
    U.setKind(libsbml.UNIT_KIND_VOLT);
    assertEquals( true, U.isVolt() );
    U.setKind(libsbml.UNIT_KIND_WATT);
    assertEquals( true, U.isWatt() );
    U.setKind(libsbml.UNIT_KIND_WEBER);
    assertEquals( true, U.isWeber() );
  }

  public void test_Unit_set_get()
  {
    Unit u = new  Unit();
    assertTrue( u.getKind() == libsbml.UNIT_KIND_INVALID );
    assertTrue( u.getExponent() == 1 );
    assertTrue( u.getScale() == 0 );
    assertTrue( u.getMultiplier() == 1.0 );
    assertEquals( false, u.isSetKind() );
    u.setKind(libsbml.UNIT_KIND_WATT);
    assertTrue( u.getKind() == libsbml.UNIT_KIND_WATT );
    u.setExponent(3);
    assertTrue( u.getExponent() == 3 );
    u.setScale(4);
    assertTrue( u.getScale() == 4 );
    u.setMultiplier(3.2);
    assertTrue( u.getMultiplier() == 3.2 );
    u = null;
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
