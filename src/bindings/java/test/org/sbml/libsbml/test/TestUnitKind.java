/*
 *
 * @file    TestUnitKind.java
 * @brief   UnitKind enumeration unit tests
 *
 * @author  Akiya Jouraku (Java conversion)
 * @author  Ben Bornstein 
 *
 * $Id:$
 * $HeadURL:$
 *
 * This test file was converted from src/sbml/test/TestUnitKind.c
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

public class TestUnitKind {

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

  public void test_UnitKind_equals()
  {
    assertEquals( 1, libsbml.UnitKind_equals(libsbml.UNIT_KIND_AMPERE,libsbml.UNIT_KIND_AMPERE) );
    assertEquals( 1, libsbml.UnitKind_equals(libsbml.UNIT_KIND_INVALID,libsbml.UNIT_KIND_INVALID) );
    assertEquals( 1, libsbml.UnitKind_equals(libsbml.UNIT_KIND_LITER,libsbml.UNIT_KIND_LITER) );
    assertEquals( 1, libsbml.UnitKind_equals(libsbml.UNIT_KIND_LITRE,libsbml.UNIT_KIND_LITRE) );
    assertEquals( 1, libsbml.UnitKind_equals(libsbml.UNIT_KIND_METER,libsbml.UNIT_KIND_METER) );
    assertEquals( 1, libsbml.UnitKind_equals(libsbml.UNIT_KIND_METRE,libsbml.UNIT_KIND_METRE) );
    assertEquals( 1, libsbml.UnitKind_equals(libsbml.UNIT_KIND_LITER,libsbml.UNIT_KIND_LITRE) );
    assertEquals( 1, libsbml.UnitKind_equals(libsbml.UNIT_KIND_LITRE,libsbml.UNIT_KIND_LITER) );
    assertEquals( 1, libsbml.UnitKind_equals(libsbml.UNIT_KIND_METER,libsbml.UNIT_KIND_METRE) );
    assertEquals( 1, libsbml.UnitKind_equals(libsbml.UNIT_KIND_METRE,libsbml.UNIT_KIND_METER) );
    assertEquals( 0, libsbml.UnitKind_equals(libsbml.UNIT_KIND_AMPERE,libsbml.UNIT_KIND_WEBER) );
  }

  public void test_UnitKind_forName()
  {
    assertTrue( libsbml.UnitKind_forName("ampere") == libsbml.UNIT_KIND_AMPERE );
    assertTrue( libsbml.UnitKind_forName("becquerel") == libsbml.UNIT_KIND_BECQUEREL );
    assertTrue( libsbml.UnitKind_forName("candela") == libsbml.UNIT_KIND_CANDELA );
    assertTrue( libsbml.UnitKind_forName("Celsius") == libsbml.UNIT_KIND_CELSIUS );
    assertTrue( libsbml.UnitKind_forName("coulomb") == libsbml.UNIT_KIND_COULOMB );
    assertTrue( libsbml.UnitKind_forName("dimensionless") == libsbml.UNIT_KIND_DIMENSIONLESS );
    assertTrue( libsbml.UnitKind_forName("farad") == libsbml.UNIT_KIND_FARAD );
    assertTrue( libsbml.UnitKind_forName("gram") == libsbml.UNIT_KIND_GRAM );
    assertTrue( libsbml.UnitKind_forName("gray") == libsbml.UNIT_KIND_GRAY );
    assertTrue( libsbml.UnitKind_forName("henry") == libsbml.UNIT_KIND_HENRY );
    assertTrue( libsbml.UnitKind_forName("hertz") == libsbml.UNIT_KIND_HERTZ );
    assertTrue( libsbml.UnitKind_forName("item") == libsbml.UNIT_KIND_ITEM );
    assertTrue( libsbml.UnitKind_forName("joule") == libsbml.UNIT_KIND_JOULE );
    assertTrue( libsbml.UnitKind_forName("katal") == libsbml.UNIT_KIND_KATAL );
    assertTrue( libsbml.UnitKind_forName("kelvin") == libsbml.UNIT_KIND_KELVIN );
    assertTrue( libsbml.UnitKind_forName("kilogram") == libsbml.UNIT_KIND_KILOGRAM );
    assertTrue( libsbml.UnitKind_forName("liter") == libsbml.UNIT_KIND_LITER );
    assertTrue( libsbml.UnitKind_forName("litre") == libsbml.UNIT_KIND_LITRE );
    assertTrue( libsbml.UnitKind_forName("lumen") == libsbml.UNIT_KIND_LUMEN );
    assertTrue( libsbml.UnitKind_forName("lux") == libsbml.UNIT_KIND_LUX );
    assertTrue( libsbml.UnitKind_forName("meter") == libsbml.UNIT_KIND_METER );
    assertTrue( libsbml.UnitKind_forName("metre") == libsbml.UNIT_KIND_METRE );
    assertTrue( libsbml.UnitKind_forName("mole") == libsbml.UNIT_KIND_MOLE );
    assertTrue( libsbml.UnitKind_forName("newton") == libsbml.UNIT_KIND_NEWTON );
    assertTrue( libsbml.UnitKind_forName("ohm") == libsbml.UNIT_KIND_OHM );
    assertTrue( libsbml.UnitKind_forName("pascal") == libsbml.UNIT_KIND_PASCAL );
    assertTrue( libsbml.UnitKind_forName("radian") == libsbml.UNIT_KIND_RADIAN );
    assertTrue( libsbml.UnitKind_forName("second") == libsbml.UNIT_KIND_SECOND );
    assertTrue( libsbml.UnitKind_forName("siemens") == libsbml.UNIT_KIND_SIEMENS );
    assertTrue( libsbml.UnitKind_forName("sievert") == libsbml.UNIT_KIND_SIEVERT );
    assertTrue( libsbml.UnitKind_forName("steradian") == libsbml.UNIT_KIND_STERADIAN );
    assertTrue( libsbml.UnitKind_forName("tesla") == libsbml.UNIT_KIND_TESLA );
    assertTrue( libsbml.UnitKind_forName("volt") == libsbml.UNIT_KIND_VOLT );
    assertTrue( libsbml.UnitKind_forName("watt") == libsbml.UNIT_KIND_WATT );
    assertTrue( libsbml.UnitKind_forName("weber") == libsbml.UNIT_KIND_WEBER );
    assertTrue( libsbml.UnitKind_forName(null) == libsbml.UNIT_KIND_INVALID );
    assertTrue( libsbml.UnitKind_forName("") == libsbml.UNIT_KIND_INVALID );
    assertTrue( libsbml.UnitKind_forName("foobar") == libsbml.UNIT_KIND_INVALID );
  }

  public void test_UnitKind_isValidUnitKindString()
  {
    assertEquals( 0, libsbml.UnitKind_isValidUnitKindString("fun-foam-unit for kids!",1,1) );
    assertEquals( 1, libsbml.UnitKind_isValidUnitKindString("litre",2,2) );
    assertEquals( 0, libsbml.UnitKind_isValidUnitKindString("liter",2,2) );
    assertEquals( 1, libsbml.UnitKind_isValidUnitKindString("liter",1,2) );
    assertEquals( 0, libsbml.UnitKind_isValidUnitKindString("meter",2,3) );
    assertEquals( 1, libsbml.UnitKind_isValidUnitKindString("metre",2,1) );
    assertEquals( 1, libsbml.UnitKind_isValidUnitKindString("meter",1,2) );
    assertEquals( 1, libsbml.UnitKind_isValidUnitKindString("Celsius",2,1) );
    assertEquals( 0, libsbml.UnitKind_isValidUnitKindString("Celsius",2,2) );
  }

  public void test_UnitKind_toString()
  {
    String s;
    s = libsbml.UnitKind_toString(libsbml.UNIT_KIND_AMPERE);
    assertTrue(s.equals( "ampere"));
    s = libsbml.UnitKind_toString(libsbml.UNIT_KIND_BECQUEREL);
    assertTrue(s.equals( "becquerel"));
    s = libsbml.UnitKind_toString(libsbml.UNIT_KIND_CANDELA);
    assertTrue(s.equals( "candela"));
    s = libsbml.UnitKind_toString(libsbml.UNIT_KIND_CELSIUS);
    assertTrue(s.equals( "Celsius"));
    s = libsbml.UnitKind_toString(libsbml.UNIT_KIND_COULOMB);
    assertTrue(s.equals( "coulomb"));
    s = libsbml.UnitKind_toString(libsbml.UNIT_KIND_DIMENSIONLESS);
    assertTrue(s.equals( "dimensionless"));
    s = libsbml.UnitKind_toString(libsbml.UNIT_KIND_FARAD);
    assertTrue(s.equals( "farad"));
    s = libsbml.UnitKind_toString(libsbml.UNIT_KIND_GRAM);
    assertTrue(s.equals( "gram"));
    s = libsbml.UnitKind_toString(libsbml.UNIT_KIND_GRAY);
    assertTrue(s.equals( "gray"));
    s = libsbml.UnitKind_toString(libsbml.UNIT_KIND_HENRY);
    assertTrue(s.equals( "henry"));
    s = libsbml.UnitKind_toString(libsbml.UNIT_KIND_HERTZ);
    assertTrue(s.equals( "hertz"));
    s = libsbml.UnitKind_toString(libsbml.UNIT_KIND_ITEM);
    assertTrue(s.equals( "item"));
    s = libsbml.UnitKind_toString(libsbml.UNIT_KIND_JOULE);
    assertTrue(s.equals( "joule"));
    s = libsbml.UnitKind_toString(libsbml.UNIT_KIND_KATAL);
    assertTrue(s.equals( "katal"));
    s = libsbml.UnitKind_toString(libsbml.UNIT_KIND_KELVIN);
    assertTrue(s.equals( "kelvin"));
    s = libsbml.UnitKind_toString(libsbml.UNIT_KIND_KILOGRAM);
    assertTrue(s.equals( "kilogram"));
    s = libsbml.UnitKind_toString(libsbml.UNIT_KIND_LITER);
    assertTrue(s.equals( "liter"));
    s = libsbml.UnitKind_toString(libsbml.UNIT_KIND_LITRE);
    assertTrue(s.equals( "litre"));
    s = libsbml.UnitKind_toString(libsbml.UNIT_KIND_LUMEN);
    assertTrue(s.equals( "lumen"));
    s = libsbml.UnitKind_toString(libsbml.UNIT_KIND_LUX);
    assertTrue(s.equals( "lux"));
    s = libsbml.UnitKind_toString(libsbml.UNIT_KIND_METER);
    assertTrue(s.equals( "meter"));
    s = libsbml.UnitKind_toString(libsbml.UNIT_KIND_METRE);
    assertTrue(s.equals( "metre"));
    s = libsbml.UnitKind_toString(libsbml.UNIT_KIND_MOLE);
    assertTrue(s.equals( "mole"));
    s = libsbml.UnitKind_toString(libsbml.UNIT_KIND_NEWTON);
    assertTrue(s.equals( "newton"));
    s = libsbml.UnitKind_toString(libsbml.UNIT_KIND_OHM);
    assertTrue(s.equals( "ohm"));
    s = libsbml.UnitKind_toString(libsbml.UNIT_KIND_PASCAL);
    assertTrue(s.equals( "pascal"));
    s = libsbml.UnitKind_toString(libsbml.UNIT_KIND_RADIAN);
    assertTrue(s.equals( "radian"));
    s = libsbml.UnitKind_toString(libsbml.UNIT_KIND_SECOND);
    assertTrue(s.equals( "second"));
    s = libsbml.UnitKind_toString(libsbml.UNIT_KIND_SIEMENS);
    assertTrue(s.equals( "siemens"));
    s = libsbml.UnitKind_toString(libsbml.UNIT_KIND_SIEVERT);
    assertTrue(s.equals( "sievert"));
    s = libsbml.UnitKind_toString(libsbml.UNIT_KIND_STERADIAN);
    assertTrue(s.equals( "steradian"));
    s = libsbml.UnitKind_toString(libsbml.UNIT_KIND_TESLA);
    assertTrue(s.equals( "tesla"));
    s = libsbml.UnitKind_toString(libsbml.UNIT_KIND_VOLT);
    assertTrue(s.equals( "volt"));
    s = libsbml.UnitKind_toString(libsbml.UNIT_KIND_WATT);
    assertTrue(s.equals( "watt"));
    s = libsbml.UnitKind_toString(libsbml.UNIT_KIND_WEBER);
    assertTrue(s.equals( "weber"));
    s = libsbml.UnitKind_toString(libsbml.UNIT_KIND_INVALID);
    assertTrue(s.equals( "(Invalid UnitKind)"));
    s = libsbml.UnitKind_toString(-1);
    assertTrue(s.equals( "(Invalid UnitKind)"));
    s = libsbml.UnitKind_toString(libsbml.UNIT_KIND_INVALID + 1);
    assertTrue(s.equals( "(Invalid UnitKind)"));
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
