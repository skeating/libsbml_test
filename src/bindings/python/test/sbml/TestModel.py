#
# @file    TestModel.py
# @brief   SBML Model unit tests
#
# @author  Akiya Jouraku (Python conversion)
# @author  Ben Bornstein 
#
# $Id$
# $HeadURL$
#
# This test file was converted from src/sbml/test/TestModel.c
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

class TestModel(unittest.TestCase):

  M = None

  def setUp(self):
    self.M = libsbml.Model(2,4)
    if (self.M == None):
      pass    
    pass  

  def tearDown(self):
    self.M = None
    pass  

  def test_KineticLaw_getParameterById(self):
    k1 = libsbml.Parameter(2,4)
    k2 = libsbml.Parameter(2,4)
    k1.setId( "k1")
    k2.setId( "k2")
    k1.setValue(3.14)
    k2.setValue(2.72)
    self.M.addParameter(k1)
    self.M.addParameter(k2)
    r1 = libsbml.Reaction(2,4)
    r1.setId( "reaction_1" )
    kl = libsbml.KineticLaw(2,4)
    kl.setFormula( "k1 * X0")
    k3 = libsbml.Parameter(2,4)
    k4 = libsbml.Parameter(2,4)
    k3.setId( "k1")
    k4.setId( "k2")
    k3.setValue(2.72)
    k4.setValue(3.14)
    kl.addParameter(k3)
    kl.addParameter(k4)
    r1.setKineticLaw(kl)
    self.M.addReaction(r1)
    kl1 = self.M.getReaction(0).getKineticLaw()
    self.assert_( kl1.getParameter( "k1" ) != k3 )
    self.assert_( kl1.getParameter( "k1" ) != k1 )
    self.assert_( kl1.getParameter( "k2" ) != k4 )
    self.assert_( kl1.getParameter( "k3" ) == None )
    pass  

  def test_Model_addCompartment(self):
    c = libsbml.Compartment(2,4)
    c.setId( "c")
    self.M.addCompartment(c)
    self.assert_( self.M.getNumCompartments() == 1 )
    pass  

  def test_Model_addParameter(self):
    p = libsbml.Parameter(2,4)
    p.setId( "p")
    self.M.addParameter(p)
    self.assert_( self.M.getNumParameters() == 1 )
    pass  

  def test_Model_addReaction(self):
    r = libsbml.Reaction(2,4)
    r.setId( "r")
    self.M.addReaction(r)
    self.assert_( self.M.getNumReactions() == 1 )
    pass  

  def test_Model_addRules(self):
    r1 = libsbml.AlgebraicRule(2,4)
    r2 = libsbml.AssignmentRule(2,4)
    r3 = libsbml.RateRule(2,4)
    r2.setVariable( "r2")
    r3.setVariable( "r3")
    r1.setMath(libsbml.parseFormula("2"))
    r2.setMath(libsbml.parseFormula("2"))
    r3.setMath(libsbml.parseFormula("2"))
    self.M.addRule(r1)
    self.M.addRule(r2)
    self.M.addRule(r3)
    self.assert_( self.M.getNumRules() == 3 )
    pass  

  def test_Model_addSpecies(self):
    s = libsbml.Species(2,4)
    s.setId( "s")
    s.setCompartment( "c")
    self.M.addSpecies(s)
    self.assert_( self.M.getNumSpecies() == 1 )
    pass  

  def test_Model_add_get_Event(self):
    e1 = libsbml.Event(2,4)
    e2 = libsbml.Event(2,4)
    t = libsbml.Trigger(2,4)
    e1.setTrigger(t)
    e2.setTrigger(t)
    e1.createEventAssignment()
    e2.createEventAssignment()
    self.M.addEvent(e1)
    self.M.addEvent(e2)
    self.assert_( self.M.getNumEvents() == 2 )
    self.assert_( self.M.getEvent(0) != e1 )
    self.assert_( self.M.getEvent(1) != e2 )
    self.assert_( self.M.getEvent(2) == None )
    self.assert_( self.M.getEvent(99999) == None )
    pass  

  def test_Model_add_get_FunctionDefinitions(self):
    fd1 = libsbml.FunctionDefinition(2,4)
    fd2 = libsbml.FunctionDefinition(2,4)
    fd1.setId( "fd1")
    fd2.setId( "fd2")
    fd1.setMath(libsbml.parseFormula("2"))
    fd2.setMath(libsbml.parseFormula("2"))
    self.M.addFunctionDefinition(fd1)
    self.M.addFunctionDefinition(fd2)
    self.assert_( self.M.getNumFunctionDefinitions() == 2 )
    self.assert_( self.M.getFunctionDefinition(0) != fd1 )
    self.assert_( self.M.getFunctionDefinition(1) != fd2 )
    self.assert_( self.M.getFunctionDefinition(2) == None )
    self.assert_( self.M.getFunctionDefinition(99999) == None )
    pass  

  def test_Model_add_get_UnitDefinitions(self):
    ud1 = libsbml.UnitDefinition(2,4)
    ud2 = libsbml.UnitDefinition(2,4)
    ud1.setId( "ud1")
    ud2.setId( "ud2")
    ud1.createUnit()
    ud2.createUnit()
    self.M.addUnitDefinition(ud1)
    self.M.addUnitDefinition(ud2)
    self.assert_( self.M.getNumUnitDefinitions() == 2 )
    self.assert_( self.M.getUnitDefinition(0) != ud1 )
    self.assert_( self.M.getUnitDefinition(1) != ud2 )
    self.assert_( self.M.getUnitDefinition(2) == None )
    self.assert_( self.M.getUnitDefinition(99999) == None )
    pass  

  def test_Model_create(self):
    self.assert_( self.M.getTypeCode() == libsbml.SBML_MODEL )
    self.assert_( self.M.getMetaId() == "" )
    self.assert_( self.M.getNotes() == None )
    self.assert_( self.M.getAnnotation() == None )
    self.assert_( self.M.getId() == "" )
    self.assert_( self.M.getName() == "" )
    self.assertEqual( False, self.M.isSetId() )
    self.assertEqual( False, self.M.isSetName() )
    self.assert_( self.M.getNumUnitDefinitions() == 0 )
    self.assert_( self.M.getNumCompartments() == 0 )
    self.assert_( self.M.getNumSpecies() == 0 )
    self.assert_( self.M.getNumParameters() == 0 )
    self.assert_( self.M.getNumReactions() == 0 )
    pass  

  def test_Model_createAlgebraicRule(self):
    ar = self.M.createAlgebraicRule()
    self.assert_( ar != None )
    self.assert_( self.M.getNumRules() == 1 )
    self.assert_( self.M.getRule(0) == ar )
    pass  

  def test_Model_createAssignmentRule(self):
    ar = self.M.createAssignmentRule()
    self.assert_( ar != None )
    self.assert_( self.M.getNumRules() == 1 )
    self.assert_( self.M.getRule(0) == ar )
    pass  

  def test_Model_createCompartment(self):
    c = self.M.createCompartment()
    self.assert_( c != None )
    self.assert_( self.M.getNumCompartments() == 1 )
    self.assert_( self.M.getCompartment(0) == c )
    pass  

  def test_Model_createCompartmentType(self):
    c = self.M.createCompartmentType()
    self.assert_( c != None )
    self.assert_( self.M.getNumCompartmentTypes() == 1 )
    self.assert_( self.M.getCompartmentType(0) == c )
    pass  

  def test_Model_createConstraint(self):
    c = self.M.createConstraint()
    self.assert_( c != None )
    self.assert_( self.M.getNumConstraints() == 1 )
    self.assert_( self.M.getConstraint(0) == c )
    pass  

  def test_Model_createEvent(self):
    e = self.M.createEvent()
    self.assert_( e != None )
    self.assert_( self.M.getNumEvents() == 1 )
    self.assert_( self.M.getEvent(0) == e )
    pass  

  def test_Model_createEventAssignment(self):
    self.M.createEvent()
    self.M.createEvent()
    ea = self.M.createEventAssignment()
    self.assert_( ea != None )
    self.assert_( self.M.getNumEvents() == 2 )
    e = self.M.getEvent(1)
    self.assert_( e.getNumEventAssignments() == 1 )
    self.assert_( e.getEventAssignment(0) == ea )
    pass  

  def test_Model_createEventAssignment_noEvent(self):
    self.assert_( self.M.getNumEvents() == 0 )
    self.assert_( self.M.createEventAssignment() == None )
    pass  

  def test_Model_createFunctionDefinition(self):
    fd = self.M.createFunctionDefinition()
    self.assert_( fd != None )
    self.assert_( self.M.getNumFunctionDefinitions() == 1 )
    self.assert_( self.M.getFunctionDefinition(0) == fd )
    pass  

  def test_Model_createInitialAssignment(self):
    c = self.M.createInitialAssignment()
    self.assert_( c != None )
    self.assert_( self.M.getNumInitialAssignments() == 1 )
    self.assert_( self.M.getInitialAssignment(0) == c )
    pass  

  def test_Model_createKineticLaw(self):
    self.M.createReaction()
    self.M.createReaction()
    kl = self.M.createKineticLaw()
    self.assert_( kl != None )
    self.assert_( self.M.getNumReactions() == 2 )
    r = self.M.getReaction(0)
    self.assert_( r.getKineticLaw() == None )
    r = self.M.getReaction(1)
    self.assert_( r.getKineticLaw() == kl )
    pass  

  def test_Model_createKineticLawParameter(self):
    self.M.createReaction()
    self.M.createReaction()
    self.M.createKineticLaw()
    p = self.M.createKineticLawParameter()
    self.assert_( self.M.getNumReactions() == 2 )
    r = self.M.getReaction(0)
    self.assert_( r.getKineticLaw() == None )
    r = self.M.getReaction(1)
    self.assert_( r.getKineticLaw() != None )
    kl = r.getKineticLaw()
    self.assert_( kl.getNumParameters() == 1 )
    self.assert_( kl.getParameter(0) == p )
    pass  

  def test_Model_createKineticLawParameter_noKineticLaw(self):
    r = self.M.createReaction()
    self.assert_( r.getKineticLaw() == None )
    self.assert_( self.M.createKineticLawParameter() == None )
    pass  

  def test_Model_createKineticLawParameter_noReaction(self):
    self.assert_( self.M.getNumReactions() == 0 )
    self.assert_( self.M.createKineticLawParameter() == None )
    pass  

  def test_Model_createKineticLaw_alreadyExists(self):
    r = self.M.createReaction()
    kl = self.M.createKineticLaw()
    self.assert_( r.getKineticLaw() == kl )
    pass  

  def test_Model_createKineticLaw_noReaction(self):
    self.assert_( self.M.getNumReactions() == 0 )
    self.assert_( self.M.createKineticLaw() == None )
    pass  

  def test_Model_createModifier(self):
    self.M.createReaction()
    self.M.createReaction()
    msr = self.M.createModifier()
    self.assert_( msr != None )
    self.assert_( self.M.getNumReactions() == 2 )
    r = self.M.getReaction(1)
    self.assert_( r.getNumModifiers() == 1 )
    self.assert_( r.getModifier(0) == msr )
    pass  

  def test_Model_createModifier_noReaction(self):
    self.assert_( self.M.getNumReactions() == 0 )
    self.assert_( self.M.createModifier() == None )
    pass  

  def test_Model_createParameter(self):
    p = self.M.createParameter()
    self.assert_( p != None )
    self.assert_( self.M.getNumParameters() == 1 )
    self.assert_( self.M.getParameter(0) == p )
    pass  

  def test_Model_createProduct(self):
    self.M.createReaction()
    self.M.createReaction()
    sr = self.M.createProduct()
    self.assert_( sr != None )
    self.assert_( self.M.getNumReactions() == 2 )
    r = self.M.getReaction(1)
    self.assert_( r.getNumProducts() == 1 )
    self.assert_( r.getProduct(0) == sr )
    pass  

  def test_Model_createProduct_noReaction(self):
    self.assert_( self.M.getNumReactions() == 0 )
    self.assert_( self.M.createProduct() == None )
    pass  

  def test_Model_createRateRule(self):
    rr = self.M.createRateRule()
    self.assert_( rr != None )
    self.assert_( self.M.getNumRules() == 1 )
    self.assert_( self.M.getRule(0) == rr )
    pass  

  def test_Model_createReactant(self):
    self.M.createReaction()
    self.M.createReaction()
    sr = self.M.createReactant()
    self.assert_( sr != None )
    self.assert_( self.M.getNumReactions() == 2 )
    r = self.M.getReaction(1)
    self.assert_( r.getNumReactants() == 1 )
    self.assert_( r.getReactant(0) == sr )
    pass  

  def test_Model_createReactant_noReaction(self):
    self.assert_( self.M.getNumReactions() == 0 )
    self.assert_( self.M.createReactant() == None )
    pass  

  def test_Model_createReaction(self):
    r = self.M.createReaction()
    self.assert_( r != None )
    self.assert_( self.M.getNumReactions() == 1 )
    self.assert_( self.M.getReaction(0) == r )
    pass  

  def test_Model_createSpecies(self):
    s = self.M.createSpecies()
    self.assert_( s != None )
    self.assert_( self.M.getNumSpecies() == 1 )
    self.assert_( self.M.getSpecies(0) == s )
    pass  

  def test_Model_createSpeciesType(self):
    c = self.M.createSpeciesType()
    self.assert_( c != None )
    self.assert_( self.M.getNumSpeciesTypes() == 1 )
    self.assert_( self.M.getSpeciesType(0) == c )
    pass  

  def test_Model_createUnit(self):
    self.M.createUnitDefinition()
    self.M.createUnitDefinition()
    u = self.M.createUnit()
    self.assert_( u != None )
    self.assert_( self.M.getNumUnitDefinitions() == 2 )
    ud = self.M.getUnitDefinition(1)
    self.assert_( ud.getNumUnits() == 1 )
    self.assert_( ud.getUnit(0) == u )
    pass  

  def test_Model_createUnitDefinition(self):
    ud = self.M.createUnitDefinition()
    self.assert_( ud != None )
    self.assert_( self.M.getNumUnitDefinitions() == 1 )
    self.assert_( self.M.getUnitDefinition(0) == ud )
    pass  

  def test_Model_createUnit_noUnitDefinition(self):
    self.assert_( self.M.getNumUnitDefinitions() == 0 )
    self.assert_( self.M.createUnit() == None )
    pass  

  def test_Model_createWithNS(self):
    xmlns = libsbml.XMLNamespaces()
    xmlns.add( "http://www.sbml.org", "testsbml")
    sbmlns = libsbml.SBMLNamespaces(2,1)
    sbmlns.addNamespaces(xmlns)
    object = libsbml.Model(sbmlns)
    self.assert_( object.getTypeCode() == libsbml.SBML_MODEL )
    self.assert_( object.getMetaId() == "" )
    self.assert_( object.getNotes() == None )
    self.assert_( object.getAnnotation() == None )
    self.assert_( object.getLevel() == 2 )
    self.assert_( object.getVersion() == 1 )
    self.assert_( object.getNamespaces() != None )
    self.assert_( object.getNamespaces().getLength() == 2 )
    object = None
    pass  

  def test_Model_free_NULL(self):
    pass  

  def test_Model_getCompartment(self):
    c1 = libsbml.Compartment(2,4)
    c2 = libsbml.Compartment(2,4)
    c1.setId( "A")
    c2.setId( "B")
    self.M.addCompartment(c1)
    self.M.addCompartment(c2)
    self.assert_( self.M.getNumCompartments() == 2 )
    c1 = self.M.getCompartment(0)
    c2 = self.M.getCompartment(1)
    self.assert_((  "A" == c1.getId() ))
    self.assert_((  "B" == c2.getId() ))
    pass  

  def test_Model_getCompartmentById(self):
    c1 = libsbml.Compartment(2,4)
    c2 = libsbml.Compartment(2,4)
    c1.setId( "A" )
    c2.setId( "B" )
    self.M.addCompartment(c1)
    self.M.addCompartment(c2)
    self.assert_( self.M.getNumCompartments() == 2 )
    self.assert_( self.M.getCompartment( "A" ) != c1 )
    self.assert_( self.M.getCompartment( "B" ) != c2 )
    self.assert_( self.M.getCompartment( "C" ) == None )
    pass  

  def test_Model_getEventById(self):
    e1 = libsbml.Event(2,4)
    e2 = libsbml.Event(2,4)
    t = libsbml.Trigger(2,4)
    e1.setTrigger(t)
    e2.setTrigger(t)
    e1.createEventAssignment()
    e2.createEventAssignment()
    e1.setId( "e1" )
    e2.setId( "e2" )
    self.M.addEvent(e1)
    self.M.addEvent(e2)
    self.assert_( self.M.getNumEvents() == 2 )
    self.assert_( self.M.getEvent( "e1" ) != e1 )
    self.assert_( self.M.getEvent( "e2" ) != e2 )
    self.assert_( self.M.getEvent( "e3" ) == None )
    pass  

  def test_Model_getFunctionDefinitionById(self):
    fd1 = libsbml.FunctionDefinition(2,4)
    fd2 = libsbml.FunctionDefinition(2,4)
    fd1.setId( "sin" )
    fd2.setId( "cos" )
    fd1.setMath(libsbml.parseFormula("2"))
    fd2.setMath(libsbml.parseFormula("2"))
    self.M.addFunctionDefinition(fd1)
    self.M.addFunctionDefinition(fd2)
    self.assert_( self.M.getNumFunctionDefinitions() == 2 )
    self.assert_( self.M.getFunctionDefinition( "sin" ) != fd1 )
    self.assert_( self.M.getFunctionDefinition( "cos" ) != fd2 )
    self.assert_( self.M.getFunctionDefinition( "tan" ) == None )
    pass  

  def test_Model_getNumSpeciesWithBoundaryCondition(self):
    s1 = libsbml.Species(2,4)
    s2 = libsbml.Species(2,4)
    s3 = libsbml.Species(2,4)
    s1.setId( "s1")
    s2.setId( "s2")
    s3.setId( "s3")
    s1.setCompartment( "c1")
    s2.setCompartment( "c2")
    s3.setCompartment( "c3")
    s1.setBoundaryCondition(True)
    s2.setBoundaryCondition(False)
    s3.setBoundaryCondition(True)
    self.assert_( self.M.getNumSpecies() == 0 )
    self.assert_( self.M.getNumSpeciesWithBoundaryCondition() == 0 )
    self.M.addSpecies(s1)
    self.assert_( self.M.getNumSpecies() == 1 )
    self.assert_( self.M.getNumSpeciesWithBoundaryCondition() == 1 )
    self.M.addSpecies(s2)
    self.assert_( self.M.getNumSpecies() == 2 )
    self.assert_( self.M.getNumSpeciesWithBoundaryCondition() == 1 )
    self.M.addSpecies(s3)
    self.assert_( self.M.getNumSpecies() == 3 )
    self.assert_( self.M.getNumSpeciesWithBoundaryCondition() == 2 )
    pass  

  def test_Model_getParameter(self):
    p1 = libsbml.Parameter(2,4)
    p2 = libsbml.Parameter(2,4)
    p1.setId( "Km1")
    p2.setId( "Km2")
    self.M.addParameter(p1)
    self.M.addParameter(p2)
    self.assert_( self.M.getNumParameters() == 2 )
    p1 = self.M.getParameter(0)
    p2 = self.M.getParameter(1)
    self.assert_((  "Km1" == p1.getId() ))
    self.assert_((  "Km2" == p2.getId() ))
    pass  

  def test_Model_getParameterById(self):
    p1 = libsbml.Parameter(2,4)
    p2 = libsbml.Parameter(2,4)
    p1.setId( "Km1" )
    p2.setId( "Km2" )
    self.M.addParameter(p1)
    self.M.addParameter(p2)
    self.assert_( self.M.getNumParameters() == 2 )
    self.assert_( self.M.getParameter( "Km1" ) != p1 )
    self.assert_( self.M.getParameter( "Km2" ) != p2 )
    self.assert_( self.M.getParameter( "Km3" ) == None )
    pass  

  def test_Model_getReaction(self):
    r1 = libsbml.Reaction(2,4)
    r2 = libsbml.Reaction(2,4)
    r1.setId( "reaction_1")
    r2.setId( "reaction_2")
    self.M.addReaction(r1)
    self.M.addReaction(r2)
    self.assert_( self.M.getNumReactions() == 2 )
    r1 = self.M.getReaction(0)
    r2 = self.M.getReaction(1)
    self.assert_((  "reaction_1" == r1.getId() ))
    self.assert_((  "reaction_2" == r2.getId() ))
    pass  

  def test_Model_getReactionById(self):
    r1 = libsbml.Reaction(2,4)
    r2 = libsbml.Reaction(2,4)
    r1.setId( "reaction_1" )
    r2.setId( "reaction_2" )
    self.M.addReaction(r1)
    self.M.addReaction(r2)
    self.assert_( self.M.getNumReactions() == 2 )
    self.assert_( self.M.getReaction( "reaction_1" ) != r1 )
    self.assert_( self.M.getReaction( "reaction_2" ) != r2 )
    self.assert_( self.M.getReaction( "reaction_3" ) == None )
    pass  

  def test_Model_getRules(self):
    ar = libsbml.AlgebraicRule(2,4)
    scr = libsbml.AssignmentRule(2,4)
    cvr = libsbml.AssignmentRule(2,4)
    pr = libsbml.AssignmentRule(2,4)
    scr.setVariable( "r2")
    cvr.setVariable( "r3")
    pr.setVariable( "r4")
    ar.setFormula( "x + 1"         )
    scr.setFormula( "k * t/(1 + k)" )
    cvr.setFormula( "0.10 * t"      )
    pr.setFormula( "k3/k2"         )
    self.M.addRule(ar)
    self.M.addRule(scr)
    self.M.addRule(cvr)
    self.M.addRule(pr)
    self.assert_( self.M.getNumRules() == 4 )
    ar = self.M.getRule(0)
    scr = self.M.getRule(1)
    cvr = self.M.getRule(2)
    pr = self.M.getRule(3)
    self.assert_((  "x + 1"         == ar.getFormula() ))
    self.assert_((  "k * t/(1 + k)" == scr.getFormula() ))
    self.assert_((  "0.10 * t"      == cvr.getFormula() ))
    self.assert_((  "k3/k2"         == pr.getFormula() ))
    pass  

  def test_Model_getSpecies(self):
    s1 = libsbml.Species(2,4)
    s2 = libsbml.Species(2,4)
    s1.setId( "Glucose"     )
    s2.setId( "Glucose_6_P" )
    s1.setCompartment( "c")
    s2.setCompartment( "c")
    self.M.addSpecies(s1)
    self.M.addSpecies(s2)
    self.assert_( self.M.getNumSpecies() == 2 )
    s1 = self.M.getSpecies(0)
    s2 = self.M.getSpecies(1)
    self.assert_((  "Glucose"      == s1.getId() ))
    self.assert_((  "Glucose_6_P"  == s2.getId() ))
    pass  

  def test_Model_getSpeciesById(self):
    s1 = libsbml.Species(2,4)
    s2 = libsbml.Species(2,4)
    s1.setId( "Glucose"     )
    s2.setId( "Glucose_6_P" )
    s1.setCompartment( "c")
    s2.setCompartment( "c")
    self.M.addSpecies(s1)
    self.M.addSpecies(s2)
    self.assert_( self.M.getNumSpecies() == 2 )
    self.assert_( self.M.getSpecies( "Glucose"    ) != s1 )
    self.assert_( self.M.getSpecies( "Glucose_6_P") != s2 )
    self.assert_( self.M.getSpecies( "Glucose2"   ) == None )
    pass  

  def test_Model_getSpeciesReferenceById(self):
    r1 = libsbml.Reaction(2,4)
    r1.setId("r1")
    sr = r1.createReactant()
    sr.setId( "s1")
    self.M.addReaction(r1)
    self.assert_( self.M.getNumReactions() == 1 )
    self.assert_( self.M.getSpeciesReference( "s1" ) != sr )
    pass  

  def test_Model_getUnitDefinition(self):
    ud1 = libsbml.UnitDefinition(2,4)
    ud2 = libsbml.UnitDefinition(2,4)
    ud1.setId( "mmls"   )
    ud2.setId( "volume" )
    ud1.createUnit()
    ud2.createUnit()
    self.M.addUnitDefinition(ud1)
    self.M.addUnitDefinition(ud2)
    self.assert_( self.M.getNumUnitDefinitions() == 2 )
    ud1 = self.M.getUnitDefinition(0)
    ud2 = self.M.getUnitDefinition(1)
    self.assert_((  "mmls"    == ud1.getId() ))
    self.assert_((  "volume"  == ud2.getId() ))
    pass  

  def test_Model_getUnitDefinitionById(self):
    ud1 = libsbml.UnitDefinition(2,4)
    ud2 = libsbml.UnitDefinition(2,4)
    ud1.setId( "mmls"   )
    ud2.setId( "volume" )
    ud1.createUnit()
    ud2.createUnit()
    self.M.addUnitDefinition(ud1)
    self.M.addUnitDefinition(ud2)
    self.assert_( self.M.getNumUnitDefinitions() == 2 )
    self.assert_( self.M.getUnitDefinition( "mmls"       ) != ud1 )
    self.assert_( self.M.getUnitDefinition( "volume"     ) != ud2 )
    self.assert_( self.M.getUnitDefinition( "rototillers") == None )
    pass  

  def test_Model_removeCompartment(self):
    o1 = self.M.createCompartment()
    o2 = self.M.createCompartment()
    o3 = self.M.createCompartment()
    o3.setId("test")
    self.assert_( self.M.removeCompartment(0) == o1 )
    self.assert_( self.M.getNumCompartments() == 2 )
    self.assert_( self.M.removeCompartment(0) == o2 )
    self.assert_( self.M.getNumCompartments() == 1 )
    self.assert_( self.M.removeCompartment("test") == o3 )
    self.assert_( self.M.getNumCompartments() == 0 )
    o1 = None
    o2 = None
    o3 = None
    pass  

  def test_Model_removeCompartmentType(self):
    o1 = self.M.createCompartmentType()
    o2 = self.M.createCompartmentType()
    o3 = self.M.createCompartmentType()
    o3.setId("test")
    self.assert_( self.M.removeCompartmentType(0) == o1 )
    self.assert_( self.M.getNumCompartmentTypes() == 2 )
    self.assert_( self.M.removeCompartmentType(0) == o2 )
    self.assert_( self.M.getNumCompartmentTypes() == 1 )
    self.assert_( self.M.removeCompartmentType("test") == o3 )
    self.assert_( self.M.getNumCompartmentTypes() == 0 )
    o1 = None
    o2 = None
    o3 = None
    pass  

  def test_Model_removeConstraint(self):
    o1 = self.M.createConstraint()
    o2 = self.M.createConstraint()
    o3 = self.M.createConstraint()
    self.assert_( self.M.removeConstraint(0) == o1 )
    self.assert_( self.M.getNumConstraints() == 2 )
    self.assert_( self.M.removeConstraint(0) == o2 )
    self.assert_( self.M.getNumConstraints() == 1 )
    self.assert_( self.M.removeConstraint(0) == o3 )
    self.assert_( self.M.getNumConstraints() == 0 )
    o1 = None
    o2 = None
    o3 = None
    pass  

  def test_Model_removeEvent(self):
    o1 = self.M.createEvent()
    o2 = self.M.createEvent()
    o3 = self.M.createEvent()
    o3.setId("test")
    self.assert_( self.M.removeEvent(0) == o1 )
    self.assert_( self.M.getNumEvents() == 2 )
    self.assert_( self.M.removeEvent(0) == o2 )
    self.assert_( self.M.getNumEvents() == 1 )
    self.assert_( self.M.removeEvent("test") == o3 )
    self.assert_( self.M.getNumEvents() == 0 )
    o1 = None
    o2 = None
    o3 = None
    pass  

  def test_Model_removeFunctionDefinition(self):
    o1 = self.M.createFunctionDefinition()
    o2 = self.M.createFunctionDefinition()
    o3 = self.M.createFunctionDefinition()
    o3.setId("test")
    self.assert_( self.M.removeFunctionDefinition(0) == o1 )
    self.assert_( self.M.getNumFunctionDefinitions() == 2 )
    self.assert_( self.M.removeFunctionDefinition(0) == o2 )
    self.assert_( self.M.getNumFunctionDefinitions() == 1 )
    self.assert_( self.M.removeFunctionDefinition("test") == o3 )
    self.assert_( self.M.getNumFunctionDefinitions() == 0 )
    o1 = None
    o2 = None
    o3 = None
    pass  

  def test_Model_removeInitialAssignment(self):
    o1 = self.M.createInitialAssignment()
    o2 = self.M.createInitialAssignment()
    o3 = self.M.createInitialAssignment()
    o3.setSymbol("test")
    self.assert_( self.M.removeInitialAssignment(0) == o1 )
    self.assert_( self.M.getNumInitialAssignments() == 2 )
    self.assert_( self.M.removeInitialAssignment(0) == o2 )
    self.assert_( self.M.getNumInitialAssignments() == 1 )
    self.assert_( self.M.removeInitialAssignment("test") == o3 )
    self.assert_( self.M.getNumInitialAssignments() == 0 )
    o1 = None
    o2 = None
    o3 = None
    pass  

  def test_Model_removeParameter(self):
    o1 = self.M.createParameter()
    o2 = self.M.createParameter()
    o3 = self.M.createParameter()
    o3.setId("test")
    self.assert_( self.M.removeParameter(0) == o1 )
    self.assert_( self.M.getNumParameters() == 2 )
    self.assert_( self.M.removeParameter(0) == o2 )
    self.assert_( self.M.getNumParameters() == 1 )
    self.assert_( self.M.removeParameter("test") == o3 )
    self.assert_( self.M.getNumParameters() == 0 )
    o1 = None
    o2 = None
    o3 = None
    pass  

  def test_Model_removeReaction(self):
    o1 = self.M.createReaction()
    o2 = self.M.createReaction()
    o3 = self.M.createReaction()
    o3.setId("test")
    self.assert_( self.M.removeReaction(0) == o1 )
    self.assert_( self.M.getNumReactions() == 2 )
    self.assert_( self.M.removeReaction(0) == o2 )
    self.assert_( self.M.getNumReactions() == 1 )
    self.assert_( self.M.removeReaction("test") == o3 )
    self.assert_( self.M.getNumReactions() == 0 )
    o1 = None
    o2 = None
    o3 = None
    pass  

  def test_Model_removeRule(self):
    o1 = self.M.createAssignmentRule()
    o2 = self.M.createAlgebraicRule()
    o3 = self.M.createRateRule()
    o3.setVariable("test")
    self.assert_( self.M.removeRule(0) == o1 )
    self.assert_( self.M.getNumRules() == 2 )
    self.assert_( self.M.removeRule(0) == o2 )
    self.assert_( self.M.getNumRules() == 1 )
    self.assert_( self.M.removeRule("test") == o3 )
    self.assert_( self.M.getNumRules() == 0 )
    o1 = None
    o2 = None
    o3 = None
    pass  

  def test_Model_removeSpecies(self):
    o1 = self.M.createSpecies()
    o2 = self.M.createSpecies()
    o3 = self.M.createSpecies()
    o3.setId("test")
    self.assert_( self.M.removeSpecies(0) == o1 )
    self.assert_( self.M.getNumSpecies() == 2 )
    self.assert_( self.M.removeSpecies(0) == o2 )
    self.assert_( self.M.getNumSpecies() == 1 )
    self.assert_( self.M.removeSpecies("test") == o3 )
    self.assert_( self.M.getNumSpecies() == 0 )
    o1 = None
    o2 = None
    o3 = None
    pass  

  def test_Model_removeSpeciesType(self):
    o1 = self.M.createSpeciesType()
    o2 = self.M.createSpeciesType()
    o3 = self.M.createSpeciesType()
    o3.setId("test")
    self.assert_( self.M.removeSpeciesType(0) == o1 )
    self.assert_( self.M.getNumSpeciesTypes() == 2 )
    self.assert_( self.M.removeSpeciesType(0) == o2 )
    self.assert_( self.M.getNumSpeciesTypes() == 1 )
    self.assert_( self.M.removeSpeciesType("test") == o3 )
    self.assert_( self.M.getNumSpeciesTypes() == 0 )
    o1 = None
    o2 = None
    o3 = None
    pass  

  def test_Model_removeUnitDefinition(self):
    o1 = self.M.createUnitDefinition()
    o2 = self.M.createUnitDefinition()
    o3 = self.M.createUnitDefinition()
    o3.setId("test")
    self.assert_( self.M.removeUnitDefinition(0) == o1 )
    self.assert_( self.M.getNumUnitDefinitions() == 2 )
    self.assert_( self.M.removeUnitDefinition(0) == o2 )
    self.assert_( self.M.getNumUnitDefinitions() == 1 )
    self.assert_( self.M.removeUnitDefinition("test") == o3 )
    self.assert_( self.M.getNumUnitDefinitions() == 0 )
    o1 = None
    o2 = None
    o3 = None
    pass  

  def test_Model_setId(self):
    id =  "Branch";
    self.M.setId(id)
    self.assert_(( id == self.M.getId() ))
    self.assertEqual( True, self.M.isSetId() )
    if (self.M.getId() == id):
      pass    
    self.M.setId(self.M.getId())
    self.assert_(( id == self.M.getId() ))
    self.M.setId("")
    self.assertEqual( False, self.M.isSetId() )
    if (self.M.getId() != None):
      pass    
    self.M.setId(id)
    self.M.unsetId()
    self.assertEqual( False, self.M.isSetId() )
    pass  

  def test_Model_setName(self):
    name =  "My_Branch_Model";
    self.M.setName(name)
    self.assert_(( name == self.M.getName() ))
    self.assertEqual( True, self.M.isSetName() )
    if (self.M.getName() == name):
      pass    
    self.M.setName(self.M.getName())
    self.assert_(( name == self.M.getName() ))
    self.M.setName("")
    self.assertEqual( False, self.M.isSetName() )
    if (self.M.getName() != None):
      pass    
    pass  

  def test_Model_setgetModelHistory(self):
    history = libsbml.ModelHistory()
    mc = libsbml.ModelCreator()
    date = libsbml.Date(2005,12,30,12,15,45,1,2,0)
    mc.setFamilyName( "Keating")
    mc.setGivenName( "Sarah")
    mc.setEmail( "sbml-team@caltech.edu")
    mc.setOrganisation( "UH")
    history.addCreator(mc)
    history.setCreatedDate(date)
    history.setModifiedDate(date)
    self.assert_( self.M.isSetModelHistory() == False )
    self.M.setModelHistory(history)
    self.assert_( self.M.isSetModelHistory() == True )
    newMC = history.getCreator(0)
    self.assert_( newMC != None )
    self.assert_((  "Keating" == newMC.getFamilyName() ))
    self.assert_((  "Sarah" == newMC.getGivenName() ))
    self.assert_((  "sbml-team@caltech.edu" == newMC.getEmail() ))
    self.assert_((  "UH" == newMC.getOrganisation() ))
    self.M.unsetModelHistory()
    self.assert_( self.M.isSetModelHistory() == False )
    history = None
    mc = None
    pass  

def suite():
  suite = unittest.TestSuite()
  suite.addTest(unittest.makeSuite(TestModel))

  return suite

if __name__ == "__main__":
  if unittest.TextTestRunner(verbosity=1).run(suite()).wasSuccessful() :
    sys.exit(0)
  else:
    sys.exit(1)
