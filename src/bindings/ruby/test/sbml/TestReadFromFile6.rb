#
# @file    TestReadFromFile6.rb
# @brief   Reads test-data/l2v2-newComponents.xml into memory and tests it.
#
# @author  Akiya Jouraku (Ruby conversion)
# @author  Sarah Keating 
#
# $Id$
# $HeadURL$
#
# This test file was converted from src/sbml/test/TestReadFromFile6.cpp
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

class TestReadFromFile6 < Test::Unit::TestCase

  def test_read_l2v2_newComponents
    reader = LibSBML::SBMLReader.new()
    filename = "../../sbml/test/test-data/"
    filename += "l2v2-newComponents.xml"
    d = reader.readSBML(filename)
    if (d == nil)
    end
    assert( d.getLevel() == 2 )
    assert( d.getVersion() == 2 )
    m = d.getModel()
    assert( m != nil )
    assert( m.getId() ==  "l2v2_newComponents" )
    assert( m.getSBOTerm() == 4 )
    assert( m.getSBOTermID() ==  "SBO:0000004" )
    assert( m.getNumCompartments() == 2 )
    c = m.getCompartment(0)
    assert( c != nil )
    assert( c.getId() ==  "cell" )
    assert( c.getCompartmentType() ==  "mitochondria" )
    assert( c.getOutside() ==  "m" )
    assert( c.getSBOTerm() == -1 )
    assert( c.getSBOTermID() ==  "" )
    c = m.getCompartment(1)
    assert( c != nil )
    assert( c.getId() ==  "m" )
    assert( c.getCompartmentType() ==  "mitochondria" )
    assert( m.getNumCompartmentTypes() == 1 )
    ct = m.getCompartmentType(0)
    assert( ct != nil )
    assert( ct.getId() ==  "mitochondria" )
    loct = m.getListOfCompartmentTypes()
    ct1 = loct.get(0)
    assert( ct1 == ct )
    ct1 = loct.get("mitochondria")
    assert( ct1 == ct )
    assert( m.getNumSpeciesTypes() == 1 )
    st = m.getSpeciesType(0)
    assert( st != nil )
    assert( st.getId() ==  "Glucose" )
    assert( m.getNumSpecies() == 2 )
    s = m.getSpecies(0)
    assert( s != nil )
    assert( s.getId() ==  "X0" )
    assert( s.getSpeciesType() ==  "Glucose" )
    assert( s.getCompartment() ==  "cell" )
    assert_equal false, s.isSetInitialAmount()
    assert_equal false, s.isSetInitialConcentration()
    s = m.getSpecies(1)
    assert( s != nil )
    assert( s.getId() ==  "X1" )
    assert_equal false, s.isSetSpeciesType()
    assert( s.getCompartment() ==  "cell" )
    assert( s.getInitialConcentration() == 0.013 )
    assert_equal false, s.isSetInitialAmount()
    assert_equal true, s.isSetInitialConcentration()
    assert( m.getNumParameters() == 1 )
    p = m.getParameter(0)
    assert( p != nil )
    assert( p.getId() ==  "y" )
    assert( p.getValue() == 2 )
    assert( p.getUnits() ==  "dimensionless" )
    assert( p.getId() ==  "y" )
    assert( p.getSBOTerm() == 2 )
    assert( p.getSBOTermID() ==  "SBO:0000002" )
    assert( m.getNumConstraints() == 1 )
    con = m.getConstraint(0)
    assert( con != nil )
    assert( con.getSBOTerm() == 64 )
    assert( con.getSBOTermID() ==  "SBO:0000064" )
    ast = con.getMath()
    assert ((  "lt(1, cell)" == LibSBML::formulaToString(ast) ))
    locon = m.getListOfConstraints()
    con1 = locon.get(0)
    assert( con1 == con )
    assert( m.getNumInitialAssignments() == 1 )
    ia = m.getInitialAssignment(0)
    assert( ia != nil )
    assert( ia.getSBOTerm() == 64 )
    assert( ia.getSBOTermID() ==  "SBO:0000064" )
    assert( ia.getSymbol() ==  "X0" )
    ast = ia.getMath()
    assert ((  "y * X1" == LibSBML::formulaToString(ast) ))
    loia = m.getListOfInitialAssignments()
    ia1 = loia.get(0)
    assert( ia1 == ia )
    ia1 = loia.get("X0")
    assert( ia1 == ia )
    assert( m.getNumReactions() == 1 )
    r = m.getReaction(0)
    assert( r != nil )
    assert( r.getSBOTerm() == 231 )
    assert( r.getSBOTermID() ==  "SBO:0000231" )
    assert( r.getId() ==  "in" )
    lor = m.getListOfReactions()
    r1 = lor.get(0)
    assert( r1 == r )
    r1 = lor.get("in")
    assert( r1 == r )
    assert_equal true, r.isSetKineticLaw()
    kl = r.getKineticLaw()
    assert( kl != nil )
    assert( kl.getSBOTerm() == 1 )
    assert( kl.getSBOTermID() ==  "SBO:0000001" )
    assert_equal true, kl.isSetMath()
    ast = kl.getMath()
    assert ((  "v * X0 / t" == LibSBML::formulaToString(ast) ))
    assert( kl.getNumParameters() == 2 )
    p = kl.getParameter(0)
    assert( p != nil )
    assert( p.getSBOTerm() == 2 )
    assert( p.getSBOTermID() ==  "SBO:0000002" )
    assert( p.getId() ==  "v" )
    assert( p.getUnits() ==  "litre" )
    assert( r.getNumReactants() == 1 )
    assert( r.getNumProducts() == 0 )
    assert( r.getNumModifiers() == 0 )
    sr = r.getReactant(0)
    assert( sr != nil )
    assert( sr.getName() ==  "sarah" )
    assert( sr.getId() ==  "me" )
    assert( sr.getSpecies() ==  "X0" )
    losr = r.getListOfReactants()
    sr1 = losr.get(0)
    assert( sr1 == sr )
    sr1 = losr.get("me")
    assert( sr1 == sr )
    d = nil
  end

end
