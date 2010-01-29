/// 
///  @file    TestReadFromFile5.cs
///  @brief   Reads test-data/l2v1-assignment.xml into memory and tests it.
///  @author  Frank Bergmann (Csharp conversion)
///  @author  Akiya Jouraku (Csharp conversion)
///  @author  Ben Bornstein 
/// 
///  $Id$
///  $HeadURL$
/// 
///  This test file was converted from src/sbml/test/TestReadFromFile5.cpp
///  with the help of conversion sciprt (ctest_converter.pl).
/// 
/// <!---------------------------------------------------------------------------
///  This file is part of libSBML.  Please visit http://sbml.org for more
///  information about SBML, and the latest version of libSBML.
/// 
///  Copyright 2005-2010 California Institute of Technology.
///  Copyright 2002-2005 California Institute of Technology and
///                      Japan Science and Technology Corporation.
///  
///  This library is free software; you can redistribute it and/or modify it
///  under the terms of the GNU Lesser General Public License as published by
///  the Free Software Foundation.  A copy of the license agreement is provided
///  in the file named "LICENSE.txt" included with this software distribution
///  and also available online as http://sbml.org/software/libsbml/license.html
/// --------------------------------------------------------------------------->*/


namespace LibSBMLCSTest {

  using libsbml;

  using  System.IO;

  public class TestReadFromFile5 {
    public class AssertionError : System.Exception 
    {
      public AssertionError() : base()
      {
        
      }
    }


    static void assertTrue(bool condition)
    {
      if (condition == true)
      {
        return;
      }
      throw new AssertionError();
    }

    static void assertEquals(object a, object b)
    {
      if ( (a == null) && (b == null) )
      {
        return;
      }
      else if (a.Equals(b))
      {
        return;
      }
  
      throw new AssertionError();
    }

    static void assertNotEquals(object a, object b)
    {
      if ( (a == null) && (b == null) )
      {
        throw new AssertionError();
      }
      else if (a.Equals(b))
      {
        throw new AssertionError();
      }
    }

    static void assertEquals(bool a, bool b)
    {
      if ( a == b )
      {
        return;
      }
      throw new AssertionError();
    }

    static void assertNotEquals(bool a, bool b)
    {
      if ( a != b )
      {
        return;
      }
      throw new AssertionError();
    }

    static void assertEquals(int a, int b)
    {
      if ( a == b )
      {
        return;
      }
      throw new AssertionError();
    }

    static void assertNotEquals(int a, int b)
    {
      if ( a != b )
      {
        return;
      }
      throw new AssertionError();
    }


    public void test_read_l2v1_assignment()
    {
      SBMLReader reader = new SBMLReader();
      SBMLDocument d;
      Model m;
      Compartment c;
      Species s;
      Parameter p;
      AssignmentRule ar;
      Reaction r;
      SpeciesReference sr;
      KineticLaw kl;
      UnitDefinition ud;
      Reaction r1;
      ListOfCompartments loc;
      Compartment c1;
      ListOfRules lor;
      AssignmentRule ar1;
      ListOfParameters lop;
      Parameter p1;
      ListOfSpecies los;
      Species s1;
      string filename =  "../../sbml/test/test-data/";
      filename += "l2v1-assignment.xml";
      d = reader.readSBML(filename);
      if (d == null);
      {
      }
      assertTrue( d.getLevel() == 2 );
      assertTrue( d.getVersion() == 1 );
      m = d.getModel();
      assertTrue( m != null );
      assertTrue( m.getNumCompartments() == 1 );
      c = m.getCompartment(0);
      assertTrue( c != null );
      assertTrue( c.getId() ==  "cell" );
      ud = c.getDerivedUnitDefinition();
      assertTrue( ud.getNumUnits() == 1 );
      assertTrue( ud.getUnit(0).getKind() == libsbml.UNIT_KIND_LITRE );
      loc = m.getListOfCompartments();
      c1 = loc.get(0);
      assertTrue( c1 == c );
      c1 = loc.get("cell");
      assertTrue( c1 == c );
      assertTrue( m.getNumSpecies() == 5 );
      s = m.getSpecies(0);
      assertTrue( s != null );
      assertTrue( s.getId() ==  "X0"   );
      assertTrue( s.getCompartment() ==  "cell" );
      assertTrue( s.getInitialConcentration() == 1.0 );
      los = m.getListOfSpecies();
      s1 = los.get(0);
      assertTrue( s1 == s );
      s1 = los.get("X0");
      assertTrue( s1 == s );
      s = m.getSpecies(1);
      assertTrue( s != null );
      assertTrue( s.getId() ==  "X1"   );
      assertTrue( s.getCompartment() ==  "cell" );
      assertTrue( s.getInitialConcentration() == 0.0 );
      s = m.getSpecies(2);
      assertTrue( s != null );
      assertTrue( s.getId() ==  "T"    );
      assertTrue( s.getCompartment() ==  "cell" );
      assertTrue( s.getInitialConcentration() == 0.0 );
      s = m.getSpecies(3);
      assertTrue( s != null );
      assertTrue( s.getId() ==  "S1"   );
      assertTrue( s.getCompartment() ==  "cell" );
      assertTrue( s.getInitialConcentration() == 0.0 );
      s = m.getSpecies(4);
      assertTrue( s != null );
      assertTrue( s.getId() ==  "S2"   );
      assertTrue( s.getCompartment() ==  "cell" );
      assertTrue( s.getInitialConcentration() == 0.0 );
      assertTrue( m.getNumParameters() == 1 );
      p = m.getParameter(0);
      assertTrue( p != null );
      assertTrue( p.getId() ==  "Keq" );
      assertTrue( p.getValue() == 2.5 );
      lop = m.getListOfParameters();
      p1 = lop.get(0);
      assertTrue( p1 == p );
      p1 = lop.get("Keq");
      assertTrue( p1 == p );
      ud = p.getDerivedUnitDefinition();
      assertTrue( ud.getNumUnits() == 0 );
      assertTrue( m.getNumRules() == 2 );
      ar = (AssignmentRule)  m.getRule(0);
      assertTrue( ar != null );
      assertTrue( ar.getVariable() ==  "S1"            );
      assertTrue( ar.getFormula() ==  "T / (1 + Keq)" );
      ud = ar.getDerivedUnitDefinition();
      assertTrue( ud.getNumUnits() == 2 );
      assertTrue( ud.getUnit(0).getKind() == libsbml.UNIT_KIND_MOLE );
      assertTrue( ud.getUnit(0).getExponent() == 1 );
      assertTrue( ud.getUnit(1).getKind() == libsbml.UNIT_KIND_LITRE );
      assertTrue( ud.getUnit(1).getExponent() == -1 );
      assertTrue( ar.containsUndeclaredUnits() == true );
      lor = m.getListOfRules();
      ar1 = (AssignmentRule) lor.get(0);
      assertTrue( ar1 == ar );
      ar1 = (AssignmentRule) lor.get("S1");
      assertTrue( ar1 == ar );
      ar = (AssignmentRule)  m.getRule(1);
      assertTrue( ar != null );
      assertTrue( ar.getVariable() ==  "S2"       );
      assertTrue( ar.getFormula() ==  "Keq * S1" );
      assertTrue( m.getNumReactions() == 2 );
      r = m.getReaction(0);
      assertTrue( r != null );
      assertTrue( r.getId() ==  "in" );
      assertTrue( r.getNumReactants() == 1 );
      assertTrue( r.getNumProducts() == 1 );
      sr = r.getReactant(0);
      assertTrue( sr != null );
      assertTrue( sr.getSpecies() ==  "X0" );
      sr = r.getProduct(0);
      assertTrue( sr != null );
      assertTrue( sr.getSpecies() ==  "T"  );
      kl = r.getKineticLaw();
      assertTrue( kl != null );
      assertTrue( kl.getFormula() ==  "k1 * X0" );
      assertTrue( kl.getNumParameters() == 1 );
      r1 = (Reaction) kl.getParentSBMLObject();
      assertTrue( r1 != null );
      assertTrue( r1.getId() ==  "in" );
      assertTrue( r1.getNumReactants() == 1 );
      assertTrue( r1.getNumProducts() == 1 );
      p = kl.getParameter(0);
      assertTrue( p != null );
      assertTrue( p.getId() ==  "k1" );
      assertTrue( p.getValue() == 0.1 );
      kl = (KineticLaw) p.getParentSBMLObject().getParentSBMLObject();
      assertTrue( kl != null );
      assertTrue( kl.getFormula() ==  "k1 * X0" );
      assertTrue( kl.getNumParameters() == 1 );
      r = m.getReaction(1);
      assertTrue( r != null );
      assertTrue( r.getId() ==  "out" );
      assertTrue( r.getNumReactants() == 1 );
      assertTrue( r.getNumProducts() == 1 );
      sr = r.getReactant(0);
      assertTrue( sr != null );
      assertTrue( sr.getSpecies() ==  "T"  );
      sr = r.getProduct(0);
      assertTrue( sr != null );
      assertTrue( sr.getSpecies() ==  "X1" );
      kl = r.getKineticLaw();
      assertTrue( kl != null );
      assertTrue( kl.getFormula() ==  "k2 * T" );
      assertTrue( kl.getNumParameters() == 1 );
      p = kl.getParameter(0);
      assertTrue( p != null );
      assertTrue( p.getId() ==  "k2" );
      assertTrue( p.getValue() == 0.15 );
      d = null;
    }

  }
}
