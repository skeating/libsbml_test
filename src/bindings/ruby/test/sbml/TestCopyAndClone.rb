#
# @file    TestCopyAndClone.rb
# @brief   Read SBML unit tests
#
# @author  Akiya Jouraku (Ruby conversion)
# @author  Ben Bornstein 
#
# $Id$
# $HeadURL$
#
# This test file was converted from src/sbml/test/TestCopyAndClone.cpp
# with the help of conversion sciprt (ctest_converter.pl).
#
#<!---------------------------------------------------------------------------
# This file is part of libSBML.  Please visit http://sbml.org for more
# information about SBML, and the latest version of libSBML.
#
# Copyright 2005-2009 California Institute of Technology.
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

class TestCopyAndClone < Test::Unit::TestCase

  def test_CompartmentType_assignmentOperator
    o1 = LibSBML::CompartmentType.new(2,4)
    o1.setId("c")
    assert( o1.getId() ==  "c" )
    o2 = LibSBML::CompartmentType.new(2,4)
    o2 = o1
    assert( o2.getId() ==  "c" )
    assert( o2.getParentSBMLObject() == o1.getParentSBMLObject() )
    o2 = nil
    o1 = nil
  end

  def test_CompartmentType_clone
    o1 = LibSBML::CompartmentType.new(2,4)
    o1.setId("c")
    assert( o1.getId() ==  "c" )
    o2 = o1.clone()
    assert( o2.getId() ==  "c" )
    assert( o2.getParentSBMLObject() == o1.getParentSBMLObject() )
    o2 = nil
    o1 = nil
  end

  def test_CompartmentType_copyConstructor
    o1 = LibSBML::CompartmentType.new(2,4)
    o1.setId("c")
    assert( o1.getId() ==  "c" )
    o2 = LibSBML::CompartmentType.new(o1)
    assert( o2.getId() ==  "c" )
    assert( o2.getParentSBMLObject() == o1.getParentSBMLObject() )
    o2 = nil
    o1 = nil
  end

  def test_Compartment_assignmentOperator
    o1 = LibSBML::Compartment.new(2,4)
    o1.setId("c")
    o1.setOutside("c2")
    assert( o1.getId() ==  "c" )
    assert( o1.getOutside() ==  "c2" )
    o2 = LibSBML::Compartment.new(2,4)
    o2 = o1
    assert( o2.getId() ==  "c" )
    assert( o2.getOutside() ==  "c2" )
    assert( o2.getParentSBMLObject() == o1.getParentSBMLObject() )
    o2 = nil
    o1 = nil
  end

  def test_Compartment_clone
    o1 = LibSBML::Compartment.new(2,4)
    o1.setId("c")
    o1.setOutside("c2")
    assert( o1.getId() ==  "c" )
    assert( o1.getOutside() ==  "c2" )
    o2 = o1.clone()
    assert( o2.getId() ==  "c" )
    assert( o2.getOutside() ==  "c2" )
    assert( o2.getParentSBMLObject() == o1.getParentSBMLObject() )
    o2 = nil
    o1 = nil
  end

  def test_Compartment_copyConstructor
    o1 = LibSBML::Compartment.new(2,4)
    o1.setId("c")
    o1.setOutside("c2")
    assert( o1.getId() ==  "c" )
    assert( o1.getOutside() ==  "c2" )
    o2 = LibSBML::Compartment.new(o1)
    assert( o2.getId() ==  "c" )
    assert( o2.getOutside() ==  "c2" )
    assert( o2.getParentSBMLObject() == o1.getParentSBMLObject() )
    o2 = nil
    o1 = nil
  end

  def test_Constraint_assignmentOperator
    o1 = LibSBML::Constraint.new(2,4)
    o1.setMetaId("c")
    assert( o1.getMetaId() ==  "c" )
    text = LibSBML::XMLNode.convertStringToXMLNode(" Some text ")
    triple = LibSBML::XMLTriple.new("p", "http://www.w3.org/1999/xhtml", "")
    att = LibSBML::XMLAttributes.new()
    xmlns = LibSBML::XMLNamespaces.new()
    xmlns.add("http://www.w3.org/1999/xhtml")
    p = LibSBML::XMLNode.new(triple,att,xmlns)
    p.addChild(text)
    triple1 = LibSBML::XMLTriple.new("message", "", "")
    att1 = LibSBML::XMLAttributes.new()
    message = LibSBML::XMLNode.new(triple1,att1)
    message.addChild(p)
    math = LibSBML::ASTNode.new(LibSBML::AST_CONSTANT_PI)
    o1.setMath(math)
    o1.setMessage(message)
    math = nil
    message = nil
    assert( o1.getMath() != nil )
    assert( o1.getMessage() != "" )
    o2 = LibSBML::Constraint.new(2,4)
    o2 = o1
    assert( o2.getMetaId() ==  "c" )
    assert( o1.getMath() != nil )
    assert( o1.getMessage() != "" )
    assert( o2.getParentSBMLObject() == o1.getParentSBMLObject() )
    o2 = nil
    o1 = nil
  end

  def test_Constraint_clone
    o1 = LibSBML::Constraint.new(2,4)
    o1.setMetaId("c")
    assert( o1.getMetaId() ==  "c" )
    text = LibSBML::XMLNode.convertStringToXMLNode(" Some text ")
    triple = LibSBML::XMLTriple.new("p", "http://www.w3.org/1999/xhtml", "")
    att = LibSBML::XMLAttributes.new()
    xmlns = LibSBML::XMLNamespaces.new()
    xmlns.add("http://www.w3.org/1999/xhtml")
    p = LibSBML::XMLNode.new(triple,att,xmlns)
    p.addChild(text)
    triple1 = LibSBML::XMLTriple.new("message", "", "")
    att1 = LibSBML::XMLAttributes.new()
    message = LibSBML::XMLNode.new(triple1,att1)
    message.addChild(p)
    math = LibSBML::ASTNode.new(LibSBML::AST_CONSTANT_PI)
    o1.setMath(math)
    o1.setMessage(message)
    math = nil
    message = nil
    assert( o1.getMath() != nil )
    assert( o1.getMessage() != "" )
    o2 = o1.clone()
    assert( o2.getMetaId() ==  "c" )
    assert( o1.getMath() != nil )
    assert( o1.getMessage() != "" )
    assert( o2.getParentSBMLObject() == o1.getParentSBMLObject() )
    o2 = nil
    o1 = nil
  end

  def test_Constraint_copyConstructor
    o1 = LibSBML::Constraint.new(2,4)
    o1.setMetaId("c")
    assert( o1.getMetaId() ==  "c" )
    text = LibSBML::XMLNode.convertStringToXMLNode(" Some text ")
    triple = LibSBML::XMLTriple.new("p", "http://www.w3.org/1999/xhtml", "")
    att = LibSBML::XMLAttributes.new()
    xmlns = LibSBML::XMLNamespaces.new()
    xmlns.add("http://www.w3.org/1999/xhtml")
    p = LibSBML::XMLNode.new(triple,att,xmlns)
    p.addChild(text)
    triple1 = LibSBML::XMLTriple.new("message", "", "")
    att1 = LibSBML::XMLAttributes.new()
    message = LibSBML::XMLNode.new(triple1,att1)
    message.addChild(p)
    math = LibSBML::ASTNode.new(LibSBML::AST_CONSTANT_PI)
    o1.setMath(math)
    o1.setMessage(message)
    math = nil
    message = nil
    assert( o1.getMath() != nil )
    assert( o1.getMessage() != "" )
    o2 = LibSBML::Constraint.new(o1)
    assert( o2.getMetaId() ==  "c" )
    assert( o1.getMath() != nil )
    assert( o1.getMessage() != "" )
    assert( o2.getParentSBMLObject() == o1.getParentSBMLObject() )
    o2 = nil
    o1 = nil
  end

  def test_Delay_assignmentOperator
    o1 = LibSBML::Delay.new(2,4)
    node = LibSBML::ASTNode.new(LibSBML::AST_CONSTANT_PI)
    o1.setMath(node)
    node = nil
    assert( o1.getMath() != nil )
    o2 = LibSBML::Delay.new(2,4)
    o2 = o1
    assert( o1.getMath() != nil )
    assert( o2.getParentSBMLObject() == o1.getParentSBMLObject() )
    o2 = nil
    o1 = nil
  end

  def test_Delay_clone
    o1 = LibSBML::Delay.new(2,4)
    node = LibSBML::ASTNode.new(LibSBML::AST_CONSTANT_PI)
    o1.setMath(node)
    node = nil
    assert( o1.getMath() != nil )
    o2 = o1.clone()
    assert( o1.getMath() != nil )
    assert( o2.getParentSBMLObject() == o1.getParentSBMLObject() )
    o2 = nil
    o1 = nil
  end

  def test_Delay_copyConstructor
    o1 = LibSBML::Delay.new(2,4)
    node = LibSBML::ASTNode.new(LibSBML::AST_CONSTANT_PI)
    o1.setMath(node)
    node = nil
    assert( o1.getMath() != nil )
    o2 = LibSBML::Delay.new(o1)
    assert( o2.getMath() != nil )
    assert( o2.getParentSBMLObject() == o1.getParentSBMLObject() )
    o2 = nil
    o1 = nil
  end

  def test_EventAssignment_assignmentOperator
    o1 = LibSBML::EventAssignment.new(2,4)
    o1.setVariable("c2")
    assert( o1.getVariable() ==  "c2" )
    node = LibSBML::ASTNode.new(LibSBML::AST_CONSTANT_PI)
    o1.setMath(node)
    node = nil
    assert( o1.getMath() != nil )
    o2 = LibSBML::EventAssignment.new(2,4)
    o2 = o1
    assert( o2.getVariable() ==  "c2" )
    assert( o2.getMath() != nil )
    assert( o2.getParentSBMLObject() == o1.getParentSBMLObject() )
    o2 = nil
    o1 = nil
  end

  def test_EventAssignment_clone
    o1 = LibSBML::EventAssignment.new(2,4)
    o1.setVariable("c2")
    assert( o1.getVariable() ==  "c2" )
    node = LibSBML::ASTNode.new(LibSBML::AST_CONSTANT_PI)
    o1.setMath(node)
    node = nil
    assert( o1.getMath() != nil )
    o2 = o1.clone()
    assert( o2.getVariable() ==  "c2" )
    assert( o2.getMath() != nil )
    assert( o2.getParentSBMLObject() == o1.getParentSBMLObject() )
    o2 = nil
    o1 = nil
  end

  def test_EventAssignment_copyConstructor
    o1 = LibSBML::EventAssignment.new(2,4)
    o1.setVariable("c2")
    assert( o1.getVariable() ==  "c2" )
    node = LibSBML::ASTNode.new(LibSBML::AST_CONSTANT_PI)
    o1.setMath(node)
    node = nil
    assert( o1.getMath() != nil )
    o2 = LibSBML::EventAssignment.new(o1)
    assert( o2.getVariable() ==  "c2" )
    assert( o2.getMath() != nil )
    assert( o2.getParentSBMLObject() == o1.getParentSBMLObject() )
    o2 = nil
    o1 = nil
  end

  def test_Event_assignmentOperator
    o1 = LibSBML::Event.new(2,4)
    o1.setId("c")
    assert( o1.getId() ==  "c" )
    o2 = LibSBML::Event.new(2,4)
    o2 = o1
    assert( o2.getId() ==  "c" )
    assert( o2.getParentSBMLObject() == o1.getParentSBMLObject() )
    o2 = nil
    o1 = nil
  end

  def test_Event_clone
    o1 = LibSBML::Event.new(2,4)
    o1.setId("c")
    assert( o1.getId() ==  "c" )
    o2 = o1.clone()
    assert( o2.getId() ==  "c" )
    assert( o2.getParentSBMLObject() == o1.getParentSBMLObject() )
    o2 = nil
    o1 = nil
  end

  def test_Event_copyConstructor
    o1 = LibSBML::Event.new(2,4)
    o1.setId("c")
    assert( o1.getId() ==  "c" )
    o2 = LibSBML::Event.new(o1)
    assert( o2.getId() ==  "c" )
    assert( o2.getParentSBMLObject() == o1.getParentSBMLObject() )
    o2 = nil
    o1 = nil
  end

  def test_FunctionDefinition_assignmentOperator
    o1 = LibSBML::FunctionDefinition.new(2,4)
    o1.setId("c")
    assert( o1.getId() ==  "c" )
    node = LibSBML::ASTNode.new(LibSBML::AST_CONSTANT_PI)
    o1.setMath(node)
    node = nil
    assert( o1.getMath() != nil )
    o2 = LibSBML::FunctionDefinition.new(2,4)
    o2 = o1
    assert( o2.getId() ==  "c" )
    assert( o2.getMath() != nil )
    assert( o2.getParentSBMLObject() == o1.getParentSBMLObject() )
    o2 = nil
    o1 = nil
  end

  def test_FunctionDefinition_clone
    o1 = LibSBML::FunctionDefinition.new(2,4)
    o1.setId("c")
    assert( o1.getId() ==  "c" )
    node = LibSBML::ASTNode.new(LibSBML::AST_CONSTANT_PI)
    o1.setMath(node)
    node = nil
    assert( o1.getMath() != nil )
    o2 = o1.clone()
    assert( o2.getId() ==  "c" )
    assert( o2.getMath() != nil )
    assert( o2.getParentSBMLObject() == o1.getParentSBMLObject() )
    o2 = nil
    o1 = nil
  end

  def test_FunctionDefinition_copyConstructor
    o1 = LibSBML::FunctionDefinition.new(2,4)
    o1.setId("c")
    assert( o1.getId() ==  "c" )
    node = LibSBML::ASTNode.new(LibSBML::AST_CONSTANT_PI)
    o1.setMath(node)
    node = nil
    assert( o1.getMath() != nil )
    o2 = LibSBML::FunctionDefinition.new(o1)
    assert( o2.getId() ==  "c" )
    assert( o2.getMath() != nil )
    assert( o2.getParentSBMLObject() == o1.getParentSBMLObject() )
    o2 = nil
    o1 = nil
  end

  def test_InitialAssignment_assignmentOperator
    o1 = LibSBML::InitialAssignment.new(2,4)
    o1.setSymbol("c")
    assert( o1.getId() ==  "c" )
    o2 = LibSBML::InitialAssignment.new(2,4)
    o2 = o1
    assert( o2.getId() ==  "c" )
    assert( o2.getParentSBMLObject() == o1.getParentSBMLObject() )
    o2 = nil
    o1 = nil
  end

  def test_InitialAssignment_clone
    o1 = LibSBML::InitialAssignment.new(2,4)
    o1.setSymbol("c")
    assert( o1.getId() ==  "c" )
    o2 = o1.clone()
    assert( o2.getId() ==  "c" )
    assert( o2.getParentSBMLObject() == o1.getParentSBMLObject() )
    o2 = nil
    o1 = nil
  end

  def test_InitialAssignment_copyConstructor
    o1 = LibSBML::InitialAssignment.new(2,4)
    o1.setSymbol("c")
    assert( o1.getId() ==  "c" )
    o2 = LibSBML::InitialAssignment.new(o1)
    assert( o2.getId() ==  "c" )
    assert( o2.getParentSBMLObject() == o1.getParentSBMLObject() )
    o2 = nil
    o1 = nil
  end

  def test_KineticLaw_assignmentOperator
    o1 = LibSBML::KineticLaw.new(2,4)
    p = LibSBML::Parameter.new(2,4)
    p.setId("jake")
    o1.addParameter(p)
    p = nil
    assert( o1.getNumParameters() == 1 )
    assert( o1.getParameter(0).getId() ==  "jake" )
    o2 = LibSBML::KineticLaw.new(2,4)
    o2 = o1
    assert( o2.getNumParameters() == 1 )
    assert( o2.getParameter(0).getId() ==  "jake" )
    assert( o2.getParentSBMLObject() == o1.getParentSBMLObject() )
    o2 = nil
    o1 = nil
  end

  def test_KineticLaw_clone
    o1 = LibSBML::KineticLaw.new(2,4)
    p = LibSBML::Parameter.new(2,4)
    p.setId("jake")
    o1.addParameter(p)
    p = nil
    assert( o1.getNumParameters() == 1 )
    assert( o1.getParameter(0).getId() ==  "jake" )
    o2 = o1.clone()
    assert( o2.getNumParameters() == 1 )
    assert( o2.getParameter(0).getId() ==  "jake" )
    assert( o2.getParentSBMLObject() == o1.getParentSBMLObject() )
    o2 = nil
    o1 = nil
  end

  def test_KineticLaw_copyConstructor
    o1 = LibSBML::KineticLaw.new(2,4)
    p = LibSBML::Parameter.new(2,4)
    p.setId("jake")
    o1.addParameter(p)
    p = nil
    assert( o1.getNumParameters() == 1 )
    assert( o1.getParameter(0).getId() ==  "jake" )
    o2 = LibSBML::KineticLaw.new(o1)
    assert( o2.getNumParameters() == 1 )
    assert( o2.getParameter(0).getId() ==  "jake" )
    assert( o2.getParentSBMLObject() == o1.getParentSBMLObject() )
    o2 = nil
    o1 = nil
  end

  def test_ListOf_assignmentOperator
    o1 = LibSBML::ListOf.new()
    s = LibSBML::Species.new(2,1)
    s.setId("species_1")
    o1.append(s)
    s = nil
    o2 = LibSBML::ListOf.new()
    o2 = o1
    assert( o2.size() == 1 )
    assert( o2.get(0).getId() ==  "species_1" )
    assert( o2.getParentSBMLObject() == o1.getParentSBMLObject() )
    o2 = nil
    o1 = nil
  end

  def test_ListOf_clone
    o1 = LibSBML::ListOf.new()
    s = LibSBML::Species.new(2,1)
    s.setId("species_1")
    o1.append(s)
    s = nil
    o2 = o1.clone()
    assert( o2.size() == 1 )
    assert( o2.get(0).getId() ==  "species_1" )
    assert( o2.getParentSBMLObject() == o1.getParentSBMLObject() )
    o2 = nil
    o1 = nil
  end

  def test_ListOf_copyConstructor
    o1 = LibSBML::ListOf.new()
    s = LibSBML::Species.new(2,1)
    s.setId("species_1")
    o1.append(s)
    s = nil
    o2 = LibSBML::ListOf.new(o1)
    assert( o2.size() == 1 )
    assert( o2.get(0).getId() ==  "species_1" )
    assert( o2.getParentSBMLObject() == o1.getParentSBMLObject() )
    o2 = nil
    o1 = nil
  end

  def test_Model_assignmentOperator
    o1 = LibSBML::Model.new(2,4)
    o1.setId("c")
    p = LibSBML::Parameter.new(2,4)
    p.setId("alex")
    o1.addParameter(p)
    p = nil
    fud = nil
    assert( o1.getId() ==  "c" )
    assert( o1.getNumParameters() == 1 )
    assert( o1.getParameter(0).getId() ==  "alex" )
    o2 = LibSBML::Model.new(2,4)
    o2 = o1
    assert( o2.getId() ==  "c" )
    assert( o2.getNumParameters() == 1 )
    assert( o2.getParameter(0).getId() ==  "alex" )
    assert( o2.getParentSBMLObject() == o1.getParentSBMLObject() )
    o2 = nil
    o1 = nil
  end

  def test_Model_clone
    o1 = LibSBML::Model.new(2,4)
    o1.setId("c")
    p = LibSBML::Parameter.new(2,4)
    p.setId("alex")
    o1.addParameter(p)
    p = nil
    fud = nil
    assert( o1.getId() ==  "c" )
    assert( o1.getNumParameters() == 1 )
    assert( o1.getParameter(0).getId() ==  "alex" )
    o2 = o1.clone()
    assert( o2.getId() ==  "c" )
    assert( o2.getNumParameters() == 1 )
    assert( o2.getParameter(0).getId() ==  "alex" )
    assert( o2.getParentSBMLObject() == o1.getParentSBMLObject() )
    o2 = nil
    o1 = nil
  end

  def test_Model_copyConstructor
    o1 = LibSBML::Model.new(2,4)
    o1.setId("c")
    p = LibSBML::Parameter.new(2,4)
    p.setId("alex")
    o1.addParameter(p)
    p = nil
    fud = nil
    assert( o1.getId() ==  "c" )
    assert( o1.getNumParameters() == 1 )
    assert( o1.getParameter(0).getId() ==  "alex" )
    o2 = LibSBML::Model.new(o1)
    assert( o2.getId() ==  "c" )
    assert( o2.getNumParameters() == 1 )
    assert( o2.getParameter(0).getId() ==  "alex" )
    assert( o2.getParentSBMLObject() == o1.getParentSBMLObject() )
    o2 = nil
    o1 = nil
  end

  def test_Parameter_assignmentOperator
    o1 = LibSBML::Parameter.new(2,4)
    o1.setId("c")
    assert( o1.getId() ==  "c" )
    o2 = LibSBML::Parameter.new(2,4)
    o2 = o1
    assert( o2.getId() ==  "c" )
    assert( o2.getParentSBMLObject() == o1.getParentSBMLObject() )
    o2 = nil
    o1 = nil
  end

  def test_Parameter_clone
    o1 = LibSBML::Parameter.new(2,4)
    o1.setId("c")
    assert( o1.getId() ==  "c" )
    o2 = o1.clone()
    assert( o2.getId() ==  "c" )
    assert( o2.getParentSBMLObject() == o1.getParentSBMLObject() )
    o2 = nil
    o1 = nil
  end

  def test_Parameter_copyConstructor
    o1 = LibSBML::Parameter.new(2,4)
    o1.setId("c")
    assert( o1.getId() ==  "c" )
    o2 = LibSBML::Parameter.new(o1)
    assert( o2.getId() ==  "c" )
    assert( o2.getParentSBMLObject() == o1.getParentSBMLObject() )
    o2 = nil
    o1 = nil
  end

  def test_Reaction_assignmentOperator
    o1 = LibSBML::Reaction.new(2,4)
    o1.setId("c")
    assert( o1.getId() ==  "c" )
    kl = LibSBML::KineticLaw.new(2,4)
    o1.setKineticLaw(kl)
    kl = nil
    assert( o1.isSetKineticLaw() == true )
    assert( o1.getKineticLaw() != nil )
    o2 = LibSBML::Reaction.new(2,4)
    o2 = o1
    assert( o2.getId() ==  "c" )
    assert( o2.isSetKineticLaw() == true )
    assert( o2.getKineticLaw() != nil )
    assert( o2.getParentSBMLObject() == o1.getParentSBMLObject() )
    o2 = nil
    o1 = nil
  end

  def test_Reaction_clone
    o1 = LibSBML::Reaction.new(2,4)
    o1.setId("c")
    assert( o1.getId() ==  "c" )
    kl = LibSBML::KineticLaw.new(2,4)
    o1.setKineticLaw(kl)
    kl = nil
    assert( o1.isSetKineticLaw() == true )
    assert( o1.getKineticLaw() != nil )
    o2 = o1.clone()
    assert( o2.getId() ==  "c" )
    assert( o2.isSetKineticLaw() == true )
    assert( o2.getKineticLaw() != nil )
    assert( o2.getParentSBMLObject() == o1.getParentSBMLObject() )
    o2 = nil
    o1 = nil
  end

  def test_Reaction_copyConstructor
    o1 = LibSBML::Reaction.new(2,4)
    o1.setId("c")
    assert( o1.getId() ==  "c" )
    kl = LibSBML::KineticLaw.new(2,4)
    o1.setKineticLaw(kl)
    kl = nil
    assert( o1.isSetKineticLaw() == true )
    assert( o1.getKineticLaw() != nil )
    o2 = LibSBML::Reaction.new(o1)
    assert( o2.getId() ==  "c" )
    assert( o2.isSetKineticLaw() == true )
    assert( o2.getKineticLaw() != nil )
    assert( o2.getParentSBMLObject() == o1.getParentSBMLObject() )
    o2 = nil
    o1 = nil
  end

  def test_Rule_assignmentOperator
    o1 = LibSBML::RateRule.new(2,4)
    o1.setVariable("a")
    assert( o1.getVariable() ==  "a" )
    node = LibSBML::ASTNode.new(LibSBML::AST_CONSTANT_PI)
    o1.setMath(node)
    node = nil
    assert( o1.isSetMath() == true )
    o2 = LibSBML::RateRule.new(2,4)
    o2 = o1
    assert( o2.getVariable() ==  "a" )
    assert( o2.isSetMath() == true )
    assert( o2.getParentSBMLObject() == o1.getParentSBMLObject() )
    o2 = nil
    o1 = nil
  end

  def test_Rule_clone
    o1 = LibSBML::RateRule.new(2,1)
    o1.setVariable("a")
    assert( o1.getVariable() ==  "a" )
    node = LibSBML::ASTNode.new(LibSBML::AST_CONSTANT_PI)
    o1.setMath(node)
    node = nil
    assert( o1.isSetMath() == true )
    o2 = o1.clone()
    assert( o2.getVariable() ==  "a" )
    assert( o2.isSetMath() == true )
    assert( o2.getParentSBMLObject() == o1.getParentSBMLObject() )
    o2 = nil
    o1 = nil
  end

  def test_Rule_copyConstructor
    o1 = LibSBML::RateRule.new(2,1)
    o1.setVariable("a")
    assert( o1.getVariable() ==  "a" )
    node = LibSBML::ASTNode.new(LibSBML::AST_CONSTANT_PI)
    o1.setMath(node)
    node = nil
    assert( o1.isSetMath() == true )
    o2 = LibSBML::Rule.new(o1)
    assert( o2.getVariable() ==  "a" )
    assert( o2.isSetMath() == true )
    assert( o2.getParentSBMLObject() == o1.getParentSBMLObject() )
    o2 = nil
    o1 = nil
  end

  def test_SBMLDocument_assignmentOperator
    o1 = LibSBML::SBMLDocument.new()
    o1.setLevelAndVersion(2,1)
    assert( o1.getLevel() == 2 )
    assert( o1.getVersion() == 1 )
    o2 = LibSBML::SBMLDocument.new()
    o2 = o1
    assert( o2.getLevel() == 2 )
    assert( o2.getVersion() == 1 )
    o2 = nil
    o1 = nil
  end

  def test_SBMLDocument_clone
    o1 = LibSBML::SBMLDocument.new()
    o1.setLevelAndVersion(1,1)
    m = LibSBML::Model.new(1,1)
    m.setId("foo")
    o1.setModel(m)
    assert( o1.getLevel() == 1 )
    assert( o1.getVersion() == 1 )
    assert( o1.getModel().getId() ==  "foo" )
    assert( o1.getModel().getLevel() == 1 )
    assert( o1.getModel().getVersion() == 1 )
    assert( o1.getModel().getSBMLDocument() == o1 )
    o2 = o1.clone()
    assert( o2.getLevel() == 1 )
    assert( o2.getVersion() == 1 )
    assert( o2.getModel().getId() ==  "foo" )
    assert( o2.getModel().getLevel() == 1 )
    assert( o2.getModel().getVersion() == 1 )
    assert( o2.getModel().getSBMLDocument() == o2 )
    o2 = nil
    o1 = nil
  end

  def test_SBMLDocument_copyConstructor
    o1 = LibSBML::SBMLDocument.new()
    o1.setLevelAndVersion(2,1)
    assert( o1.getLevel() == 2 )
    assert( o1.getVersion() == 1 )
    o2 = LibSBML::SBMLDocument.new(o1)
    assert( o2.getLevel() == 2 )
    assert( o2.getVersion() == 1 )
    o2 = nil
    o1 = nil
  end

  def test_SpeciesReference_assignmentOperator
    o1 = LibSBML::SpeciesReference.new(2,4)
    o1.setId("c")
    assert( o1.getId() ==  "c" )
    o2 = LibSBML::SpeciesReference.new(2,4)
    o2 = o1
    assert( o2.getId() ==  "c" )
    assert( o2.getParentSBMLObject() == o1.getParentSBMLObject() )
    o2 = nil
    o1 = nil
  end

  def test_SpeciesReference_clone
    o1 = LibSBML::SpeciesReference.new(2,4)
    o1.setId("c")
    assert( o1.getId() ==  "c" )
    o2 = o1.clone()
    assert( o2.getId() ==  "c" )
    assert( o2.getParentSBMLObject() == o1.getParentSBMLObject() )
    o2 = nil
    o1 = nil
  end

  def test_SpeciesReference_copyConstructor
    o1 = LibSBML::SpeciesReference.new(2,4)
    o1.setId("c")
    assert( o1.getId() ==  "c" )
    o2 = LibSBML::SpeciesReference.new(o1)
    assert( o2.getId() ==  "c" )
    assert( o2.getParentSBMLObject() == o1.getParentSBMLObject() )
    o2 = nil
    o1 = nil
  end

  def test_SpeciesType_assignmentOperator
    o1 = LibSBML::SpeciesType.new(2,4)
    o1.setId("c")
    assert( o1.getId() ==  "c" )
    o2 = LibSBML::SpeciesType.new(2,4)
    o2 = o1
    assert( o2.getId() ==  "c" )
    assert( o2.getParentSBMLObject() == o1.getParentSBMLObject() )
    o2 = nil
    o1 = nil
  end

  def test_SpeciesType_clone
    o1 = LibSBML::SpeciesType.new(2,4)
    o1.setId("c")
    assert( o1.getId() ==  "c" )
    o2 = o1.clone()
    assert( o2.getId() ==  "c" )
    assert( o2.getParentSBMLObject() == o1.getParentSBMLObject() )
    o2 = nil
    o1 = nil
  end

  def test_SpeciesType_copyConstructor
    o1 = LibSBML::SpeciesType.new(2,4)
    o1.setId("c")
    assert( o1.getId() ==  "c" )
    o2 = LibSBML::SpeciesType.new(o1)
    assert( o2.getId() ==  "c" )
    assert( o2.getParentSBMLObject() == o1.getParentSBMLObject() )
    o2 = nil
    o1 = nil
  end

  def test_Species_assignmentOperator
    o1 = LibSBML::Species.new(2,4)
    o1.setId("c")
    o1.setSpeciesType("c1")
    assert( o1.getId() ==  "c" )
    assert( o1.getSpeciesType() ==  "c1" )
    o2 = LibSBML::Species.new(2,4)
    o2 = o1
    assert( o2.getId() ==  "c" )
    assert( o2.getSpeciesType() ==  "c1" )
    assert( o2.getParentSBMLObject() == o1.getParentSBMLObject() )
    o2 = nil
    o1 = nil
  end

  def test_Species_clone
    o1 = LibSBML::Species.new(2,4)
    o1.setId("c")
    o1.setSpeciesType("c1")
    assert( o1.getId() ==  "c" )
    assert( o1.getSpeciesType() ==  "c1" )
    o2 = o1.clone()
    assert( o2.getId() ==  "c" )
    assert( o2.getSpeciesType() ==  "c1" )
    assert( o2.getParentSBMLObject() == o1.getParentSBMLObject() )
    o2 = nil
    o1 = nil
  end

  def test_Species_copyConstructor
    o1 = LibSBML::Species.new(2,4)
    o1.setId("c")
    o1.setSpeciesType("c1")
    assert( o1.getId() ==  "c" )
    assert( o1.getSpeciesType() ==  "c1" )
    o2 = LibSBML::Species.new(o1)
    assert( o2.getId() ==  "c" )
    assert( o2.getSpeciesType() ==  "c1" )
    assert( o2.getParentSBMLObject() == o1.getParentSBMLObject() )
    o2 = nil
    o1 = nil
  end

  def test_Trigger_assignmentOperator
    o1 = LibSBML::Trigger.new(2,4)
    node = LibSBML::ASTNode.new(LibSBML::AST_CONSTANT_PI)
    o1.setMath(node)
    node = nil
    assert( o1.getMath() != nil )
    o2 = LibSBML::Trigger.new(2,4)
    o2 = o1
    assert( o1.getMath() != nil )
    assert( o2.getParentSBMLObject() == o1.getParentSBMLObject() )
    o2 = nil
    o1 = nil
  end

  def test_Trigger_clone
    o1 = LibSBML::Trigger.new(2,4)
    node = LibSBML::ASTNode.new(LibSBML::AST_CONSTANT_PI)
    o1.setMath(node)
    node = nil
    assert( o1.getMath() != nil )
    o2 = o1.clone()
    assert( o1.getMath() != nil )
    assert( o2.getParentSBMLObject() == o1.getParentSBMLObject() )
    o2 = nil
    o1 = nil
  end

  def test_Trigger_copyConstructor
    o1 = LibSBML::Trigger.new(2,4)
    node = LibSBML::ASTNode.new(LibSBML::AST_CONSTANT_PI)
    o1.setMath(node)
    node = nil
    assert( o1.getMath() != nil )
    o2 = LibSBML::Trigger.new(o1)
    assert( o2.getMath() != nil )
    assert( o2.getParentSBMLObject() == o1.getParentSBMLObject() )
    o2 = nil
    o1 = nil
  end

  def test_UnitDefinition_assignmentOperator
    o1 = LibSBML::UnitDefinition.new(2,4)
    o1.setId("c")
    assert( o1.getId() ==  "c" )
    o2 = LibSBML::UnitDefinition.new(2,4)
    o2 = o1
    assert( o2.getId() ==  "c" )
    assert( o2.getParentSBMLObject() == o1.getParentSBMLObject() )
    o2 = nil
    o1 = nil
  end

  def test_UnitDefinition_clone
    o1 = LibSBML::UnitDefinition.new(2,4)
    o1.setId("c")
    assert( o1.getId() ==  "c" )
    o2 = o1.clone()
    assert( o2.getId() ==  "c" )
    assert( o2.getParentSBMLObject() == o1.getParentSBMLObject() )
    o2 = nil
    o1 = nil
  end

  def test_UnitDefinition_copyConstructor
    o1 = LibSBML::UnitDefinition.new(2,4)
    o1.setId("c")
    assert( o1.getId() ==  "c" )
    o2 = LibSBML::UnitDefinition.new(o1)
    assert( o2.getId() ==  "c" )
    assert( o2.getParentSBMLObject() == o1.getParentSBMLObject() )
    o2 = nil
    o1 = nil
  end

  def test_Unit_assignmentOperator
    o1 = LibSBML::Unit.new(2,4)
    o1.setKind(LibSBML::UNIT_KIND_MOLE)
    assert( o1.getKind() == LibSBML::UNIT_KIND_MOLE )
    o2 = LibSBML::Unit.new(2,4)
    o2 = o1
    assert( o2.getKind() == LibSBML::UNIT_KIND_MOLE )
    assert( o2.getParentSBMLObject() == o1.getParentSBMLObject() )
    o2 = nil
    o1 = nil
  end

  def test_Unit_clone
    o1 = LibSBML::Unit.new(2,4)
    o1.setKind(LibSBML::UNIT_KIND_MOLE)
    assert( o1.getKind() == LibSBML::UNIT_KIND_MOLE )
    o2 = o1.clone()
    assert( o2.getKind() == LibSBML::UNIT_KIND_MOLE )
    assert( o2.getParentSBMLObject() == o1.getParentSBMLObject() )
    o2 = nil
    o1 = nil
  end

  def test_Unit_copyConstructor
    o1 = LibSBML::Unit.new(2,4)
    o1.setKind(LibSBML::UNIT_KIND_MOLE)
    assert( o1.getKind() == LibSBML::UNIT_KIND_MOLE )
    o2 = LibSBML::Unit.new(o1)
    assert( o2.getKind() == LibSBML::UNIT_KIND_MOLE )
    assert( o2.getParentSBMLObject() == o1.getParentSBMLObject() )
    o2 = nil
    o1 = nil
  end

end
