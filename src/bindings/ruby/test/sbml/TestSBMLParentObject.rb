#
# @file    TestSBMLParentObject.rb
# @brief   SBML parent object unit tests
#
# @author  Akiya Jouraku (Ruby conversion)
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
require 'test/unit'
require 'libSBML'

class TestSBMLParentObject < Test::Unit::TestCase

  def test_AlgebraicRule_parent_create
    m = LibSBML::Model.new(2,4)
    r = m.createAlgebraicRule()
    lo = m.getListOfRules()
    assert( lo == m.getRule(0).getParentSBMLObject() )
    assert( lo == r.getParentSBMLObject() )
    assert( m == lo.getParentSBMLObject() )
  end

  def test_AssignmentRule_parent_create
    m = LibSBML::Model.new(2,4)
    r = m.createAssignmentRule()
    lo = m.getListOfRules()
    assert( lo == m.getRule(0).getParentSBMLObject() )
    assert( lo == r.getParentSBMLObject() )
    assert( m == lo.getParentSBMLObject() )
  end

  def test_CompartmentType_parent_NULL
    d = LibSBML::SBMLDocument.new()
    m = d.createModel()
    c = m.createCompartmentType()
    c1 = c.clone()
    d = nil
    assert( c1.getAncestorOfType(LibSBML::SBML_MODEL) == nil )
    assert( c1.getParentSBMLObject() == nil )
    assert( c1.getSBMLDocument() == nil )
    c1 = nil
  end

  def test_CompartmentType_parent_add
    ct = LibSBML::CompartmentType.new(2,4)
    m = LibSBML::Model.new(2,4)
    ct.setId("ct")
    m.addCompartmentType(ct)
    ct = nil
    lo = m.getListOfCompartmentTypes()
    assert( lo == m.getCompartmentType(0).getParentSBMLObject() )
    assert( m == lo.getParentSBMLObject() )
  end

  def test_CompartmentType_parent_create
    m = LibSBML::Model.new(2,4)
    ct = m.createCompartmentType()
    lo = m.getListOfCompartmentTypes()
    assert( lo == m.getCompartmentType(0).getParentSBMLObject() )
    assert( lo == ct.getParentSBMLObject() )
    assert( m == lo.getParentSBMLObject() )
  end

  def test_Compartment_parent_NULL
    d = LibSBML::SBMLDocument.new()
    m = d.createModel()
    c = m.createCompartment()
    c1 = c.clone()
    d = nil
    assert( c1.getAncestorOfType(LibSBML::SBML_MODEL) == nil )
    assert( c1.getParentSBMLObject() == nil )
    assert( c1.getSBMLDocument() == nil )
    c1 = nil
  end

  def test_Compartment_parent_add
    c = LibSBML::Compartment.new(2,4)
    c.setId("c")
    m = LibSBML::Model.new(2,4)
    m.addCompartment(c)
    c = nil
    lo = m.getListOfCompartments()
    assert( lo == m.getCompartment(0).getParentSBMLObject() )
    assert( m == lo.getParentSBMLObject() )
  end

  def test_Compartment_parent_create
    m = LibSBML::Model.new(2,4)
    c = m.createCompartment()
    lo = m.getListOfCompartments()
    assert( lo == m.getCompartment(0).getParentSBMLObject() )
    assert( lo == c.getParentSBMLObject() )
    assert( m == lo.getParentSBMLObject() )
  end

  def test_Constraint_parent_NULL
    d = LibSBML::SBMLDocument.new()
    m = d.createModel()
    c = m.createConstraint()
    c1 = c.clone()
    d = nil
    assert( c1.getAncestorOfType(LibSBML::SBML_MODEL) == nil )
    assert( c1.getParentSBMLObject() == nil )
    assert( c1.getSBMLDocument() == nil )
    c1 = nil
  end

  def test_Constraint_parent_add
    ct = LibSBML::Constraint.new(2,4)
    m = LibSBML::Model.new(2,4)
    ct.setMath(LibSBML::parseFormula("a-k"))
    m.addConstraint(ct)
    ct = nil
    lo = m.getListOfConstraints()
    assert( lo == m.getConstraint(0).getParentSBMLObject() )
    assert( m == lo.getParentSBMLObject() )
  end

  def test_Constraint_parent_create
    m = LibSBML::Model.new(2,4)
    ct = m.createConstraint()
    lo = m.getListOfConstraints()
    assert( lo == m.getConstraint(0).getParentSBMLObject() )
    assert( lo == ct.getParentSBMLObject() )
    assert( m == lo.getParentSBMLObject() )
  end

  def test_Delay_parent_add
    d = LibSBML::Delay.new(2,4)
    e = LibSBML::Event.new(2,4)
    e.setDelay(d)
    d = nil
    assert( e == e.getDelay().getParentSBMLObject() )
    e = nil
  end

  def test_EventAssignment_parent_add
    e = LibSBML::Event.new(2,4)
    ea = LibSBML::EventAssignment.new(2,4)
    ea.setVariable("c")
    ea.setMath(LibSBML::parseFormula("K+L"))
    e.addEventAssignment(ea)
    ea = nil
    lo = e.getListOfEventAssignments()
    assert( lo == e.getEventAssignment(0).getParentSBMLObject() )
    assert( e == lo.getParentSBMLObject() )
  end

  def test_EventAssignment_parent_create
    e = LibSBML::Event.new(2,4)
    ea = e.createEventAssignment()
    lo = e.getListOfEventAssignments()
    assert( lo == e.getEventAssignment(0).getParentSBMLObject() )
    assert( lo == ea.getParentSBMLObject() )
    assert( e == lo.getParentSBMLObject() )
  end

  def test_EventAssignment_parent_create_model
    m = LibSBML::Model.new(2,4)
    e = m.createEvent()
    ea = m.createEventAssignment()
    lo = e.getListOfEventAssignments()
    assert( lo == e.getEventAssignment(0).getParentSBMLObject() )
    assert( lo == ea.getParentSBMLObject() )
    assert( e == lo.getParentSBMLObject() )
  end

  def test_Event_parent_NULL
    d = LibSBML::SBMLDocument.new()
    m = d.createModel()
    c = m.createEvent()
    ea = c.createEventAssignment()
    t = LibSBML::Trigger.new(2,4)
    t.setMath(LibSBML::ASTNode.new())
    dy = LibSBML::Delay.new(2,4)
    dy.setMath(LibSBML::ASTNode.new())
    c.setTrigger(t)
    c.setDelay(dy)
    assert( c.getAncestorOfType(LibSBML::SBML_MODEL) == m )
    assert( c.getTrigger().getParentSBMLObject() == c )
    assert( c.getDelay().getSBMLDocument() == d )
    assert( ea.getAncestorOfType(LibSBML::SBML_EVENT) == c )
    c1 = c.clone()
    d = nil
    assert( c1.getAncestorOfType(LibSBML::SBML_MODEL) == nil )
    assert( c1.getParentSBMLObject() == nil )
    assert( c1.getSBMLDocument() == nil )
    assert( c1.getEventAssignment(0).getAncestorOfType(LibSBML::SBML_MODEL) == nil )
    assert( c1.getEventAssignment(0).getAncestorOfType(LibSBML::SBML_EVENT) == c1 )
    assert( c1.getEventAssignment(0).getParentSBMLObject() != nil )
    assert( c1.getEventAssignment(0).getSBMLDocument() == nil )
    assert( c1.getTrigger().getAncestorOfType(LibSBML::SBML_MODEL) == nil )
    assert( c1.getTrigger().getAncestorOfType(LibSBML::SBML_EVENT) == c1 )
    assert( c1.getTrigger().getParentSBMLObject() != nil )
    assert( c1.getTrigger().getSBMLDocument() == nil )
    assert( c1.getDelay().getAncestorOfType(LibSBML::SBML_MODEL) == nil )
    assert( c1.getDelay().getAncestorOfType(LibSBML::SBML_EVENT) == c1 )
    assert( c1.getDelay().getParentSBMLObject() != nil )
    assert( c1.getDelay().getSBMLDocument() == nil )
    c1 = nil
  end

  def test_Event_parent_add
    e = LibSBML::Event.new(2,4)
    t = LibSBML::Trigger.new(2,4)
    e.setTrigger(t)
    e.createEventAssignment()
    m = LibSBML::Model.new(2,4)
    m.addEvent(e)
    e = nil
    lo = m.getListOfEvents()
    assert( lo == m.getEvent(0).getParentSBMLObject() )
    assert( m == lo.getParentSBMLObject() )
  end

  def test_Event_parent_create
    m = LibSBML::Model.new(2,4)
    e = m.createEvent()
    lo = m.getListOfEvents()
    assert( lo == m.getEvent(0).getParentSBMLObject() )
    assert( lo == e.getParentSBMLObject() )
    assert( m == lo.getParentSBMLObject() )
  end

  def test_FunctionDefinition_parent_NULL
    d = LibSBML::SBMLDocument.new()
    m = d.createModel()
    c = m.createFunctionDefinition()
    c1 = c.clone()
    d = nil
    assert( c1.getAncestorOfType(LibSBML::SBML_MODEL) == nil )
    assert( c1.getParentSBMLObject() == nil )
    assert( c1.getSBMLDocument() == nil )
    c1 = nil
  end

  def test_FunctionDefinition_parent_add
    fd = LibSBML::FunctionDefinition.new(2,4)
    m = LibSBML::Model.new(2,4)
    fd.setId("fd")
    fd.setMath(LibSBML::parseFormula("l"))
    m.addFunctionDefinition(fd)
    fd = nil
    lo = m.getListOfFunctionDefinitions()
    assert( lo == m.getFunctionDefinition(0).getParentSBMLObject() )
    assert( m == lo.getParentSBMLObject() )
  end

  def test_FunctionDefinition_parent_create
    m = LibSBML::Model.new(2,4)
    fd = m.createFunctionDefinition()
    lo = m.getListOfFunctionDefinitions()
    assert( lo == m.getFunctionDefinition(0).getParentSBMLObject() )
    assert( lo == fd.getParentSBMLObject() )
    assert( m == lo.getParentSBMLObject() )
  end

  def test_InitialAssignment_parent_NULL
    d = LibSBML::SBMLDocument.new()
    m = d.createModel()
    c = m.createInitialAssignment()
    c1 = c.clone()
    d = nil
    assert( c1.getAncestorOfType(LibSBML::SBML_MODEL) == nil )
    assert( c1.getParentSBMLObject() == nil )
    assert( c1.getSBMLDocument() == nil )
    c1 = nil
  end

  def test_InitialAssignment_parent_add
    ia = LibSBML::InitialAssignment.new(2,4)
    m = LibSBML::Model.new(2,4)
    ia.setSymbol("c")
    ia.setMath(LibSBML::parseFormula("9"))
    m.addInitialAssignment(ia)
    ia = nil
    lo = m.getListOfInitialAssignments()
    assert( lo == m.getInitialAssignment(0).getParentSBMLObject() )
    assert( m == lo.getParentSBMLObject() )
  end

  def test_InitialAssignment_parent_create
    m = LibSBML::Model.new(2,4)
    ia = m.createInitialAssignment()
    lo = m.getListOfInitialAssignments()
    assert( lo == m.getInitialAssignment(0).getParentSBMLObject() )
    assert( lo == ia.getParentSBMLObject() )
    assert( m == lo.getParentSBMLObject() )
  end

  def test_KineticLaw_Parameter_parent_add
    kl = LibSBML::KineticLaw.new(2,4)
    p = LibSBML::Parameter.new(2,4)
    p.setId("jake")
    kl.addParameter(p)
    p = nil
    assert( kl.getNumParameters() == 1 )
    assert( kl.getParameter(0).getId() ==  "jake" )
    lop = kl.getListOfParameters()
    assert( kl == lop.getParentSBMLObject() )
    assert( lop == kl.getParameter(0).getParentSBMLObject() )
    kl = nil
  end

  def test_KineticLaw_Parameter_parent_create
    kl = LibSBML::KineticLaw.new(2,4)
    p = kl.createParameter()
    assert( kl.getNumParameters() == 1 )
    lop = kl.getListOfParameters()
    assert( kl == lop.getParentSBMLObject() )
    assert( lop == p.getParentSBMLObject() )
    assert( lop == kl.getParameter(0).getParentSBMLObject() )
    kl = nil
  end

  def test_KineticLaw_Parameter_parent_create_model
    m = LibSBML::Model.new(2,4)
    r = m.createReaction()
    kl = m.createKineticLaw()
    p = m.createKineticLawParameter()
    assert( kl.getNumParameters() == 1 )
    lop = kl.getListOfParameters()
    assert( r == kl.getParentSBMLObject() )
    assert( kl == lop.getParentSBMLObject() )
    assert( lop == p.getParentSBMLObject() )
    assert( lop == kl.getParameter(0).getParentSBMLObject() )
    kl = nil
  end

  def test_KineticLaw_parent_NULL
    r = LibSBML::Reaction.new(2,4)
    kl = r.createKineticLaw()
    p = kl.createParameter()
    assert( r == kl.getParentSBMLObject() )
    assert( r == p.getAncestorOfType(LibSBML::SBML_REACTION) )
    assert( kl == p.getAncestorOfType(LibSBML::SBML_KINETIC_LAW) )
    kl1 = kl.clone()
    assert( kl1.getParentSBMLObject() == nil )
    assert( kl1.getParameter(0).getAncestorOfType(LibSBML::SBML_REACTION) == nil )
    assert( kl1 == kl1.getParameter(0).getAncestorOfType(LibSBML::SBML_KINETIC_LAW) )
    r = nil
  end

  def test_KineticLaw_parent_add
    kl = LibSBML::KineticLaw.new(2,4)
    r = LibSBML::Reaction.new(2,4)
    r.setKineticLaw(kl)
    assert( r == r.getKineticLaw().getParentSBMLObject() )
    r = nil
  end

  def test_KineticLaw_parent_create
    r = LibSBML::Reaction.new(2,4)
    kl = r.createKineticLaw()
    assert( r == kl.getParentSBMLObject() )
    r = nil
  end

  def test_KineticLaw_parent_create_model
    m = LibSBML::Model.new(2,4)
    r = m.createReaction()
    kl = r.createKineticLaw()
    assert( r == kl.getParentSBMLObject() )
    assert( r == r.getKineticLaw().getParentSBMLObject() )
    r = nil
  end

  def test_Model_parent_add
    d = LibSBML::SBMLDocument.new(2,4)
    m = LibSBML::Model.new(2,4)
    d.setModel(m)
    assert( d == d.getModel().getParentSBMLObject() )
    d = nil
  end

  def test_Model_parent_create
    d = LibSBML::SBMLDocument.new(2,4)
    m = d.createModel()
    assert( d == m.getParentSBMLObject() )
    d = nil
  end

  def test_Parameter_parent_NULL
    d = LibSBML::SBMLDocument.new()
    m = d.createModel()
    c = m.createParameter()
    c1 = c.clone()
    d = nil
    assert( c1.getAncestorOfType(LibSBML::SBML_MODEL) == nil )
    assert( c1.getParentSBMLObject() == nil )
    assert( c1.getSBMLDocument() == nil )
    c1 = nil
  end

  def test_Parameter_parent_add
    ia = LibSBML::Parameter.new(2,4)
    m = LibSBML::Model.new(2,4)
    ia.setId("p")
    m.addParameter(ia)
    ia = nil
    lo = m.getListOfParameters()
    assert( lo == m.getParameter(0).getParentSBMLObject() )
    assert( m == lo.getParentSBMLObject() )
  end

  def test_Parameter_parent_create
    m = LibSBML::Model.new(2,4)
    p = m.createParameter()
    lo = m.getListOfParameters()
    assert( lo == m.getParameter(0).getParentSBMLObject() )
    assert( lo == p.getParentSBMLObject() )
    assert( m == lo.getParentSBMLObject() )
  end

  def test_RateRule_parent_create
    m = LibSBML::Model.new(2,4)
    r = m.createRateRule()
    lo = m.getListOfRules()
    assert( lo == m.getRule(0).getParentSBMLObject() )
    assert( lo == r.getParentSBMLObject() )
    assert( m == lo.getParentSBMLObject() )
  end

  def test_Reaction_parent_NULL
    d = LibSBML::SBMLDocument.new()
    m = d.createModel()
    c = m.createReaction()
    sr = c.createReactant()
    kl = c.createKineticLaw()
    assert( c.getAncestorOfType(LibSBML::SBML_MODEL) == m )
    assert( c.getSBMLDocument() == d )
    assert( sr.getAncestorOfType(LibSBML::SBML_REACTION) == c )
    assert( kl.getAncestorOfType(LibSBML::SBML_REACTION) == c )
    c1 = c.clone()
    d = nil
    assert( c1.getAncestorOfType(LibSBML::SBML_MODEL) == nil )
    assert( c1.getParentSBMLObject() == nil )
    assert( c1.getSBMLDocument() == nil )
    sr1 = c1.getReactant(0)
    assert( sr1.getAncestorOfType(LibSBML::SBML_MODEL) == nil )
    assert( sr1.getAncestorOfType(LibSBML::SBML_REACTION) == c1 )
    assert( sr1.getSBMLDocument() == nil )
    assert( c1.getKineticLaw().getAncestorOfType(LibSBML::SBML_MODEL) == nil )
    assert( c1.getKineticLaw().getAncestorOfType(LibSBML::SBML_REACTION) == c1 )
    assert( c1.getKineticLaw().getSBMLDocument() == nil )
    c1 = nil
  end

  def test_Reaction_parent_add
    ia = LibSBML::Reaction.new(2,4)
    m = LibSBML::Model.new(2,4)
    ia.setId("k")
    m.addReaction(ia)
    ia = nil
    lo = m.getListOfReactions()
    assert( lo == m.getReaction(0).getParentSBMLObject() )
    assert( m == lo.getParentSBMLObject() )
  end

  def test_Reaction_parent_create
    m = LibSBML::Model.new(2,4)
    r = m.createReaction()
    lo = m.getListOfReactions()
    assert( lo == m.getReaction(0).getParentSBMLObject() )
    assert( lo == r.getParentSBMLObject() )
    assert( m == lo.getParentSBMLObject() )
  end

  def test_Rule_parent_add
    ia = LibSBML::RateRule.new(2,4)
    ia.setVariable("a")
    ia.setMath(LibSBML::parseFormula("9"))
    m = LibSBML::Model.new(2,4)
    m.addRule(ia)
    ia = nil
    lo = m.getListOfRules()
    assert( lo == m.getRule(0).getParentSBMLObject() )
    assert( m == lo.getParentSBMLObject() )
  end

  def test_SpeciesReference_Modifier_parent_add
    sr = LibSBML::ModifierSpeciesReference.new(2,4)
    sr.setSpecies("s")
    r = LibSBML::Reaction.new(2,4)
    r.addModifier(sr)
    sr = nil
    lo = r.getListOfModifiers()
    assert( lo == r.getModifier(0).getParentSBMLObject() )
    assert( r == lo.getParentSBMLObject() )
  end

  def test_SpeciesReference_Modifier_parent_create
    r = LibSBML::Reaction.new(2,4)
    sr = r.createModifier()
    lo = r.getListOfModifiers()
    assert( lo == sr.getParentSBMLObject() )
    assert( lo == r.getModifier(0).getParentSBMLObject() )
    assert( r == lo.getParentSBMLObject() )
  end

  def test_SpeciesReference_Modifier_parent_create_model
    m = LibSBML::Model.new(2,4)
    r = m.createReaction()
    sr = m.createModifier()
    lo = r.getListOfModifiers()
    assert( lo == sr.getParentSBMLObject() )
    assert( lo == r.getModifier(0).getParentSBMLObject() )
    assert( r == lo.getParentSBMLObject() )
  end

  def test_SpeciesReference_Product_parent_add
    sr = LibSBML::SpeciesReference.new(2,4)
    r = LibSBML::Reaction.new(2,4)
    sr.setSpecies("p")
    r.addProduct(sr)
    sr = nil
    lo = r.getListOfProducts()
    assert( lo == r.getProduct(0).getParentSBMLObject() )
    assert( r == lo.getParentSBMLObject() )
  end

  def test_SpeciesReference_Product_parent_create
    r = LibSBML::Reaction.new(2,4)
    sr = r.createProduct()
    lo = r.getListOfProducts()
    assert( lo == r.getProduct(0).getParentSBMLObject() )
    assert( lo == sr.getParentSBMLObject() )
    assert( r == lo.getParentSBMLObject() )
  end

  def test_SpeciesReference_Product_parent_create_model
    m = LibSBML::Model.new(2,4)
    r = m.createReaction()
    sr = m.createProduct()
    lo = r.getListOfProducts()
    assert( lo == r.getProduct(0).getParentSBMLObject() )
    assert( lo == sr.getParentSBMLObject() )
    assert( r == lo.getParentSBMLObject() )
  end

  def test_SpeciesReference_Reactant_parent_add
    sr = LibSBML::SpeciesReference.new(2,4)
    r = LibSBML::Reaction.new(2,4)
    sr.setSpecies("s")
    r.addReactant(sr)
    sr = nil
    lo = r.getListOfReactants()
    assert( lo == r.getReactant(0).getParentSBMLObject() )
    assert( r == lo.getParentSBMLObject() )
  end

  def test_SpeciesReference_Reactant_parent_create
    r = LibSBML::Reaction.new(2,4)
    sr = r.createReactant()
    lo = r.getListOfReactants()
    assert( lo == r.getReactant(0).getParentSBMLObject() )
    assert( lo == sr.getParentSBMLObject() )
    assert( r == lo.getParentSBMLObject() )
  end

  def test_SpeciesReference_Reactant_parent_create_model
    m = LibSBML::Model.new(2,4)
    r = m.createReaction()
    sr = m.createReactant()
    lo = r.getListOfReactants()
    assert( lo == r.getReactant(0).getParentSBMLObject() )
    assert( lo == sr.getParentSBMLObject() )
    assert( r == lo.getParentSBMLObject() )
  end

  def test_SpeciesType_parent_NULL
    d = LibSBML::SBMLDocument.new()
    m = d.createModel()
    c = m.createSpeciesType()
    c1 = c.clone()
    d = nil
    assert( c1.getAncestorOfType(LibSBML::SBML_MODEL) == nil )
    assert( c1.getParentSBMLObject() == nil )
    assert( c1.getSBMLDocument() == nil )
    c1 = nil
  end

  def test_SpeciesType_parent_add
    ia = LibSBML::SpeciesType.new(2,4)
    ia.setId("s")
    m = LibSBML::Model.new(2,4)
    m.addSpeciesType(ia)
    ia = nil
    lo = m.getListOfSpeciesTypes()
    assert( lo == m.getSpeciesType(0).getParentSBMLObject() )
    assert( m == lo.getParentSBMLObject() )
  end

  def test_SpeciesType_parent_create
    m = LibSBML::Model.new(2,4)
    st = m.createSpeciesType()
    lo = m.getListOfSpeciesTypes()
    assert( lo == m.getSpeciesType(0).getParentSBMLObject() )
    assert( lo == st.getParentSBMLObject() )
    assert( m == lo.getParentSBMLObject() )
  end

  def test_Species_parent_NULL
    d = LibSBML::SBMLDocument.new()
    m = d.createModel()
    c = m.createSpecies()
    c1 = c.clone()
    d = nil
    assert( c1.getAncestorOfType(LibSBML::SBML_MODEL) == nil )
    assert( c1.getParentSBMLObject() == nil )
    assert( c1.getSBMLDocument() == nil )
    c1 = nil
  end

  def test_Species_parent_add
    ia = LibSBML::Species.new(2,4)
    ia.setId("s")
    ia.setCompartment("c")
    m = LibSBML::Model.new(2,4)
    m.addSpecies(ia)
    ia = nil
    lo = m.getListOfSpecies()
    assert( lo == m.getSpecies(0).getParentSBMLObject() )
    assert( m == lo.getParentSBMLObject() )
  end

  def test_Species_parent_create
    m = LibSBML::Model.new(2,4)
    s = m.createSpecies()
    lo = m.getListOfSpecies()
    assert( lo == s.getParentSBMLObject() )
    assert( lo == m.getSpecies(0).getParentSBMLObject() )
    assert( m == lo.getParentSBMLObject() )
  end

  def test_StoichiometryMath_parent_add
    m = LibSBML::StoichiometryMath.new(2,4)
    sr = LibSBML::SpeciesReference.new(2,4)
    sr.setStoichiometryMath(m)
    m = nil
    assert( sr == sr.getStoichiometryMath().getParentSBMLObject() )
    sr = nil
  end

  def test_Trigger_parent_add
    d = LibSBML::Trigger.new(2,4)
    e = LibSBML::Event.new(2,4)
    e.setTrigger(d)
    d = nil
    assert( e == e.getTrigger().getParentSBMLObject() )
    e = nil
  end

  def test_UnitDefinition_parent_NULL
    d = LibSBML::SBMLDocument.new()
    m = d.createModel()
    c = m.createUnitDefinition()
    u = c.createUnit()
    assert( u.getAncestorOfType(LibSBML::SBML_UNIT_DEFINITION) == c )
    c1 = c.clone()
    d = nil
    assert( c1.getAncestorOfType(LibSBML::SBML_MODEL) == nil )
    assert( c1.getParentSBMLObject() == nil )
    assert( c1.getSBMLDocument() == nil )
    assert( c1.getUnit(0).getAncestorOfType(LibSBML::SBML_UNIT_DEFINITION) == c1 )
    assert( c1.getUnit(0).getParentSBMLObject() != nil )
    assert( c1.getUnit(0).getSBMLDocument() == nil )
    c1 = nil
  end

  def test_UnitDefinition_parent_add
    ia = LibSBML::UnitDefinition.new(2,4)
    m = LibSBML::Model.new(2,4)
    ia.setId("u")
    ia.createUnit()
    m.addUnitDefinition(ia)
    ia = nil
    lo = m.getListOfUnitDefinitions()
    assert( lo == m.getUnitDefinition(0).getParentSBMLObject() )
    assert( m == lo.getParentSBMLObject() )
  end

  def test_UnitDefinition_parent_create
    m = LibSBML::Model.new(2,4)
    ud = m.createUnitDefinition()
    lo = m.getListOfUnitDefinitions()
    assert( lo == m.getUnitDefinition(0).getParentSBMLObject() )
    assert( lo == ud.getParentSBMLObject() )
    assert( m == lo.getParentSBMLObject() )
  end

  def test_Unit_parent_add
    ud = LibSBML::UnitDefinition.new(2,4)
    u = LibSBML::Unit.new(2,4)
    u.setKind(LibSBML::UNIT_KIND_MOLE)
    ud.addUnit(u)
    u = nil
    assert( ud.getNumUnits() == 1 )
    lo = ud.getListOfUnits()
    assert( lo == ud.getUnit(0).getParentSBMLObject() )
    assert( ud == lo.getParentSBMLObject() )
    ud = nil
  end

  def test_Unit_parent_create
    ud = LibSBML::UnitDefinition.new(2,4)
    u = ud.createUnit()
    assert( ud.getNumUnits() == 1 )
    lo = ud.getListOfUnits()
    assert( lo == ud.getUnit(0).getParentSBMLObject() )
    assert( lo == u.getParentSBMLObject() )
    assert( ud == lo.getParentSBMLObject() )
    ud = nil
  end

  def test_Unit_parent_create_model
    m = LibSBML::Model.new(2,4)
    ud = m.createUnitDefinition()
    u = m.createUnit()
    assert( ud.getNumUnits() == 1 )
    lo = ud.getListOfUnits()
    assert( lo == ud.getUnit(0).getParentSBMLObject() )
    assert( lo == u.getParentSBMLObject() )
    assert( ud == lo.getParentSBMLObject() )
    ud = nil
  end

end
