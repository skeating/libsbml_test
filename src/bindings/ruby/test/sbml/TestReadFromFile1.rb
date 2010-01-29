#
# @file    TestReadFromFile1.rb
# @brief   Reads tests/l1v1-branch.xml into memory and tests it.
#
# @author  Akiya Jouraku (Ruby conversion)
# @author  Ben Bornstein 
#
# $Id$
# $HeadURL$
#
# This test file was converted from src/sbml/test/TestReadFromFile1.c
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
require 'test/unit'
require 'libSBML'

class TestReadFromFile1 < Test::Unit::TestCase

  def test_read_l1v1_branch
    filename = "../../sbml/test/test-data/l1v1-branch.xml"
    d = LibSBML::readSBML(filename)
    if (d == nil)
    end
    assert( d.getLevel() == 1 )
    assert( d.getVersion() == 1 )
    m = d.getModel()
    assert ((  "Branch" == m.getName() ))
    assert( m.getNumCompartments() == 1 )
    c = m.getCompartment(0)
    assert ((  "compartmentOne" == c.getName() ))
    assert( c.getVolume() == 1 )
    ud = c.getDerivedUnitDefinition()
    assert( ud.getNumUnits() == 1 )
    assert( ud.getUnit(0).getKind() == LibSBML::UNIT_KIND_LITRE )
    assert( m.getNumSpecies() == 4 )
    s = m.getSpecies(0)
    assert ((  "S1"              == s.getName() ))
    assert ((  "compartmentOne"  == s.getCompartment() ))
    assert( s.getInitialAmount() == 0 )
    assert( s.getBoundaryCondition() == false )
    ud = s.getDerivedUnitDefinition()
    assert( ud.getNumUnits() == 2 )
    assert( ud.getUnit(0).getKind() == LibSBML::UNIT_KIND_MOLE )
    assert( ud.getUnit(0).getExponent() == 1 )
    assert( ud.getUnit(1).getKind() == LibSBML::UNIT_KIND_LITRE )
    assert( ud.getUnit(1).getExponent() == -1 )
    s = m.getSpecies(1)
    assert ((  "X0"              == s.getName() ))
    assert ((  "compartmentOne"  == s.getCompartment() ))
    assert( s.getInitialAmount() == 0 )
    assert( s.getBoundaryCondition() == true )
    s = m.getSpecies(2)
    assert ((  "X1"              == s.getName() ))
    assert ((  "compartmentOne"  == s.getCompartment() ))
    assert( s.getInitialAmount() == 0 )
    assert( s.getBoundaryCondition() == true )
    s = m.getSpecies(3)
    assert ((  "X2"              == s.getName() ))
    assert ((  "compartmentOne"  == s.getCompartment() ))
    assert( s.getInitialAmount() == 0 )
    assert( s.getBoundaryCondition() == true )
    assert( m.getNumReactions() == 3 )
    r = m.getReaction(0)
    assert ((  "reaction_1" == r.getName() ))
    assert( r.getReversible() == false )
    assert( r.getFast() == false )
    ud = r.getKineticLaw().getDerivedUnitDefinition()
    assert( ud.getNumUnits() == 2 )
    assert( ud.getUnit(0).getKind() == LibSBML::UNIT_KIND_MOLE )
    assert( ud.getUnit(0).getExponent() == 1 )
    assert( ud.getUnit(1).getKind() == LibSBML::UNIT_KIND_LITRE )
    assert( ud.getUnit(1).getExponent() == -1 )
    assert( r.getKineticLaw().containsUndeclaredUnits() == true )
    r = m.getReaction(1)
    assert ((  "reaction_2" == r.getName() ))
    assert( r.getReversible() == false )
    assert( r.getFast() == false )
    r = m.getReaction(2)
    assert ((  "reaction_3" == r.getName() ))
    assert( r.getReversible() == false )
    assert( r.getFast() == false )
    r = m.getReaction(0)
    assert( r.getNumReactants() == 1 )
    assert( r.getNumProducts() == 1 )
    sr = r.getReactant(0)
    assert ((  "X0" == sr.getSpecies() ))
    assert( sr.getStoichiometry() == 1 )
    assert( sr.getDenominator() == 1 )
    sr = r.getProduct(0)
    assert ((  "S1" == sr.getSpecies() ))
    assert( sr.getStoichiometry() == 1 )
    assert( sr.getDenominator() == 1 )
    kl = r.getKineticLaw()
    assert ((  "k1 * X0" == kl.getFormula() ))
    assert( kl.getNumParameters() == 1 )
    p = kl.getParameter(0)
    assert ((  "k1" == p.getName() ))
    assert( p.getValue() == 0 )
    r = m.getReaction(1)
    assert( r.getNumReactants() == 1 )
    assert( r.getNumProducts() == 1 )
    sr = r.getReactant(0)
    assert ((  "S1" == sr.getSpecies() ))
    assert( sr.getStoichiometry() == 1 )
    assert( sr.getDenominator() == 1 )
    sr = r.getProduct(0)
    assert ((  "X1" == sr.getSpecies() ))
    assert( sr.getStoichiometry() == 1 )
    assert( sr.getDenominator() == 1 )
    kl = r.getKineticLaw()
    assert ((  "k2 * S1" == kl.getFormula() ))
    assert( kl.getNumParameters() == 1 )
    p = kl.getParameter(0)
    assert ((  "k2" == p.getName() ))
    assert( p.getValue() == 0 )
    r = m.getReaction(2)
    assert( r.getNumReactants() == 1 )
    assert( r.getNumProducts() == 1 )
    sr = r.getReactant(0)
    assert ((  "S1" == sr.getSpecies() ))
    assert( sr.getStoichiometry() == 1 )
    assert( sr.getDenominator() == 1 )
    sr = r.getProduct(0)
    assert ((  "X2" == sr.getSpecies() ))
    assert( sr.getStoichiometry() == 1 )
    assert( sr.getDenominator() == 1 )
    kl = r.getKineticLaw()
    assert ((  "k3 * S1" == kl.getFormula() ))
    assert( kl.getNumParameters() == 1 )
    p = kl.getParameter(0)
    assert ((  "k3" == p.getName() ))
    assert( p.getValue() == 0 )
    d = nil
  end

end
