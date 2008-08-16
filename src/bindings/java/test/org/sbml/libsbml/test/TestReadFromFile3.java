/*
 *
 * @file    TestReadFromFile3.java
 * @brief   Reads tests/l1v1-rules.xml into memory and tests it.
 *
 * @author  Akiya Jouraku (Java conversion)
 * @author  Ben Bornstein 
 *
 * $Id:$
 * $HeadURL:$
 *
 * This test file was converted from src/sbml/test/TestReadFromFile3.c
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

public class TestReadFromFile3 {

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

  public void test_read_l1v1_rules()
  {
    SBMLDocument d;
    Model m;
    Compartment c;
    KineticLaw kl;
    Parameter p;
    Rule pr;
    Reaction r;
    Species s;
    Rule scr;
    SpeciesReference sr;
    UnitDefinition ud;
    String filename = "../../sbml/test/test-data/l1v1-rules.xml";
    d = libsbml.readSBML(filename);
    if (d == null);
    {
    }
    assertTrue( d.getLevel() == 1 );
    assertTrue( d.getVersion() == 1 );
    m = d.getModel();
    assertTrue( m.getNumCompartments() == 1 );
    c = m.getCompartment(0);
    assertTrue(c.getName().equals( "cell"));
    assertTrue( c.getVolume() == 1 );
    assertTrue( m.getNumSpecies() == 6 );
    s = m.getSpecies(0);
    assertTrue(s.getName().equals( "s1"   ));
    assertTrue(s.getCompartment().equals( "cell" ));
    assertTrue( s.getInitialAmount() == 4 );
    assertTrue( s.getBoundaryCondition() == false );
    s = m.getSpecies(1);
    assertTrue(s.getName().equals( "s2"   ));
    assertTrue(s.getCompartment().equals( "cell" ));
    assertTrue( s.getInitialAmount() == 2 );
    assertTrue( s.getBoundaryCondition() == false );
    s = m.getSpecies(2);
    assertTrue(s.getName().equals( "x0"   ));
    assertTrue(s.getCompartment().equals( "cell" ));
    assertTrue( s.getInitialAmount() == 1 );
    assertTrue( s.getBoundaryCondition() == false );
    s = m.getSpecies(3);
    assertTrue(s.getName().equals( "x1"   ));
    assertTrue(s.getCompartment().equals( "cell" ));
    assertTrue( s.getInitialAmount() == 0 );
    assertTrue( s.getBoundaryCondition() == false );
    s = m.getSpecies(4);
    assertTrue(s.getName().equals( "x2"   ));
    assertTrue(s.getCompartment().equals( "cell" ));
    assertTrue( s.getInitialAmount() == 1 );
    assertTrue( s.getBoundaryCondition() == false );
    s = m.getSpecies(5);
    assertTrue(s.getName().equals( "x3"   ));
    assertTrue(s.getCompartment().equals( "cell" ));
    assertTrue( s.getInitialAmount() == 0 );
    assertTrue( s.getBoundaryCondition() == false );
    assertTrue( m.getNumParameters() == 7 );
    p = m.getParameter(0);
    assertTrue(p.getName().equals( "k1"));
    assertTrue( p.getValue() == 1.2 );
    p = m.getParameter(1);
    assertTrue(p.getName().equals( "k2"));
    assertTrue( p.getValue() == 1000 );
    p = m.getParameter(2);
    assertTrue(p.getName().equals( "k3"));
    assertTrue( p.getValue() == 3000 );
    p = m.getParameter(3);
    assertTrue(p.getName().equals( "k4"));
    assertTrue( p.getValue() == 4.5 );
    assertTrue( m.getNumRules() == 4 );
    pr = m.getRule(0);
    assertTrue(pr.getVariable().equals( "t"));
    assertTrue(pr.getFormula().equals( "s1 + s2"));
    ud = pr.getDerivedUnitDefinition();
    assertTrue( ud.getNumUnits() == 2 );
    assertTrue( ud.getUnit(0).getKind() == libsbml.UNIT_KIND_MOLE );
    assertTrue( ud.getUnit(0).getExponent() == 1 );
    assertTrue( ud.getUnit(1).getKind() == libsbml.UNIT_KIND_LITRE );
    assertTrue( ud.getUnit(1).getExponent() == -1 );
    assertTrue( pr.containsUndeclaredUnits() == false );
    pr = m.getRule(1);
    assertTrue(pr.getVariable().equals( "k"));
    assertTrue(pr.getFormula().equals( "k3/k2"));
    ud = pr.getDerivedUnitDefinition();
    assertTrue( ud.getNumUnits() == 0 );
    assertTrue( pr.containsUndeclaredUnits() == true );
    scr = m.getRule(2);
    assertTrue(scr.getVariable().equals( "x2"));
    assertTrue(scr.getFormula().equals( "k * (s1+s2)/(1 + k)"));
    scr = m.getRule(3);
    assertTrue(scr.getVariable().equals( "x3"));
    assertTrue(scr.getFormula().equals( "p*(t - s2)"));
    assertTrue( m.getNumReactions() == 2 );
    r = m.getReaction(0);
    assertTrue(r.getName().equals( "j1"));
    assertTrue( r.getReversible() != false );
    assertTrue( r.getFast() == false );
    r = m.getReaction(1);
    assertTrue(r.getName().equals( "j3"));
    assertTrue( r.getReversible() != false );
    assertTrue( r.getFast() == false );
    r = m.getReaction(0);
    assertTrue( r.getNumReactants() == 1 );
    assertTrue( r.getNumProducts() == 1 );
    sr = r.getReactant(0);
    assertTrue(sr.getSpecies().equals( "x0"));
    assertTrue( sr.getStoichiometry() == 1 );
    assertTrue( sr.getDenominator() == 1 );
    sr = r.getProduct(0);
    assertTrue(sr.getSpecies().equals( "s1"));
    assertTrue( sr.getStoichiometry() == 1 );
    assertTrue( sr.getDenominator() == 1 );
    kl = r.getKineticLaw();
    assertTrue(kl.getFormula().equals( "k1 * x0"));
    r = m.getReaction(1);
    assertTrue( r.getNumReactants() == 1 );
    assertTrue( r.getNumProducts() == 1 );
    sr = r.getReactant(0);
    assertTrue(sr.getSpecies().equals( "s2"));
    assertTrue( sr.getStoichiometry() == 1 );
    assertTrue( sr.getDenominator() == 1 );
    sr = r.getProduct(0);
    assertTrue(sr.getSpecies().equals( "x1"));
    assertTrue( sr.getStoichiometry() == 1 );
    assertTrue( sr.getDenominator() == 1 );
    kl = r.getKineticLaw();
    assertTrue(kl.getFormula().equals( "k4 * s2"));
    d = null;
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
