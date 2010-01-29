#
# @file    TestWriteSBML.rb
# @brief   Write SBML unit tests
#
# @author  Akiya Jouraku (Ruby conversion)
# @author  Ben Bornstein 
#
# $Id$
# $HeadURL$
#
# This test file was converted from src/sbml/test/TestWriteSBML.cpp
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

class TestWriteSBML < Test::Unit::TestCase

  def LV_L1v1
    return "level=\"1\" version=\"1\">\n"
  end

  def LV_L1v2
    return "level=\"1\" version=\"2\">\n"
  end

  def LV_L2v1
    return "level=\"2\" version=\"1\">\n"
  end

  def LV_L2v2
    return "level=\"2\" version=\"2\">\n"
  end

  def LV_L2v3
    return "level=\"2\" version=\"3\">\n"
  end

  def NS_L1
    return "xmlns=\"http://www.sbml.org/sbml/level1\" "
  end

  def NS_L2v1
    return "xmlns=\"http://www.sbml.org/sbml/level2\" "
  end

  def NS_L2v2
    return "xmlns=\"http://www.sbml.org/sbml/level2/version2\" "
  end

  def NS_L2v3
    return "xmlns=\"http://www.sbml.org/sbml/level2/version3\" "
  end

  def SBML_END
    return "</sbml>\n"
  end

  def SBML_START
    return "<sbml "
  end

  def XML_START
    return "<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n"
  end

  def wrapSBML_L1v1(s)
    r = XML_START()
    r += SBML_START()
    r += NS_L1()
    r += LV_L1v1()
    r += s
    r += SBML_END()
    return r
  end

  def wrapSBML_L1v2(s)
    r = XML_START()
    r += SBML_START()
    r += NS_L1()
    r += LV_L1v2()
    r += s
    r += SBML_END()
    return r
  end

  def wrapSBML_L2v1(s)
    r = XML_START()
    r += SBML_START()
    r += NS_L2v1()
    r += LV_L2v1()
    r += s
    r += SBML_END()
    return r
  end

  def wrapSBML_L2v2(s)
    r = XML_START()
    r += SBML_START()
    r += NS_L2v2()
    r += LV_L2v2()
    r += s
    r += SBML_END()
    return r
  end

  def wrapSBML_L2v3(s)
    r = XML_START()
    r += SBML_START()
    r += NS_L2v3()
    r += LV_L2v3()
    r += s
    r += SBML_END()
    return r
  end

  def wrapXML(s)
    r = XML_START()
    r += s
    return r
  end

  def util_NaN
    z = 0.0
    return 0.0/z
  end

  def util_PosInf
    z = 0.0
    return 1.0/z
  end

  def util_NegInf
    z = 0.0
    return -1.0/z
  end

  def equals(*x)
    case x.size
    when 2
      e, s = x
      return e == s
    when 1
      e, = x
      return e == @@oss.str()
    end
  end

  def setup
    @@d = LibSBML::SBMLDocument.new()
    @@s = 0
  end

  def teardown
    @@d = nil
    @@s = nil
  end

  def test_SBMLWriter_create
    w = LibSBML::SBMLWriter.new()
    assert( w != nil )
    w = nil
  end

  def test_SBMLWriter_setProgramName
    w = LibSBML::SBMLWriter.new()
    assert( w != nil )
    i = w.setProgramName( "sss")
    assert( i == LibSBML::LIBSBML_OPERATION_SUCCESS )
    i = w.setProgramName("")
    assert( i == LibSBML::LIBSBML_OPERATION_SUCCESS )
    w = nil
  end

  def test_SBMLWriter_setProgramVersion
    w = LibSBML::SBMLWriter.new()
    assert( w != nil )
    i = w.setProgramVersion( "sss")
    assert( i == LibSBML::LIBSBML_OPERATION_SUCCESS )
    i = w.setProgramVersion("")
    assert( i == LibSBML::LIBSBML_OPERATION_SUCCESS )
    w = nil
  end

  def test_WriteSBML_AlgebraicRule
    @@d.setLevelAndVersion(1,1,false)
    expected =  "<algebraicRule formula=\"x + 1\"/>";
    r = @@d.createModel().createAlgebraicRule()
    r.setFormula("x + 1")
    assert_equal true, equals(expected,r.toSBML())
  end

  def test_WriteSBML_AlgebraicRule_L2v1
    @@d.setLevelAndVersion(2,1,false)
    expected = "<algebraicRule>\n" + 
    "  <math xmlns=\"http://www.w3.org/1998/Math/MathML\">\n" + 
    "    <apply>\n" + 
    "      <plus/>\n" + 
    "      <ci> x </ci>\n" + 
    "      <cn type=\"integer\"> 1 </cn>\n" + 
    "    </apply>\n" + 
    "  </math>\n" + 
    "</algebraicRule>"
    r = @@d.createModel().createAlgebraicRule()
    r.setFormula("x + 1")
    assert_equal true, equals(expected,r.toSBML())
  end

  def test_WriteSBML_AlgebraicRule_L2v2
    @@d.setLevelAndVersion(2,2,false)
    expected = "<algebraicRule sboTerm=\"SBO:0000004\">\n" + 
    "  <math xmlns=\"http://www.w3.org/1998/Math/MathML\">\n" + 
    "    <apply>\n" + 
    "      <plus/>\n" + 
    "      <ci> x </ci>\n" + 
    "      <cn type=\"integer\"> 1 </cn>\n" + 
    "    </apply>\n" + 
    "  </math>\n" + 
    "</algebraicRule>"
    r = @@d.createModel().createAlgebraicRule()
    r.setFormula("x + 1")
    r.setSBOTerm(4)
    assert_equal true, equals(expected,r.toSBML())
  end

  def test_WriteSBML_Compartment
    @@d.setLevelAndVersion(1,2,false)
    expected =  "<compartment name=\"A\" volume=\"2.1\" outside=\"B\"/>";
    c = @@d.createModel().createCompartment()
    c.setId("A")
    c.setSize(2.1)
    c.setOutside("B")
    assert_equal true, equals(expected,c.toSBML())
  end

  def test_WriteSBML_CompartmentType
    @@d.setLevelAndVersion(2,2,false)
    expected =  "<compartmentType id=\"ct\"/>";
    ct = @@d.createModel().createCompartmentType()
    ct.setId("ct")
    ct.setSBOTerm(4)
    assert_equal true, equals(expected,ct.toSBML())
  end

  def test_WriteSBML_CompartmentType_withSBO
    @@d.setLevelAndVersion(2,3,false)
    expected =  "<compartmentType id=\"ct\" sboTerm=\"SBO:0000004\"/>";
    ct = @@d.createModel().createCompartmentType()
    ct.setId("ct")
    ct.setSBOTerm(4)
    assert_equal true, equals(expected,ct.toSBML())
  end

  def test_WriteSBML_CompartmentVolumeRule
    @@d.setLevelAndVersion(1,1,false)
    expected = "<compartmentVolumeRule " + "formula=\"v + c\" type=\"rate\" compartment=\"c\"/>";
    @@d.createModel()
    @@d.getModel().createCompartment().setId("c")
    r = @@d.getModel().createRateRule()
    r.setVariable("c")
    r.setFormula("v + c")
    assert_equal true, equals(expected,r.toSBML())
  end

  def test_WriteSBML_CompartmentVolumeRule_L2v1
    @@d.setLevelAndVersion(2,1,false)
    expected = "<assignmentRule variable=\"c\">\n" + 
    "  <math xmlns=\"http://www.w3.org/1998/Math/MathML\">\n" + 
    "    <apply>\n" + 
    "      <plus/>\n" + 
    "      <ci> v </ci>\n" + 
    "      <ci> c </ci>\n" + 
    "    </apply>\n" + 
    "  </math>\n" + 
    "</assignmentRule>"
    @@d.createModel()
    @@d.getModel().createCompartment().setId("c")
    r = @@d.getModel().createAssignmentRule()
    r.setVariable("c")
    r.setFormula("v + c")
    assert_equal true, equals(expected,r.toSBML())
  end

  def test_WriteSBML_CompartmentVolumeRule_L2v2
    @@d.setLevelAndVersion(2,2,false)
    expected = "<assignmentRule variable=\"c\" sboTerm=\"SBO:0000005\">\n" + 
    "  <math xmlns=\"http://www.w3.org/1998/Math/MathML\">\n" + 
    "    <apply>\n" + 
    "      <plus/>\n" + 
    "      <ci> v </ci>\n" + 
    "      <ci> c </ci>\n" + 
    "    </apply>\n" + 
    "  </math>\n" + 
    "</assignmentRule>"
    @@d.createModel()
    @@d.getModel().createCompartment().setId("c")
    r = @@d.getModel().createAssignmentRule()
    r.setVariable("c")
    r.setFormula("v + c")
    r.setSBOTerm(5)
    assert_equal true, equals(expected,r.toSBML())
  end

  def test_WriteSBML_CompartmentVolumeRule_defaults
    @@d.setLevelAndVersion(1,1,false)
    expected =  "<compartmentVolumeRule formula=\"v + c\" compartment=\"c\"/>";
    @@d.createModel()
    @@d.getModel().createCompartment().setId("c")
    r = @@d.getModel().createAssignmentRule()
    r.setVariable("c")
    r.setFormula("v + c")
    assert_equal true, equals(expected,r.toSBML())
  end

  def test_WriteSBML_Compartment_L2v1
    @@d.setLevelAndVersion(2,1,false)
    expected =  "<compartment id=\"M\" spatialDimensions=\"2\" size=\"2.5\"/>";
    c = @@d.createModel().createCompartment()
    c.setId("M")
    c.setSize(2.5)
    c.setSpatialDimensions(2)
    assert_equal true, equals(expected,c.toSBML())
  end

  def test_WriteSBML_Compartment_L2v1_constant
    @@d.setLevelAndVersion(2,1,false)
    expected =  "<compartment id=\"cell\" size=\"1.2\" constant=\"false\"/>";
    c = @@d.createModel().createCompartment()
    c.setId("cell")
    c.setSize(1.2)
    c.setConstant(false)
    assert_equal true, equals(expected,c.toSBML())
  end

  def test_WriteSBML_Compartment_L2v1_unsetSize
    @@d.setLevelAndVersion(2,1,false)
    expected =  "<compartment id=\"A\"/>";
    c = @@d.createModel().createCompartment()
    c.setId("A")
    c.unsetSize()
    assert_equal true, equals(expected,c.toSBML())
  end

  def test_WriteSBML_Compartment_L2v2_compartmentType
    @@d.setLevelAndVersion(2,2,false)
    expected =  "<compartment id=\"cell\" compartmentType=\"ct\"/>";
    c = @@d.createModel().createCompartment()
    c.setId("cell")
    c.setCompartmentType("ct")
    assert_equal true, equals(expected,c.toSBML())
  end

  def test_WriteSBML_Compartment_L2v3_SBO
    @@d.setLevelAndVersion(2,3,false)
    expected =  "<compartment id=\"cell\" sboTerm=\"SBO:0000005\"/>";
    c = @@d.createModel().createCompartment()
    c.setId("cell")
    c.setSBOTerm(5)
    assert_equal true, equals(expected,c.toSBML())
  end

  def test_WriteSBML_Compartment_unsetVolume
    @@d.setLevelAndVersion(1,2,false)
    expected =  "<compartment name=\"A\"/>";
    c = @@d.createModel().createCompartment()
    c.setId("A")
    c.unsetVolume()
    assert_equal true, equals(expected,c.toSBML())
  end

  def test_WriteSBML_Constraint
    @@d.setLevelAndVersion(2,2,false)
    expected =  "<constraint sboTerm=\"SBO:0000064\"/>";
    ct = @@d.createModel().createConstraint()
    ct.setSBOTerm(64)
    assert_equal true, equals(expected,ct.toSBML())
  end

  def test_WriteSBML_Constraint_full
    @@d.setLevelAndVersion(2,2,false)
    expected = "<constraint sboTerm=\"SBO:0000064\">\n" + 
    "  <math xmlns=\"http://www.w3.org/1998/Math/MathML\">\n" + 
    "    <apply>\n" + 
    "      <leq/>\n" + 
    "      <ci> P1 </ci>\n" + 
    "      <ci> t </ci>\n" + 
    "    </apply>\n" + 
    "  </math>\n" + 
    "  <message>\n" + 
    "    <p xmlns=\"http://www.w3.org/1999/xhtml\"> Species P1 is out of range </p>\n" + 
    "  </message>\n" + 
    "</constraint>"
    c = @@d.createModel().createConstraint()
    node = LibSBML::parseFormula("leq(P1,t)")
    c.setMath(node)
    c.setSBOTerm(64)
    text = LibSBML::XMLNode.convertStringToXMLNode(" Species P1 is out of range ")
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
    c.setMessage(message)
    assert_equal true, equals(expected,c.toSBML())
  end

  def test_WriteSBML_Constraint_math
    @@d.setLevelAndVersion(2,2,false)
    expected = "<constraint>\n" + 
    "  <math xmlns=\"http://www.w3.org/1998/Math/MathML\">\n" + 
    "    <apply>\n" + 
    "      <leq/>\n" + 
    "      <ci> P1 </ci>\n" + 
    "      <ci> t </ci>\n" + 
    "    </apply>\n" + 
    "  </math>\n" + 
    "</constraint>"
    c = @@d.createModel().createConstraint()
    node = LibSBML::parseFormula("leq(P1,t)")
    c.setMath(node)
    assert_equal true, equals(expected,c.toSBML())
  end

  def test_WriteSBML_Event
    @@d.setLevelAndVersion(2,1,false)
    expected =  "<event id=\"e\"/>";
    e = @@d.createModel().createEvent()
    e.setId("e")
    assert_equal true, equals(expected,e.toSBML())
  end

  def test_WriteSBML_Event_WithSBO
    @@d.setLevelAndVersion(2,3,false)
    expected =  "<event id=\"e\" sboTerm=\"SBO:0000076\"/>";
    e = @@d.createModel().createEvent()
    e.setId("e")
    e.setSBOTerm(76)
    assert_equal true, equals(expected,e.toSBML())
  end

  def test_WriteSBML_Event_WithUseValuesFromTriggerTime
    expected =  "<event id=\"e\" useValuesFromTriggerTime=\"false\"/>";
    @@d.setLevelAndVersion(2,4,false)
    e = @@d.createModel().createEvent()
    e.setId("e")
    e.setUseValuesFromTriggerTime(false)
    assert_equal true, equals(expected,e.toSBML())
  end

  def test_WriteSBML_Event_both
    expected = "<event id=\"e\">\n" + 
    "  <trigger>\n" + 
    "    <math xmlns=\"http://www.w3.org/1998/Math/MathML\">\n" + 
    "      <apply>\n" + 
    "        <leq/>\n" + 
    "        <ci> P1 </ci>\n" + 
    "        <ci> t </ci>\n" + 
    "      </apply>\n" + 
    "    </math>\n" + 
    "  </trigger>\n" + 
    "  <delay>\n" + 
    "    <math xmlns=\"http://www.w3.org/1998/Math/MathML\">\n" + 
    "      <cn type=\"integer\"> 5 </cn>\n" + 
    "    </math>\n" + 
    "  </delay>\n" + 
    "</event>"
    @@d.setLevelAndVersion(2,1,false)
    e = @@d.createModel().createEvent()
    e.setId("e")
    node1 = LibSBML::parseFormula("leq(P1,t)")
    t = LibSBML::Trigger.new( 2,1 )
    t.setMath(node1)
    node = LibSBML::parseFormula("5")
    d = LibSBML::Delay.new( 2,1 )
    d.setMath(node)
    e.setDelay(d)
    e.setTrigger(t)
    assert_equal true, equals(expected,e.toSBML())
  end

  def test_WriteSBML_Event_delay
    expected = "<event id=\"e\">\n" + 
    "  <delay>\n" + 
    "    <math xmlns=\"http://www.w3.org/1998/Math/MathML\">\n" + 
    "      <cn type=\"integer\"> 5 </cn>\n" + 
    "    </math>\n" + 
    "  </delay>\n" + 
    "</event>"
    @@d.setLevelAndVersion(2,1,false)
    e = @@d.createModel().createEvent()
    e.setId("e")
    node = LibSBML::parseFormula("5")
    d = LibSBML::Delay.new( 2,1 )
    d.setMath(node)
    e.setDelay(d)
    assert_equal true, equals(expected,e.toSBML())
  end

  def test_WriteSBML_Event_delayWithSBO
    expected = "<event id=\"e\">\n" + 
    "  <delay sboTerm=\"SBO:0000064\">\n" + 
    "    <math xmlns=\"http://www.w3.org/1998/Math/MathML\">\n" + 
    "      <cn type=\"integer\"> 5 </cn>\n" + 
    "    </math>\n" + 
    "  </delay>\n" + 
    "</event>"
    @@d.setLevelAndVersion(2,3,false)
    e = @@d.createModel().createEvent()
    e.setId("e")
    node = LibSBML::parseFormula("5")
    d = LibSBML::Delay.new( 2,3 )
    d.setMath(node)
    d.setSBOTerm(64)
    e.setDelay(d)
    assert_equal true, equals(expected,e.toSBML())
  end

  def test_WriteSBML_Event_full
    expected = "<event id=\"e\">\n" + 
    "  <trigger>\n" + 
    "    <math xmlns=\"http://www.w3.org/1998/Math/MathML\">\n" + 
    "      <apply>\n" + 
    "        <leq/>\n" + 
    "        <ci> P1 </ci>\n" + 
    "        <ci> t </ci>\n" + 
    "      </apply>\n" + 
    "    </math>\n" + 
    "  </trigger>\n" + 
    "  <listOfEventAssignments>\n" + 
    "    <eventAssignment variable=\"k2\" sboTerm=\"SBO:0000064\">\n" + 
    "      <math xmlns=\"http://www.w3.org/1998/Math/MathML\">\n" + 
    "        <cn type=\"integer\"> 0 </cn>\n" + 
    "      </math>\n" + 
    "    </eventAssignment>\n" + 
    "  </listOfEventAssignments>\n" + 
    "</event>"
    @@d.setLevelAndVersion(2,3,false)
    e = @@d.createModel().createEvent()
    e.setId("e")
    node = LibSBML::parseFormula("leq(P1,t)")
    t = LibSBML::Trigger.new( 2,3 )
    t.setMath(node)
    math = LibSBML::parseFormula("0")
    ea = LibSBML::EventAssignment.new( 2,3 )
    ea.setVariable("k2")
    ea.setMath(math)
    ea.setSBOTerm(64)
    e.setTrigger(t)
    e.addEventAssignment(ea)
    assert_equal true, equals(expected,e.toSBML())
  end

  def test_WriteSBML_Event_trigger
    expected = "<event id=\"e\">\n" + 
    "  <trigger>\n" + 
    "    <math xmlns=\"http://www.w3.org/1998/Math/MathML\">\n" + 
    "      <apply>\n" + 
    "        <leq/>\n" + 
    "        <ci> P1 </ci>\n" + 
    "        <ci> t </ci>\n" + 
    "      </apply>\n" + 
    "    </math>\n" + 
    "  </trigger>\n" + 
    "</event>"
    @@d.setLevelAndVersion(2,1,false)
    e = @@d.createModel().createEvent()
    e.setId("e")
    node = LibSBML::parseFormula("leq(P1,t)")
    t = LibSBML::Trigger.new( 2,1 )
    t.setMath(node)
    e.setTrigger(t)
    assert_equal true, equals(expected,e.toSBML())
  end

  def test_WriteSBML_Event_trigger_withSBO
    expected = "<event id=\"e\">\n" + 
    "  <trigger sboTerm=\"SBO:0000064\">\n" + 
    "    <math xmlns=\"http://www.w3.org/1998/Math/MathML\">\n" + 
    "      <apply>\n" + 
    "        <leq/>\n" + 
    "        <ci> P1 </ci>\n" + 
    "        <ci> t </ci>\n" + 
    "      </apply>\n" + 
    "    </math>\n" + 
    "  </trigger>\n" + 
    "</event>"
    @@d.setLevelAndVersion(2,3,false)
    e = @@d.createModel().createEvent()
    e.setId("e")
    node = LibSBML::parseFormula("leq(P1,t)")
    t = LibSBML::Trigger.new( 2,3 )
    t.setMath(node)
    t.setSBOTerm(64)
    e.setTrigger(t)
    assert_equal true, equals(expected,e.toSBML())
  end

  def test_WriteSBML_FunctionDefinition
    expected = "<functionDefinition id=\"pow3\">\n" + 
    "  <math xmlns=\"http://www.w3.org/1998/Math/MathML\">\n" + 
    "    <lambda>\n" + 
    "      <bvar>\n" + 
    "        <ci> x </ci>\n" + 
    "      </bvar>\n" + 
    "      <apply>\n" + 
    "        <power/>\n" + 
    "        <ci> x </ci>\n" + 
    "        <cn type=\"integer\"> 3 </cn>\n" + 
    "      </apply>\n" + 
    "    </lambda>\n" + 
    "  </math>\n" + 
    "</functionDefinition>"
    fd = LibSBML::FunctionDefinition.new( 2,4 )
    fd.setId("pow3")
    fd.setMath(LibSBML::parseFormula("lambda(x, x^3)"))
    assert_equal true, equals(expected,fd.toSBML())
  end

  def test_WriteSBML_FunctionDefinition_withSBO
    expected = "<functionDefinition id=\"pow3\" sboTerm=\"SBO:0000064\">\n" + 
    "  <math xmlns=\"http://www.w3.org/1998/Math/MathML\">\n" + 
    "    <lambda>\n" + 
    "      <bvar>\n" + 
    "        <ci> x </ci>\n" + 
    "      </bvar>\n" + 
    "      <apply>\n" + 
    "        <power/>\n" + 
    "        <ci> x </ci>\n" + 
    "        <cn type=\"integer\"> 3 </cn>\n" + 
    "      </apply>\n" + 
    "    </lambda>\n" + 
    "  </math>\n" + 
    "</functionDefinition>"
    fd = LibSBML::FunctionDefinition.new( 2,4 )
    fd.setId("pow3")
    fd.setMath(LibSBML::parseFormula("lambda(x, x^3)"))
    fd.setSBOTerm(64)
    assert_equal true, equals(expected,fd.toSBML())
  end

  def test_WriteSBML_INF
    expected =  "<parameter id=\"p\" value=\"INF\"/>";
    p = @@d.createModel().createParameter()
    p.setId("p")
    p.setValue(util_PosInf())
    assert_equal true, equals(expected,p.toSBML())
  end

  def test_WriteSBML_InitialAssignment
    @@d.setLevelAndVersion(2,2,false)
    expected =  "<initialAssignment symbol=\"c\" sboTerm=\"SBO:0000064\"/>";
    ia = @@d.createModel().createInitialAssignment()
    ia.setSBOTerm(64)
    ia.setSymbol("c")
    assert_equal true, equals(expected,ia.toSBML())
  end

  def test_WriteSBML_InitialAssignment_math
    expected = "<initialAssignment symbol=\"c\">\n" + 
    "  <math xmlns=\"http://www.w3.org/1998/Math/MathML\">\n" + 
    "    <apply>\n" + 
    "      <plus/>\n" + 
    "      <ci> a </ci>\n" + 
    "      <ci> b </ci>\n" + 
    "    </apply>\n" + 
    "  </math>\n" + 
    "</initialAssignment>"
    ia = @@d.createModel().createInitialAssignment()
    node = LibSBML::parseFormula("a + b")
    ia.setMath(node)
    ia.setSymbol("c")
    assert_equal true, equals(expected,ia.toSBML())
  end

  def test_WriteSBML_KineticLaw
    @@d.setLevelAndVersion(1,2,false)
    expected = "<kineticLaw formula=\"k * e\" timeUnits=\"second\" " + "substanceUnits=\"item\"/>";
    kl = @@d.createModel().createReaction().createKineticLaw()
    kl.setFormula("k * e")
    kl.setTimeUnits("second")
    kl.setSubstanceUnits("item")
    assert_equal true, equals(expected,kl.toSBML())
  end

  def test_WriteSBML_KineticLaw_ListOfParameters
    @@d.setLevelAndVersion(1,2,false)
    expected = "<kineticLaw formula=\"nk * e\" timeUnits=\"second\" " + 
    "substanceUnits=\"item\">\n" + 
    "  <listOfParameters>\n" + 
    "    <parameter name=\"n\" value=\"1.2\"/>\n" + 
    "  </listOfParameters>\n" + 
    "</kineticLaw>"
    kl = @@d.createModel().createReaction().createKineticLaw()
    kl.setFormula("nk * e")
    kl.setTimeUnits("second")
    kl.setSubstanceUnits("item")
    p = kl.createParameter()
    p.setName("n")
    p.setValue(1.2)
    assert_equal true, equals(expected,kl.toSBML())
  end

  def test_WriteSBML_KineticLaw_l2v1
    @@d.setLevelAndVersion(2,1,false)
    expected = "<kineticLaw timeUnits=\"second\" substanceUnits=\"item\">\n" + 
    "  <math xmlns=\"http://www.w3.org/1998/Math/MathML\">\n" + 
    "    <apply>\n" + 
    "      <divide/>\n" + 
    "      <apply>\n" + 
    "        <times/>\n" + 
    "        <ci> vm </ci>\n" + 
    "        <ci> s1 </ci>\n" + 
    "      </apply>\n" + 
    "      <apply>\n" + 
    "        <plus/>\n" + 
    "        <ci> km </ci>\n" + 
    "        <ci> s1 </ci>\n" + 
    "      </apply>\n" + 
    "    </apply>\n" + 
    "  </math>\n" + 
    "</kineticLaw>"
    kl = @@d.createModel().createReaction().createKineticLaw()
    kl.setTimeUnits("second")
    kl.setSubstanceUnits("item")
    kl.setFormula("(vm * s1)/(km + s1)")
    assert_equal true, equals(expected,kl.toSBML())
  end

  def test_WriteSBML_KineticLaw_skipOptional
    @@d.setLevelAndVersion(1,2,false)
    expected =  "<kineticLaw formula=\"k * e\"/>";
    kl = @@d.createModel().createReaction().createKineticLaw()
    kl.setFormula("k * e")
    assert_equal true, equals(expected,kl.toSBML())
  end

  def test_WriteSBML_KineticLaw_withSBO
    @@d.setLevelAndVersion(2,2,false)
    expected = "<kineticLaw sboTerm=\"SBO:0000001\">\n" + 
    "  <math xmlns=\"http://www.w3.org/1998/Math/MathML\">\n" + 
    "    <apply>\n" + 
    "      <divide/>\n" + 
    "      <apply>\n" + 
    "        <times/>\n" + 
    "        <ci> vm </ci>\n" + 
    "        <ci> s1 </ci>\n" + 
    "      </apply>\n" + 
    "      <apply>\n" + 
    "        <plus/>\n" + 
    "        <ci> km </ci>\n" + 
    "        <ci> s1 </ci>\n" + 
    "      </apply>\n" + 
    "    </apply>\n" + 
    "  </math>\n" + 
    "</kineticLaw>"
    kl = @@d.createModel().createReaction().createKineticLaw()
    kl.setFormula("(vm * s1)/(km + s1)")
    kl.setSBOTerm(1)
    assert_equal true, equals(expected,kl.toSBML())
  end

  def test_WriteSBML_Model
    @@d.setLevelAndVersion(1,1,false)
    expected = wrapSBML_L1v1("  <model name=\"Branch\"/>\n")
    @@d.createModel("Branch")
    @@s = LibSBML::writeSBMLToString(@@d)
    assert_equal true, equals(expected,@@s)
  end

  def test_WriteSBML_Model_L2v1
    @@d.setLevelAndVersion(2,1,false)
    expected = wrapSBML_L2v1("  <model id=\"Branch\"/>\n")
    @@d.createModel("Branch")
    @@s = LibSBML::writeSBMLToString(@@d)
    assert_equal true, equals(expected,@@s)
  end

  def test_WriteSBML_Model_L2v1_skipOptional
    @@d.setLevelAndVersion(2,1,false)
    expected = wrapSBML_L2v1("  <model/>\n")
    @@d.createModel()
    @@s = LibSBML::writeSBMLToString(@@d)
    assert_equal true, equals(expected,@@s)
  end

  def test_WriteSBML_Model_L2v2
    @@d.setLevelAndVersion(2,2,false)
    expected = wrapSBML_L2v2("  <model id=\"Branch\" sboTerm=\"SBO:0000004\"/>\n")
    m = @@d.createModel("Branch")
    m.setSBOTerm(4)
    @@s = LibSBML::writeSBMLToString(@@d)
    assert_equal true, equals(expected,@@s)
  end

  def test_WriteSBML_Model_skipOptional
    @@d.setLevelAndVersion(1,2,false)
    expected = wrapSBML_L1v2("  <model/>\n")
    @@d.createModel()
    @@s = LibSBML::writeSBMLToString(@@d)
    assert_equal true, equals(expected,@@s)
  end

  def test_WriteSBML_NaN
    expected =  "<parameter id=\"p\" value=\"NaN\"/>";
    p = @@d.createModel().createParameter()
    p.setId("p")
    p.setValue(util_NaN())
    assert_equal true, equals(expected,p.toSBML())
  end

  def test_WriteSBML_NegINF
    expected =  "<parameter id=\"p\" value=\"-INF\"/>";
    p = @@d.createModel().createParameter()
    p.setId("p")
    p.setValue(util_NegInf())
    assert_equal true, equals(expected,p.toSBML())
  end

  def test_WriteSBML_Parameter
    @@d.setLevelAndVersion(1,2,false)
    expected =  "<parameter name=\"Km1\" value=\"2.3\" units=\"second\"/>";
    p = @@d.createModel().createParameter()
    p.setId("Km1")
    p.setValue(2.3)
    p.setUnits("second")
    assert_equal true, equals(expected,p.toSBML())
  end

  def test_WriteSBML_ParameterRule
    @@d.setLevelAndVersion(1,1,false)
    expected = "<parameterRule " + "formula=\"p * t\" type=\"rate\" name=\"p\"/>";
    @@d.createModel()
    @@d.getModel().createParameter().setId("p")
    r = @@d.getModel().createRateRule()
    r.setVariable("p")
    r.setFormula("p * t")
    assert_equal true, equals(expected,r.toSBML())
  end

  def test_WriteSBML_ParameterRule_L2v1
    @@d.setLevelAndVersion(2,1,false)
    expected = "<rateRule variable=\"p\">\n" + 
    "  <math xmlns=\"http://www.w3.org/1998/Math/MathML\">\n" + 
    "    <apply>\n" + 
    "      <times/>\n" + 
    "      <ci> p </ci>\n" + 
    "      <ci> t </ci>\n" + 
    "    </apply>\n" + 
    "  </math>\n" + 
    "</rateRule>"
    @@d.createModel()
    @@d.getModel().createParameter().setId("p")
    r = @@d.getModel().createRateRule()
    r.setVariable("p")
    r.setFormula("p * t")
    assert_equal true, equals(expected,r.toSBML())
  end

  def test_WriteSBML_ParameterRule_L2v2
    @@d.setLevelAndVersion(2,2,false)
    expected = "<rateRule variable=\"p\" sboTerm=\"SBO:0000007\">\n" + 
    "  <math xmlns=\"http://www.w3.org/1998/Math/MathML\">\n" + 
    "    <apply>\n" + 
    "      <times/>\n" + 
    "      <ci> p </ci>\n" + 
    "      <ci> t </ci>\n" + 
    "    </apply>\n" + 
    "  </math>\n" + 
    "</rateRule>"
    @@d.createModel()
    @@d.getModel().createParameter().setId("p")
    r = @@d.getModel().createRateRule()
    r.setVariable("p")
    r.setFormula("p * t")
    r.setSBOTerm(7)
    assert_equal true, equals(expected,r.toSBML())
  end

  def test_WriteSBML_ParameterRule_defaults
    @@d.setLevelAndVersion(1,1,false)
    expected =  "<parameterRule formula=\"p * t\" name=\"p\"/>";
    @@d.createModel()
    @@d.getModel().createParameter().setId("p")
    r = @@d.getModel().createAssignmentRule()
    r.setVariable("p")
    r.setFormula("p * t")
    assert_equal true, equals(expected,r.toSBML())
  end

  def test_WriteSBML_Parameter_L1v1_required
    @@d.setLevelAndVersion(1,1,false)
    expected =  "<parameter name=\"Km1\" value=\"NaN\"/>";
    p = @@d.createModel().createParameter()
    p.setId("Km1")
    p.unsetValue()
    assert_equal true, equals(expected,p.toSBML())
  end

  def test_WriteSBML_Parameter_L1v2_skipOptional
    @@d.setLevelAndVersion(1,2,false)
    expected =  "<parameter name=\"Km1\"/>";
    p = @@d.createModel().createParameter()
    p.setId("Km1")
    p.unsetValue()
    assert_equal true, equals(expected,p.toSBML())
  end

  def test_WriteSBML_Parameter_L2v1
    @@d.setLevelAndVersion(2,1,false)
    expected =  "<parameter id=\"Km1\" value=\"2.3\" units=\"second\"/>";
    p = @@d.createModel().createParameter()
    p.setId("Km1")
    p.setValue(2.3)
    p.setUnits("second")
    assert_equal true, equals(expected,p.toSBML())
  end

  def test_WriteSBML_Parameter_L2v1_constant
    @@d.setLevelAndVersion(2,1,false)
    expected =  "<parameter id=\"x\" constant=\"false\"/>";
    p = @@d.createModel().createParameter()
    p.setId("x")
    p.setConstant(false)
    assert_equal true, equals(expected,p.toSBML())
  end

  def test_WriteSBML_Parameter_L2v1_skipOptional
    @@d.setLevelAndVersion(2,1,false)
    expected =  "<parameter id=\"Km1\"/>";
    p = @@d.createModel().createParameter()
    p.setId("Km1")
    assert_equal true, equals(expected,p.toSBML())
  end

  def test_WriteSBML_Parameter_L2v2
    @@d.setLevelAndVersion(2,2,false)
    expected =  "<parameter id=\"Km1\" value=\"2.3\" units=\"second\" sboTerm=\"SBO:0000002\"/>";
    p = @@d.createModel().createParameter()
    p.setId("Km1")
    p.setValue(2.3)
    p.setUnits("second")
    p.setSBOTerm(2)
    assert_equal true, equals(expected,p.toSBML())
  end

  def test_WriteSBML_Reaction
    @@d.setLevelAndVersion(1,2,false)
    expected =  "<reaction name=\"r\" reversible=\"false\" fast=\"true\"/>";
    r = @@d.createModel().createReaction()
    r.setId("r")
    r.setReversible(false)
    r.setFast(true)
    assert_equal true, equals(expected,r.toSBML())
  end

  def test_WriteSBML_Reaction_L2v1
    @@d.setLevelAndVersion(2,1,false)
    expected =  "<reaction id=\"r\" reversible=\"false\"/>";
    r = @@d.createModel().createReaction()
    r.setId("r")
    r.setReversible(false)
    assert_equal true, equals(expected,r.toSBML())
  end

  def test_WriteSBML_Reaction_L2v1_full
    @@d.setLevelAndVersion(2,1,false)
    expected = "<reaction id=\"v1\">\n" + 
    "  <listOfReactants>\n" + 
    "    <speciesReference species=\"x0\"/>\n" + 
    "  </listOfReactants>\n" + 
    "  <listOfProducts>\n" + 
    "    <speciesReference species=\"s1\"/>\n" + 
    "  </listOfProducts>\n" + 
    "  <listOfModifiers>\n" + 
    "    <modifierSpeciesReference species=\"m1\"/>\n" + 
    "  </listOfModifiers>\n" + 
    "  <kineticLaw>\n" + 
    "    <math xmlns=\"http://www.w3.org/1998/Math/MathML\">\n" + 
    "      <apply>\n" + 
    "        <divide/>\n" + 
    "        <apply>\n" + 
    "          <times/>\n" + 
    "          <ci> vm </ci>\n" + 
    "          <ci> s1 </ci>\n" + 
    "        </apply>\n" + 
    "        <apply>\n" + 
    "          <plus/>\n" + 
    "          <ci> km </ci>\n" + 
    "          <ci> s1 </ci>\n" + 
    "        </apply>\n" + 
    "      </apply>\n" + 
    "    </math>\n" + 
    "  </kineticLaw>\n" + 
    "</reaction>"
    @@d.createModel()
    r = @@d.getModel().createReaction()
    r.setId("v1")
    r.setReversible(true)
    r.createReactant().setSpecies("x0")
    r.createProduct().setSpecies("s1")
    r.createModifier().setSpecies("m1")
    r.createKineticLaw().setFormula("(vm * s1)/(km + s1)")
    assert_equal true, equals(expected,r.toSBML())
  end

  def test_WriteSBML_Reaction_L2v2
    @@d.setLevelAndVersion(2,2,false)
    expected =  "<reaction id=\"r\" name=\"r1\" reversible=\"false\" fast=\"true\" sboTerm=\"SBO:0000064\"/>";
    r = @@d.createModel().createReaction()
    r.setId("r")
    r.setName("r1")
    r.setReversible(false)
    r.setFast(true)
    r.setSBOTerm(64)
    assert_equal true, equals(expected,r.toSBML())
  end

  def test_WriteSBML_Reaction_defaults
    @@d.setLevelAndVersion(1,2,false)
    expected =  "<reaction name=\"r\"/>";
    r = @@d.createModel().createReaction()
    r.setId("r")
    assert_equal true, equals(expected,r.toSBML())
  end

  def test_WriteSBML_Reaction_full
    @@d.setLevelAndVersion(1,2,false)
    expected = "<reaction name=\"v1\">\n" + 
    "  <listOfReactants>\n" + 
    "    <speciesReference species=\"x0\"/>\n" + 
    "  </listOfReactants>\n" + 
    "  <listOfProducts>\n" + 
    "    <speciesReference species=\"s1\"/>\n" + 
    "  </listOfProducts>\n" + 
    "  <kineticLaw formula=\"(vm * s1)/(km + s1)\"/>\n" + 
    "</reaction>"
    @@d.createModel()
    r = @@d.getModel().createReaction()
    r.setId("v1")
    r.setReversible(true)
    r.createReactant().setSpecies("x0")
    r.createProduct().setSpecies("s1")
    r.createKineticLaw().setFormula("(vm * s1)/(km + s1)")
    assert_equal true, equals(expected,r.toSBML())
  end

  def test_WriteSBML_SBMLDocument_L1v1
    @@d.setLevelAndVersion(1,1,false)
    expected = wrapXML("<sbml xmlns=\"http://www.sbml.org/sbml/level1\" " + "level=\"1\" version=\"1\"/>\n")
    @@s = LibSBML::writeSBMLToString(@@d)
    assert_equal true, equals(expected,@@s)
  end

  def test_WriteSBML_SBMLDocument_L1v2
    @@d.setLevelAndVersion(1,2,false)
    expected = wrapXML("<sbml xmlns=\"http://www.sbml.org/sbml/level1\" " + "level=\"1\" version=\"2\"/>\n")
    @@s = LibSBML::writeSBMLToString(@@d)
    assert_equal true, equals(expected,@@s)
  end

  def test_WriteSBML_SBMLDocument_L2v1
    @@d.setLevelAndVersion(2,1,false)
    expected = wrapXML("<sbml xmlns=\"http://www.sbml.org/sbml/level2\" " + "level=\"2\" version=\"1\"/>\n")
    @@s = LibSBML::writeSBMLToString(@@d)
    assert_equal true, equals(expected,@@s)
  end

  def test_WriteSBML_SBMLDocument_L2v2
    @@d.setLevelAndVersion(2,2,false)
    expected = wrapXML("<sbml xmlns=\"http://www.sbml.org/sbml/level2/version2\" " + "level=\"2\" version=\"2\"/>\n")
    @@s = LibSBML::writeSBMLToString(@@d)
    assert_equal true, equals(expected,@@s)
  end

  def test_WriteSBML_Species
    @@d.setLevelAndVersion(1,2,false)
    expected = "<species name=\"Ca2\" compartment=\"cell\" initialAmount=\"0.7\"" + " units=\"mole\" boundaryCondition=\"true\" charge=\"2\"/>";
    s = @@d.createModel().createSpecies()
    s.setName("Ca2")
    s.setCompartment("cell")
    s.setInitialAmount(0.7)
    s.setUnits("mole")
    s.setBoundaryCondition(true)
    s.setCharge(2)
    assert_equal true, equals(expected,s.toSBML())
  end

  def test_WriteSBML_SpeciesConcentrationRule
    @@d.setLevelAndVersion(1,2,false)
    expected = "<speciesConcentrationRule " + "formula=\"t * s\" type=\"rate\" species=\"s\"/>";
    @@d.createModel()
    @@d.getModel().createSpecies().setId("s")
    r = @@d.getModel().createRateRule()
    r.setVariable("s")
    r.setFormula("t * s")
    assert_equal true, equals(expected,r.toSBML())
  end

  def test_WriteSBML_SpeciesConcentrationRule_L1v1
    @@d.setLevelAndVersion(1,1,false)
    expected =  "<specieConcentrationRule formula=\"t * s\" specie=\"s\"/>";
    @@d.createModel()
    @@d.getModel().createSpecies().setId("s")
    r = @@d.getModel().createAssignmentRule()
    r.setVariable("s")
    r.setFormula("t * s")
    assert_equal true, equals(expected,r.toSBML())
  end

  def test_WriteSBML_SpeciesConcentrationRule_L2v1
    @@d.setLevelAndVersion(2,1,false)
    expected = "<assignmentRule variable=\"s\">\n" + 
    "  <math xmlns=\"http://www.w3.org/1998/Math/MathML\">\n" + 
    "    <apply>\n" + 
    "      <times/>\n" + 
    "      <ci> t </ci>\n" + 
    "      <ci> s </ci>\n" + 
    "    </apply>\n" + 
    "  </math>\n" + 
    "</assignmentRule>"
    @@d.createModel()
    @@d.getModel().createSpecies().setId("s")
    r = @@d.getModel().createAssignmentRule()
    r.setVariable("s")
    r.setFormula("t * s")
    assert_equal true, equals(expected,r.toSBML())
  end

  def test_WriteSBML_SpeciesConcentrationRule_L2v2
    @@d.setLevelAndVersion(2,2,false)
    expected = "<assignmentRule variable=\"s\" sboTerm=\"SBO:0000006\">\n" + 
    "  <math xmlns=\"http://www.w3.org/1998/Math/MathML\">\n" + 
    "    <apply>\n" + 
    "      <times/>\n" + 
    "      <ci> t </ci>\n" + 
    "      <ci> s </ci>\n" + 
    "    </apply>\n" + 
    "  </math>\n" + 
    "</assignmentRule>"
    @@d.createModel()
    @@d.getModel().createSpecies().setId("s")
    r = @@d.getModel().createAssignmentRule()
    r.setVariable("s")
    r.setFormula("t * s")
    r.setSBOTerm(6)
    assert_equal true, equals(expected,r.toSBML())
  end

  def test_WriteSBML_SpeciesConcentrationRule_defaults
    @@d.setLevelAndVersion(1,2,false)
    expected =  "<speciesConcentrationRule formula=\"t * s\" species=\"s\"/>";
    @@d.createModel()
    @@d.getModel().createSpecies().setId("s")
    r = @@d.getModel().createAssignmentRule()
    r.setVariable("s")
    r.setFormula("t * s")
    assert_equal true, equals(expected,r.toSBML())
  end

  def test_WriteSBML_SpeciesReference
    @@d.setLevelAndVersion(1,2,false)
    expected =  "<speciesReference species=\"s\" stoichiometry=\"3\" denominator=\"2\"/>";
    sr = @@d.createModel().createReaction().createReactant()
    sr.setSpecies("s")
    sr.setStoichiometry(3)
    sr.setDenominator(2)
    assert_equal true, equals(expected,sr.toSBML())
  end

  def test_WriteSBML_SpeciesReference_L1v1
    @@d.setLevelAndVersion(1,1,false)
    expected =  "<specieReference specie=\"s\" stoichiometry=\"3\" denominator=\"2\"/>";
    sr = @@d.createModel().createReaction().createReactant()
    sr.setSpecies("s")
    sr.setStoichiometry(3)
    sr.setDenominator(2)
    assert_equal true, equals(expected,sr.toSBML())
  end

  def test_WriteSBML_SpeciesReference_L2v1_1
    @@d.setLevelAndVersion(2,1,false)
    expected = "<speciesReference species=\"s\">\n" + 
    "  <stoichiometryMath>\n" + 
    "    <math xmlns=\"http://www.w3.org/1998/Math/MathML\">\n" + 
    "      <cn type=\"rational\"> 3 <sep/> 2 </cn>\n" + 
    "    </math>\n" + 
    "  </stoichiometryMath>\n" + 
    "</speciesReference>"
    sr = @@d.createModel().createReaction().createReactant()
    sr.setSpecies("s")
    sr.setStoichiometry(3)
    sr.setDenominator(2)
    assert_equal true, equals(expected,sr.toSBML())
  end

  def test_WriteSBML_SpeciesReference_L2v1_2
    @@d.setLevelAndVersion(2,1,false)
    expected =  "<speciesReference species=\"s\" stoichiometry=\"3.2\"/>";
    sr = @@d.createModel().createReaction().createReactant()
    sr.setSpecies("s")
    sr.setStoichiometry(3.2)
    assert_equal true, equals(expected,sr.toSBML())
  end

  def test_WriteSBML_SpeciesReference_L2v1_3
    @@d.setLevelAndVersion(2,1,false)
    expected = "<speciesReference species=\"s\">\n" + 
    "  <stoichiometryMath>\n" + 
    "    <math xmlns=\"http://www.w3.org/1998/Math/MathML\">\n" + 
    "      <apply>\n" + 
    "        <divide/>\n" + 
    "        <cn type=\"integer\"> 1 </cn>\n" + 
    "        <ci> d </ci>\n" + 
    "      </apply>\n" + 
    "    </math>\n" + 
    "  </stoichiometryMath>\n" + 
    "</speciesReference>"
    sr = @@d.createModel().createReaction().createReactant()
    sr.setSpecies("s")
    math = LibSBML::parseFormula("1/d")
    stoich = sr.createStoichiometryMath()
    stoich.setMath(math)
    sr.setStoichiometryMath(stoich)
    assert_equal true, equals(expected,sr.toSBML())
  end

  def test_WriteSBML_SpeciesReference_L2v2_1
    @@d.setLevelAndVersion(2,2,false)
    expected = "<speciesReference id=\"ss\" name=\"odd\" sboTerm=\"SBO:0000009\" species=\"s\">\n" + 
    "  <stoichiometryMath>\n" + 
    "    <math xmlns=\"http://www.w3.org/1998/Math/MathML\">\n" + 
    "      <cn type=\"rational\"> 3 <sep/> 2 </cn>\n" + 
    "    </math>\n" + 
    "  </stoichiometryMath>\n" + 
    "</speciesReference>"
    sr = @@d.createModel().createReaction().createReactant()
    sr.setSpecies("s")
    sr.setStoichiometry(3)
    sr.setDenominator(2)
    sr.setId("ss")
    sr.setName("odd")
    sr.setSBOTerm(9)
    sr.setId("ss")
    sr.setName("odd")
    sr.setSBOTerm(9)
    assert_equal true, equals(expected,sr.toSBML())
  end

  def test_WriteSBML_SpeciesReference_L2v3_1
    @@d.setLevelAndVersion(2,3,false)
    expected =  "<speciesReference id=\"ss\" name=\"odd\" sboTerm=\"SBO:0000009\" species=\"s\" stoichiometry=\"3.2\"/>";
    sr = @@d.createModel().createReaction().createReactant()
    sr.setSpecies("s")
    sr.setStoichiometry(3.2)
    sr.setId("ss")
    sr.setName("odd")
    sr.setSBOTerm(9)
    assert_equal true, equals(expected,sr.toSBML())
  end

  def test_WriteSBML_SpeciesReference_defaults
    @@d.setLevelAndVersion(1,2,false)
    expected =  "<speciesReference species=\"s\"/>";
    sr = @@d.createModel().createReaction().createReactant()
    sr.setSpecies("s")
    assert_equal true, equals(expected,sr.toSBML())
  end

  def test_WriteSBML_SpeciesType
    @@d.setLevelAndVersion(2,2,false)
    expected =  "<speciesType id=\"st\"/>";
    st = @@d.createModel().createSpeciesType()
    st.setId("st")
    st.setSBOTerm(4)
    assert_equal true, equals(expected,st.toSBML())
  end

  def test_WriteSBML_SpeciesType_withSBO
    @@d.setLevelAndVersion(2,3,false)
    expected =  "<speciesType id=\"st\" sboTerm=\"SBO:0000004\"/>";
    st = @@d.createModel().createSpeciesType()
    st.setId("st")
    st.setSBOTerm(4)
    assert_equal true, equals(expected,st.toSBML())
  end

  def test_WriteSBML_Species_L1v1
    @@d.setLevelAndVersion(1,1,false)
    expected = "<specie name=\"Ca2\" compartment=\"cell\" initialAmount=\"0.7\"" + " units=\"mole\" boundaryCondition=\"true\" charge=\"2\"/>";
    s = @@d.createModel().createSpecies()
    s.setName("Ca2")
    s.setCompartment("cell")
    s.setInitialAmount(0.7)
    s.setUnits("mole")
    s.setBoundaryCondition(true)
    s.setCharge(2)
    assert_equal true, equals(expected,s.toSBML())
  end

  def test_WriteSBML_Species_L2v1
    @@d.setLevelAndVersion(2,1,false)
    expected = "<species id=\"Ca2\" compartment=\"cell\" initialAmount=\"0.7\" " + "substanceUnits=\"mole\" constant=\"true\"/>";
    s = @@d.createModel().createSpecies()
    s.setId("Ca2")
    s.setCompartment("cell")
    s.setInitialAmount(0.7)
    s.setSubstanceUnits("mole")
    s.setConstant(true)
    assert_equal true, equals(expected,s.toSBML())
  end

  def test_WriteSBML_Species_L2v1_skipOptional
    @@d.setLevelAndVersion(2,1,false)
    expected =  "<species id=\"Ca2\" compartment=\"cell\"/>";
    s = @@d.createModel().createSpecies()
    s.setId("Ca2")
    s.setCompartment("cell")
    assert_equal true, equals(expected,s.toSBML())
  end

  def test_WriteSBML_Species_L2v2
    @@d.setLevelAndVersion(2,2,false)
    expected = "<species id=\"Ca2\" speciesType=\"st\" compartment=\"cell\" initialAmount=\"0.7\" " + "substanceUnits=\"mole\" constant=\"true\"/>";
    s = @@d.createModel().createSpecies()
    s.setId("Ca2")
    s.setCompartment("cell")
    s.setInitialAmount(0.7)
    s.setSubstanceUnits("mole")
    s.setConstant(true)
    s.setSpeciesType("st")
    assert_equal true, equals(expected,s.toSBML())
  end

  def test_WriteSBML_Species_L2v3
    @@d.setLevelAndVersion(2,3,false)
    expected =  "<species id=\"Ca2\" compartment=\"cell\" sboTerm=\"SBO:0000007\"/>";
    s = @@d.createModel().createSpecies()
    s.setId("Ca2")
    s.setCompartment("cell")
    s.setSBOTerm(7)
    assert_equal true, equals(expected,s.toSBML())
  end

  def test_WriteSBML_Species_defaults
    @@d.setLevelAndVersion(1,2,false)
    expected = "<species name=\"Ca2\" compartment=\"cell\" initialAmount=\"0.7\"" + " units=\"mole\" charge=\"2\"/>";
    s = @@d.createModel().createSpecies()
    s.setName("Ca2")
    s.setCompartment("cell")
    s.setInitialAmount(0.7)
    s.setUnits("mole")
    s.setCharge(2)
    assert_equal true, equals(expected,s.toSBML())
  end

  def test_WriteSBML_Species_skipOptional
    @@d.setLevelAndVersion(1,2,false)
    expected =  "<species name=\"Ca2\" compartment=\"cell\" initialAmount=\"0.7\"/>";
    s = @@d.createModel().createSpecies()
    s.setId("Ca2")
    s.setCompartment("cell")
    s.setInitialAmount(0.7)
    assert_equal true, equals(expected,s.toSBML())
  end

  def test_WriteSBML_StoichiometryMath
    @@d.setLevelAndVersion(2,1,false)
    expected = "<stoichiometryMath>\n" + 
    "  <math xmlns=\"http://www.w3.org/1998/Math/MathML\">\n" + 
    "    <apply>\n" + 
    "      <divide/>\n" + 
    "      <cn type=\"integer\"> 1 </cn>\n" + 
    "      <ci> d </ci>\n" + 
    "    </apply>\n" + 
    "  </math>\n" + 
    "</stoichiometryMath>"
    math = LibSBML::parseFormula("1/d")
    stoich = @@d.createModel().createReaction().createReactant().createStoichiometryMath()
    stoich.setMath(math)
    assert_equal true, equals(expected,stoich.toSBML())
  end

  def test_WriteSBML_StoichiometryMath_withSBO
    @@d.setLevelAndVersion(2,3,false)
    expected = "<stoichiometryMath sboTerm=\"SBO:0000333\">\n" + 
    "  <math xmlns=\"http://www.w3.org/1998/Math/MathML\">\n" + 
    "    <apply>\n" + 
    "      <divide/>\n" + 
    "      <cn type=\"integer\"> 1 </cn>\n" + 
    "      <ci> d </ci>\n" + 
    "    </apply>\n" + 
    "  </math>\n" + 
    "</stoichiometryMath>"
    math = LibSBML::parseFormula("1/d")
    stoich = @@d.createModel().createReaction().createReactant().createStoichiometryMath()
    stoich.setMath(math)
    stoich.setSBOTerm(333)
    assert_equal true, equals(expected,stoich.toSBML())
  end

  def test_WriteSBML_Unit
    @@d.setLevelAndVersion(2,4,false)
    expected =  "<unit kind=\"kilogram\" exponent=\"2\" scale=\"-3\"/>";
    u = @@d.createModel().createUnitDefinition().createUnit()
    u.setKind(LibSBML::UNIT_KIND_KILOGRAM)
    u.setExponent(2)
    u.setScale(-3)
    assert_equal true, equals(expected,u.toSBML())
  end

  def test_WriteSBML_UnitDefinition
    @@d.setLevelAndVersion(1,2,false)
    expected =  "<unitDefinition name=\"mmls\"/>";
    ud = @@d.createModel().createUnitDefinition()
    ud.setId("mmls")
    assert_equal true, equals(expected,ud.toSBML())
  end

  def test_WriteSBML_UnitDefinition_L2v1
    @@d.setLevelAndVersion(2,1,false)
    expected =  "<unitDefinition id=\"mmls\"/>";
    ud = @@d.createModel().createUnitDefinition()
    ud.setId("mmls")
    assert_equal true, equals(expected,ud.toSBML())
  end

  def test_WriteSBML_UnitDefinition_L2v1_full
    @@d.setLevelAndVersion(2,1,false)
    expected = "<unitDefinition id=\"Fahrenheit\">\n" + 
    "  <listOfUnits>\n" + 
    "    <unit kind=\"Celsius\" multiplier=\"1.8\" offset=\"32\"/>\n" + 
    "  </listOfUnits>\n" + 
    "</unitDefinition>"
    ud = @@d.createModel().createUnitDefinition()
    ud.setId("Fahrenheit")
    u1 = ud.createUnit()
    u1.setKind(LibSBML::UnitKind_forName("Celsius"))
    u1.setMultiplier(1.8)
    u1.setOffset(32)
    assert_equal true, equals(expected,ud.toSBML())
  end

  def test_WriteSBML_UnitDefinition_full
    @@d.setLevelAndVersion(1,2,false)
    expected = "<unitDefinition name=\"mmls\">\n" + 
    "  <listOfUnits>\n" + 
    "    <unit kind=\"mole\" scale=\"-3\"/>\n" + 
    "    <unit kind=\"liter\" exponent=\"-1\"/>\n" + 
    "    <unit kind=\"second\" exponent=\"-1\"/>\n" + 
    "  </listOfUnits>\n" + 
    "</unitDefinition>"
    ud = @@d.createModel().createUnitDefinition()
    ud.setId("mmls")
    u1 = ud.createUnit()
    u1.setKind(LibSBML::UNIT_KIND_MOLE)
    u1.setScale(-3)
    u2 = ud.createUnit()
    u2.setKind(LibSBML::UNIT_KIND_LITER)
    u2.setExponent(-1)
    u3 = ud.createUnit()
    u3.setKind(LibSBML::UNIT_KIND_SECOND)
    u3.setExponent(-1)
    assert_equal true, equals(expected,ud.toSBML())
  end

  def test_WriteSBML_Unit_L2v1
    @@d.setLevelAndVersion(2,1,false)
    expected =  "<unit kind=\"Celsius\" multiplier=\"1.8\" offset=\"32\"/>";
    u = @@d.createModel().createUnitDefinition().createUnit()
    u.setKind(LibSBML::UnitKind_forName("Celsius"))
    u.setMultiplier(1.8)
    u.setOffset(32)
    assert_equal true, equals(expected,u.toSBML())
  end

  def test_WriteSBML_Unit_defaults
    @@d.setLevelAndVersion(1,2,false)
    expected =  "<unit kind=\"kilogram\"/>";
    u = @@d.createModel().createUnitDefinition().createUnit()
    u.setKind(LibSBML::UNIT_KIND_KILOGRAM)
    assert_equal true, equals(expected,u.toSBML())
  end

  def test_WriteSBML_Unit_l2v3
    @@d.setLevelAndVersion(2,3,false)
    expected =  "<unit kind=\"kilogram\" exponent=\"2\" scale=\"-3\"/>";
    u = @@d.createModel().createUnitDefinition().createUnit()
    u.setKind(LibSBML::UNIT_KIND_KILOGRAM)
    u.setExponent(2)
    u.setScale(-3)
    u.setOffset(32)
    assert_equal true, equals(expected,u.toSBML())
  end

  def test_WriteSBML_bzip2
    file = [
                        "../../../examples/sample-models/from-spec/level-2/algebraicrules.xml",
                        "../../../examples/sample-models/from-spec/level-2/assignmentrules.xml",
                        "../../../examples/sample-models/from-spec/level-2/boundarycondition.xml",
                        "../../../examples/sample-models/from-spec/level-2/delay.xml",
                        "../../../examples/sample-models/from-spec/level-2/dimerization.xml",
                        "../../../examples/sample-models/from-spec/level-2/enzymekinetics.xml",
                        "../../../examples/sample-models/from-spec/level-2/events.xml",
                        "../../../examples/sample-models/from-spec/level-2/functiondef.xml",
                        "../../../examples/sample-models/from-spec/level-2/multicomp.xml",
                        "../../../examples/sample-models/from-spec/level-2/overdetermined.xml",
                        "../../../examples/sample-models/from-spec/level-2/twodimensional.xml",
                        "../../../examples/sample-models/from-spec/level-2/units.xml"
    ]
    bz2file = "test.xml.bz2"
    file.each do |f|
      d = LibSBML::readSBML(f)
      assert( d != nil )
      if not LibSBML::SBMLWriter::hasBzip2()
        assert( LibSBML::writeSBML(d,bz2file) == 0 )
        d = nil
        next
      end
      result = LibSBML::writeSBML(d,bz2file)
      assert_equal 1, result
      dg = LibSBML::readSBML(bz2file)
      assert( dg != nil )
      assert( ( dg.toSBML() != d.toSBML() ) == false )
      d = nil
      dg = nil
    end 
  end


  def test_WriteSBML_elements_L1v2
    @@d.setLevelAndVersion(1,2,false)
    expected = wrapSBML_L1v2("  <model>\n" + 
    "    <listOfUnitDefinitions>\n" + 
    "      <unitDefinition/>\n" + 
    "    </listOfUnitDefinitions>\n" + 
    "    <listOfCompartments>\n" + 
    "      <compartment/>\n" + 
    "    </listOfCompartments>\n" + 
    "    <listOfSpecies>\n" + 
    "      <species initialAmount=\"0\"/>\n" + 
    "    </listOfSpecies>\n" + 
    "    <listOfParameters>\n" + 
    "      <parameter/>\n" + 
    "    </listOfParameters>\n" + 
    "    <listOfRules>\n" + 
    "      <algebraicRule/>\n" + 
    "    </listOfRules>\n" + 
    "    <listOfReactions>\n" + 
    "      <reaction/>\n" + 
    "    </listOfReactions>\n" + 
    "  </model>\n")
    m = @@d.createModel()
    m.createUnitDefinition()
    m.createCompartment()
    m.createParameter()
    m.createAlgebraicRule()
    m.createReaction()
    m.createSpecies()
    @@s = LibSBML::writeSBMLToString(@@d)
    assert_equal true, equals(expected,@@s)
  end

  def test_WriteSBML_elements_L2v1
    @@d.setLevelAndVersion(2,1,false)
    expected = wrapSBML_L2v1("  <model>\n" + 
    "    <listOfFunctionDefinitions>\n" + 
    "      <functionDefinition/>\n" + 
    "    </listOfFunctionDefinitions>\n" + 
    "    <listOfUnitDefinitions>\n" + 
    "      <unitDefinition/>\n" + 
    "    </listOfUnitDefinitions>\n" + 
    "    <listOfCompartments>\n" + 
    "      <compartment/>\n" + 
    "    </listOfCompartments>\n" + 
    "    <listOfSpecies>\n" + 
    "      <species/>\n" + 
    "    </listOfSpecies>\n" + 
    "    <listOfParameters>\n" + 
    "      <parameter/>\n" + 
    "    </listOfParameters>\n" + 
    "    <listOfRules>\n" + 
    "      <algebraicRule/>\n" + 
    "    </listOfRules>\n" + 
    "    <listOfReactions>\n" + 
    "      <reaction/>\n" + 
    "    </listOfReactions>\n" + 
    "    <listOfEvents>\n" + 
    "      <event/>\n" + 
    "    </listOfEvents>\n" + 
    "  </model>\n")
    m = @@d.createModel()
    m.createUnitDefinition()
    m.createFunctionDefinition()
    m.createCompartment()
    m.createEvent()
    m.createParameter()
    m.createAlgebraicRule()
    m.createInitialAssignment()
    m.createConstraint()
    m.createReaction()
    m.createSpecies()
    @@s = LibSBML::writeSBMLToString(@@d)
    assert_equal true, equals(expected,@@s)
  end

  def test_WriteSBML_elements_L2v2
    @@d.setLevelAndVersion(2,2,false)
    expected = wrapSBML_L2v2("  <model>\n" + 
    "    <listOfFunctionDefinitions>\n" + 
    "      <functionDefinition/>\n" + 
    "    </listOfFunctionDefinitions>\n" + 
    "    <listOfUnitDefinitions>\n" + 
    "      <unitDefinition/>\n" + 
    "    </listOfUnitDefinitions>\n" + 
    "    <listOfCompartmentTypes>\n" + 
    "      <compartmentType/>\n" + 
    "    </listOfCompartmentTypes>\n" + 
    "    <listOfSpeciesTypes>\n" + 
    "      <speciesType/>\n" + 
    "    </listOfSpeciesTypes>\n" + 
    "    <listOfCompartments>\n" + 
    "      <compartment/>\n" + 
    "    </listOfCompartments>\n" + 
    "    <listOfSpecies>\n" + 
    "      <species/>\n" + 
    "    </listOfSpecies>\n" + 
    "    <listOfParameters>\n" + 
    "      <parameter/>\n" + 
    "    </listOfParameters>\n" + 
    "    <listOfInitialAssignments>\n" + 
    "      <initialAssignment/>\n" + 
    "    </listOfInitialAssignments>\n" + 
    "    <listOfRules>\n" + 
    "      <algebraicRule/>\n" + 
    "    </listOfRules>\n" + 
    "    <listOfConstraints>\n" + 
    "      <constraint/>\n" + 
    "    </listOfConstraints>\n" + 
    "    <listOfReactions>\n" + 
    "      <reaction/>\n" + 
    "    </listOfReactions>\n" + 
    "    <listOfEvents>\n" + 
    "      <event/>\n" + 
    "    </listOfEvents>\n" + 
    "  </model>\n")
    m = @@d.createModel()
    m.createUnitDefinition()
    m.createFunctionDefinition()
    m.createCompartmentType()
    m.createSpeciesType()
    m.createCompartment()
    m.createEvent()
    m.createParameter()
    m.createAlgebraicRule()
    m.createInitialAssignment()
    m.createConstraint()
    m.createReaction()
    m.createSpecies()
    @@s = LibSBML::writeSBMLToString(@@d)
    assert_equal true, equals(expected,@@s)
  end

  def test_WriteSBML_error
    d = LibSBML::SBMLDocument.new()
    w = LibSBML::SBMLWriter.new()
    assert_equal false, w.writeSBML(d, "/tmp/impossible/path/should/fail")
    assert( d.getNumErrors() == 1 )
    assert( d.getError(0).getErrorId() == LibSBML::XMLFileUnwritable )
    d = nil
    w = nil
  end

  def test_WriteSBML_gzip
    file = [
                        "../../../examples/sample-models/from-spec/level-2/algebraicrules.xml",
                        "../../../examples/sample-models/from-spec/level-2/assignmentrules.xml",
                        "../../../examples/sample-models/from-spec/level-2/boundarycondition.xml",
                        "../../../examples/sample-models/from-spec/level-2/delay.xml",
                        "../../../examples/sample-models/from-spec/level-2/dimerization.xml",
                        "../../../examples/sample-models/from-spec/level-2/enzymekinetics.xml",
                        "../../../examples/sample-models/from-spec/level-2/events.xml",
                        "../../../examples/sample-models/from-spec/level-2/functiondef.xml",
                        "../../../examples/sample-models/from-spec/level-2/multicomp.xml",
                        "../../../examples/sample-models/from-spec/level-2/overdetermined.xml",
                        "../../../examples/sample-models/from-spec/level-2/twodimensional.xml",
                        "../../../examples/sample-models/from-spec/level-2/units.xml"
    ]
    gzfile = "test.xml.gz"
    file.each do |f|
      d = LibSBML::readSBML(f)
      assert( d != nil )
      if not LibSBML::SBMLWriter::hasZlib()
        assert( LibSBML::writeSBML(d,gzfile) == 0 )
        d = nil
        next
      end
      result = LibSBML::writeSBML(d,gzfile)
      assert_equal 1, result
      dg = LibSBML::readSBML(gzfile)
      assert( dg != nil )
      assert( ( dg.toSBML() != d.toSBML() ) == false )
      d = nil
      dg = nil
    end 
  end


  def test_WriteSBML_locale
    expected =  "<parameter id=\"p\" value=\"3.31\"/>";
    p = @@d.createModel().createParameter()
    p.setId("p")
    p.setValue(3.31)
    assert_equal true, equals(expected,p.toSBML())
  end

  def test_WriteSBML_zip
    file = [
                        "../../../examples/sample-models/from-spec/level-2/algebraicrules.xml",
                        "../../../examples/sample-models/from-spec/level-2/assignmentrules.xml",
                        "../../../examples/sample-models/from-spec/level-2/boundarycondition.xml",
                        "../../../examples/sample-models/from-spec/level-2/delay.xml",
                        "../../../examples/sample-models/from-spec/level-2/dimerization.xml",
                        "../../../examples/sample-models/from-spec/level-2/enzymekinetics.xml",
                        "../../../examples/sample-models/from-spec/level-2/events.xml",
                        "../../../examples/sample-models/from-spec/level-2/functiondef.xml",
                        "../../../examples/sample-models/from-spec/level-2/multicomp.xml",
                        "../../../examples/sample-models/from-spec/level-2/overdetermined.xml",
                        "../../../examples/sample-models/from-spec/level-2/twodimensional.xml",
                        "../../../examples/sample-models/from-spec/level-2/units.xml"
    ]
    zipfile = "test.xml.zip"
    file.each do |f|
      d = LibSBML::readSBML(f)
      assert( d != nil )
      if not LibSBML::SBMLWriter::hasZlib()
        assert( LibSBML::writeSBML(d,zipfile) == 0 )
        d = nil
        next
      end
      result = LibSBML::writeSBML(d,zipfile)
      assert_equal 1, result
      dg = LibSBML::readSBML(zipfile)
      assert( dg != nil )
      assert( ( dg.toSBML() != d.toSBML() ) == false )
      d = nil
      dg = nil
    end 
  end


end
