/*
 *
 * @file    TestReadFromFile2.java
 * @brief   Reads tests/l1v1-units.xml into memory and tests it.
 *
 * @author  Akiya Jouraku (Java conversion)
 * @author  Ben Bornstein 
 *
 * $Id:$
 * $HeadURL:$
 *
 * This test file was converted from src/sbml/test/TestReadFromFile2.c
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

public class TestReadFromFile2 {

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

  public void test_create_l1v1_units()
  {
    SBMLDocument d;
    Model m;
    Compartment c;
    KineticLaw kl;
    Parameter p;
    Reaction r;
    Species s;
    SpeciesReference sr;
    Unit u;
    UnitDefinition ud;
    d = new  SBMLDocument();
    m = new  Model();
    d.setModel(m);
    ud = m.createUnitDefinition();
    ud.setName( "substance");
    u = m.createUnit();
    u.setKind(libsbml.UNIT_KIND_MOLE);
    u.setScale(-3);
    ud = m.createUnitDefinition();
    ud.setName( "mls");
    u = m.createUnit();
    u.setKind(libsbml.UNIT_KIND_MOLE);
    u.setScale(-3);
    u = m.createUnit();
    u.setKind(libsbml.UNIT_KIND_LITER);
    u.setExponent(-1);
    u = m.createUnit();
    u.setKind(libsbml.UNIT_KIND_SECOND);
    u.setExponent(-1);
    c = m.createCompartment();
    c.setName( "cell");
    s = m.createSpecies();
    s.setName( "x0");
    s.setCompartment( "cell");
    s.setInitialAmount(1);
    s = m.createSpecies();
    s.setName( "x1");
    s.setCompartment( "cell");
    s.setInitialAmount(1);
    s = m.createSpecies();
    s.setName( "s1");
    s.setCompartment( "cell");
    s.setInitialAmount(1);
    s = m.createSpecies();
    s.setName( "s2");
    s.setCompartment( "cell");
    s.setInitialAmount(1);
    p = m.createParameter();
    p.setName( "vm");
    p.setUnits( "mls");
    p.setValue(2);
    p = m.createParameter();
    p.setName( "km");
    p.setValue(2);
    r = m.createReaction();
    r.setName( "v1");
    sr = m.createReactant();
    sr.setSpecies( "x0");
    sr = m.createProduct();
    sr.setSpecies( "s1");
    kl = m.createKineticLaw();
    kl.setFormula( "(vm * s1)/(km + s1)");
    r = m.createReaction();
    r.setName( "v2");
    sr = m.createReactant();
    sr.setSpecies( "s1");
    sr = m.createProduct();
    sr.setSpecies( "s2");
    kl = m.createKineticLaw();
    kl.setFormula( "(vm * s2)/(km + s2)");
    r = m.createReaction();
    r.setName( "v3");
    sr = m.createReactant();
    sr.setSpecies( "s2");
    sr = m.createProduct();
    sr.setSpecies( "x1");
    kl = m.createKineticLaw();
    kl.setFormula( "(vm * s1)/(km + s1)");
    d = null;
  }

  public void test_read_l1v1_units()
  {
    SBMLDocument d;
    Model m;
    Compartment c;
    KineticLaw kl;
    Parameter p;
    Reaction r;
    Species s;
    SpeciesReference sr;
    Unit u;
    UnitDefinition ud;
    String filename = "../../sbml/test/test-data/l1v1-units.xml";
    d = libsbml.readSBML(filename);
    if (d == null);
    {
    }
    assertTrue( d.getLevel() == 1 );
    assertTrue( d.getVersion() == 1 );
    m = d.getModel();
    assertTrue( m.getNumUnitDefinitions() == 2 );
    ud = m.getUnitDefinition(0);
    assertTrue(ud.getName().equals( "substance"));
    ud = m.getUnitDefinition(1);
    assertTrue(ud.getName().equals( "mls"));
    ud = m.getUnitDefinition(0);
    assertTrue( ud.getNumUnits() == 1 );
    u = ud.getUnit(0);
    assertTrue( u.getKind() == libsbml.UNIT_KIND_MOLE );
    assertTrue( u.getExponent() == 1 );
    assertTrue( u.getScale() == -3 );
    ud = m.getUnitDefinition(1);
    assertTrue( ud.getNumUnits() == 3 );
    u = ud.getUnit(0);
    assertTrue( u.getKind() == libsbml.UNIT_KIND_MOLE );
    assertTrue( u.getExponent() == 1 );
    assertTrue( u.getScale() == -3 );
    u = ud.getUnit(1);
    assertTrue( u.getKind() == libsbml.UNIT_KIND_LITER );
    assertTrue( u.getExponent() == -1 );
    assertTrue( u.getScale() == 0 );
    u = ud.getUnit(2);
    assertTrue( u.getKind() == libsbml.UNIT_KIND_SECOND );
    assertTrue( u.getExponent() == -1 );
    assertTrue( u.getScale() == 0 );
    assertTrue( m.getNumCompartments() == 1 );
    c = m.getCompartment(0);
    assertTrue(c.getName().equals( "cell"));
    assertTrue( m.getNumSpecies() == 4 );
    s = m.getSpecies(0);
    assertTrue(s.getName().equals( "x0"   ));
    assertTrue(s.getCompartment().equals( "cell" ));
    assertTrue( s.getInitialAmount() == 1 );
    assertTrue( s.getBoundaryCondition() == false );
    ud = s.getDerivedUnitDefinition();
    assertTrue( ud.getNumUnits() == 2 );
    assertTrue( ud.getUnit(0).getKind() == libsbml.UNIT_KIND_MOLE );
    assertTrue( ud.getUnit(0).getExponent() == 1 );
    assertTrue( ud.getUnit(0).getScale() == -3 );
    assertTrue( ud.getUnit(1).getKind() == libsbml.UNIT_KIND_LITRE );
    assertTrue( ud.getUnit(1).getExponent() == -1 );
    s = m.getSpecies(1);
    assertTrue(s.getName().equals( "x1"   ));
    assertTrue(s.getCompartment().equals( "cell" ));
    assertTrue( s.getInitialAmount() == 1 );
    assertTrue( s.getBoundaryCondition() == false );
    s = m.getSpecies(2);
    assertTrue(s.getName().equals( "s1"   ));
    assertTrue(s.getCompartment().equals( "cell" ));
    assertTrue( s.getInitialAmount() == 1 );
    assertTrue( s.getBoundaryCondition() == false );
    s = m.getSpecies(3);
    assertTrue(s.getName().equals( "s2"   ));
    assertTrue(s.getCompartment().equals( "cell" ));
    assertTrue( s.getInitialAmount() == 1 );
    assertTrue( s.getBoundaryCondition() == false );
    assertTrue( m.getNumParameters() == 2 );
    p = m.getParameter(0);
    assertTrue(p.getName().equals( "vm"  ));
    assertTrue(p.getUnits().equals( "mls" ));
    assertTrue( p.getValue() == 2 );
    ud = p.getDerivedUnitDefinition();
    assertTrue( ud.getNumUnits() == 3 );
    assertTrue( ud.getUnit(0).getKind() == libsbml.UNIT_KIND_MOLE );
    assertTrue( ud.getUnit(0).getExponent() == 1 );
    assertTrue( ud.getUnit(0).getScale() == -3 );
    assertTrue( ud.getUnit(1).getKind() == libsbml.UNIT_KIND_LITER );
    assertTrue( ud.getUnit(1).getExponent() == -1 );
    assertTrue( ud.getUnit(2).getKind() == libsbml.UNIT_KIND_SECOND );
    assertTrue( ud.getUnit(2).getExponent() == -1 );
    p = m.getParameter(1);
    assertTrue(p.getName().equals( "km"  ));
    assertTrue( p.getValue() == 2 );
    ud = p.getDerivedUnitDefinition();
    assertTrue( ud.getNumUnits() == 0 );
    assertTrue( m.getNumReactions() == 3 );
    r = m.getReaction(0);
    assertTrue(r.getName().equals( "v1"));
    assertTrue( r.getReversible() != false );
    assertTrue( r.getFast() == false );
    r = m.getReaction(1);
    assertTrue(r.getName().equals( "v2"));
    assertTrue( r.getReversible() != false );
    assertTrue( r.getFast() == false );
    r = m.getReaction(2);
    assertTrue(r.getName().equals( "v3"));
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
    assertTrue(kl.getFormula().equals( "cell * (vm * s1)/(km + s1)"));
    r = m.getReaction(1);
    assertTrue( r.getNumReactants() == 1 );
    assertTrue( r.getNumProducts() == 1 );
    sr = r.getReactant(0);
    assertTrue(sr.getSpecies().equals( "s1"));
    assertTrue( sr.getStoichiometry() == 1 );
    assertTrue( sr.getDenominator() == 1 );
    sr = r.getProduct(0);
    assertTrue(sr.getSpecies().equals( "s2"));
    assertTrue( sr.getStoichiometry() == 1 );
    assertTrue( sr.getDenominator() == 1 );
    kl = r.getKineticLaw();
    assertTrue(kl.getFormula().equals( "cell * (vm * s2)/(km + s2)"));
    r = m.getReaction(2);
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
    assertTrue(kl.getFormula().equals( "cell * (vm * s1)/(km + s1)"));
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
