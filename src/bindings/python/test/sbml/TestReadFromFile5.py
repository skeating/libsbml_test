#
# @file    TestReadFromFile5.py
# @brief   Reads test-data/l2v1-assignment.xml into memory and tests it.
#
# @author  Akiya Jouraku (Python conversion)
# @author  Ben Bornstein 
#
# $Id$
# $HeadURL$
#
# This test file was converted from src/sbml/test/TestReadFromFile5.cpp
# with the help of conversion sciprt (ctest_converter.pl).
#
#<!---------------------------------------------------------------------------
# This file is part of libSBML.  Please visit http://sbml.org for more
# information about SBML, and the latest version of libSBML.
#
# Copyright 2005-2010 California Institute of Technology.
# Copyright 2002-2005 California Institute of Technology and
#                     Japan Science and Technology Corporation.
# 
# This library is free software; you can redistribute it and/or modify it
# under the terms of the GNU Lesser General Public License as published by
# the Free Software Foundation.  A copy of the license agreement is provided
# in the file named "LICENSE.txt" included with this software distribution
# and also available online as http://sbml.org/software/libsbml/license.html
#--------------------------------------------------------------------------->*/
import sys
import unittest
import libsbml


class TestReadFromFile5(unittest.TestCase):


  def test_read_l2v1_assignment(self):
    reader = libsbml.SBMLReader()
    filename = "../../sbml/test/test-data/"
    filename += "l2v1-assignment.xml"
    d = reader.readSBML(filename)
    if (d == None):
      pass    
    self.assert_( d.getLevel() == 2 )
    self.assert_( d.getVersion() == 1 )
    m = d.getModel()
    self.assert_( m != None )
    self.assert_( m.getNumCompartments() == 1 )
    c = m.getCompartment(0)
    self.assert_( c != None )
    self.assert_( c.getId() ==  "cell" )
    ud = c.getDerivedUnitDefinition()
    self.assert_( ud.getNumUnits() == 1 )
    self.assert_( ud.getUnit(0).getKind() == libsbml.UNIT_KIND_LITRE )
    loc = m.getListOfCompartments()
    c1 = loc.get(0)
    self.assert_( c1 == c )
    c1 = loc.get("cell")
    self.assert_( c1 == c )
    self.assert_( m.getNumSpecies() == 5 )
    s = m.getSpecies(0)
    self.assert_( s != None )
    self.assert_( s.getId() ==  "X0"   )
    self.assert_( s.getCompartment() ==  "cell" )
    self.assert_( s.getInitialConcentration() == 1.0 )
    los = m.getListOfSpecies()
    s1 = los.get(0)
    self.assert_( s1 == s )
    s1 = los.get("X0")
    self.assert_( s1 == s )
    s = m.getSpecies(1)
    self.assert_( s != None )
    self.assert_( s.getId() ==  "X1"   )
    self.assert_( s.getCompartment() ==  "cell" )
    self.assert_( s.getInitialConcentration() == 0.0 )
    s = m.getSpecies(2)
    self.assert_( s != None )
    self.assert_( s.getId() ==  "T"    )
    self.assert_( s.getCompartment() ==  "cell" )
    self.assert_( s.getInitialConcentration() == 0.0 )
    s = m.getSpecies(3)
    self.assert_( s != None )
    self.assert_( s.getId() ==  "S1"   )
    self.assert_( s.getCompartment() ==  "cell" )
    self.assert_( s.getInitialConcentration() == 0.0 )
    s = m.getSpecies(4)
    self.assert_( s != None )
    self.assert_( s.getId() ==  "S2"   )
    self.assert_( s.getCompartment() ==  "cell" )
    self.assert_( s.getInitialConcentration() == 0.0 )
    self.assert_( m.getNumParameters() == 1 )
    p = m.getParameter(0)
    self.assert_( p != None )
    self.assert_( p.getId() ==  "Keq" )
    self.assert_( p.getValue() == 2.5 )
    lop = m.getListOfParameters()
    p1 = lop.get(0)
    self.assert_( p1 == p )
    p1 = lop.get("Keq")
    self.assert_( p1 == p )
    ud = p.getDerivedUnitDefinition()
    self.assert_( ud.getNumUnits() == 0 )
    self.assert_( m.getNumRules() == 2 )
    ar = m.getRule(0)
    self.assert_( ar != None )
    self.assert_( ar.getVariable() ==  "S1"            )
    self.assert_( ar.getFormula() ==  "T / (1 + Keq)" )
    ud = ar.getDerivedUnitDefinition()
    self.assert_( ud.getNumUnits() == 2 )
    self.assert_( ud.getUnit(0).getKind() == libsbml.UNIT_KIND_MOLE )
    self.assert_( ud.getUnit(0).getExponent() == 1 )
    self.assert_( ud.getUnit(1).getKind() == libsbml.UNIT_KIND_LITRE )
    self.assert_( ud.getUnit(1).getExponent() == -1 )
    self.assert_( ar.containsUndeclaredUnits() == True )
    lor = m.getListOfRules()
    ar1 = lor.get(0)
    self.assert_( ar1 == ar )
    ar1 = lor.get("S1")
    self.assert_( ar1 == ar )
    ar = m.getRule(1)
    self.assert_( ar != None )
    self.assert_( ar.getVariable() ==  "S2"       )
    self.assert_( ar.getFormula() ==  "Keq * S1" )
    self.assert_( m.getNumReactions() == 2 )
    r = m.getReaction(0)
    self.assert_( r != None )
    self.assert_( r.getId() ==  "in" )
    self.assert_( r.getNumReactants() == 1 )
    self.assert_( r.getNumProducts() == 1 )
    sr = r.getReactant(0)
    self.assert_( sr != None )
    self.assert_( sr.getSpecies() ==  "X0" )
    sr = r.getProduct(0)
    self.assert_( sr != None )
    self.assert_( sr.getSpecies() ==  "T"  )
    kl = r.getKineticLaw()
    self.assert_( kl != None )
    self.assert_( kl.getFormula() ==  "k1 * X0" )
    self.assert_( kl.getNumParameters() == 1 )
    r1 = kl.getParentSBMLObject()
    self.assert_( r1 != None )
    self.assert_( r1.getId() ==  "in" )
    self.assert_( r1.getNumReactants() == 1 )
    self.assert_( r1.getNumProducts() == 1 )
    p = kl.getParameter(0)
    self.assert_( p != None )
    self.assert_( p.getId() ==  "k1" )
    self.assert_( p.getValue() == 0.1 )
    kl = p.getParentSBMLObject().getParentSBMLObject()
    self.assert_( kl != None )
    self.assert_( kl.getFormula() ==  "k1 * X0" )
    self.assert_( kl.getNumParameters() == 1 )
    r = m.getReaction(1)
    self.assert_( r != None )
    self.assert_( r.getId() ==  "out" )
    self.assert_( r.getNumReactants() == 1 )
    self.assert_( r.getNumProducts() == 1 )
    sr = r.getReactant(0)
    self.assert_( sr != None )
    self.assert_( sr.getSpecies() ==  "T"  )
    sr = r.getProduct(0)
    self.assert_( sr != None )
    self.assert_( sr.getSpecies() ==  "X1" )
    kl = r.getKineticLaw()
    self.assert_( kl != None )
    self.assert_( kl.getFormula() ==  "k2 * T" )
    self.assert_( kl.getNumParameters() == 1 )
    p = kl.getParameter(0)
    self.assert_( p != None )
    self.assert_( p.getId() ==  "k2" )
    self.assert_( p.getValue() == 0.15 )
    d = None
    pass  

def suite():
  suite = unittest.TestSuite()
  suite.addTest(unittest.makeSuite(TestReadFromFile5))

  return suite

if __name__ == "__main__":
  if unittest.TextTestRunner(verbosity=1).run(suite()).wasSuccessful() :
    sys.exit(0)
  else:
    sys.exit(1)
