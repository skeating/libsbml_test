#
# @file    TestSBMLParentObject.py
# @brief   SBML parent object unit tests
#
# @author  Akiya Jouraku (Python conversion)
# @author  Sarah Keating 
#
# $Id$
# $HeadURL$
#
# This test file was converted from src/sbml/test/TestSBMLParentObject.cpp
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

class TestSBMLParentObject(unittest.TestCase):


  def test_AlgebraicRule_parent_create(self):
    m = libsbml.Model(2,4)
    r = m.createAlgebraicRule()
    lo = m.getListOfRules()
    self.assert_( lo == m.getRule(0).getParentSBMLObject() )
    self.assert_( lo == r.getParentSBMLObject() )
    self.assert_( m == lo.getParentSBMLObject() )
    pass  

  def test_AssignmentRule_parent_create(self):
    m = libsbml.Model(2,4)
    r = m.createAssignmentRule()
    lo = m.getListOfRules()
    self.assert_( lo == m.getRule(0).getParentSBMLObject() )
    self.assert_( lo == r.getParentSBMLObject() )
    self.assert_( m == lo.getParentSBMLObject() )
    pass  

  def test_CompartmentType_parent_NULL(self):
    d = libsbml.SBMLDocument(2,4)
    m = d.createModel()
    c = m.createCompartmentType()
    c1 = c.clone()
    d = None
    self.assert_( c1.getAncestorOfType(libsbml.SBML_MODEL) == None )
    self.assert_( c1.getParentSBMLObject() == None )
    self.assert_( c1.getSBMLDocument() == None )
    c1 = None
    pass  

  def test_CompartmentType_parent_add(self):
    ct = libsbml.CompartmentType(2,4)
    m = libsbml.Model(2,4)
    ct.setId("ct")
    m.addCompartmentType(ct)
    ct = None
    lo = m.getListOfCompartmentTypes()
    self.assert_( lo == m.getCompartmentType(0).getParentSBMLObject() )
    self.assert_( m == lo.getParentSBMLObject() )
    pass  

  def test_CompartmentType_parent_create(self):
    m = libsbml.Model(2,4)
    ct = m.createCompartmentType()
    lo = m.getListOfCompartmentTypes()
    self.assert_( lo == m.getCompartmentType(0).getParentSBMLObject() )
    self.assert_( lo == ct.getParentSBMLObject() )
    self.assert_( m == lo.getParentSBMLObject() )
    pass  

  def test_Compartment_parent_NULL(self):
    d = libsbml.SBMLDocument()
    m = d.createModel()
    c = m.createCompartment()
    c1 = c.clone()
    d = None
    self.assert_( c1.getAncestorOfType(libsbml.SBML_MODEL) == None )
    self.assert_( c1.getParentSBMLObject() == None )
    self.assert_( c1.getSBMLDocument() == None )
    c1 = None
    pass  

  def test_Compartment_parent_add(self):
    c = libsbml.Compartment(2,4)
    c.setId("c")
    m = libsbml.Model(2,4)
    m.addCompartment(c)
    c = None
    lo = m.getListOfCompartments()
    self.assert_( lo == m.getCompartment(0).getParentSBMLObject() )
    self.assert_( m == lo.getParentSBMLObject() )
    pass  

  def test_Compartment_parent_create(self):
    m = libsbml.Model(2,4)
    c = m.createCompartment()
    lo = m.getListOfCompartments()
    self.assert_( lo == m.getCompartment(0).getParentSBMLObject() )
    self.assert_( lo == c.getParentSBMLObject() )
    self.assert_( m == lo.getParentSBMLObject() )
    pass  

  def test_Constraint_parent_NULL(self):
    d = libsbml.SBMLDocument()
    m = d.createModel()
    c = m.createConstraint()
    c1 = c.clone()
    d = None
    self.assert_( c1.getAncestorOfType(libsbml.SBML_MODEL) == None )
    self.assert_( c1.getParentSBMLObject() == None )
    self.assert_( c1.getSBMLDocument() == None )
    c1 = None
    pass  

  def test_Constraint_parent_add(self):
    ct = libsbml.Constraint(2,4)
    m = libsbml.Model(2,4)
    ct.setMath(libsbml.parseFormula("a-k"))
    m.addConstraint(ct)
    ct = None
    lo = m.getListOfConstraints()
    self.assert_( lo == m.getConstraint(0).getParentSBMLObject() )
    self.assert_( m == lo.getParentSBMLObject() )
    pass  

  def test_Constraint_parent_create(self):
    m = libsbml.Model(2,4)
    ct = m.createConstraint()
    lo = m.getListOfConstraints()
    self.assert_( lo == m.getConstraint(0).getParentSBMLObject() )
    self.assert_( lo == ct.getParentSBMLObject() )
    self.assert_( m == lo.getParentSBMLObject() )
    pass  

  def test_Delay_parent_add(self):
    d = libsbml.Delay(2,4)
    e = libsbml.Event(2,4)
    e.setDelay(d)
    d = None
    self.assert_( e == e.getDelay().getParentSBMLObject() )
    e = None
    pass  

  def test_EventAssignment_parent_add(self):
    e = libsbml.Event(2,4)
    ea = libsbml.EventAssignment(2,4)
    ea.setVariable("c")
    ea.setMath(libsbml.parseFormula("K+L"))
    e.addEventAssignment(ea)
    ea = None
    lo = e.getListOfEventAssignments()
    self.assert_( lo == e.getEventAssignment(0).getParentSBMLObject() )
    self.assert_( e == lo.getParentSBMLObject() )
    pass  

  def test_EventAssignment_parent_create(self):
    e = libsbml.Event(2,4)
    ea = e.createEventAssignment()
    lo = e.getListOfEventAssignments()
    self.assert_( lo == e.getEventAssignment(0).getParentSBMLObject() )
    self.assert_( lo == ea.getParentSBMLObject() )
    self.assert_( e == lo.getParentSBMLObject() )
    pass  

  def test_EventAssignment_parent_create_model(self):
    m = libsbml.Model(2,4)
    e = m.createEvent()
    ea = m.createEventAssignment()
    lo = e.getListOfEventAssignments()
    self.assert_( lo == e.getEventAssignment(0).getParentSBMLObject() )
    self.assert_( lo == ea.getParentSBMLObject() )
    self.assert_( e == lo.getParentSBMLObject() )
    pass  

  def test_Event_parent_NULL(self):
    d = libsbml.SBMLDocument(2,4)
    m = d.createModel()
    c = m.createEvent()
    ea = c.createEventAssignment()
    t = libsbml.Trigger(2,4)
    t.setMath(libsbml.ASTNode())
    dy = libsbml.Delay(2,4)
    dy.setMath(libsbml.ASTNode())
    c.setTrigger(t)
    c.setDelay(dy)
    self.assert_( c.getAncestorOfType(libsbml.SBML_MODEL) == m )
    self.assert_( c.getTrigger().getParentSBMLObject() == c )
    self.assert_( c.getDelay().getSBMLDocument() == d )
    self.assert_( ea.getAncestorOfType(libsbml.SBML_EVENT) == c )
    c1 = c.clone()
    d = None
    self.assert_( c1.getAncestorOfType(libsbml.SBML_MODEL) == None )
    self.assert_( c1.getParentSBMLObject() == None )
    self.assert_( c1.getSBMLDocument() == None )
    self.assert_( c1.getEventAssignment(0).getAncestorOfType(libsbml.SBML_MODEL) == None )
    self.assert_( c1.getEventAssignment(0).getAncestorOfType(libsbml.SBML_EVENT) == c1 )
    self.assert_( c1.getEventAssignment(0).getParentSBMLObject() != None )
    self.assert_( c1.getEventAssignment(0).getSBMLDocument() == None )
    self.assert_( c1.getTrigger().getAncestorOfType(libsbml.SBML_MODEL) == None )
    self.assert_( c1.getTrigger().getAncestorOfType(libsbml.SBML_EVENT) == c1 )
    self.assert_( c1.getTrigger().getParentSBMLObject() != None )
    self.assert_( c1.getTrigger().getSBMLDocument() == None )
    self.assert_( c1.getDelay().getAncestorOfType(libsbml.SBML_MODEL) == None )
    self.assert_( c1.getDelay().getAncestorOfType(libsbml.SBML_EVENT) == c1 )
    self.assert_( c1.getDelay().getParentSBMLObject() != None )
    self.assert_( c1.getDelay().getSBMLDocument() == None )
    c1 = None
    pass  

  def test_Event_parent_add(self):
    e = libsbml.Event(2,4)
    t = libsbml.Trigger(2,4)
    e.setTrigger(t)
    e.createEventAssignment()
    m = libsbml.Model(2,4)
    m.addEvent(e)
    e = None
    lo = m.getListOfEvents()
    self.assert_( lo == m.getEvent(0).getParentSBMLObject() )
    self.assert_( m == lo.getParentSBMLObject() )
    pass  

  def test_Event_parent_create(self):
    m = libsbml.Model(2,4)
    e = m.createEvent()
    lo = m.getListOfEvents()
    self.assert_( lo == m.getEvent(0).getParentSBMLObject() )
    self.assert_( lo == e.getParentSBMLObject() )
    self.assert_( m == lo.getParentSBMLObject() )
    pass  

  def test_FunctionDefinition_parent_NULL(self):
    d = libsbml.SBMLDocument()
    m = d.createModel()
    c = m.createFunctionDefinition()
    c1 = c.clone()
    d = None
    self.assert_( c1.getAncestorOfType(libsbml.SBML_MODEL) == None )
    self.assert_( c1.getParentSBMLObject() == None )
    self.assert_( c1.getSBMLDocument() == None )
    c1 = None
    pass  

  def test_FunctionDefinition_parent_add(self):
    fd = libsbml.FunctionDefinition(2,4)
    m = libsbml.Model(2,4)
    fd.setId("fd")
    fd.setMath(libsbml.parseFormula("l"))
    m.addFunctionDefinition(fd)
    fd = None
    lo = m.getListOfFunctionDefinitions()
    self.assert_( lo == m.getFunctionDefinition(0).getParentSBMLObject() )
    self.assert_( m == lo.getParentSBMLObject() )
    pass  

  def test_FunctionDefinition_parent_create(self):
    m = libsbml.Model(2,4)
    fd = m.createFunctionDefinition()
    lo = m.getListOfFunctionDefinitions()
    self.assert_( lo == m.getFunctionDefinition(0).getParentSBMLObject() )
    self.assert_( lo == fd.getParentSBMLObject() )
    self.assert_( m == lo.getParentSBMLObject() )
    pass  

  def test_InitialAssignment_parent_NULL(self):
    d = libsbml.SBMLDocument()
    m = d.createModel()
    c = m.createInitialAssignment()
    c1 = c.clone()
    d = None
    self.assert_( c1.getAncestorOfType(libsbml.SBML_MODEL) == None )
    self.assert_( c1.getParentSBMLObject() == None )
    self.assert_( c1.getSBMLDocument() == None )
    c1 = None
    pass  

  def test_InitialAssignment_parent_add(self):
    ia = libsbml.InitialAssignment(2,4)
    m = libsbml.Model(2,4)
    ia.setSymbol("c")
    ia.setMath(libsbml.parseFormula("9"))
    m.addInitialAssignment(ia)
    ia = None
    lo = m.getListOfInitialAssignments()
    self.assert_( lo == m.getInitialAssignment(0).getParentSBMLObject() )
    self.assert_( m == lo.getParentSBMLObject() )
    pass  

  def test_InitialAssignment_parent_create(self):
    m = libsbml.Model(2,4)
    ia = m.createInitialAssignment()
    lo = m.getListOfInitialAssignments()
    self.assert_( lo == m.getInitialAssignment(0).getParentSBMLObject() )
    self.assert_( lo == ia.getParentSBMLObject() )
    self.assert_( m == lo.getParentSBMLObject() )
    pass  

  def test_KineticLaw_Parameter_parent_add(self):
    kl = libsbml.KineticLaw(2,4)
    p = libsbml.Parameter(2,4)
    p.setId("jake")
    kl.addParameter(p)
    p = None
    self.assert_( kl.getNumParameters() == 1 )
    self.assert_( kl.getParameter(0).getId() ==  "jake" )
    lop = kl.getListOfParameters()
    self.assert_( kl == lop.getParentSBMLObject() )
    self.assert_( lop == kl.getParameter(0).getParentSBMLObject() )
    kl = None
    pass  

  def test_KineticLaw_Parameter_parent_create(self):
    kl = libsbml.KineticLaw(2,4)
    p = kl.createParameter()
    self.assert_( kl.getNumParameters() == 1 )
    lop = kl.getListOfParameters()
    self.assert_( kl == lop.getParentSBMLObject() )
    self.assert_( lop == p.getParentSBMLObject() )
    self.assert_( lop == kl.getParameter(0).getParentSBMLObject() )
    kl = None
    pass  

  def test_KineticLaw_Parameter_parent_create_model(self):
    m = libsbml.Model(2,4)
    r = m.createReaction()
    kl = m.createKineticLaw()
    p = m.createKineticLawParameter()
    self.assert_( kl.getNumParameters() == 1 )
    lop = kl.getListOfParameters()
    self.assert_( r == kl.getParentSBMLObject() )
    self.assert_( kl == lop.getParentSBMLObject() )
    self.assert_( lop == p.getParentSBMLObject() )
    self.assert_( lop == kl.getParameter(0).getParentSBMLObject() )
    kl = None
    pass  

  def test_KineticLaw_parent_NULL(self):
    r = libsbml.Reaction(2,4)
    kl = r.createKineticLaw()
    p = kl.createParameter()
    self.assert_( r == kl.getParentSBMLObject() )
    self.assert_( r == p.getAncestorOfType(libsbml.SBML_REACTION) )
    self.assert_( kl == p.getAncestorOfType(libsbml.SBML_KINETIC_LAW) )
    kl1 = kl.clone()
    self.assert_( kl1.getParentSBMLObject() == None )
    self.assert_( kl1.getParameter(0).getAncestorOfType(libsbml.SBML_REACTION) == None )
    self.assert_( kl1 == kl1.getParameter(0).getAncestorOfType(libsbml.SBML_KINETIC_LAW) )
    r = None
    pass  

  def test_KineticLaw_parent_add(self):
    kl = libsbml.KineticLaw(2,4)
    r = libsbml.Reaction(2,4)
    r.setKineticLaw(kl)
    self.assert_( r == r.getKineticLaw().getParentSBMLObject() )
    r = None
    pass  

  def test_KineticLaw_parent_create(self):
    r = libsbml.Reaction(2,4)
    kl = r.createKineticLaw()
    self.assert_( r == kl.getParentSBMLObject() )
    r = None
    pass  

  def test_KineticLaw_parent_create_model(self):
    m = libsbml.Model(2,4)
    r = m.createReaction()
    kl = r.createKineticLaw()
    self.assert_( r == kl.getParentSBMLObject() )
    self.assert_( r == r.getKineticLaw().getParentSBMLObject() )
    r = None
    pass  

  def test_Model_parent_add(self):
    d = libsbml.SBMLDocument(2,4)
    m = libsbml.Model(2,4)
    d.setModel(m)
    self.assert_( d == d.getModel().getParentSBMLObject() )
    d = None
    pass  

  def test_Model_parent_create(self):
    d = libsbml.SBMLDocument(2,4)
    m = d.createModel()
    self.assert_( d == m.getParentSBMLObject() )
    d = None
    pass  

  def test_Parameter_parent_NULL(self):
    d = libsbml.SBMLDocument()
    m = d.createModel()
    c = m.createParameter()
    c1 = c.clone()
    d = None
    self.assert_( c1.getAncestorOfType(libsbml.SBML_MODEL) == None )
    self.assert_( c1.getParentSBMLObject() == None )
    self.assert_( c1.getSBMLDocument() == None )
    c1 = None
    pass  

  def test_Parameter_parent_add(self):
    ia = libsbml.Parameter(2,4)
    m = libsbml.Model(2,4)
    ia.setId("p")
    m.addParameter(ia)
    ia = None
    lo = m.getListOfParameters()
    self.assert_( lo == m.getParameter(0).getParentSBMLObject() )
    self.assert_( m == lo.getParentSBMLObject() )
    pass  

  def test_Parameter_parent_create(self):
    m = libsbml.Model(2,4)
    p = m.createParameter()
    lo = m.getListOfParameters()
    self.assert_( lo == m.getParameter(0).getParentSBMLObject() )
    self.assert_( lo == p.getParentSBMLObject() )
    self.assert_( m == lo.getParentSBMLObject() )
    pass  

  def test_RateRule_parent_create(self):
    m = libsbml.Model(2,4)
    r = m.createRateRule()
    lo = m.getListOfRules()
    self.assert_( lo == m.getRule(0).getParentSBMLObject() )
    self.assert_( lo == r.getParentSBMLObject() )
    self.assert_( m == lo.getParentSBMLObject() )
    pass  

  def test_Reaction_parent_NULL(self):
    d = libsbml.SBMLDocument()
    m = d.createModel()
    c = m.createReaction()
    sr = c.createReactant()
    kl = c.createKineticLaw()
    self.assert_( c.getAncestorOfType(libsbml.SBML_MODEL) == m )
    self.assert_( c.getSBMLDocument() == d )
    self.assert_( sr.getAncestorOfType(libsbml.SBML_REACTION) == c )
    self.assert_( kl.getAncestorOfType(libsbml.SBML_REACTION) == c )
    c1 = c.clone()
    d = None
    self.assert_( c1.getAncestorOfType(libsbml.SBML_MODEL) == None )
    self.assert_( c1.getParentSBMLObject() == None )
    self.assert_( c1.getSBMLDocument() == None )
    sr1 = c1.getReactant(0)
    self.assert_( sr1.getAncestorOfType(libsbml.SBML_MODEL) == None )
    self.assert_( sr1.getAncestorOfType(libsbml.SBML_REACTION) == c1 )
    self.assert_( sr1.getSBMLDocument() == None )
    self.assert_( c1.getKineticLaw().getAncestorOfType(libsbml.SBML_MODEL) == None )
    self.assert_( c1.getKineticLaw().getAncestorOfType(libsbml.SBML_REACTION) == c1 )
    self.assert_( c1.getKineticLaw().getSBMLDocument() == None )
    c1 = None
    pass  

  def test_Reaction_parent_add(self):
    ia = libsbml.Reaction(2,4)
    m = libsbml.Model(2,4)
    ia.setId("k")
    m.addReaction(ia)
    ia = None
    lo = m.getListOfReactions()
    self.assert_( lo == m.getReaction(0).getParentSBMLObject() )
    self.assert_( m == lo.getParentSBMLObject() )
    pass  

  def test_Reaction_parent_create(self):
    m = libsbml.Model(2,4)
    r = m.createReaction()
    lo = m.getListOfReactions()
    self.assert_( lo == m.getReaction(0).getParentSBMLObject() )
    self.assert_( lo == r.getParentSBMLObject() )
    self.assert_( m == lo.getParentSBMLObject() )
    pass  

  def test_Rule_parent_add(self):
    ia = libsbml.RateRule(2,4)
    ia.setVariable("a")
    ia.setMath(libsbml.parseFormula("9"))
    m = libsbml.Model(2,4)
    m.addRule(ia)
    ia = None
    lo = m.getListOfRules()
    self.assert_( lo == m.getRule(0).getParentSBMLObject() )
    self.assert_( m == lo.getParentSBMLObject() )
    pass  

  def test_SpeciesReference_Modifier_parent_add(self):
    sr = libsbml.ModifierSpeciesReference(2,4)
    sr.setSpecies("s")
    r = libsbml.Reaction(2,4)
    r.addModifier(sr)
    sr = None
    lo = r.getListOfModifiers()
    self.assert_( lo == r.getModifier(0).getParentSBMLObject() )
    self.assert_( r == lo.getParentSBMLObject() )
    pass  

  def test_SpeciesReference_Modifier_parent_create(self):
    r = libsbml.Reaction(2,4)
    sr = r.createModifier()
    lo = r.getListOfModifiers()
    self.assert_( lo == sr.getParentSBMLObject() )
    self.assert_( lo == r.getModifier(0).getParentSBMLObject() )
    self.assert_( r == lo.getParentSBMLObject() )
    pass  

  def test_SpeciesReference_Modifier_parent_create_model(self):
    m = libsbml.Model(2,4)
    r = m.createReaction()
    sr = m.createModifier()
    lo = r.getListOfModifiers()
    self.assert_( lo == sr.getParentSBMLObject() )
    self.assert_( lo == r.getModifier(0).getParentSBMLObject() )
    self.assert_( r == lo.getParentSBMLObject() )
    pass  

  def test_SpeciesReference_Product_parent_add(self):
    sr = libsbml.SpeciesReference(2,4)
    r = libsbml.Reaction(2,4)
    sr.setSpecies("p")
    r.addProduct(sr)
    sr = None
    lo = r.getListOfProducts()
    self.assert_( lo == r.getProduct(0).getParentSBMLObject() )
    self.assert_( r == lo.getParentSBMLObject() )
    pass  

  def test_SpeciesReference_Product_parent_create(self):
    r = libsbml.Reaction(2,4)
    sr = r.createProduct()
    lo = r.getListOfProducts()
    self.assert_( lo == r.getProduct(0).getParentSBMLObject() )
    self.assert_( lo == sr.getParentSBMLObject() )
    self.assert_( r == lo.getParentSBMLObject() )
    pass  

  def test_SpeciesReference_Product_parent_create_model(self):
    m = libsbml.Model(2,4)
    r = m.createReaction()
    sr = m.createProduct()
    lo = r.getListOfProducts()
    self.assert_( lo == r.getProduct(0).getParentSBMLObject() )
    self.assert_( lo == sr.getParentSBMLObject() )
    self.assert_( r == lo.getParentSBMLObject() )
    pass  

  def test_SpeciesReference_Reactant_parent_add(self):
    sr = libsbml.SpeciesReference(2,4)
    r = libsbml.Reaction(2,4)
    sr.setSpecies("s")
    r.addReactant(sr)
    sr = None
    lo = r.getListOfReactants()
    self.assert_( lo == r.getReactant(0).getParentSBMLObject() )
    self.assert_( r == lo.getParentSBMLObject() )
    pass  

  def test_SpeciesReference_Reactant_parent_create(self):
    r = libsbml.Reaction(2,4)
    sr = r.createReactant()
    lo = r.getListOfReactants()
    self.assert_( lo == r.getReactant(0).getParentSBMLObject() )
    self.assert_( lo == sr.getParentSBMLObject() )
    self.assert_( r == lo.getParentSBMLObject() )
    pass  

  def test_SpeciesReference_Reactant_parent_create_model(self):
    m = libsbml.Model(2,4)
    r = m.createReaction()
    sr = m.createReactant()
    lo = r.getListOfReactants()
    self.assert_( lo == r.getReactant(0).getParentSBMLObject() )
    self.assert_( lo == sr.getParentSBMLObject() )
    self.assert_( r == lo.getParentSBMLObject() )
    pass  

  def test_SpeciesType_parent_NULL(self):
    d = libsbml.SBMLDocument(2,4)
    m = d.createModel()
    c = m.createSpeciesType()
    c1 = c.clone()
    d = None
    self.assert_( c1.getAncestorOfType(libsbml.SBML_MODEL) == None )
    self.assert_( c1.getParentSBMLObject() == None )
    self.assert_( c1.getSBMLDocument() == None )
    c1 = None
    pass  

  def test_SpeciesType_parent_add(self):
    ia = libsbml.SpeciesType(2,4)
    ia.setId("s")
    m = libsbml.Model(2,4)
    m.addSpeciesType(ia)
    ia = None
    lo = m.getListOfSpeciesTypes()
    self.assert_( lo == m.getSpeciesType(0).getParentSBMLObject() )
    self.assert_( m == lo.getParentSBMLObject() )
    pass  

  def test_SpeciesType_parent_create(self):
    m = libsbml.Model(2,4)
    st = m.createSpeciesType()
    lo = m.getListOfSpeciesTypes()
    self.assert_( lo == m.getSpeciesType(0).getParentSBMLObject() )
    self.assert_( lo == st.getParentSBMLObject() )
    self.assert_( m == lo.getParentSBMLObject() )
    pass  

  def test_Species_parent_NULL(self):
    d = libsbml.SBMLDocument()
    m = d.createModel()
    c = m.createSpecies()
    c1 = c.clone()
    d = None
    self.assert_( c1.getAncestorOfType(libsbml.SBML_MODEL) == None )
    self.assert_( c1.getParentSBMLObject() == None )
    self.assert_( c1.getSBMLDocument() == None )
    c1 = None
    pass  

  def test_Species_parent_add(self):
    ia = libsbml.Species(2,4)
    ia.setId("s")
    ia.setCompartment("c")
    m = libsbml.Model(2,4)
    m.addSpecies(ia)
    ia = None
    lo = m.getListOfSpecies()
    self.assert_( lo == m.getSpecies(0).getParentSBMLObject() )
    self.assert_( m == lo.getParentSBMLObject() )
    pass  

  def test_Species_parent_create(self):
    m = libsbml.Model(2,4)
    s = m.createSpecies()
    lo = m.getListOfSpecies()
    self.assert_( lo == s.getParentSBMLObject() )
    self.assert_( lo == m.getSpecies(0).getParentSBMLObject() )
    self.assert_( m == lo.getParentSBMLObject() )
    pass  

  def test_StoichiometryMath_parent_add(self):
    m = libsbml.StoichiometryMath(2,4)
    sr = libsbml.SpeciesReference(2,4)
    sr.setStoichiometryMath(m)
    m = None
    self.assert_( sr == sr.getStoichiometryMath().getParentSBMLObject() )
    sr = None
    pass  

  def test_Trigger_parent_add(self):
    d = libsbml.Trigger(2,4)
    e = libsbml.Event(2,4)
    e.setTrigger(d)
    d = None
    self.assert_( e == e.getTrigger().getParentSBMLObject() )
    e = None
    pass  

  def test_UnitDefinition_parent_NULL(self):
    d = libsbml.SBMLDocument()
    m = d.createModel()
    c = m.createUnitDefinition()
    u = c.createUnit()
    self.assert_( u.getAncestorOfType(libsbml.SBML_UNIT_DEFINITION) == c )
    c1 = c.clone()
    d = None
    self.assert_( c1.getAncestorOfType(libsbml.SBML_MODEL) == None )
    self.assert_( c1.getParentSBMLObject() == None )
    self.assert_( c1.getSBMLDocument() == None )
    self.assert_( c1.getUnit(0).getAncestorOfType(libsbml.SBML_UNIT_DEFINITION) == c1 )
    self.assert_( c1.getUnit(0).getParentSBMLObject() != None )
    self.assert_( c1.getUnit(0).getSBMLDocument() == None )
    c1 = None
    pass  

  def test_UnitDefinition_parent_add(self):
    ia = libsbml.UnitDefinition(2,4)
    m = libsbml.Model(2,4)
    ia.setId("u")
    ia.createUnit()
    m.addUnitDefinition(ia)
    ia = None
    lo = m.getListOfUnitDefinitions()
    self.assert_( lo == m.getUnitDefinition(0).getParentSBMLObject() )
    self.assert_( m == lo.getParentSBMLObject() )
    pass  

  def test_UnitDefinition_parent_create(self):
    m = libsbml.Model(2,4)
    ud = m.createUnitDefinition()
    lo = m.getListOfUnitDefinitions()
    self.assert_( lo == m.getUnitDefinition(0).getParentSBMLObject() )
    self.assert_( lo == ud.getParentSBMLObject() )
    self.assert_( m == lo.getParentSBMLObject() )
    pass  

  def test_Unit_parent_add(self):
    ud = libsbml.UnitDefinition(2,4)
    u = libsbml.Unit(2,4)
    u.setKind(libsbml.UNIT_KIND_MOLE)
    ud.addUnit(u)
    u = None
    self.assert_( ud.getNumUnits() == 1 )
    lo = ud.getListOfUnits()
    self.assert_( lo == ud.getUnit(0).getParentSBMLObject() )
    self.assert_( ud == lo.getParentSBMLObject() )
    ud = None
    pass  

  def test_Unit_parent_create(self):
    ud = libsbml.UnitDefinition(2,4)
    u = ud.createUnit()
    self.assert_( ud.getNumUnits() == 1 )
    lo = ud.getListOfUnits()
    self.assert_( lo == ud.getUnit(0).getParentSBMLObject() )
    self.assert_( lo == u.getParentSBMLObject() )
    self.assert_( ud == lo.getParentSBMLObject() )
    ud = None
    pass  

  def test_Unit_parent_create_model(self):
    m = libsbml.Model(2,4)
    ud = m.createUnitDefinition()
    u = m.createUnit()
    self.assert_( ud.getNumUnits() == 1 )
    lo = ud.getListOfUnits()
    self.assert_( lo == ud.getUnit(0).getParentSBMLObject() )
    self.assert_( lo == u.getParentSBMLObject() )
    self.assert_( ud == lo.getParentSBMLObject() )
    ud = None
    pass  

def suite():
  suite = unittest.TestSuite()
  suite.addTest(unittest.makeSuite(TestSBMLParentObject))

  return suite

if __name__ == "__main__":
  if unittest.TextTestRunner(verbosity=1).run(suite()).wasSuccessful() :
    sys.exit(0)
  else:
    sys.exit(1)
