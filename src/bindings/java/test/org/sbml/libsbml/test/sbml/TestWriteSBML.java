/*
 *
 * @file    TestWriteSBML.java
 * @brief   Write SBML unit tests
 *
 * @author  Akiya Jouraku (Java conversion)
 * @author  Ben Bornstein 
 *
 * $Id$
 * $HeadURL$
 *
 * This test file was converted from src/sbml/test/TestWriteSBML.cpp
 * with the help of conversion sciprt (ctest_converter.pl).
 *
 *<!---------------------------------------------------------------------------
 * This file is part of libSBML.  Please visit http://sbml.org for more
 * information about SBML, and the latest version of libSBML.
 *
 * Copyright 2005-2009 California Institute of Technology.
 * Copyright 2002-2005 California Institute of Technology and
 *                     Japan Science and Technology Corporation.
 * 
 * This library is free software; you can redistribute it and/or modify it
 * under the terms of the GNU Lesser General Public License as published by
 * the Free Software Foundation.  A copy of the license agreement is provided
 * in the file named "LICENSE.txt" included with this software distribution
 * and also available online as http://sbml.org/software/libsbml/license.html
 *--------------------------------------------------------------------------->*/


package org.sbml.libsbml.test.sbml;

import org.sbml.libsbml.*;

import java.io.File;
import java.lang.AssertionError;

public class TestWriteSBML {

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
    else if ( (a == null) || (b == null) )
    {
      throw new AssertionError();
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
    else if ( (a == null) || (b == null) )
    {
      return;
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
  private SBMLDocument D;
  private String S;

  public String LV_L1v1()
  {
    return "level=\"1\" version=\"1\">\n";
  }

  public String LV_L1v2()
  {
    return "level=\"1\" version=\"2\">\n";
  }

  public String LV_L2v1()
  {
    return "level=\"2\" version=\"1\">\n";
  }

  public String LV_L2v2()
  {
    return "level=\"2\" version=\"2\">\n";
  }

  public String LV_L2v3()
  {
    return "level=\"2\" version=\"3\">\n";
  }

  public String NS_L1()
  {
    return "xmlns=\"http://www.sbml.org/sbml/level1\" ";
  }

  public String NS_L2v1()
  {
    return "xmlns=\"http://www.sbml.org/sbml/level2\" ";
  }

  public String NS_L2v2()
  {
    return "xmlns=\"http://www.sbml.org/sbml/level2/version2\" ";
  }

  public String NS_L2v3()
  {
    return "xmlns=\"http://www.sbml.org/sbml/level2/version3\" ";
  }

  public String SBML_END()
  {
    return "</sbml>\n";
  }

  public String SBML_START()
  {
    return "<sbml ";
  }

  public String XML_START()
  {
    return "<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n";
  }

  public String wrapSBML_L1v1(String s)
  {
    String r = XML_START();
    r += SBML_START();
    r += NS_L1();
    r += LV_L1v1();
    r += s;
    r += SBML_END();
    return r;
  }

  public String wrapSBML_L1v2(String s)
  {
    String r = XML_START();
    r += SBML_START();
    r += NS_L1();
    r += LV_L1v2();
    r += s;
    r += SBML_END();
    return r;
  }

  public String wrapSBML_L2v1(String s)
  {
    String r = XML_START();
    r += SBML_START();
    r += NS_L2v1();
    r += LV_L2v1();
    r += s;
    r += SBML_END();
    return r;
  }

  public String wrapSBML_L2v2(String s)
  {
    String r = XML_START();
    r += SBML_START();
    r += NS_L2v2();
    r += LV_L2v2();
    r += s;
    r += SBML_END();
    return r;
  }

  public String wrapSBML_L2v3(String s)
  {
    String r = XML_START();
    r += SBML_START();
    r += NS_L2v3();
    r += LV_L2v3();
    r += s;
    r += SBML_END();
    return r;
  }

  public String wrapXML(String s)
  {
    String r = XML_START();
    r += s;
    return r;
  }


  public double util_NaN()
  {
    double z = 0.0;
    return 0.0/z;
  }

  public double util_PosInf()
  {
    double z = 0.0;
    return 1.0/z;
  }

  public double util_NegInf()
  {
    double z = 0.0;
    return -1.0/z;
  }

//  public boolean equals(String s)
//  {
//    return s.equals(OSS.str());
//  }

  public boolean equals(String s1, String s2)
  {
    return s1.equals(s2);
  }

  protected void setUp() throws Exception
  {
    D = new SBMLDocument();
    S = null;
  }

  protected void tearDown() throws Exception
  {
    S = null;
  }

  public void test_SBMLWriter_create()
  {
    SBMLWriter w = new  SBMLWriter();
    assertTrue( w != null );
    w = null;
  }

  public void test_SBMLWriter_setProgramName()
  {
    SBMLWriter w = new  SBMLWriter();
    assertTrue( w != null );
    long i = w.setProgramName( "sss");
    assertTrue( i == libsbml.LIBSBML_OPERATION_SUCCESS );
    i = w.setProgramName("");
    assertTrue( i == libsbml.LIBSBML_OPERATION_SUCCESS );
    w = null;
  }

  public void test_SBMLWriter_setProgramVersion()
  {
    SBMLWriter w = new  SBMLWriter();
    assertTrue( w != null );
    long i = w.setProgramVersion( "sss");
    assertTrue( i == libsbml.LIBSBML_OPERATION_SUCCESS );
    i = w.setProgramVersion("");
    assertTrue( i == libsbml.LIBSBML_OPERATION_SUCCESS );
    w = null;
  }

  public void test_WriteSBML_AlgebraicRule()
  {
    D.setLevelAndVersion(1,1);
    String expected =  "<algebraicRule formula=\"x + 1\"/>";;
    AlgebraicRule r = D.createModel().createAlgebraicRule();
    r.setFormula("x + 1");
    assertEquals( true, equals(expected,r.toSBML()) );
  }

  public void test_WriteSBML_AlgebraicRule_L2v1()
  {
    D.setLevelAndVersion(2,1);
    String expected = "<algebraicRule>\n" + 
    "  <math xmlns=\"http://www.w3.org/1998/Math/MathML\">\n" + 
    "    <apply>\n" + 
    "      <plus/>\n" + 
    "      <ci> x </ci>\n" + 
    "      <cn type=\"integer\"> 1 </cn>\n" + 
    "    </apply>\n" + 
    "  </math>\n" + 
    "</algebraicRule>";
    AlgebraicRule r = D.createModel().createAlgebraicRule();
    r.setFormula("x + 1");
    assertEquals( true, equals(expected,r.toSBML()) );
  }

  public void test_WriteSBML_AlgebraicRule_L2v2()
  {
    D.setLevelAndVersion(2,2);
    String expected = "<algebraicRule sboTerm=\"SBO:0000004\">\n" + 
    "  <math xmlns=\"http://www.w3.org/1998/Math/MathML\">\n" + 
    "    <apply>\n" + 
    "      <plus/>\n" + 
    "      <ci> x </ci>\n" + 
    "      <cn type=\"integer\"> 1 </cn>\n" + 
    "    </apply>\n" + 
    "  </math>\n" + 
    "</algebraicRule>";
    AlgebraicRule r = D.createModel().createAlgebraicRule();
    r.setFormula("x + 1");
    r.setSBOTerm(4);
    assertEquals( true, equals(expected,r.toSBML()) );
  }

  public void test_WriteSBML_Compartment()
  {
    D.setLevelAndVersion(1,2);
    String expected =  "<compartment name=\"A\" volume=\"2.1\" outside=\"B\"/>";;
    Compartment c = D.createModel().createCompartment();
    c.setId("A");
    c.setSize(2.1);
    c.setOutside("B");
    assertEquals( true, equals(expected,c.toSBML()) );
  }

  public void test_WriteSBML_CompartmentType()
  {
    D.setLevelAndVersion(2,2);
    String expected =  "<compartmentType id=\"ct\"/>";;
    CompartmentType ct = D.createModel().createCompartmentType();
    ct.setId("ct");
    ct.setSBOTerm(4);
    assertEquals( true, equals(expected,ct.toSBML()) );
  }

  public void test_WriteSBML_CompartmentType_withSBO()
  {
    D.setLevelAndVersion(2,3);
    String expected =  "<compartmentType id=\"ct\" sboTerm=\"SBO:0000004\"/>";;
    CompartmentType ct = D.createModel().createCompartmentType();
    ct.setId("ct");
    ct.setSBOTerm(4);
    assertEquals( true, equals(expected,ct.toSBML()) );
  }

  public void test_WriteSBML_CompartmentVolumeRule()
  {
    D.setLevelAndVersion(1,1);
    String expected = "<compartmentVolumeRule " + "formula=\"v + c\" type=\"rate\" compartment=\"c\"/>";;
    D.createModel();
    D.getModel().createCompartment().setId("c");
    Rule r = D.getModel().createRateRule();
    r.setVariable("c");
    r.setFormula("v + c");
    assertEquals( true, equals(expected,r.toSBML()) );
  }

  public void test_WriteSBML_CompartmentVolumeRule_L2v1()
  {
    D.setLevelAndVersion(2,1);
    String expected = "<assignmentRule variable=\"c\">\n" + 
    "  <math xmlns=\"http://www.w3.org/1998/Math/MathML\">\n" + 
    "    <apply>\n" + 
    "      <plus/>\n" + 
    "      <ci> v </ci>\n" + 
    "      <ci> c </ci>\n" + 
    "    </apply>\n" + 
    "  </math>\n" + 
    "</assignmentRule>";
    D.createModel();
    D.getModel().createCompartment().setId("c");
    Rule r = D.getModel().createAssignmentRule();
    r.setVariable("c");
    r.setFormula("v + c");
    assertEquals( true, equals(expected,r.toSBML()) );
  }

  public void test_WriteSBML_CompartmentVolumeRule_L2v2()
  {
    D.setLevelAndVersion(2,2);
    String expected = "<assignmentRule variable=\"c\" sboTerm=\"SBO:0000005\">\n" + 
    "  <math xmlns=\"http://www.w3.org/1998/Math/MathML\">\n" + 
    "    <apply>\n" + 
    "      <plus/>\n" + 
    "      <ci> v </ci>\n" + 
    "      <ci> c </ci>\n" + 
    "    </apply>\n" + 
    "  </math>\n" + 
    "</assignmentRule>";
    D.createModel();
    D.getModel().createCompartment().setId("c");
    Rule r = D.getModel().createAssignmentRule();
    r.setVariable("c");
    r.setFormula("v + c");
    r.setSBOTerm(5);
    assertEquals( true, equals(expected,r.toSBML()) );
  }

  public void test_WriteSBML_CompartmentVolumeRule_defaults()
  {
    D.setLevelAndVersion(1,1);
    String expected =  "<compartmentVolumeRule formula=\"v + c\" compartment=\"c\"/>";;
    D.createModel();
    D.getModel().createCompartment().setId("c");
    Rule r = D.getModel().createAssignmentRule();
    r.setVariable("c");
    r.setFormula("v + c");
    assertEquals( true, equals(expected,r.toSBML()) );
  }

  public void test_WriteSBML_Compartment_L2v1()
  {
    D.setLevelAndVersion(2,1);
    String expected =  "<compartment id=\"M\" spatialDimensions=\"2\" size=\"2.5\"/>";;
    Compartment c = D.createModel().createCompartment();
    c.setId("M");
    c.setSize(2.5);
    c.setSpatialDimensions(2);
    assertEquals( true, equals(expected,c.toSBML()) );
  }

  public void test_WriteSBML_Compartment_L2v1_constant()
  {
    D.setLevelAndVersion(2,1);
    String expected =  "<compartment id=\"cell\" size=\"1.2\" constant=\"false\"/>";;
    Compartment c = D.createModel().createCompartment();
    c.setId("cell");
    c.setSize(1.2);
    c.setConstant(false);
    assertEquals( true, equals(expected,c.toSBML()) );
  }

  public void test_WriteSBML_Compartment_L2v1_unsetSize()
  {
    D.setLevelAndVersion(2,1);
    String expected =  "<compartment id=\"A\"/>";;
    Compartment c = D.createModel().createCompartment();
    c.setId("A");
    c.unsetSize();
    assertEquals( true, equals(expected,c.toSBML()) );
  }

  public void test_WriteSBML_Compartment_L2v2_compartmentType()
  {
    D.setLevelAndVersion(2,2);
    String expected =  "<compartment id=\"cell\" compartmentType=\"ct\"/>";;
    Compartment c = D.createModel().createCompartment();
    c.setId("cell");
    c.setCompartmentType("ct");
    assertEquals( true, equals(expected,c.toSBML()) );
  }

  public void test_WriteSBML_Compartment_L2v3_SBO()
  {
    D.setLevelAndVersion(2,3);
    String expected =  "<compartment id=\"cell\" sboTerm=\"SBO:0000005\"/>";;
    Compartment c = D.createModel().createCompartment();
    c.setId("cell");
    c.setSBOTerm(5);
    assertEquals( true, equals(expected,c.toSBML()) );
  }

  public void test_WriteSBML_Compartment_unsetVolume()
  {
    D.setLevelAndVersion(1,2);
    String expected =  "<compartment name=\"A\"/>";;
    Compartment c = D.createModel().createCompartment();
    c.setId("A");
    c.unsetVolume();
    assertEquals( true, equals(expected,c.toSBML()) );
  }

  public void test_WriteSBML_Constraint()
  {
    D.setLevelAndVersion(2,2);
    String expected =  "<constraint sboTerm=\"SBO:0000064\"/>";;
    Constraint ct = D.createModel().createConstraint();
    ct.setSBOTerm(64);
    assertEquals( true, equals(expected,ct.toSBML()) );
  }

  public void test_WriteSBML_Constraint_full()
  {
    D.setLevelAndVersion(2,2);
    String expected = "<constraint sboTerm=\"SBO:0000064\">\n" + 
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
    "</constraint>";
    Constraint c = D.createModel().createConstraint();
    ASTNode node = libsbml.parseFormula("leq(P1,t)");
    c.setMath(node);
    c.setSBOTerm(64);
    XMLNode text = XMLNode.convertStringToXMLNode(" Species P1 is out of range ");
    XMLTriple triple = new XMLTriple("p", "http://www.w3.org/1999/xhtml", "");
    XMLAttributes att = new XMLAttributes();
    XMLNamespaces xmlns = new XMLNamespaces();
    xmlns.add("http://www.w3.org/1999/xhtml");
    XMLNode p = new XMLNode(triple,att,xmlns);
    p.addChild(text);
    XMLTriple triple1 = new XMLTriple("message", "", "");
    XMLAttributes att1 = new XMLAttributes();
    XMLNode message = new XMLNode(triple1,att1);
    message.addChild(p);
    c.setMessage(message);
    assertEquals( true, equals(expected,c.toSBML()) );
  }

  public void test_WriteSBML_Constraint_math()
  {
    D.setLevelAndVersion(2,2);
    String expected = "<constraint>\n" + 
    "  <math xmlns=\"http://www.w3.org/1998/Math/MathML\">\n" + 
    "    <apply>\n" + 
    "      <leq/>\n" + 
    "      <ci> P1 </ci>\n" + 
    "      <ci> t </ci>\n" + 
    "    </apply>\n" + 
    "  </math>\n" + 
    "</constraint>";
    Constraint c = D.createModel().createConstraint();
    ASTNode node = libsbml.parseFormula("leq(P1,t)");
    c.setMath(node);
    assertEquals( true, equals(expected,c.toSBML()) );
  }

  public void test_WriteSBML_Event()
  {
    D.setLevelAndVersion(2,1);
    String expected =  "<event id=\"e\"/>";;
    Event e = D.createModel().createEvent();
    e.setId("e");
    assertEquals( true, equals(expected,e.toSBML()) );
  }

  public void test_WriteSBML_Event_WithSBO()
  {
    D.setLevelAndVersion(2,3);
    String expected =  "<event id=\"e\" sboTerm=\"SBO:0000076\"/>";;
    Event e = D.createModel().createEvent();
    e.setId("e");
    e.setSBOTerm(76);
    assertEquals( true, equals(expected,e.toSBML()) );
  }

  public void test_WriteSBML_Event_WithUseValuesFromTriggerTime()
  {
    String expected =  "<event id=\"e\" useValuesFromTriggerTime=\"false\"/>";;
    D.setLevelAndVersion(2,4);
    Event e = D.createModel().createEvent();
    e.setId("e");
    e.setUseValuesFromTriggerTime(false);
    assertEquals( true, equals(expected,e.toSBML()) );
  }

  public void test_WriteSBML_Event_both()
  {
    String expected = "<event id=\"e\">\n" + 
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
    "</event>";
    D.setLevelAndVersion(2,1);
    Event e = D.createModel().createEvent();
    e.setId("e");
    ASTNode node1 = libsbml.parseFormula("leq(P1,t)");
    Trigger t = new Trigger ( 2,1 );
    t.setMath(node1);
    ASTNode node = libsbml.parseFormula("5");
    Delay d = new Delay ( 2,1 );
    d.setMath(node);
    e.setDelay(d);
    e.setTrigger(t);
    assertEquals( true, equals(expected,e.toSBML()) );
  }

  public void test_WriteSBML_Event_delay()
  {
    String expected = "<event id=\"e\">\n" + 
    "  <delay>\n" + 
    "    <math xmlns=\"http://www.w3.org/1998/Math/MathML\">\n" + 
    "      <cn type=\"integer\"> 5 </cn>\n" + 
    "    </math>\n" + 
    "  </delay>\n" + 
    "</event>";
    D.setLevelAndVersion(2,1);
    Event e = D.createModel().createEvent();
    e.setId("e");
    ASTNode node = libsbml.parseFormula("5");
    Delay d = new Delay ( 2,1 );
    d.setMath(node);
    e.setDelay(d);
    assertEquals( true, equals(expected,e.toSBML()) );
  }

  public void test_WriteSBML_Event_delayWithSBO()
  {
    String expected = "<event id=\"e\">\n" + 
    "  <delay sboTerm=\"SBO:0000064\">\n" + 
    "    <math xmlns=\"http://www.w3.org/1998/Math/MathML\">\n" + 
    "      <cn type=\"integer\"> 5 </cn>\n" + 
    "    </math>\n" + 
    "  </delay>\n" + 
    "</event>";
    D.setLevelAndVersion(2,3);
    Event e = D.createModel().createEvent();
    e.setId("e");
    ASTNode node = libsbml.parseFormula("5");
    Delay d = new Delay ( 2,3 );
    d.setMath(node);
    d.setSBOTerm(64);
    e.setDelay(d);
    assertEquals( true, equals(expected,e.toSBML()) );
  }

  public void test_WriteSBML_Event_full()
  {
    String expected = "<event id=\"e\">\n" + 
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
    "</event>";
    D.setLevelAndVersion(2,3);
    Event e = D.createModel().createEvent();
    e.setId("e");
    ASTNode node = libsbml.parseFormula("leq(P1,t)");
    Trigger t = new Trigger ( 2,3 );
    t.setMath(node);
    ASTNode math = libsbml.parseFormula("0");
    EventAssignment ea = new EventAssignment ( 2,3 );
    ea.setVariable("k2");
    ea.setMath(math);
    ea.setSBOTerm(64);
    e.setTrigger(t);
    e.addEventAssignment(ea);
    assertEquals( true, equals(expected,e.toSBML()) );
  }

  public void test_WriteSBML_Event_trigger()
  {
    String expected = "<event id=\"e\">\n" + 
    "  <trigger>\n" + 
    "    <math xmlns=\"http://www.w3.org/1998/Math/MathML\">\n" + 
    "      <apply>\n" + 
    "        <leq/>\n" + 
    "        <ci> P1 </ci>\n" + 
    "        <ci> t </ci>\n" + 
    "      </apply>\n" + 
    "    </math>\n" + 
    "  </trigger>\n" + 
    "</event>";
    D.setLevelAndVersion(2,1);
    Event e = D.createModel().createEvent();
    e.setId("e");
    ASTNode node = libsbml.parseFormula("leq(P1,t)");
    Trigger t = new Trigger ( 2,1 );
    t.setMath(node);
    e.setTrigger(t);
    assertEquals( true, equals(expected,e.toSBML()) );
  }

  public void test_WriteSBML_Event_trigger_withSBO()
  {
    String expected = "<event id=\"e\">\n" + 
    "  <trigger sboTerm=\"SBO:0000064\">\n" + 
    "    <math xmlns=\"http://www.w3.org/1998/Math/MathML\">\n" + 
    "      <apply>\n" + 
    "        <leq/>\n" + 
    "        <ci> P1 </ci>\n" + 
    "        <ci> t </ci>\n" + 
    "      </apply>\n" + 
    "    </math>\n" + 
    "  </trigger>\n" + 
    "</event>";
    D.setLevelAndVersion(2,3);
    Event e = D.createModel().createEvent();
    e.setId("e");
    ASTNode node = libsbml.parseFormula("leq(P1,t)");
    Trigger t = new Trigger ( 2,3 );
    t.setMath(node);
    t.setSBOTerm(64);
    e.setTrigger(t);
    assertEquals( true, equals(expected,e.toSBML()) );
  }

  public void test_WriteSBML_FunctionDefinition()
  {
    String expected = "<functionDefinition id=\"pow3\">\n" + 
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
    "</functionDefinition>";
    FunctionDefinition fd = new FunctionDefinition ( 2,4 );
    fd.setId("pow3");
    fd.setMath(libsbml.parseFormula("lambda(x, x^3)"));
    assertEquals( true, equals(expected,fd.toSBML()) );
  }

  public void test_WriteSBML_FunctionDefinition_withSBO()
  {
    String expected = "<functionDefinition id=\"pow3\" sboTerm=\"SBO:0000064\">\n" + 
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
    "</functionDefinition>";
    FunctionDefinition fd = new FunctionDefinition ( 2,4 );
    fd.setId("pow3");
    fd.setMath(libsbml.parseFormula("lambda(x, x^3)"));
    fd.setSBOTerm(64);
    assertEquals( true, equals(expected,fd.toSBML()) );
  }

  public void test_WriteSBML_INF()
  {
    String expected =  "<parameter id=\"p\" value=\"INF\"/>";;
    Parameter p = D.createModel().createParameter();
    p.setId("p");
    p.setValue(util_PosInf());
    assertEquals( true, equals(expected,p.toSBML()) );
  }

  public void test_WriteSBML_InitialAssignment()
  {
    D.setLevelAndVersion(2,2);
    String expected =  "<initialAssignment symbol=\"c\" sboTerm=\"SBO:0000064\"/>";;
    InitialAssignment ia = D.createModel().createInitialAssignment();
    ia.setSBOTerm(64);
    ia.setSymbol("c");
    assertEquals( true, equals(expected,ia.toSBML()) );
  }

  public void test_WriteSBML_InitialAssignment_math()
  {
    String expected = "<initialAssignment symbol=\"c\">\n" + 
    "  <math xmlns=\"http://www.w3.org/1998/Math/MathML\">\n" + 
    "    <apply>\n" + 
    "      <plus/>\n" + 
    "      <ci> a </ci>\n" + 
    "      <ci> b </ci>\n" + 
    "    </apply>\n" + 
    "  </math>\n" + 
    "</initialAssignment>";
    InitialAssignment ia = D.createModel().createInitialAssignment();
    ASTNode node = libsbml.parseFormula("a + b");
    ia.setMath(node);
    ia.setSymbol("c");
    assertEquals( true, equals(expected,ia.toSBML()) );
  }

  public void test_WriteSBML_KineticLaw()
  {
    D.setLevelAndVersion(1,2);
    String expected = "<kineticLaw formula=\"k * e\" timeUnits=\"second\" " + "substanceUnits=\"item\"/>";;
    KineticLaw kl = D.createModel().createReaction().createKineticLaw();
    kl.setFormula("k * e");
    kl.setTimeUnits("second");
    kl.setSubstanceUnits("item");
    assertEquals( true, equals(expected,kl.toSBML()) );
  }

  public void test_WriteSBML_KineticLaw_ListOfParameters()
  {
    D.setLevelAndVersion(1,2);
    String expected = "<kineticLaw formula=\"nk * e\" timeUnits=\"second\" " + 
    "substanceUnits=\"item\">\n" + 
    "  <listOfParameters>\n" + 
    "    <parameter name=\"n\" value=\"1.2\"/>\n" + 
    "  </listOfParameters>\n" + 
    "</kineticLaw>";
    KineticLaw kl = D.createModel().createReaction().createKineticLaw();
    kl.setFormula("nk * e");
    kl.setTimeUnits("second");
    kl.setSubstanceUnits("item");
    Parameter p = kl.createParameter();
    p.setName("n");
    p.setValue(1.2);
    assertEquals( true, equals(expected,kl.toSBML()) );
  }

  public void test_WriteSBML_KineticLaw_l2v1()
  {
    D.setLevelAndVersion(2,1);
    String expected = "<kineticLaw timeUnits=\"second\" substanceUnits=\"item\">\n" + 
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
    "</kineticLaw>";
    KineticLaw kl = D.createModel().createReaction().createKineticLaw();
    kl.setTimeUnits("second");
    kl.setSubstanceUnits("item");
    kl.setFormula("(vm * s1)/(km + s1)");
    assertEquals( true, equals(expected,kl.toSBML()) );
  }

  public void test_WriteSBML_KineticLaw_skipOptional()
  {
    D.setLevelAndVersion(1,2);
    String expected =  "<kineticLaw formula=\"k * e\"/>";;
    KineticLaw kl = D.createModel().createReaction().createKineticLaw();
    kl.setFormula("k * e");
    assertEquals( true, equals(expected,kl.toSBML()) );
  }

  public void test_WriteSBML_KineticLaw_withSBO()
  {
    D.setLevelAndVersion(2,2);
    String expected = "<kineticLaw sboTerm=\"SBO:0000001\">\n" + 
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
    "</kineticLaw>";
    KineticLaw kl = D.createModel().createReaction().createKineticLaw();
    kl.setFormula("(vm * s1)/(km + s1)");
    kl.setSBOTerm(1);
    assertEquals( true, equals(expected,kl.toSBML()) );
  }

  public void test_WriteSBML_Model()
  {
    D.setLevelAndVersion(1,1);
    String expected = wrapSBML_L1v1("  <model name=\"Branch\"/>\n");
    D.createModel("Branch");
    S = libsbml.writeSBMLToString(D);
    assertEquals( true, equals(expected,S) );
  }

  public void test_WriteSBML_Model_L2v1()
  {
    D.setLevelAndVersion(2,1);
    String expected = wrapSBML_L2v1("  <model id=\"Branch\"/>\n");
    D.createModel("Branch");
    S = libsbml.writeSBMLToString(D);
    assertEquals( true, equals(expected,S) );
  }

  public void test_WriteSBML_Model_L2v1_skipOptional()
  {
    D.setLevelAndVersion(2,1);
    String expected = wrapSBML_L2v1("  <model/>\n");
    D.createModel();
    S = libsbml.writeSBMLToString(D);
    assertEquals( true, equals(expected,S) );
  }

  public void test_WriteSBML_Model_L2v2()
  {
    D.setLevelAndVersion(2,2);
    String expected = wrapSBML_L2v2("  <model id=\"Branch\" sboTerm=\"SBO:0000004\"/>\n");
    Model m = D.createModel("Branch");
    m.setSBOTerm(4);
    S = libsbml.writeSBMLToString(D);
    assertEquals( true, equals(expected,S) );
  }

  public void test_WriteSBML_Model_skipOptional()
  {
    D.setLevelAndVersion(1,2);
    String expected = wrapSBML_L1v2("  <model/>\n");
    D.createModel();
    S = libsbml.writeSBMLToString(D);
    assertEquals( true, equals(expected,S) );
  }

  public void test_WriteSBML_NaN()
  {
    String expected =  "<parameter id=\"p\" value=\"NaN\"/>";;
    Parameter p = D.createModel().createParameter();
    p.setId("p");
    p.setValue(util_NaN());
    assertEquals( true, equals(expected,p.toSBML()) );
  }

  public void test_WriteSBML_NegINF()
  {
    String expected =  "<parameter id=\"p\" value=\"-INF\"/>";;
    Parameter p = D.createModel().createParameter();
    p.setId("p");
    p.setValue(util_NegInf());
    assertEquals( true, equals(expected,p.toSBML()) );
  }

  public void test_WriteSBML_Parameter()
  {
    D.setLevelAndVersion(1,2);
    String expected =  "<parameter name=\"Km1\" value=\"2.3\" units=\"second\"/>";;
    Parameter p = D.createModel().createParameter();
    p.setId("Km1");
    p.setValue(2.3);
    p.setUnits("second");
    assertEquals( true, equals(expected,p.toSBML()) );
  }

  public void test_WriteSBML_ParameterRule()
  {
    D.setLevelAndVersion(1,1);
    String expected = "<parameterRule " + "formula=\"p * t\" type=\"rate\" name=\"p\"/>";;
    D.createModel();
    D.getModel().createParameter().setId("p");
    Rule r = D.getModel().createRateRule();
    r.setVariable("p");
    r.setFormula("p * t");
    assertEquals( true, equals(expected,r.toSBML()) );
  }

  public void test_WriteSBML_ParameterRule_L2v1()
  {
    D.setLevelAndVersion(2,1);
    String expected = "<rateRule variable=\"p\">\n" + 
    "  <math xmlns=\"http://www.w3.org/1998/Math/MathML\">\n" + 
    "    <apply>\n" + 
    "      <times/>\n" + 
    "      <ci> p </ci>\n" + 
    "      <ci> t </ci>\n" + 
    "    </apply>\n" + 
    "  </math>\n" + 
    "</rateRule>";
    D.createModel();
    D.getModel().createParameter().setId("p");
    Rule r = D.getModel().createRateRule();
    r.setVariable("p");
    r.setFormula("p * t");
    assertEquals( true, equals(expected,r.toSBML()) );
  }

  public void test_WriteSBML_ParameterRule_L2v2()
  {
    D.setLevelAndVersion(2,2);
    String expected = "<rateRule variable=\"p\" sboTerm=\"SBO:0000007\">\n" + 
    "  <math xmlns=\"http://www.w3.org/1998/Math/MathML\">\n" + 
    "    <apply>\n" + 
    "      <times/>\n" + 
    "      <ci> p </ci>\n" + 
    "      <ci> t </ci>\n" + 
    "    </apply>\n" + 
    "  </math>\n" + 
    "</rateRule>";
    D.createModel();
    D.getModel().createParameter().setId("p");
    Rule r = D.getModel().createRateRule();
    r.setVariable("p");
    r.setFormula("p * t");
    r.setSBOTerm(7);
    assertEquals( true, equals(expected,r.toSBML()) );
  }

  public void test_WriteSBML_ParameterRule_defaults()
  {
    D.setLevelAndVersion(1,1);
    String expected =  "<parameterRule formula=\"p * t\" name=\"p\"/>";;
    D.createModel();
    D.getModel().createParameter().setId("p");
    Rule r = D.getModel().createAssignmentRule();
    r.setVariable("p");
    r.setFormula("p * t");
    assertEquals( true, equals(expected,r.toSBML()) );
  }

  public void test_WriteSBML_Parameter_L1v1_required()
  {
    D.setLevelAndVersion(1,1);
    String expected =  "<parameter name=\"Km1\" value=\"NaN\"/>";;
    Parameter p = D.createModel().createParameter();
    p.setId("Km1");
    p.unsetValue();
    assertEquals( true, equals(expected,p.toSBML()) );
  }

  public void test_WriteSBML_Parameter_L1v2_skipOptional()
  {
    D.setLevelAndVersion(1,2);
    String expected =  "<parameter name=\"Km1\"/>";;
    Parameter p = D.createModel().createParameter();
    p.setId("Km1");
    p.unsetValue();
    assertEquals( true, equals(expected,p.toSBML()) );
  }

  public void test_WriteSBML_Parameter_L2v1()
  {
    D.setLevelAndVersion(2,1);
    String expected =  "<parameter id=\"Km1\" value=\"2.3\" units=\"second\"/>";;
    Parameter p = D.createModel().createParameter();
    p.setId("Km1");
    p.setValue(2.3);
    p.setUnits("second");
    assertEquals( true, equals(expected,p.toSBML()) );
  }

  public void test_WriteSBML_Parameter_L2v1_constant()
  {
    D.setLevelAndVersion(2,1);
    String expected =  "<parameter id=\"x\" constant=\"false\"/>";;
    Parameter p = D.createModel().createParameter();
    p.setId("x");
    p.setConstant(false);
    assertEquals( true, equals(expected,p.toSBML()) );
  }

  public void test_WriteSBML_Parameter_L2v1_skipOptional()
  {
    D.setLevelAndVersion(2,1);
    String expected =  "<parameter id=\"Km1\"/>";;
    Parameter p = D.createModel().createParameter();
    p.setId("Km1");
    assertEquals( true, equals(expected,p.toSBML()) );
  }

  public void test_WriteSBML_Parameter_L2v2()
  {
    D.setLevelAndVersion(2,2);
    String expected =  "<parameter id=\"Km1\" value=\"2.3\" units=\"second\" sboTerm=\"SBO:0000002\"/>";;
    Parameter p = D.createModel().createParameter();
    p.setId("Km1");
    p.setValue(2.3);
    p.setUnits("second");
    p.setSBOTerm(2);
    assertEquals( true, equals(expected,p.toSBML()) );
  }

  public void test_WriteSBML_Reaction()
  {
    D.setLevelAndVersion(1,2);
    String expected =  "<reaction name=\"r\" reversible=\"false\" fast=\"true\"/>";;
    Reaction r = D.createModel().createReaction();
    r.setId("r");
    r.setReversible(false);
    r.setFast(true);
    assertEquals( true, equals(expected,r.toSBML()) );
  }

  public void test_WriteSBML_Reaction_L2v1()
  {
    D.setLevelAndVersion(2,1);
    String expected =  "<reaction id=\"r\" reversible=\"false\"/>";;
    Reaction r = D.createModel().createReaction();
    r.setId("r");
    r.setReversible(false);
    assertEquals( true, equals(expected,r.toSBML()) );
  }

  public void test_WriteSBML_Reaction_L2v1_full()
  {
    D.setLevelAndVersion(2,1);
    String expected = "<reaction id=\"v1\">\n" + 
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
    "</reaction>";
    D.createModel();
    Reaction r = D.getModel().createReaction();
    r.setId("v1");
    r.setReversible(true);
    r.createReactant().setSpecies("x0");
    r.createProduct().setSpecies("s1");
    r.createModifier().setSpecies("m1");
    r.createKineticLaw().setFormula("(vm * s1)/(km + s1)");
    assertEquals( true, equals(expected,r.toSBML()) );
  }

  public void test_WriteSBML_Reaction_L2v2()
  {
    D.setLevelAndVersion(2,2);
    String expected =  "<reaction id=\"r\" name=\"r1\" reversible=\"false\" fast=\"true\" sboTerm=\"SBO:0000064\"/>";;
    Reaction r = D.createModel().createReaction();
    r.setId("r");
    r.setName("r1");
    r.setReversible(false);
    r.setFast(true);
    r.setSBOTerm(64);
    assertEquals( true, equals(expected,r.toSBML()) );
  }

  public void test_WriteSBML_Reaction_defaults()
  {
    D.setLevelAndVersion(1,2);
    String expected =  "<reaction name=\"r\"/>";;
    Reaction r = D.createModel().createReaction();
    r.setId("r");
    assertEquals( true, equals(expected,r.toSBML()) );
  }

  public void test_WriteSBML_Reaction_full()
  {
    D.setLevelAndVersion(1,2);
    String expected = "<reaction name=\"v1\">\n" + 
    "  <listOfReactants>\n" + 
    "    <speciesReference species=\"x0\"/>\n" + 
    "  </listOfReactants>\n" + 
    "  <listOfProducts>\n" + 
    "    <speciesReference species=\"s1\"/>\n" + 
    "  </listOfProducts>\n" + 
    "  <kineticLaw formula=\"(vm * s1)/(km + s1)\"/>\n" + 
    "</reaction>";
    D.createModel();
    Reaction r = D.getModel().createReaction();
    r.setId("v1");
    r.setReversible(true);
    r.createReactant().setSpecies("x0");
    r.createProduct().setSpecies("s1");
    r.createKineticLaw().setFormula("(vm * s1)/(km + s1)");
    assertEquals( true, equals(expected,r.toSBML()) );
  }

  public void test_WriteSBML_SBMLDocument_L1v1()
  {
    D.setLevelAndVersion(1,1);
    String expected = wrapXML("<sbml xmlns=\"http://www.sbml.org/sbml/level1\" " + "level=\"1\" version=\"1\"/>\n");
    S = libsbml.writeSBMLToString(D);
    assertEquals( true, equals(expected,S) );
  }

  public void test_WriteSBML_SBMLDocument_L1v2()
  {
    D.setLevelAndVersion(1,2);
    String expected = wrapXML("<sbml xmlns=\"http://www.sbml.org/sbml/level1\" " + "level=\"1\" version=\"2\"/>\n");
    S = libsbml.writeSBMLToString(D);
    assertEquals( true, equals(expected,S) );
  }

  public void test_WriteSBML_SBMLDocument_L2v1()
  {
    D.setLevelAndVersion(2,1);
    String expected = wrapXML("<sbml xmlns=\"http://www.sbml.org/sbml/level2\" " + "level=\"2\" version=\"1\"/>\n");
    S = libsbml.writeSBMLToString(D);
    assertEquals( true, equals(expected,S) );
  }

  public void test_WriteSBML_SBMLDocument_L2v2()
  {
    D.setLevelAndVersion(2,2);
    String expected = wrapXML("<sbml xmlns=\"http://www.sbml.org/sbml/level2/version2\" " + "level=\"2\" version=\"2\"/>\n");
    S = libsbml.writeSBMLToString(D);
    assertEquals( true, equals(expected,S) );
  }

  public void test_WriteSBML_Species()
  {
    D.setLevelAndVersion(1,2);
    String expected = "<species name=\"Ca2\" compartment=\"cell\" initialAmount=\"0.7\"" + " units=\"mole\" boundaryCondition=\"true\" charge=\"2\"/>";;
    Species s = D.createModel().createSpecies();
    s.setName("Ca2");
    s.setCompartment("cell");
    s.setInitialAmount(0.7);
    s.setUnits("mole");
    s.setBoundaryCondition(true);
    s.setCharge(2);
    assertEquals( true, equals(expected,s.toSBML()) );
  }

  public void test_WriteSBML_SpeciesConcentrationRule()
  {
    D.setLevelAndVersion(1,2);
    String expected = "<speciesConcentrationRule " + "formula=\"t * s\" type=\"rate\" species=\"s\"/>";;
    D.createModel();
    D.getModel().createSpecies().setId("s");
    Rule r = D.getModel().createRateRule();
    r.setVariable("s");
    r.setFormula("t * s");
    assertEquals( true, equals(expected,r.toSBML()) );
  }

  public void test_WriteSBML_SpeciesConcentrationRule_L1v1()
  {
    D.setLevelAndVersion(1,1);
    String expected =  "<specieConcentrationRule formula=\"t * s\" specie=\"s\"/>";;
    D.createModel();
    D.getModel().createSpecies().setId("s");
    Rule r = D.getModel().createAssignmentRule();
    r.setVariable("s");
    r.setFormula("t * s");
    assertEquals( true, equals(expected,r.toSBML()) );
  }

  public void test_WriteSBML_SpeciesConcentrationRule_L2v1()
  {
    D.setLevelAndVersion(2,1);
    String expected = "<assignmentRule variable=\"s\">\n" + 
    "  <math xmlns=\"http://www.w3.org/1998/Math/MathML\">\n" + 
    "    <apply>\n" + 
    "      <times/>\n" + 
    "      <ci> t </ci>\n" + 
    "      <ci> s </ci>\n" + 
    "    </apply>\n" + 
    "  </math>\n" + 
    "</assignmentRule>";
    D.createModel();
    D.getModel().createSpecies().setId("s");
    Rule r = D.getModel().createAssignmentRule();
    r.setVariable("s");
    r.setFormula("t * s");
    assertEquals( true, equals(expected,r.toSBML()) );
  }

  public void test_WriteSBML_SpeciesConcentrationRule_L2v2()
  {
    D.setLevelAndVersion(2,2);
    String expected = "<assignmentRule variable=\"s\" sboTerm=\"SBO:0000006\">\n" + 
    "  <math xmlns=\"http://www.w3.org/1998/Math/MathML\">\n" + 
    "    <apply>\n" + 
    "      <times/>\n" + 
    "      <ci> t </ci>\n" + 
    "      <ci> s </ci>\n" + 
    "    </apply>\n" + 
    "  </math>\n" + 
    "</assignmentRule>";
    D.createModel();
    D.getModel().createSpecies().setId("s");
    Rule r = D.getModel().createAssignmentRule();
    r.setVariable("s");
    r.setFormula("t * s");
    r.setSBOTerm(6);
    assertEquals( true, equals(expected,r.toSBML()) );
  }

  public void test_WriteSBML_SpeciesConcentrationRule_defaults()
  {
    D.setLevelAndVersion(1,2);
    String expected =  "<speciesConcentrationRule formula=\"t * s\" species=\"s\"/>";;
    D.createModel();
    D.getModel().createSpecies().setId("s");
    Rule r = D.getModel().createAssignmentRule();
    r.setVariable("s");
    r.setFormula("t * s");
    assertEquals( true, equals(expected,r.toSBML()) );
  }

  public void test_WriteSBML_SpeciesReference()
  {
    D.setLevelAndVersion(1,2);
    String expected =  "<speciesReference species=\"s\" stoichiometry=\"3\" denominator=\"2\"/>";;
    SpeciesReference sr = D.createModel().createReaction().createReactant();
    sr.setSpecies("s");
    sr.setStoichiometry(3);
    sr.setDenominator(2);
    assertEquals( true, equals(expected,sr.toSBML()) );
  }

  public void test_WriteSBML_SpeciesReference_L1v1()
  {
    D.setLevelAndVersion(1,1);
    String expected =  "<specieReference specie=\"s\" stoichiometry=\"3\" denominator=\"2\"/>";;
    SpeciesReference sr = D.createModel().createReaction().createReactant();
    sr.setSpecies("s");
    sr.setStoichiometry(3);
    sr.setDenominator(2);
    assertEquals( true, equals(expected,sr.toSBML()) );
  }

  public void test_WriteSBML_SpeciesReference_L2v1_1()
  {
    D.setLevelAndVersion(2,1);
    String expected = "<speciesReference species=\"s\">\n" + 
    "  <stoichiometryMath>\n" + 
    "    <math xmlns=\"http://www.w3.org/1998/Math/MathML\">\n" + 
    "      <cn type=\"rational\"> 3 <sep/> 2 </cn>\n" + 
    "    </math>\n" + 
    "  </stoichiometryMath>\n" + 
    "</speciesReference>";
    SpeciesReference sr = D.createModel().createReaction().createReactant();
    sr.setSpecies("s");
    sr.setStoichiometry(3);
    sr.setDenominator(2);
    assertEquals( true, equals(expected,sr.toSBML()) );
  }

  public void test_WriteSBML_SpeciesReference_L2v1_2()
  {
    D.setLevelAndVersion(2,1);
    String expected =  "<speciesReference species=\"s\" stoichiometry=\"3.2\"/>";;
    SpeciesReference sr = D.createModel().createReaction().createReactant();
    sr.setSpecies("s");
    sr.setStoichiometry(3.2);
    assertEquals( true, equals(expected,sr.toSBML()) );
  }

  public void test_WriteSBML_SpeciesReference_L2v1_3()
  {
    D.setLevelAndVersion(2,1);
    String expected = "<speciesReference species=\"s\">\n" + 
    "  <stoichiometryMath>\n" + 
    "    <math xmlns=\"http://www.w3.org/1998/Math/MathML\">\n" + 
    "      <apply>\n" + 
    "        <divide/>\n" + 
    "        <cn type=\"integer\"> 1 </cn>\n" + 
    "        <ci> d </ci>\n" + 
    "      </apply>\n" + 
    "    </math>\n" + 
    "  </stoichiometryMath>\n" + 
    "</speciesReference>";
    SpeciesReference sr = D.createModel().createReaction().createReactant();
    sr.setSpecies("s");
    ASTNode math = libsbml.parseFormula("1/d");
    StoichiometryMath stoich = sr.createStoichiometryMath();
    stoich.setMath(math);
    sr.setStoichiometryMath(stoich);
    assertEquals( true, equals(expected,sr.toSBML()) );
  }

  public void test_WriteSBML_SpeciesReference_L2v2_1()
  {
    D.setLevelAndVersion(2,2);
    String expected = "<speciesReference id=\"ss\" name=\"odd\" sboTerm=\"SBO:0000009\" species=\"s\">\n" + 
    "  <stoichiometryMath>\n" + 
    "    <math xmlns=\"http://www.w3.org/1998/Math/MathML\">\n" + 
    "      <cn type=\"rational\"> 3 <sep/> 2 </cn>\n" + 
    "    </math>\n" + 
    "  </stoichiometryMath>\n" + 
    "</speciesReference>";
    SpeciesReference sr = D.createModel().createReaction().createReactant();
    sr.setSpecies("s");
    sr.setStoichiometry(3);
    sr.setDenominator(2);
    sr.setId("ss");
    sr.setName("odd");
    sr.setSBOTerm(9);
    sr.setId("ss");
    sr.setName("odd");
    sr.setSBOTerm(9);
    assertEquals( true, equals(expected,sr.toSBML()) );
  }

  public void test_WriteSBML_SpeciesReference_L2v3_1()
  {
    D.setLevelAndVersion(2,3);
    String expected =  "<speciesReference id=\"ss\" name=\"odd\" sboTerm=\"SBO:0000009\" species=\"s\" stoichiometry=\"3.2\"/>";;
    SpeciesReference sr = D.createModel().createReaction().createReactant();
    sr.setSpecies("s");
    sr.setStoichiometry(3.2);
    sr.setId("ss");
    sr.setName("odd");
    sr.setSBOTerm(9);
    assertEquals( true, equals(expected,sr.toSBML()) );
  }

  public void test_WriteSBML_SpeciesReference_defaults()
  {
    D.setLevelAndVersion(1,2);
    String expected =  "<speciesReference species=\"s\"/>";;
    SpeciesReference sr = D.createModel().createReaction().createReactant();
    sr.setSpecies("s");
    assertEquals( true, equals(expected,sr.toSBML()) );
  }

  public void test_WriteSBML_SpeciesType()
  {
    D.setLevelAndVersion(2,2);
    String expected =  "<speciesType id=\"st\"/>";;
    SpeciesType st = D.createModel().createSpeciesType();
    st.setId("st");
    st.setSBOTerm(4);
    assertEquals( true, equals(expected,st.toSBML()) );
  }

  public void test_WriteSBML_SpeciesType_withSBO()
  {
    D.setLevelAndVersion(2,3);
    String expected =  "<speciesType id=\"st\" sboTerm=\"SBO:0000004\"/>";;
    SpeciesType st = D.createModel().createSpeciesType();
    st.setId("st");
    st.setSBOTerm(4);
    assertEquals( true, equals(expected,st.toSBML()) );
  }

  public void test_WriteSBML_Species_L1v1()
  {
    D.setLevelAndVersion(1,1);
    String expected = "<specie name=\"Ca2\" compartment=\"cell\" initialAmount=\"0.7\"" + " units=\"mole\" boundaryCondition=\"true\" charge=\"2\"/>";;
    Species s = D.createModel().createSpecies();
    s.setName("Ca2");
    s.setCompartment("cell");
    s.setInitialAmount(0.7);
    s.setUnits("mole");
    s.setBoundaryCondition(true);
    s.setCharge(2);
    assertEquals( true, equals(expected,s.toSBML()) );
  }

  public void test_WriteSBML_Species_L2v1()
  {
    D.setLevelAndVersion(2,1);
    String expected = "<species id=\"Ca2\" compartment=\"cell\" initialAmount=\"0.7\" " + "substanceUnits=\"mole\" constant=\"true\"/>";;
    Species s = D.createModel().createSpecies();
    s.setId("Ca2");
    s.setCompartment("cell");
    s.setInitialAmount(0.7);
    s.setSubstanceUnits("mole");
    s.setConstant(true);
    assertEquals( true, equals(expected,s.toSBML()) );
  }

  public void test_WriteSBML_Species_L2v1_skipOptional()
  {
    D.setLevelAndVersion(2,1);
    String expected =  "<species id=\"Ca2\" compartment=\"cell\"/>";;
    Species s = D.createModel().createSpecies();
    s.setId("Ca2");
    s.setCompartment("cell");
    assertEquals( true, equals(expected,s.toSBML()) );
  }

  public void test_WriteSBML_Species_L2v2()
  {
    D.setLevelAndVersion(2,2);
    String expected = "<species id=\"Ca2\" speciesType=\"st\" compartment=\"cell\" initialAmount=\"0.7\" " + "substanceUnits=\"mole\" constant=\"true\"/>";;
    Species s = D.createModel().createSpecies();
    s.setId("Ca2");
    s.setCompartment("cell");
    s.setInitialAmount(0.7);
    s.setSubstanceUnits("mole");
    s.setConstant(true);
    s.setSpeciesType("st");
    assertEquals( true, equals(expected,s.toSBML()) );
  }

  public void test_WriteSBML_Species_L2v3()
  {
    D.setLevelAndVersion(2,3);
    String expected =  "<species id=\"Ca2\" compartment=\"cell\" sboTerm=\"SBO:0000007\"/>";;
    Species s = D.createModel().createSpecies();
    s.setId("Ca2");
    s.setCompartment("cell");
    s.setSBOTerm(7);
    assertEquals( true, equals(expected,s.toSBML()) );
  }

  public void test_WriteSBML_Species_defaults()
  {
    D.setLevelAndVersion(1,2);
    String expected = "<species name=\"Ca2\" compartment=\"cell\" initialAmount=\"0.7\"" + " units=\"mole\" charge=\"2\"/>";;
    Species s = D.createModel().createSpecies();
    s.setName("Ca2");
    s.setCompartment("cell");
    s.setInitialAmount(0.7);
    s.setUnits("mole");
    s.setCharge(2);
    assertEquals( true, equals(expected,s.toSBML()) );
  }

  public void test_WriteSBML_Species_skipOptional()
  {
    D.setLevelAndVersion(1,2);
    String expected =  "<species name=\"Ca2\" compartment=\"cell\" initialAmount=\"0.7\"/>";;
    Species s = D.createModel().createSpecies();
    s.setId("Ca2");
    s.setCompartment("cell");
    s.setInitialAmount(0.7);
    assertEquals( true, equals(expected,s.toSBML()) );
  }

  public void test_WriteSBML_StoichiometryMath()
  {
    D.setLevelAndVersion(2,1);
    String expected = "<stoichiometryMath>\n" + 
    "  <math xmlns=\"http://www.w3.org/1998/Math/MathML\">\n" + 
    "    <apply>\n" + 
    "      <divide/>\n" + 
    "      <cn type=\"integer\"> 1 </cn>\n" + 
    "      <ci> d </ci>\n" + 
    "    </apply>\n" + 
    "  </math>\n" + 
    "</stoichiometryMath>";
    ASTNode math = libsbml.parseFormula("1/d");
    StoichiometryMath stoich = D.createModel().createReaction().createReactant().createStoichiometryMath();
    stoich.setMath(math);
    assertEquals( true, equals(expected,stoich.toSBML()) );
  }

  public void test_WriteSBML_StoichiometryMath_withSBO()
  {
    D.setLevelAndVersion(2,3);
    String expected = "<stoichiometryMath sboTerm=\"SBO:0000333\">\n" + 
    "  <math xmlns=\"http://www.w3.org/1998/Math/MathML\">\n" + 
    "    <apply>\n" + 
    "      <divide/>\n" + 
    "      <cn type=\"integer\"> 1 </cn>\n" + 
    "      <ci> d </ci>\n" + 
    "    </apply>\n" + 
    "  </math>\n" + 
    "</stoichiometryMath>";
    ASTNode math = libsbml.parseFormula("1/d");
    StoichiometryMath stoich = D.createModel().createReaction().createReactant().createStoichiometryMath();
    stoich.setMath(math);
    stoich.setSBOTerm(333);
    assertEquals( true, equals(expected,stoich.toSBML()) );
  }

  public void test_WriteSBML_Unit()
  {
    D.setLevelAndVersion(2,4);
    String expected =  "<unit kind=\"kilogram\" exponent=\"2\" scale=\"-3\"/>";;
    Unit u = D.createModel().createUnitDefinition().createUnit();
    u.setKind(libsbml.UNIT_KIND_KILOGRAM);
    u.setExponent(2);
    u.setScale(-3);
    assertEquals( true, equals(expected,u.toSBML()) );
  }

  public void test_WriteSBML_UnitDefinition()
  {
    D.setLevelAndVersion(1,2);
    String expected =  "<unitDefinition name=\"mmls\"/>";;
    UnitDefinition ud = D.createModel().createUnitDefinition();
    ud.setId("mmls");
    assertEquals( true, equals(expected,ud.toSBML()) );
  }

  public void test_WriteSBML_UnitDefinition_L2v1()
  {
    D.setLevelAndVersion(2,1);
    String expected =  "<unitDefinition id=\"mmls\"/>";;
    UnitDefinition ud = D.createModel().createUnitDefinition();
    ud.setId("mmls");
    assertEquals( true, equals(expected,ud.toSBML()) );
  }

  public void test_WriteSBML_UnitDefinition_L2v1_full()
  {
    D.setLevelAndVersion(2,1);
    String expected = "<unitDefinition id=\"Fahrenheit\">\n" + 
    "  <listOfUnits>\n" + 
    "    <unit kind=\"Celsius\" multiplier=\"1.8\" offset=\"32\"/>\n" + 
    "  </listOfUnits>\n" + 
    "</unitDefinition>";
    UnitDefinition ud = D.createModel().createUnitDefinition();
    ud.setId("Fahrenheit");
    Unit u1 = ud.createUnit();
    u1.setKind(libsbml.UnitKind_forName("Celsius"));
    u1.setMultiplier(1.8);
    u1.setOffset(32);
    assertEquals( true, equals(expected,ud.toSBML()) );
  }

  public void test_WriteSBML_UnitDefinition_full()
  {
    D.setLevelAndVersion(1,2);
    String expected = "<unitDefinition name=\"mmls\">\n" + 
    "  <listOfUnits>\n" + 
    "    <unit kind=\"mole\" scale=\"-3\"/>\n" + 
    "    <unit kind=\"liter\" exponent=\"-1\"/>\n" + 
    "    <unit kind=\"second\" exponent=\"-1\"/>\n" + 
    "  </listOfUnits>\n" + 
    "</unitDefinition>";
    UnitDefinition ud = D.createModel().createUnitDefinition();
    ud.setId("mmls");
    Unit u1 = ud.createUnit();
    u1.setKind(libsbml.UNIT_KIND_MOLE);
    u1.setScale(-3);
    Unit u2 = ud.createUnit();
    u2.setKind(libsbml.UNIT_KIND_LITER);
    u2.setExponent(-1);
    Unit u3 = ud.createUnit();
    u3.setKind(libsbml.UNIT_KIND_SECOND);
    u3.setExponent(-1);
    assertEquals( true, equals(expected,ud.toSBML()) );
  }

  public void test_WriteSBML_Unit_L2v1()
  {
    D.setLevelAndVersion(2,1);
    String expected =  "<unit kind=\"Celsius\" multiplier=\"1.8\" offset=\"32\"/>";;
    Unit u = D.createModel().createUnitDefinition().createUnit();
    u.setKind(libsbml.UnitKind_forName("Celsius"));
    u.setMultiplier(1.8);
    u.setOffset(32);
    assertEquals( true, equals(expected,u.toSBML()) );
  }

  public void test_WriteSBML_Unit_defaults()
  {
    D.setLevelAndVersion(1,2);
    String expected =  "<unit kind=\"kilogram\"/>";;
    Unit u = D.createModel().createUnitDefinition().createUnit();
    u.setKind(libsbml.UNIT_KIND_KILOGRAM);
    assertEquals( true, equals(expected,u.toSBML()) );
  }

  public void test_WriteSBML_Unit_l2v3()
  {
    D.setLevelAndVersion(2,3);
    String expected =  "<unit kind=\"kilogram\" exponent=\"2\" scale=\"-3\"/>";;
    Unit u = D.createModel().createUnitDefinition().createUnit();
    u.setKind(libsbml.UNIT_KIND_KILOGRAM);
    u.setExponent(2);
    u.setScale(-3);
    u.setOffset(32);
    assertEquals( true, equals(expected,u.toSBML()) );
  }

  public void test_WriteSBML_bzip2()
  {
    int filenum = 12;
    String file[] = {
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
    };
    String bz2file = "test.xml.bz2";
    for(int i = 0; i < filenum; i++)
    {
      SBMLDocument d = libsbml.readSBML(file[i]);
      assertTrue( d != null );
      if (! SBMLWriter.hasBzip2())
      {
        assertTrue( libsbml.writeSBML(d, bz2file) == 0 );
        d = null;
          continue;
      }
      boolean result = (libsbml.writeSBML(d, bz2file) != 0);
      assertEquals( true, result );
      SBMLDocument dg = libsbml.readSBML(bz2file);
      assertTrue( dg != null );
      assertTrue( !d.toSBML().equals(dg.toSBML()) == false );
      d = null;
      dg = null;
    }
  }


  public void test_WriteSBML_elements_L1v2()
  {
    D.setLevelAndVersion(1,2);
    String expected = wrapSBML_L1v2("  <model>\n" + 
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
    "  </model>\n");
    Model m = D.createModel();
    m.createUnitDefinition();
    m.createCompartment();
    m.createParameter();
    m.createAlgebraicRule();
    m.createReaction();
    m.createSpecies();
    S = libsbml.writeSBMLToString(D);
    assertEquals( true, equals(expected,S) );
  }

  public void test_WriteSBML_elements_L2v1()
  {
    D.setLevelAndVersion(2,1);
    String expected = wrapSBML_L2v1("  <model>\n" + 
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
    "  </model>\n");
    Model m = D.createModel();
    m.createUnitDefinition();
    m.createFunctionDefinition();
    m.createCompartment();
    m.createEvent();
    m.createParameter();
    m.createAlgebraicRule();
    m.createInitialAssignment();
    m.createConstraint();
    m.createReaction();
    m.createSpecies();
    S = libsbml.writeSBMLToString(D);
    assertEquals( true, equals(expected,S) );
  }

  public void test_WriteSBML_elements_L2v2()
  {
    D.setLevelAndVersion(2,2);
    String expected = wrapSBML_L2v2("  <model>\n" + 
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
    "  </model>\n");
    Model m = D.createModel();
    m.createUnitDefinition();
    m.createFunctionDefinition();
    m.createCompartmentType();
    m.createSpeciesType();
    m.createCompartment();
    m.createEvent();
    m.createParameter();
    m.createAlgebraicRule();
    m.createInitialAssignment();
    m.createConstraint();
    m.createReaction();
    m.createSpecies();
    S = libsbml.writeSBMLToString(D);
    assertEquals( true, equals(expected,S) );
  }

  public void test_WriteSBML_error()
  {
    SBMLDocument d = new SBMLDocument();
    SBMLWriter w = new SBMLWriter();
    assertEquals( false, w.writeSBML(d, "/tmp/impossible/path/should/fail") );
    assertTrue( d.getNumErrors() == 1 );
    assertTrue( d.getError(0).getErrorId() == libsbml.XMLFileUnwritable );
    d = null;
    w = null;
  }

  public void test_WriteSBML_gzip()
  {
    int filenum = 12;
    String file[] = {
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
    };
    String gzfile = "test.xml.gz";
    for(int i = 0; i < filenum; i++)
    {
      SBMLDocument d = libsbml.readSBML(file[i]);
      assertTrue( d != null );
      if (! SBMLWriter.hasZlib())
      {
        assertTrue( libsbml.writeSBML(d, gzfile) == 0 );
        d = null;
          continue;
      }
      boolean result = (libsbml.writeSBML(d, gzfile) != 0);
      assertEquals( true, result );
      SBMLDocument dg = libsbml.readSBML(gzfile);
      assertTrue( dg != null );
      assertTrue( !d.toSBML().equals(dg.toSBML()) == false );
      d = null;
      dg = null;
    }
  }


  public void test_WriteSBML_locale()
  {
    String expected =  "<parameter id=\"p\" value=\"3.31\"/>";;
    Parameter p = D.createModel().createParameter();
    p.setId("p");
    p.setValue(3.31);
    assertEquals( true, equals(expected,p.toSBML()) );
  }

  public void test_WriteSBML_zip()
  {
    int filenum = 12;
    String file[] = {
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
    };
    String zipfile = "test.xml.zip";
    for(int i = 0; i < filenum; i++)
    {
      SBMLDocument d = libsbml.readSBML(file[i]);
      assertTrue( d != null );
      if (! SBMLWriter.hasZlib())
      {
        assertTrue( libsbml.writeSBML(d, zipfile) == 0 );
        d = null;
          continue;
      }
      boolean result = (libsbml.writeSBML(d, zipfile) != 0);
      assertEquals( true, result );
      SBMLDocument dg = libsbml.readSBML(zipfile);
      assertTrue( dg != null );
      assertTrue( !d.toSBML().equals(dg.toSBML()) == false );
      d = null;
      dg = null;
    }
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
