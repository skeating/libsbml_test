/*
 *
 * @file    TestSBMLError.java
 * @brief   SBMLError unit tests, C++ version
 *
 * @author  Akiya Jouraku (Java conversion)
 * @author  Sarah Keating 
 *
 * $Id$
 * $HeadURL$
 *
 * This test file was converted from src/sbml/test/TestSBMLError.cpp
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

public class TestSBMLError {

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

  public void test_SBMLError_create()
  {
    SBMLError error = new SBMLError();
    assertTrue( error != null );
    error = null;
    error = new SBMLError(libsbml.EmptyListInReaction);
    assertTrue( error.getErrorId() == libsbml.EmptyListInReaction );
    assertTrue( error.getSeverity() == libsbml.LIBSBML_SEV_ERROR );
    assertTrue( error.getSeverityAsString().equals( "Error" ) );
    assertTrue( error.getCategory() == libsbml.LIBSBML_CAT_SBML );
    assertTrue( error.getCategoryAsString().equals( "General SBML conformance") );
    error = null;
    error = new SBMLError(libsbml.OverdeterminedSystem,2,1);
    assertTrue( error.getErrorId() == libsbml.OverdeterminedSystem );
    assertTrue( error.getSeverity() == libsbml.LIBSBML_SEV_WARNING );
    assertTrue( error.getSeverityAsString().equals( "Warning" ) );
    assertTrue( error.getCategory() == libsbml.LIBSBML_CAT_SBML );
    assertTrue( error.getCategoryAsString().equals( "General SBML conformance") );
    error = null;
    error = new SBMLError(libsbml.OffsetNoLongerValid,2,2);
    assertTrue( error.getErrorId() == libsbml.OffsetNoLongerValid );
    assertTrue( error.getSeverity() == libsbml.LIBSBML_SEV_ERROR );
    assertTrue( error.getSeverityAsString().equals( "Error" ) );
    assertTrue( error.getCategory() == libsbml.LIBSBML_CAT_GENERAL_CONSISTENCY );
    assertTrue( error.getCategoryAsString().equals( "SBML component consistency") );
    error = null;
    error = new SBMLError(libsbml.NoSBOTermsInL1,2,2);
    assertTrue( error.getErrorId() == libsbml.NoSBOTermsInL1 );
    assertTrue( error.getSeverity() == libsbml.LIBSBML_SEV_WARNING );
    assertTrue( error.getSeverityAsString().equals( "Warning" ) );
    assertTrue( error.getCategory() == libsbml.LIBSBML_CAT_SBML_L1_COMPAT );
    assertTrue( error.getCategoryAsString().equals( "Translation to SBML L1V2") );
    error = null;
    error = new SBMLError(libsbml.DisallowedMathMLEncodingUse,2,2);
    assertTrue( error.getErrorId() == libsbml.DisallowedMathMLEncodingUse );
    assertTrue( error.getSeverity() == libsbml.LIBSBML_SEV_ERROR );
    assertTrue( error.getSeverityAsString().equals( "Error" ) );
    assertTrue( error.getCategory() == libsbml.LIBSBML_CAT_MATHML_CONSISTENCY );
    assertTrue( error.getShortMessage().equals( "Disallowed use of MathML 'encoding' attribute") );
    error = null;
    error = new SBMLError(libsbml.DisallowedMathMLEncodingUse,1,2);
    assertTrue( error.getErrorId() == libsbml.DisallowedMathMLEncodingUse );
    assertTrue( error.getSeverity() == libsbml.LIBSBML_SEV_NOT_APPLICABLE );
    assertTrue( error.getCategory() == libsbml.LIBSBML_CAT_MATHML_CONSISTENCY );
    error = null;
    error = new SBMLError(libsbml.UnknownError,2,4);
    assertTrue( error.getErrorId() == libsbml.UnknownError );
    assertTrue( error.getSeverity() == libsbml.LIBSBML_SEV_FATAL );
    assertTrue( error.getSeverityAsString().equals( "Fatal" ) );
    assertTrue( error.getCategory() == libsbml.LIBSBML_CAT_INTERNAL );
    assertTrue( error.getShortMessage().equals( "Unknown internal libSBML error") );
    error = null;
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
