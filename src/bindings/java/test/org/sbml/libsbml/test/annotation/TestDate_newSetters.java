/*
 *
 * @file    TestDate_newSetters.java
 * @brief   Date unit tests
 *
 * @author  Akiya Jouraku (Java conversion)
 * @author  Sarah Keating 
 *
 * $Id$
 * $HeadURL$
 *
 * This test file was converted from src/sbml/test/TestDate_newSetters.c
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


package org.sbml.libsbml.test.annotation;

import org.sbml.libsbml.*;

import java.io.File;
import java.lang.AssertionError;

public class TestDate_newSetters {

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

  public void test_Date_setDateAsString()
  {
    Date date = new  Date(2007,10,23,14,15,16,1,3,0);
    assertTrue( date != null );
    long i = date.setDateAsString( "20081-12-30T12:15:45+02:00");
    assertTrue( i == libsbml.LIBSBML_INVALID_ATTRIBUTE_VALUE );
    assertTrue(date.getDateAsString().equals(                                "2007-10-23T14:15:16+03:00"));
    i = date.setDateAsString( "200-12-30T12:15:45+02:00");
    assertTrue( i == libsbml.LIBSBML_INVALID_ATTRIBUTE_VALUE );
    assertTrue(date.getDateAsString().equals(                                "2007-10-23T14:15:16+03:00"));
    i = date.setDateAsString("");
    assertTrue( i == libsbml.LIBSBML_OPERATION_SUCCESS );
    assertTrue(date.getDateAsString().equals(                            "2000-01-01T00:00:00Z"));
    i = date.setDateAsString( "2008-12-30T12:15:45+02:00");
    assertTrue( i == libsbml.LIBSBML_OPERATION_SUCCESS );
    assertTrue( date.getYear() == 2008 );
    assertTrue( date.getMonth() == 12 );
    assertTrue( date.getDay() == 30 );
    assertTrue( date.getHour() == 12 );
    assertTrue( date.getMinute() == 15 );
    assertTrue( date.getSecond() == 45 );
    assertTrue( date.getSignOffset() == 1 );
    assertTrue( date.getHoursOffset() == 2 );
    assertTrue( date.getMinutesOffset() == 0 );
    date = null;
  }

  public void test_Date_setDay()
  {
    Date date = new  Date(2005,2,12,12,15,45,1,2,0);
    assertTrue( date != null );
    long i = date.setDay(29);
    assertTrue( i == libsbml.LIBSBML_INVALID_ATTRIBUTE_VALUE );
    assertTrue( date.getDay() == 1 );
    i = date.setDay(31);
    assertTrue( i == libsbml.LIBSBML_INVALID_ATTRIBUTE_VALUE );
    assertTrue( date.getDay() == 1 );
    i = date.setDay(15);
    assertTrue( i == libsbml.LIBSBML_OPERATION_SUCCESS );
    assertTrue( date.getDay() == 15 );
    assertTrue(date.getDateAsString().equals(                            "2005-02-15T12:15:45+02:00"));
    date = null;
  }

  public void test_Date_setHour()
  {
    Date date = new  Date(2005,12,30,12,15,45,1,2,0);
    assertTrue( date != null );
    long i = date.setHour(434);
    assertTrue( i == libsbml.LIBSBML_INVALID_ATTRIBUTE_VALUE );
    assertTrue( date.getHour() == 0 );
    i = date.setHour(12121);
    assertTrue( i == libsbml.LIBSBML_INVALID_ATTRIBUTE_VALUE );
    assertTrue( date.getHour() == 0 );
    i = date.setHour(9);
    assertTrue( i == libsbml.LIBSBML_OPERATION_SUCCESS );
    assertTrue( date.getHour() == 9 );
    assertTrue(date.getDateAsString().equals(                            "2005-12-30T09:15:45+02:00"));
    date = null;
  }

  public void test_Date_setHoursOffset()
  {
    Date date = new  Date(2005,12,30,12,15,45,1,2,0);
    assertTrue( date != null );
    long i = date.setHoursOffset(434);
    assertTrue( i == libsbml.LIBSBML_INVALID_ATTRIBUTE_VALUE );
    assertTrue( date.getHoursOffset() == 0 );
    i = date.setHoursOffset(-3);
    assertTrue( i == libsbml.LIBSBML_INVALID_ATTRIBUTE_VALUE );
    assertTrue( date.getHoursOffset() == 0 );
    i = date.setHoursOffset(11);
    assertTrue( i == libsbml.LIBSBML_OPERATION_SUCCESS );
    assertTrue( date.getHoursOffset() == 11 );
    assertTrue(date.getDateAsString().equals(                            "2005-12-30T12:15:45+11:00"));
    date = null;
  }

  public void test_Date_setMinute()
  {
    Date date = new  Date(2005,12,30,12,15,45,1,2,0);
    assertTrue( date != null );
    long i = date.setMinute(434);
    assertTrue( i == libsbml.LIBSBML_INVALID_ATTRIBUTE_VALUE );
    assertTrue( date.getMinute() == 0 );
    i = date.setMinute(12121);
    assertTrue( i == libsbml.LIBSBML_INVALID_ATTRIBUTE_VALUE );
    assertTrue( date.getMinute() == 0 );
    i = date.setMinute(32);
    assertTrue( i == libsbml.LIBSBML_OPERATION_SUCCESS );
    assertTrue( date.getMinute() == 32 );
    assertTrue(date.getDateAsString().equals(                            "2005-12-30T12:32:45+02:00"));
    date = null;
  }

  public void test_Date_setMinutesOffset()
  {
    Date date = new  Date(2005,12,30,12,15,45,1,2,0);
    assertTrue( date != null );
    long i = date.setMinutesOffset(434);
    assertTrue( i == libsbml.LIBSBML_INVALID_ATTRIBUTE_VALUE );
    assertTrue( date.getMinutesOffset() == 0 );
    i = date.setMinutesOffset(60);
    assertTrue( i == libsbml.LIBSBML_INVALID_ATTRIBUTE_VALUE );
    assertTrue( date.getMinutesOffset() == 0 );
    i = date.setMinutesOffset(45);
    assertTrue( i == libsbml.LIBSBML_OPERATION_SUCCESS );
    assertTrue( date.getMinutesOffset() == 45 );
    assertTrue(date.getDateAsString().equals(                            "2005-12-30T12:15:45+02:45"));
    date = null;
  }

  public void test_Date_setMonth()
  {
    Date date = new  Date(2005,12,30,12,15,45,1,2,0);
    assertTrue( date != null );
    long i = date.setMonth(434);
    assertTrue( i == libsbml.LIBSBML_INVALID_ATTRIBUTE_VALUE );
    assertTrue( date.getMonth() == 1 );
    i = date.setMonth(12121);
    assertTrue( i == libsbml.LIBSBML_INVALID_ATTRIBUTE_VALUE );
    assertTrue( date.getMonth() == 1 );
    i = date.setMonth(11);
    assertTrue( i == libsbml.LIBSBML_OPERATION_SUCCESS );
    assertTrue( date.getMonth() == 11 );
    assertTrue(date.getDateAsString().equals(                            "2005-11-30T12:15:45+02:00"));
    date = null;
  }

  public void test_Date_setOffsetSign()
  {
    Date date = new  Date(2005,12,30,12,15,45,1,2,0);
    assertTrue( date != null );
    long i = date.setSignOffset(2);
    assertTrue( i == libsbml.LIBSBML_INVALID_ATTRIBUTE_VALUE );
    assertTrue( date.getSignOffset() == 0 );
    i = date.setSignOffset(-4);
    assertTrue( i == libsbml.LIBSBML_INVALID_ATTRIBUTE_VALUE );
    assertTrue( date.getSignOffset() == 0 );
    i = date.setSignOffset(0);
    assertTrue( i == libsbml.LIBSBML_OPERATION_SUCCESS );
    assertTrue( date.getSignOffset() == 0 );
    assertTrue(date.getDateAsString().equals(                            "2005-12-30T12:15:45-02:00"));
    date = null;
  }

  public void test_Date_setSecond()
  {
    Date date = new  Date(2005,12,30,12,15,45,1,2,0);
    assertTrue( date != null );
    long i = date.setSecond(434);
    assertTrue( i == libsbml.LIBSBML_INVALID_ATTRIBUTE_VALUE );
    assertTrue( date.getSecond() == 0 );
    i = date.setSecond(12121);
    assertTrue( i == libsbml.LIBSBML_INVALID_ATTRIBUTE_VALUE );
    assertTrue( date.getSecond() == 0 );
    i = date.setSecond(32);
    assertTrue( i == libsbml.LIBSBML_OPERATION_SUCCESS );
    assertTrue( date.getSecond() == 32 );
    assertTrue(date.getDateAsString().equals(                            "2005-12-30T12:15:32+02:00"));
    date = null;
  }

  public void test_Date_setYear()
  {
    Date date = new  Date(2005,12,30,12,15,45,1,2,0);
    assertTrue( date != null );
    long i = date.setYear(434);
    assertTrue( i == libsbml.LIBSBML_INVALID_ATTRIBUTE_VALUE );
    assertTrue( date.getYear() == 2000 );
    i = date.setYear(12121);
    assertTrue( i == libsbml.LIBSBML_INVALID_ATTRIBUTE_VALUE );
    assertTrue( date.getYear() == 2000 );
    i = date.setYear(2008);
    assertTrue( i == libsbml.LIBSBML_OPERATION_SUCCESS );
    assertTrue( date.getYear() == 2008 );
    assertTrue(date.getDateAsString().equals(                            "2008-12-30T12:15:45+02:00"));
    date = null;
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
