#
# @file    TestReadSBML.py
# @brief   Read SBML unit tests
#
# @author  Akiya Jouraku (Python conversion)
# @author  Ben Bornstein 
#
# $Id$
# $HeadURL$
#
# This test file was converted from src/sbml/test/TestReadSBML.cpp
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

import re

USE_LIBXML = 0
USE_EXPAT  = 0
USE_XERCES = 0

def setXMLParser():
  make_config = "../../../config/makefile-common-vars.mk"

  global USE_LIBXML 
  global USE_EXPAT  
  global USE_XERCES 

  re_expat  = re.compile('^ USE_EXPAT   \s* = \s* 1', re.X)
  re_libxml = re.compile('^ USE_LIBXML  \s* = \s* 1', re.X)
  re_xerces = re.compile('^ USE_XERCES  \s* = \s* 1', re.X)

  f = open(make_config)
  for line in f:
    if re_expat.match(line)  : USE_EXPAT   = 1 
    if re_libxml.match(line) : USE_LIBXML  = 1 
    if re_xerces.match(line) : USE_XERCES  = 1 

def wrapString(s):
  return s
  pass

def SBML_FOOTER():
  return "</model> </sbml>"
  pass

def SBML_HEADER_L1v1():
  return "<sbml level='1' version='1'> <model name='m'>\n"
  pass

def SBML_HEADER_L1v2():
  return "<sbml level='1' version='2'> <model name='m'>\n"
  pass

def SBML_HEADER_L2v1():
  return "<sbml level='2' version='1'> <model name='m'>\n"
  pass

def SBML_HEADER_L2v2():
  return "<sbml level='2' version='2'> <model name='m'>\n"
  pass

def SBML_HEADER_L2v3():
  return "<sbml level='2' version='3'> <model name='m'>\n"
  pass

def XML_HEADER():
  return "<?xml version='1.0' encoding='UTF-8'?>\n"
  pass

def wrapSBML_L1v1(s):
  r = XML_HEADER()
  r += SBML_HEADER_L1v1()
  r += s
  r += SBML_FOOTER()
  return r
  pass

def wrapSBML_L1v2(s):
  r = XML_HEADER()
  r += SBML_HEADER_L1v2()
  r += s
  r += SBML_FOOTER()
  return r
  pass

def wrapSBML_L2v1(s):
  r = XML_HEADER()
  r += SBML_HEADER_L2v1()
  r += s
  r += SBML_FOOTER()
  return r
  pass

def wrapSBML_L2v2(s):
  r = XML_HEADER()
  r += SBML_HEADER_L2v2()
  r += s
  r += SBML_FOOTER()
  return r
  pass

def wrapSBML_L2v3(s):
  r = XML_HEADER()
  r += SBML_HEADER_L2v3()
  r += s
  r += SBML_FOOTER()
  return r
  pass

def wrapXML(s):
  r = XML_HEADER()
  r += s
  return r
  pass

class TestReadSBML(unittest.TestCase):

  M = None
  D = None

  def setUp(self):
    self.D = None
    pass  

  def tearDown(self):
    self.D = None
    pass  

  def test_ReadSBML_AlgebraicRule(self):
    s = wrapSBML_L1v2("<listOfRules>" + 
    "  <algebraicRule formula='x + 1'/>" + 
    "</listOfRules>")
    self.D = libsbml.readSBMLFromString(s)
    self.M = self.D.getModel()
    self.assert_( self.M.getNumRules() == 1 )
    ar = self.M.getRule(0)
    self.assert_((  "x + 1" == ar.getFormula() ))
    pass  

  def test_ReadSBML_AlgebraicRule_L2(self):
    s = wrapSBML_L2v1("<listOfRules>" + 
    "  <algebraicRule>" + 
    "    <math>" + 
    "      <apply>" + 
    "        <minus/>" + 
    "        <apply>" + 
    "          <plus/>" + 
    "            <ci> S1 </ci>" + 
    "            <ci> S2 </ci>" + 
    "        </apply>" + 
    "        <ci> T </ci>" + 
    "      </apply>" + 
    "    </math>" + 
    "  </algebraicRule>" + 
    "</listOfRules>")
    self.D = libsbml.readSBMLFromString(s)
    self.M = self.D.getModel()
    self.assert_( self.M.getNumRules() == 1 )
    ar = self.M.getRule(0)
    self.assert_( ar != None )
    self.assertEqual( True, ar.isSetMath() )
    math = ar.getMath()
    formula = ar.getFormula()
    self.assert_( formula != None )
    self.assert_((  "S1 + S2 - T" == formula ))
    pass  

  def test_ReadSBML_AssignmentRule(self):
    s = wrapSBML_L2v1("<listOfRules>" + 
    "  <assignmentRule variable='k'>" + 
    "    <math>" + 
    "      <apply>" + 
    "        <divide/>" + 
    "        <ci> k3 </ci>" + 
    "        <ci> k2 </ci>" + 
    "      </apply>" + 
    "    </math>" + 
    "  </assignmentRule>" + 
    "</listOfRules>")
    self.D = libsbml.readSBMLFromString(s)
    self.M = self.D.getModel()
    self.assert_( self.M.getNumRules() == 1 )
    ar = self.M.getRule(0)
    self.assert_( ar != None )
    self.assertEqual( True, ar.isSetMath() )
    math = ar.getMath()
    formula = ar.getFormula()
    self.assert_( formula != None )
    self.assert_((  "k3 / k2" == formula ))
    pass  

  def test_ReadSBML_Compartment(self):
    s = wrapSBML_L1v2("<listOfCompartments>" + 
    "  <compartment name='mitochondria' volume='.0001' units='milliliters'" + 
    "               outside='cell'/>" + 
    "</listOfCompartments>")
    self.D = libsbml.readSBMLFromString(s)
    self.M = self.D.getModel()
    self.assert_( self.M.getNumCompartments() == 1 )
    c = self.M.getCompartment(0)
    self.assert_((  "mitochondria"  == c.getId() ))
    self.assert_((  "milliliters"   == c.getUnits() ))
    self.assert_((  "cell"          == c.getOutside() ))
    self.assert_( c.getVolume() == .0001 )
    self.assertEqual( True, c.isSetVolume() )
    self.assertEqual( True, c.isSetSize() )
    pass  

  def test_ReadSBML_CompartmentVolumeRule(self):
    s = wrapSBML_L1v2("<listOfRules>" + 
    "  <compartmentVolumeRule compartment='A' formula='0.10 * t'/>" + 
    "</listOfRules>")
    self.D = libsbml.readSBMLFromString(s)
    self.M = self.D.getModel()
    self.assert_( self.M.getNumRules() == 1 )
    cvr = self.M.getRule(0)
    self.assertEqual( True, cvr.isCompartmentVolume() )
    self.assert_((  "A" == cvr.getVariable() ))
    self.assert_((  "0.10 * t"  == cvr.getFormula() ))
    self.assert_( cvr.getType() == libsbml.RULE_TYPE_SCALAR )
    pass  

  def test_ReadSBML_Compartment_L2(self):
    s = wrapSBML_L2v1("<listOfCompartments>" + 
    "  <compartment id='membrane' size='.3' spatialDimensions='2'" + 
    "               units='area' outside='tissue' constant='false'/>" + 
    "</listOfCompartments>")
    self.D = libsbml.readSBMLFromString(s)
    self.M = self.D.getModel()
    self.assert_( self.M.getNumCompartments() == 1 )
    c = self.M.getCompartment(0)
    self.assertEqual( True, c.isSetId() )
    self.assertEqual( False, c.isSetName() )
    self.assertEqual( True, c.isSetVolume() )
    self.assertEqual( True, c.isSetSize() )
    self.assertEqual( True, c.isSetUnits() )
    self.assertEqual( True, c.isSetOutside() )
    self.assert_((  "membrane"  == c.getId() ))
    self.assert_((  "area"      == c.getUnits() ))
    self.assert_((  "tissue"    == c.getOutside() ))
    self.assert_( c.getSpatialDimensions() == 2 )
    self.assert_( c.getSize() == .3 )
    pass  

  def test_ReadSBML_Compartment_defaults(self):
    s = wrapSBML_L1v2("<listOfCompartments> <compartment name='cell'/> </listOfCompartments>"  
    )
    self.D = libsbml.readSBMLFromString(s)
    self.M = self.D.getModel()
    self.assert_( self.M.getNumCompartments() == 1 )
    c = self.M.getCompartment(0)
    self.assertEqual( True, c.isSetId() )
    self.assertEqual( True, c.isSetVolume() )
    self.assertEqual( False, c.isSetSize() )
    self.assertEqual( False, c.isSetUnits() )
    self.assertEqual( False, c.isSetOutside() )
    self.assert_((  "cell"  == c.getId() ))
    self.assert_( c.getVolume() == 1.0 )
    pass  

  def test_ReadSBML_Compartment_defaults_L2(self):
    s = wrapSBML_L2v1("<listOfCompartments> <compartment id='cell'/> </listOfCompartments>"  
    )
    self.D = libsbml.readSBMLFromString(s)
    self.M = self.D.getModel()
    self.assert_( self.M.getNumCompartments() == 1 )
    c = self.M.getCompartment(0)
    self.assertEqual( True, c.isSetId() )
    self.assertEqual( False, c.isSetName() )
    self.assertEqual( False, c.isSetSize() )
    self.assertEqual( False, c.isSetUnits() )
    self.assertEqual( False, c.isSetOutside() )
    self.assert_((  "cell"  == c.getId() ))
    self.assert_( c.getSpatialDimensions() == 3 )
    self.assert_( c.getConstant() == True )
    pass  

  def test_ReadSBML_Event(self):
    s = wrapSBML_L2v2("<listOfEvents>" + 
    "  <event id='e1' name='MyEvent' timeUnits='time'/>" + 
    "</listOfEvents>")
    self.D = libsbml.readSBMLFromString(s)
    self.M = self.D.getModel()
    self.assert_( self.M.getNumEvents() == 1 )
    e = self.M.getEvent(0)
    self.assert_( e != None )
    self.assertEqual( True, e.isSetId() )
    self.assertEqual( True, e.isSetName() )
    self.assertEqual( True, e.isSetTimeUnits() )
    self.assertEqual( False, e.isSetTrigger() )
    self.assertEqual( False, e.isSetDelay() )
    self.assert_((  "e1"       == e.getId() ))
    self.assert_((  "MyEvent"  == e.getName() ))
    self.assert_((  "time"     == e.getTimeUnits() ))
    pass  

  def test_ReadSBML_EventAssignment(self):
    s = wrapSBML_L2v1("<listOfEvents>" + 
    "  <event>" + 
    "    <listOfEventAssignments>" + 
    "      <eventAssignment variable='k2'>" + 
    "        <math> <cn> 0 </cn> </math>" + 
    "      </eventAssignment>" + 
    "    </listOfEventAssignments>" + 
    "  </event>" + 
    "</listOfEvents>")
    self.D = libsbml.readSBMLFromString(s)
    self.M = self.D.getModel()
    self.assert_( self.M.getNumEvents() == 1 )
    e = self.M.getEvent(0)
    self.assert_( e != None )
    self.assert_( e.getNumEventAssignments() == 1 )
    ea = e.getEventAssignment(0)
    self.assert_( ea != None )
    self.assertEqual( True, ea.isSetVariable() )
    self.assert_((  "k2" == ea.getVariable() ))
    self.assertEqual( True, ea.isSetMath() )
    math = ea.getMath()
    formula = libsbml.formulaToString(math)
    self.assert_( formula != None )
    self.assert_((  "0" == formula ))
    pass  

  def test_ReadSBML_Event_delay(self):
    s = wrapSBML_L2v1("<listOfEvents>" + 
    "  <event> <delay> <math> <cn> 5 </cn> </math> </delay> </event>" + 
    "</listOfEvents>")
    self.D = libsbml.readSBMLFromString(s)
    self.M = self.D.getModel()
    self.assert_( self.M.getNumEvents() == 1 )
    e = self.M.getEvent(0)
    self.assert_( e != None )
    self.assertEqual( True, e.isSetDelay() )
    self.assertEqual( False, e.isSetTrigger() )
    delay = e.getDelay()
    formula = libsbml.formulaToString(delay.getMath())
    self.assert_( formula != None )
    self.assert_((  "5" == formula ))
    pass  

  def test_ReadSBML_Event_trigger(self):
    s = wrapSBML_L2v1("<listOfEvents>" + 
    "  <event>" + 
    "    <trigger>" + 
    "      <math>" + 
    "        <apply>" + 
    "          <leq/>" + 
    "          <ci> P1 </ci>" + 
    "          <ci> t  </ci>" + 
    "        </apply>" + 
    "      </math>" + 
    "   </trigger>" + 
    "  </event>" + 
    "</listOfEvents>")
    self.D = libsbml.readSBMLFromString(s)
    self.M = self.D.getModel()
    self.assert_( self.M.getNumEvents() == 1 )
    e = self.M.getEvent(0)
    self.assert_( e != None )
    self.assertEqual( False, e.isSetDelay() )
    self.assertEqual( True, e.isSetTrigger() )
    trigger = e.getTrigger()
    formula = libsbml.formulaToString(trigger.getMath())
    self.assert_( formula != None )
    self.assert_((  "leq(P1, t)" == formula ))
    pass  

  def test_ReadSBML_FunctionDefinition(self):
    s = wrapSBML_L2v1("<listOfFunctionDefinitions>" + 
    "  <functionDefinition id='pow3' name='cubed'>" + 
    "    <math>" + 
    "      <lambda>" + 
    "        <bvar><ci> x </ci></bvar>" + 
    "        <apply>" + 
    "          <power/>" + 
    "          <ci> x </ci>" + 
    "          <cn> 3 </cn>" + 
    "        </apply>" + 
    "      </lambda>" + 
    "    </math>" + 
    "  </functionDefinition>" + 
    "</listOfFunctionDefinitions>")
    self.D = libsbml.readSBMLFromString(s)
    self.M = self.D.getModel()
    self.assert_( self.M.getNumFunctionDefinitions() == 1 )
    fd = self.M.getFunctionDefinition(0)
    self.assert_( fd != None )
    self.assertEqual( True, fd.isSetId() )
    self.assertEqual( True, fd.isSetName() )
    self.assert_((  "pow3"   == fd.getId() ))
    self.assert_((  "cubed"  == fd.getName() ))
    self.assertEqual( True, fd.isSetMath() )
    math = fd.getMath()
    formula = libsbml.formulaToString(math)
    self.assert_( formula != None )
    self.assert_((  "lambda(x, pow(x, 3))" == formula ))
    pass  

  def test_ReadSBML_KineticLaw(self):
    s = wrapSBML_L1v2("<listOfReactions>" + 
    "  <reaction name='J1'>" + 
    "    <kineticLaw formula='k1*X0'/>" + 
    "  </reaction>" + 
    "</listOfReactions>")
    self.D = libsbml.readSBMLFromString(s)
    self.M = self.D.getModel()
    self.assert_( self.M.getNumReactions() == 1 )
    r = self.M.getReaction(0)
    kl = r.getKineticLaw()
    self.assert_((  "k1*X0" == kl.getFormula() ))
    pass  

  def test_ReadSBML_KineticLaw_L2(self):
    s = wrapSBML_L2v1("<listOfReactions>" + 
    "  <reaction id='J1'>" + 
    "    <kineticLaw>" + 
    "      <math>" + 
    "        <apply>" + 
    "          <times/>" + 
    "          <ci> k  </ci>" + 
    "          <ci> S2 </ci>" + 
    "          <ci> X0 </ci>" + 
    "        </apply>" + 
    "      </math>" + 
    "    </kineticLaw>" + 
    "  </reaction>" + 
    "</listOfReactions>")
    self.D = libsbml.readSBMLFromString(s)
    self.M = self.D.getModel()
    self.assert_( self.M.getNumReactions() == 1 )
    r = self.M.getReaction(0)
    self.assert_( r != None )
    kl = r.getKineticLaw()
    self.assert_( kl != None )
    self.assertEqual( True, kl.isSetMath() )
    math = kl.getMath()
    formula = kl.getFormula()
    self.assert_( formula != None )
    self.assert_((  "k * S2 * X0" == formula ))
    pass  

  def test_ReadSBML_KineticLaw_Parameter(self):
    s = wrapSBML_L1v2("<listOfReactions>" + 
    "  <reaction name='J1'>" + 
    "    <kineticLaw formula='k1*X0'>" + 
    "      <listOfParameters>" + 
    "        <parameter name='k1' value='0'/>" + 
    "      </listOfParameters>" + 
    "    </kineticLaw>" + 
    "  </reaction>" + 
    "</listOfReactions>")
    self.D = libsbml.readSBMLFromString(s)
    self.M = self.D.getModel()
    self.assert_( self.M.getNumReactions() == 1 )
    r = self.M.getReaction(0)
    kl = r.getKineticLaw()
    self.assert_((  "k1*X0" == kl.getFormula() ))
    self.assert_( kl.getNumParameters() == 1 )
    p = kl.getParameter(0)
    self.assert_((  "k1" == p.getId() ))
    self.assert_( p.getValue() == 0 )
    pass  

  def test_ReadSBML_Model(self):
    s = wrapXML("<sbml level='1' version='1'>" + 
    "  <model name='testModel'></model>" + 
    "</sbml>")
    self.D = libsbml.readSBMLFromString(s)
    self.M = self.D.getModel()
    self.assert_((  "testModel" == self.M.getId() ))
    pass  

  def test_ReadSBML_Model_L2(self):
    s = wrapXML("<sbml level='2' version='1'>" + 
    "  <model id='testModel'> </model>" + 
    "</sbml>")
    self.D = libsbml.readSBMLFromString(s)
    self.M = self.D.getModel()
    self.assertEqual( True, self.M.isSetId() )
    self.assertEqual( False, self.M.isSetName() )
    self.assert_((  "testModel" == self.M.getId() ))
    pass  

  def test_ReadSBML_Parameter(self):
    s = wrapSBML_L1v2("<listOfParameters>" + 
    "  <parameter name='Km1' value='2.3' units='second'/>" + 
    "</listOfParameters>")
    self.D = libsbml.readSBMLFromString(s)
    self.M = self.D.getModel()
    self.assert_( self.M.getNumParameters() == 1 )
    p = self.M.getParameter(0)
    self.assert_((  "Km1"     == p.getId() ))
    self.assert_((  "second"  == p.getUnits() ))
    self.assert_( p.getValue() == 2.3 )
    self.assert_( p.isSetValue() == True )
    pass  

  def test_ReadSBML_ParameterRule(self):
    s = wrapSBML_L1v2("<listOfRules>" + 
    "  <parameterRule name='k' formula='k3/k2'/>" + 
    "</listOfRules>")
    self.D = libsbml.readSBMLFromString(s)
    self.M = self.D.getModel()
    self.assert_( self.M.getNumRules() == 1 )
    pr = self.M.getRule(0)
    self.assertEqual( True, pr.isParameter() )
    self.assert_((  "k" == pr.getVariable() ))
    self.assert_((  "k3/k2"  == pr.getFormula() ))
    self.assert_( pr.getType() == libsbml.RULE_TYPE_SCALAR )
    pass  

  def test_ReadSBML_Parameter_L2(self):
    s = wrapSBML_L2v1("<listOfParameters>" + 
    "  <parameter id='T' value='4.6' units='Celsius' constant='false'/>" + 
    "</listOfParameters>")
    self.D = libsbml.readSBMLFromString(s)
    self.M = self.D.getModel()
    self.assert_( self.M.getNumParameters() == 1 )
    p = self.M.getParameter(0)
    self.assertEqual( True, p.isSetId() )
    self.assertEqual( False, p.isSetName() )
    self.assertEqual( True, p.isSetValue() )
    self.assertEqual( True, p.isSetUnits() )
    self.assert_((  "T"        == p.getId() ))
    self.assert_((  "Celsius"  == p.getUnits() ))
    self.assert_( p.getValue() == 4.6 )
    self.assert_( p.getConstant() == False )
    pass  

  def test_ReadSBML_Parameter_L2_defaults(self):
    s = wrapSBML_L2v1("<listOfParameters> <parameter id='x'/> </listOfParameters>"  
    )
    self.D = libsbml.readSBMLFromString(s)
    self.M = self.D.getModel()
    self.assert_( self.M.getNumParameters() == 1 )
    p = self.M.getParameter(0)
    self.assertEqual( True, p.isSetId() )
    self.assertEqual( False, p.isSetName() )
    self.assertEqual( False, p.isSetValue() )
    self.assertEqual( False, p.isSetUnits() )
    self.assert_((  "x" == p.getId() ))
    self.assert_( p.getConstant() == True )
    pass  

  def test_ReadSBML_RateRule(self):
    s = wrapSBML_L2v1("<listOfRules>" + 
    "  <rateRule variable='x'>" + 
    "    <math>" + 
    "      <apply>" + 
    "        <times/>" + 
    "        <apply>" + 
    "          <minus/>" + 
    "          <cn> 1 </cn>" + 
    "          <ci> x </ci>" + 
    "        </apply>" + 
    "        <apply>" + 
    "          <ln/>" + 
    "          <ci> x </ci>" + 
    "        </apply>" + 
    "      </apply>" + 
    "    </math>" + 
    "  </rateRule>" + 
    "</listOfRules>")
    self.D = libsbml.readSBMLFromString(s)
    self.M = self.D.getModel()
    self.assert_( self.M.getNumRules() == 1 )
    rr = self.M.getRule(0)
    self.assert_( rr != None )
    self.assertEqual( True, rr.isSetMath() )
    math = rr.getMath()
    formula = rr.getFormula()
    self.assert_( formula != None )
    self.assert_((  "(1 - x) * log(x)" == formula ))
    pass  

  def test_ReadSBML_Reaction(self):
    s = wrapSBML_L1v2("<listOfReactions>" + 
    "  <reaction name='reaction_1' reversible='false'/>" + 
    "</listOfReactions>")
    self.D = libsbml.readSBMLFromString(s)
    self.M = self.D.getModel()
    self.assert_( self.M.getNumReactions() == 1 )
    r = self.M.getReaction(0)
    self.assert_((  "reaction_1" == r.getId() ))
    self.assert_( r.getReversible() == False )
    self.assert_( r.getFast() == False )
    pass  

  def test_ReadSBML_Reaction_L2(self):
    s = wrapSBML_L2v1("<listOfReactions>" + 
    "  <reaction id='r1' reversible='false' fast='false'/>" + 
    "</listOfReactions>")
    self.D = libsbml.readSBMLFromString(s)
    self.M = self.D.getModel()
    self.assert_( self.M.getNumReactions() == 1 )
    r = self.M.getReaction(0)
    self.assertEqual( True, r.isSetId() )
    self.assertEqual( False, r.isSetName() )
    self.assertEqual( True, r.isSetFast() )
    self.assert_((  "r1" == r.getId() ))
    self.assert_( r.getReversible() == False )
    self.assert_( r.getFast() == False )
    pass  

  def test_ReadSBML_Reaction_L2_defaults(self):
    s = wrapSBML_L2v1("<listOfReactions> <reaction id='r1'/> </listOfReactions>"  
    )
    self.D = libsbml.readSBMLFromString(s)
    self.M = self.D.getModel()
    self.assert_( self.M.getNumReactions() == 1 )
    r = self.M.getReaction(0)
    self.assertEqual( True, r.isSetId() )
    self.assertEqual( False, r.isSetName() )
    self.assertEqual( False, r.isSetFast() )
    self.assert_((  "r1" == r.getId() ))
    self.assert_( r.getReversible() == True )
    pass  

  def test_ReadSBML_Reaction_defaults(self):
    s = wrapSBML_L1v2("<listOfReactions>" + 
    "  <reaction name='reaction_1'/>" + 
    "</listOfReactions>")
    self.D = libsbml.readSBMLFromString(s)
    self.M = self.D.getModel()
    self.assert_( self.M.getNumReactions() == 1 )
    r = self.M.getReaction(0)
    self.assert_((  "reaction_1" == r.getId() ))
    self.assert_( r.getReversible() != False )
    self.assert_( r.getFast() == False )
    pass  

  def test_ReadSBML_SBML(self):
    s = wrapXML("<sbml level='1' version='1'> </sbml>")
    self.D = libsbml.readSBMLFromString(s)
    self.assert_( self.D.getLevel() == 1 )
    self.assert_( self.D.getVersion() == 1 )
    pass  

  def test_ReadSBML_Specie(self):
    s = wrapSBML_L1v1("<listOfSpecie>" + 
    "  <specie name='Glucose' compartment='cell' initialAmount='4.1'" + 
    "          units='volume' boundaryCondition='false' charge='6'/>" + 
    "</listOfSpecie>")
    self.D = libsbml.readSBMLFromString(s)
    self.M = self.D.getModel()
    self.assert_( self.M.getNumSpecies() == 1 )
    sp = self.M.getSpecies(0)
    self.assert_((  "Glucose"  == sp.getId() ))
    self.assert_((  "cell"     == sp.getCompartment() ))
    self.assert_((  "volume"   == sp.getUnits() ))
    self.assert_( sp.getInitialAmount() == 4.1 )
    self.assert_( sp.getBoundaryCondition() == False )
    self.assert_( sp.getCharge() == 6 )
    self.assert_( sp.isSetInitialAmount() == True )
    self.assert_( sp.isSetCharge() == True )
    pass  

  def test_ReadSBML_SpecieConcentrationRule(self):
    s = wrapSBML_L1v1("<listOfRules>" + 
    "  <specieConcentrationRule specie='s2' formula='k * t/(1 + k)'/>" + 
    "</listOfRules>")
    self.D = libsbml.readSBMLFromString(s)
    self.M = self.D.getModel()
    self.assert_( self.M.getNumRules() == 1 )
    scr = self.M.getRule(0)
    self.assertEqual( True, scr.isSpeciesConcentration() )
    self.assert_((  "s2" == scr.getVariable() ))
    self.assert_((  "k * t/(1 + k)"  == scr.getFormula() ))
    self.assert_( scr.getType() == libsbml.RULE_TYPE_SCALAR )
    pass  

  def test_ReadSBML_SpecieConcentrationRule_rate(self):
    s = wrapSBML_L1v1("<listOfRules>" + 
    "  <specieConcentrationRule specie='s2' formula='k * t/(1 + k)' " + 
    "                           type='rate'/>" + 
    "</listOfRules>")
    self.D = libsbml.readSBMLFromString(s)
    self.M = self.D.getModel()
    self.assert_( self.M.getNumRules() == 1 )
    scr = self.M.getRule(0)
    self.assertEqual( True, scr.isSpeciesConcentration() )
    self.assert_((  "s2" == scr.getVariable() ))
    self.assert_((  "k * t/(1 + k)"  == scr.getFormula() ))
    self.assert_( scr.getType() == libsbml.RULE_TYPE_RATE )
    pass  

  def test_ReadSBML_SpecieReference_Product(self):
    s = wrapSBML_L1v1("<listOfReactions>" + 
    "  <reaction name='reaction_1' reversible='false'>" + 
    "    <listOfProducts>" + 
    "      <specieReference specie='S1' stoichiometry='1'/>" + 
    "    </listOfProducts>" + 
    "  </reaction>" + 
    "</listOfReactions>")
    self.D = libsbml.readSBMLFromString(s)
    self.M = self.D.getModel()
    self.assert_( self.M.getNumReactions() == 1 )
    r = self.M.getReaction(0)
    self.assert_((  "reaction_1" == r.getId() ))
    self.assert_( r.getReversible() == False )
    self.assert_( r.getNumProducts() == 1 )
    sr = r.getProduct(0)
    self.assert_((  "S1" == sr.getSpecies() ))
    self.assert_( sr.getStoichiometry() == 1 )
    self.assert_( sr.getDenominator() == 1 )
    pass  

  def test_ReadSBML_SpecieReference_Reactant(self):
    s = wrapSBML_L1v1("<listOfReactions>" + 
    "  <reaction name='reaction_1' reversible='false'>" + 
    "    <listOfReactants>" + 
    "      <specieReference specie='X0' stoichiometry='1'/>" + 
    "    </listOfReactants>" + 
    "  </reaction>" + 
    "</listOfReactions>")
    self.D = libsbml.readSBMLFromString(s)
    self.M = self.D.getModel()
    self.assert_( self.M.getNumReactions() == 1 )
    r = self.M.getReaction(0)
    self.assert_((  "reaction_1" == r.getId() ))
    self.assert_( r.getReversible() == False )
    self.assert_( r.getNumReactants() == 1 )
    sr = r.getReactant(0)
    self.assert_((  "X0" == sr.getSpecies() ))
    self.assert_( sr.getStoichiometry() == 1 )
    self.assert_( sr.getDenominator() == 1 )
    pass  

  def test_ReadSBML_SpecieReference_defaults(self):
    s = wrapSBML_L1v1("<listOfReactions>" + 
    "  <reaction name='reaction_1' reversible='false'>" + 
    "    <listOfReactants>" + 
    "      <specieReference specie='X0'/>" + 
    "    </listOfReactants>" + 
    "  </reaction>" + 
    "</listOfReactions>")
    self.D = libsbml.readSBMLFromString(s)
    self.M = self.D.getModel()
    self.assert_( self.M.getNumReactions() == 1 )
    r = self.M.getReaction(0)
    self.assert_((  "reaction_1" == r.getId() ))
    self.assert_( r.getReversible() == False )
    self.assert_( r.getNumReactants() == 1 )
    sr = r.getReactant(0)
    self.assert_((  "X0" == sr.getSpecies() ))
    self.assert_( sr.getStoichiometry() == 1 )
    self.assert_( sr.getDenominator() == 1 )
    pass  

  def test_ReadSBML_Specie_defaults(self):
    s = wrapSBML_L1v1("<listOfSpecie>" + 
    "  <specie name='Glucose' compartment='cell' initialAmount='1.0'/>" + 
    "</listOfSpecie>")
    self.D = libsbml.readSBMLFromString(s)
    self.M = self.D.getModel()
    self.assert_( self.M.getNumSpecies() == 1 )
    sp = self.M.getSpecies(0)
    self.assert_((  "Glucose"  == sp.getId() ))
    self.assert_((  "cell"     == sp.getCompartment() ))
    self.assert_( sp.getInitialAmount() == 1.0 )
    self.assert_( sp.getBoundaryCondition() == False )
    self.assert_( sp.isSetInitialAmount() == True )
    self.assert_( sp.isSetCharge() == False )
    pass  

  def test_ReadSBML_Species(self):
    s = wrapSBML_L1v2("<listOfSpecies>" + 
    "  <species name='Glucose' compartment='cell' initialAmount='4.1'" + 
    "           units='volume' boundaryCondition='false' charge='6'/>" + 
    "</listOfSpecies>")
    self.D = libsbml.readSBMLFromString(s)
    self.M = self.D.getModel()
    self.assert_( self.M.getNumSpecies() == 1 )
    sp = self.M.getSpecies(0)
    self.assert_((  "Glucose"  == sp.getId() ))
    self.assert_((  "cell"     == sp.getCompartment() ))
    self.assert_((  "volume"   == sp.getUnits() ))
    self.assert_( sp.getInitialAmount() == 4.1 )
    self.assert_( sp.getBoundaryCondition() == False )
    self.assert_( sp.getCharge() == 6 )
    self.assert_( sp.isSetInitialAmount() == True )
    self.assert_( sp.isSetCharge() == True )
    pass  

  def test_ReadSBML_SpeciesConcentrationRule(self):
    s = wrapSBML_L1v2("<listOfRules>" + 
    "  <speciesConcentrationRule species='s2' formula='k * t/(1 + k)'/>" + 
    "</listOfRules>")
    self.D = libsbml.readSBMLFromString(s)
    self.M = self.D.getModel()
    self.assert_( self.M.getNumRules() == 1 )
    scr = self.M.getRule(0)
    self.assertEqual( True, scr.isSpeciesConcentration() )
    self.assert_((  "s2" == scr.getVariable() ))
    self.assert_((  "k * t/(1 + k)"  == scr.getFormula() ))
    self.assert_( scr.getType() == libsbml.RULE_TYPE_SCALAR )
    pass  

  def test_ReadSBML_SpeciesReference_StoichiometryMath_1(self):
    s = wrapSBML_L2v1("<listOfReactions>" + 
    "  <reaction name='r1'>" + 
    "    <listOfReactants>" + 
    "      <speciesReference species='X0'>" + 
    "        <stoichiometryMath>" + 
    "          <math> <ci> x </ci> </math>" + 
    "        </stoichiometryMath>" + 
    "      </speciesReference>" + 
    "    </listOfReactants>" + 
    "  </reaction>" + 
    "</listOfReactions>")
    self.D = libsbml.readSBMLFromString(s)
    self.M = self.D.getModel()
    self.assert_( self.M.getNumReactions() == 1 )
    r = self.M.getReaction(0)
    self.assert_( r != None )
    self.assert_( r.getNumReactants() == 1 )
    sr = r.getReactant(0)
    self.assert_( sr != None )
    self.assertEqual( True, sr.isSetStoichiometryMath() )
    math = sr.getStoichiometryMath()
    formula = libsbml.formulaToString(math.getMath())
    self.assert_( formula != None )
    self.assert_((  "x" == formula ))
    pass  

  def test_ReadSBML_SpeciesReference_StoichiometryMath_2(self):
    s = wrapSBML_L2v1("<listOfReactions>" + 
    "  <reaction name='r1'>" + 
    "    <listOfReactants>" + 
    "      <speciesReference species='X0'>" + 
    "        <stoichiometryMath>" + 
    "          <math> <cn type='rational'> 3 <sep/> 2 </cn> </math>" + 
    "        </stoichiometryMath>" + 
    "      </speciesReference>" + 
    "    </listOfReactants>" + 
    "  </reaction>" + 
    "</listOfReactions>")
    self.D = libsbml.readSBMLFromString(s)
    self.M = self.D.getModel()
    self.assert_( self.M.getNumReactions() == 1 )
    r = self.M.getReaction(0)
    self.assert_( r != None )
    self.assert_( r.getNumReactants() == 1 )
    sr = r.getReactant(0)
    self.assert_( sr != None )
    self.assertEqual( False, sr.isSetStoichiometryMath() )
    self.assert_( sr.getStoichiometry() == 3 )
    self.assert_( sr.getDenominator() == 2 )
    pass  

  def test_ReadSBML_SpeciesReference_defaults(self):
    s = wrapSBML_L1v2("<listOfReactions>" + 
    "  <reaction name='reaction_1' reversible='false'>" + 
    "    <listOfReactants>" + 
    "      <speciesReference species='X0'/>" + 
    "    </listOfReactants>" + 
    "  </reaction>" + 
    "</listOfReactions>")
    self.D = libsbml.readSBMLFromString(s)
    self.M = self.D.getModel()
    self.assert_( self.M.getNumReactions() == 1 )
    r = self.M.getReaction(0)
    self.assert_((  "reaction_1" == r.getId() ))
    self.assert_( r.getReversible() == False )
    self.assert_( r.getNumReactants() == 1 )
    sr = r.getReactant(0)
    self.assert_((  "X0" == sr.getSpecies() ))
    self.assert_( sr.getStoichiometry() == 1 )
    self.assert_( sr.getDenominator() == 1 )
    pass  

  def test_ReadSBML_Species_L2_1(self):
    s = wrapSBML_L2v1("<listOfSpecies>" + 
    "  <species id='Glucose' compartment='cell' initialConcentration='4.1'" + 
    "           substanceUnits='item' spatialSizeUnits='volume'" + 
    "           boundaryCondition='true' charge='6' constant='true'/>" + 
    "</listOfSpecies>")
    self.D = libsbml.readSBMLFromString(s)
    self.M = self.D.getModel()
    self.assert_( self.M.getNumSpecies() == 1 )
    sp = self.M.getSpecies(0)
    self.assertEqual( True, sp.isSetId() )
    self.assertEqual( False, sp.isSetName() )
    self.assertEqual( True, sp.isSetCompartment() )
    self.assertEqual( False, sp.isSetInitialAmount() )
    self.assertEqual( True, sp.isSetInitialConcentration() )
    self.assertEqual( True, sp.isSetSubstanceUnits() )
    self.assertEqual( True, sp.isSetSpatialSizeUnits() )
    self.assertEqual( True, sp.isSetCharge() )
    self.assert_((  "Glucose"  == sp.getId() ))
    self.assert_((  "cell"     == sp.getCompartment() ))
    self.assert_((  "item"     == sp.getSubstanceUnits() ))
    self.assert_((  "volume"   == sp.getSpatialSizeUnits() ))
    self.assert_( sp.getInitialConcentration() == 4.1 )
    self.assert_( sp.getHasOnlySubstanceUnits() == False )
    self.assert_( sp.getBoundaryCondition() == True )
    self.assert_( sp.getCharge() == 6 )
    self.assert_( sp.getConstant() == True )
    pass  

  def test_ReadSBML_Species_L2_2(self):
    s = wrapSBML_L2v1("<listOfSpecies>" + 
    "  <species id='s' compartment='c' hasOnlySubstanceUnits='true'/>" + 
    "</listOfSpecies>")
    self.D = libsbml.readSBMLFromString(s)
    self.M = self.D.getModel()
    self.assert_( self.M.getNumSpecies() == 1 )
    sp = self.M.getSpecies(0)
    self.assertEqual( True, sp.isSetId() )
    self.assertEqual( False, sp.isSetName() )
    self.assertEqual( True, sp.isSetCompartment() )
    self.assertEqual( False, sp.isSetInitialAmount() )
    self.assertEqual( False, sp.isSetInitialConcentration() )
    self.assertEqual( False, sp.isSetSubstanceUnits() )
    self.assertEqual( False, sp.isSetSpatialSizeUnits() )
    self.assertEqual( False, sp.isSetCharge() )
    self.assert_((  "s"  == sp.getId() ))
    self.assert_((  "c"  == sp.getCompartment() ))
    self.assert_( sp.getHasOnlySubstanceUnits() == True )
    self.assert_( sp.getBoundaryCondition() == False )
    self.assert_( sp.getConstant() == False )
    pass  

  def test_ReadSBML_Species_L2_defaults(self):
    s = wrapSBML_L2v1("<listOfSpecies>" + 
    "  <species id='Glucose_6_P' compartment='cell'/>" + 
    "</listOfSpecies>")
    self.D = libsbml.readSBMLFromString(s)
    self.M = self.D.getModel()
    self.assert_( self.M.getNumSpecies() == 1 )
    sp = self.M.getSpecies(0)
    self.assertEqual( True, sp.isSetId() )
    self.assertEqual( False, sp.isSetName() )
    self.assertEqual( True, sp.isSetCompartment() )
    self.assertEqual( False, sp.isSetInitialAmount() )
    self.assertEqual( False, sp.isSetInitialConcentration() )
    self.assertEqual( False, sp.isSetSubstanceUnits() )
    self.assertEqual( False, sp.isSetSpatialSizeUnits() )
    self.assertEqual( False, sp.isSetCharge() )
    self.assert_((  "Glucose_6_P"  == sp.getId() ))
    self.assert_((  "cell"         == sp.getCompartment() ))
    self.assert_( sp.getHasOnlySubstanceUnits() == False )
    self.assert_( sp.getBoundaryCondition() == False )
    self.assert_( sp.getConstant() == False )
    pass  

  def test_ReadSBML_Unit(self):
    s = wrapSBML_L1v2("<listOfUnitDefinitions>" + 
    "  <unitDefinition name='substance'>" + 
    "    <listOfUnits> <unit kind='mole' scale='-3'/> </listOfUnits>" + 
    "  </unitDefinition>" + 
    "</listOfUnitDefinitions>")
    self.D = libsbml.readSBMLFromString(s)
    self.M = self.D.getModel()
    self.assert_( self.M.getNumUnitDefinitions() == 1 )
    ud = self.M.getUnitDefinition(0)
    self.assert_((  "substance" == ud.getId() ))
    self.assert_( ud.getNumUnits() == 1 )
    u = ud.getUnit(0)
    self.assert_( u.getKind() == libsbml.UNIT_KIND_MOLE )
    self.assert_( u.getExponent() == 1 )
    self.assert_( u.getScale() == -3 )
    pass  

  def test_ReadSBML_UnitDefinition(self):
    s = wrapSBML_L1v2("<listOfUnitDefinitions>" + 
    "  <unitDefinition name='mmls'/>" + 
    "</listOfUnitDefinitions>")
    self.D = libsbml.readSBMLFromString(s)
    self.M = self.D.getModel()
    self.assert_( self.M.getNumUnitDefinitions() == 1 )
    ud = self.M.getUnitDefinition(0)
    self.assert_((  "mmls" == ud.getId() ))
    pass  

  def test_ReadSBML_UnitDefinition_L2(self):
    s = wrapSBML_L2v1("<listOfUnitDefinitions>" + 
    "  <unitDefinition id='mmls' name='mmol/ls'/>" + 
    "</listOfUnitDefinitions>")
    self.D = libsbml.readSBMLFromString(s)
    self.M = self.D.getModel()
    self.assert_( self.M.getNumUnitDefinitions() == 1 )
    ud = self.M.getUnitDefinition(0)
    self.assertEqual( True, ud.isSetId() )
    self.assertEqual( True, ud.isSetName() )
    self.assert_((  "mmls" == ud.getId() ))
    self.assert_((  "mmol/ls" == ud.getName() ))
    pass  

  def test_ReadSBML_Unit_L2(self):
    s = wrapSBML_L2v1("<listOfUnitDefinitions>" + 
    "  <unitDefinition id='Fahrenheit'>" + 
    "    <listOfUnits>" + 
    "      <unit kind='Celsius' multiplier='1.8' offset='32'/>" + 
    "    </listOfUnits>" + 
    "  </unitDefinition>" + 
    "</listOfUnitDefinitions>")
    self.D = libsbml.readSBMLFromString(s)
    self.M = self.D.getModel()
    self.assert_( self.M.getNumUnitDefinitions() == 1 )
    ud = self.M.getUnitDefinition(0)
    self.assertEqual( True, ud.isSetId() )
    self.assert_((  "Fahrenheit" == ud.getId() ))
    self.assert_( ud.getNumUnits() == 1 )
    u = ud.getUnit(0)
    self.assert_( u.getKind() == libsbml.UNIT_KIND_CELSIUS )
    self.assert_( u.getExponent() == 1 )
    self.assert_( u.getScale() == 0 )
    self.assert_( u.getMultiplier() == 1.8 )
    self.assert_( u.getOffset() == 32 )
    pass  

  def test_ReadSBML_Unit_defaults_L1_L2(self):
    s = wrapSBML_L1v2("<listOfUnitDefinitions>" + 
    "  <unitDefinition name='bogomips'>" + 
    "    <listOfUnits> <unit kind='second'/> </listOfUnits>" + 
    "  </unitDefinition>" + 
    "</listOfUnitDefinitions>")
    self.D = libsbml.readSBMLFromString(s)
    self.M = self.D.getModel()
    self.assert_( self.M.getNumUnitDefinitions() == 1 )
    ud = self.M.getUnitDefinition(0)
    self.assert_((  "bogomips" == ud.getId() ))
    self.assert_( ud.getNumUnits() == 1 )
    u = ud.getUnit(0)
    self.assert_( u.getKind() == libsbml.UNIT_KIND_SECOND )
    self.assert_( u.getExponent() == 1 )
    self.assert_( u.getScale() == 0 )
    self.assert_( u.getMultiplier() == 1.0 )
    self.assert_( u.getOffset() == 0.0 )
    pass  

  def test_ReadSBML_annotation(self):
    s = wrapSBML_L2v3("<annotation xmlns:mysim=\"http://www.mysim.org/ns\">" + 
    "  <mysim:nodecolors mysim:bgcolor=\"green\" mysim:fgcolor=\"white\">" + 
    "  </mysim:nodecolors>" + 
    "  <mysim:timestamp>2000-12-18 18:31 PST</mysim:timestamp>" + 
    "</annotation>")
    self.D = libsbml.readSBMLFromString(s)
    self.M = self.D.getModel()
    self.assert_( self.M.getAnnotation() != None )
    ann = self.M.getAnnotation()
    self.assert_( ann.getNumChildren() == 2 )
    pass  

  def test_ReadSBML_annotation_sbml(self):
    s = wrapXML("<sbml level=\"1\" version=\"1\">" + 
    "  <annotation xmlns:jd = \"http://www.sys-bio.org/sbml\">" + 
    "    <jd:header>" + 
    "      <VersionHeader SBMLVersion = \"1.0\"/>" + 
    "    </jd:header>" + 
    "    <jd:display>" + 
    "      <SBMLGraphicsHeader BackGroundColor = \"15728639\"/>" + 
    "    </jd:display>" + 
    "  </annotation>" + 
    "</sbml>")
    self.D = libsbml.readSBMLFromString(s)
    self.assert_( self.D.getNumErrors() > 0 )
    pass  

  def test_ReadSBML_annotation_sbml_L2(self):
    s = wrapXML("<sbml xmlns=\"http://www.sbml.org/sbml/level2\" level=\"2\" version=\"1\"> " + 
    "  <annotation>" + 
    "    <rdf xmlns=\"http://www.w3.org/1999/anything\">" + 
    "		 </rdf>" + 
    "	  </annotation>" + 
    "	  <model>" + 
    "   </model>" + 
    " </sbml>")
    self.D = libsbml.readSBMLFromString(s)
    self.M = self.D.getModel()
    self.assert_( self.D.getNumErrors() == 0 )
    pass  

  def test_ReadSBML_invalid_default_namespace(self):
    valid = wrapXML("<sbml xmlns=\"http://www.sbml.org/sbml/level2/version4\" level=\"2\" version=\"4\"> " + 
    "   <model>" + 
    "     <notes>" + 
    "       <p xmlns=\"http://www.w3.org/1999/xhtml\">Some text.</p>" + 
    "     </notes>" + 
    "     <annotation>" + 
    "       <example xmlns=\"http://www.example.org/\"/>" + 
    "     </annotation>" + 
    "     <listOfCompartments>" + 
    "       <compartment id=\"compartmentOne\" size=\"1\"/>" + 
    "     </listOfCompartments>" + 
    "     <listOfSpecies>" + 
    "       <species id=\"S1\" initialConcentration=\"1\" compartment=\"compartmentOne\"/>" + 
    "       <species id=\"S2\" initialConcentration=\"0\" compartment=\"compartmentOne\"/>" + 
    "     </listOfSpecies>" + 
    "     <listOfParameters>" + 
    "       <parameter id=\"t\" value = \"1\" units=\"second\"/>" + 
    "     </listOfParameters>" + 
    "     <listOfConstraints>" + 
    "       <constraint sboTerm=\"SBO:0000064\">" + 
    "         <math xmlns=\"http://www.w3.org/1998/Math/MathML\">" + 
    "           <apply>" + 
    "             <leq/>" + 
    "             <ci> S1 </ci>" + 
    "             <ci> t </ci>" + 
    "           </apply>" + 
    "         </math>" + 
    "         <message>" + 
    "           <p xmlns=\"http://www.w3.org/1999/xhtml\"> Species S1 is out of range </p>" + 
    "         </message>" + 
    "       </constraint>" + 
    "     </listOfConstraints>" + 
    "     <listOfReactions>" + 
    "       <reaction id=\"reaction_1\" reversible=\"false\">" + 
    "           <listOfReactants>" + 
    "             <speciesReference species=\"S1\"/>" + 
    "           </listOfReactants>" + 
    "           <listOfProducts>" + 
    "             <speciesReference species=\"S2\">" + 
    "             </speciesReference>" + 
    "           </listOfProducts>" + 
    "       </reaction>" + 
    "     </listOfReactions>" + 
    "   </model>" + 
    " </sbml>")
    invalid = wrapXML("<sbml xmlns=\"http://www.sbml.org/sbml/level2/version4\" level=\"2\" version=\"4\"> " + 
    "   <model xmlns=\"http://invalid/custom/default/uri\">" + 
    "     <notes xmlns=\"http://invalid/custom/default/uri/in/notes\">" + 
    "       <p xmlns=\"http://www.w3.org/1999/xhtml\">Some text.</p>" + 
    "     </notes>" + 
    "     <annotation xmlns=\"http://invalid/custom/default/uri/in/annotation\">" + 
    "       <example xmlns=\"http://www.example.org/\"/>" + 
    "     </annotation>" + 
    "     <listOfCompartments>" + 
    "       <compartment id=\"compartmentOne\" size=\"1\"/>" + 
    "     </listOfCompartments>" + 
    "     <listOfSpecies>" + 
    "       <notes xmlns=\"http://invalid/custom/default/uri/in/notes\">" + 
    "         <p xmlns=\"http://www.w3.org/1999/xhtml\">Some text.</p>" + 
    "       </notes>" + 
    "       <annotation xmlns=\"http://invalid/custom/default/uri/in/annotation\">" + 
    "         <example xmlns=\"http://www.example.org/\"/>" + 
    "       </annotation>" + 
    "       <species id=\"S1\" initialConcentration=\"1\" compartment=\"compartmentOne\"/>" + 
    "       <species id=\"S2\" initialConcentration=\"0\" compartment=\"compartmentOne\"/>" + 
    "     </listOfSpecies>" + 
    "     <listOfParameters>" + 
    "       <parameter id=\"t\" value = \"1\" units=\"second\"/>" + 
    "     </listOfParameters>" + 
    "     <listOfConstraints>" + 
    "       <constraint sboTerm=\"SBO:0000064\">" + 
    "         <math xmlns=\"http://www.w3.org/1998/Math/MathML\">" + 
    "           <apply>" + 
    "             <leq/>" + 
    "             <ci> S1 </ci>" + 
    "             <ci> t </ci>" + 
    "           </apply>" + 
    "         </math>" + 
    "         <message xmlns=\"http://invalid/custom/default/uri/in/message\">" + 
    "           <p xmlns=\"http://www.w3.org/1999/xhtml\"> Species S1 is out of range </p>" + 
    "         </message>" + 
    "       </constraint>" + 
    "     </listOfConstraints>" + 
    "     <listOfReactions>" + 
    "       <reaction id=\"reaction_1\" reversible=\"false\">" + 
    "           <listOfReactants>" + 
    "             <speciesReference xmlns=\"http://invalid/custom/default/uri\" species=\"S1\"/>" + 
    "           </listOfReactants>" + 
    "           <listOfProducts>" + 
    "             <speciesReference species=\"S2\">" + 
    "               <notes xmlns=\"http://invalid/custom/default/uri/in/notes\">" + 
    "                 <p xmlns=\"http://www.w3.org/1999/xhtml\">Some text.</p>" + 
    "               </notes>" + 
    "               <annotation xmlns=\"http://invalid/custom/default/uri/in/annotation\">" + 
    "                 <example xmlns=\"http://www.example.org/\"/>" + 
    "               </annotation>" + 
    "             </speciesReference>" + 
    "           </listOfProducts>" + 
    "       </reaction>" + 
    "     </listOfReactions>" + 
    "   </model>" + 
    " </sbml>")
    self.D = libsbml.readSBMLFromString(valid)
    self.assert_( self.D.getNumErrors() == 0 )
    self.D = None
    self.D = libsbml.readSBMLFromString(invalid)
    self.assert_( self.D.getNumErrors() == 9 )
    pass  

  def test_ReadSBML_line_col_numbers(self):
    setXMLParser()


    s = wrapString("<?xml version='1.0' encoding='UTF-8'?>\n" + 
    "<sbml xmlns='http://www.sbml.org/sbml/level2' level='2' version='1'>\n" + 
    "  <model id='testModel' name='testModel'>\n" + 
    "    <listOfReactions> <reaction/> </listOfReactions>\n" + 
    "  </model>\n" + 
    "</sbml>\n")
    self.D = libsbml.readSBMLFromString(s)
    self.M = self.D.getModel()
    self.assert_( self.M != None )
    sb = self.M
    sb = self.M.getListOfReactions()
    sb = self.M.getReaction(0)
    pass  

  def test_ReadSBML_metaid(self):
    s = wrapSBML_L2v1("<listOfFunctionDefinitions>" + 
    "  <functionDefinition metaid='fd'/>" + 
    "</listOfFunctionDefinitions>" + 
    "<listOfUnitDefinitions>" + 
    "  <unitDefinition metaid='ud'/>" + 
    "</listOfUnitDefinitions>" + 
    "<listOfCompartments>" + 
    "  <compartment metaid='c'/>" + 
    "</listOfCompartments>" + 
    "<listOfSpecies>" + 
    "  <species metaid='s'/>" + 
    "</listOfSpecies>" + 
    "<listOfParameters>" + 
    "  <parameter metaid='p'/>" + 
    "</listOfParameters>" + 
    "<listOfRules>" + 
    "  <rateRule metaid='rr'/>" + 
    "</listOfRules>" + 
    "<listOfReactions>" + 
    "  <reaction metaid='rx'/>" + 
    "</listOfReactions>" + 
    "<listOfEvents>" + 
    " <event metaid='e'/>" + 
    "</listOfEvents>")
    self.D = libsbml.readSBMLFromString(s)
    self.M = self.D.getModel()
    self.assert_( self.M != None )
    sb = self.M.getFunctionDefinition(0)
    self.assertEqual( True, sb.isSetMetaId() )
    self.assert_((  "fd" == sb.getMetaId() ))
    sb = self.M.getUnitDefinition(0)
    self.assertEqual( True, sb.isSetMetaId() )
    self.assert_((  "ud" == sb.getMetaId() ))
    sb = self.M.getCompartment(0)
    self.assertEqual( True, sb.isSetMetaId() )
    self.assert_((  "c" == sb.getMetaId() ))
    sb = self.M.getSpecies(0)
    self.assertEqual( True, sb.isSetMetaId() )
    self.assert_((  "s" == sb.getMetaId() ))
    sb = self.M.getParameter(0)
    self.assertEqual( True, sb.isSetMetaId() )
    self.assert_((  "p" == sb.getMetaId() ))
    sb = self.M.getRule(0)
    self.assertEqual( True, sb.isSetMetaId() )
    self.assert_((  "rr" == sb.getMetaId() ))
    sb = self.M.getReaction(0)
    self.assertEqual( True, sb.isSetMetaId() )
    self.assert_((  "rx" == sb.getMetaId() ))
    sb = self.M.getEvent(0)
    self.assertEqual( True, sb.isSetMetaId() )
    self.assert_((  "e" == sb.getMetaId() ))
    pass  

  def test_ReadSBML_metaid_Event(self):
    s = wrapSBML_L2v1("<listOfEvents>" + 
    "  <event metaid='e'>" + 
    "    <listOfEventAssignments metaid='loea'>" + 
    "      <eventAssignment metaid='ea'/>" + 
    "    </listOfEventAssignments>" + 
    "  </event>" + 
    "</listOfEvents>")
    self.D = libsbml.readSBMLFromString(s)
    self.M = self.D.getModel()
    self.assert_( self.M != None )
    e = self.M.getEvent(0)
    sb = e
    self.assertEqual( True, sb.isSetMetaId() )
    self.assert_((  "e" == sb.getMetaId() ))
    sb = e.getListOfEventAssignments()
    self.assertEqual( True, sb.isSetMetaId() )
    self.assert_((  "loea" == sb.getMetaId() ))
    sb = e.getEventAssignment(0)
    self.assertEqual( True, sb.isSetMetaId() )
    self.assert_((  "ea" == sb.getMetaId() ))
    pass  

  def test_ReadSBML_metaid_ListOf(self):
    s = wrapSBML_L2v1("<listOfFunctionDefinitions metaid='lofd'/>" + 
    "<listOfUnitDefinitions     metaid='loud'/>" + 
    "<listOfCompartments        metaid='loc'/>" + 
    "<listOfSpecies             metaid='los'/>" + 
    "<listOfParameters          metaid='lop'/>" + 
    "<listOfRules               metaid='lor'/>" + 
    "<listOfReactions           metaid='lorx'/>" + 
    "<listOfEvents              metaid='loe'/>")
    self.D = libsbml.readSBMLFromString(s)
    self.M = self.D.getModel()
    self.assert_( self.M != None )
    sb = self.M.getListOfFunctionDefinitions()
    self.assertEqual( True, sb.isSetMetaId() )
    self.assert_((  "lofd" == sb.getMetaId() ))
    sb = self.M.getListOfUnitDefinitions()
    self.assertEqual( True, sb.isSetMetaId() )
    self.assert_((  "loud" == sb.getMetaId() ))
    sb = self.M.getListOfCompartments()
    self.assertEqual( True, sb.isSetMetaId() )
    self.assert_((  "loc" == sb.getMetaId() ))
    sb = self.M.getListOfSpecies()
    self.assertEqual( True, sb.isSetMetaId() )
    self.assert_((  "los" == sb.getMetaId() ))
    sb = self.M.getListOfParameters()
    self.assertEqual( True, sb.isSetMetaId() )
    self.assert_((  "lop" == sb.getMetaId() ))
    sb = self.M.getListOfRules()
    self.assertEqual( True, sb.isSetMetaId() )
    self.assert_((  "lor" == sb.getMetaId() ))
    sb = self.M.getListOfReactions()
    self.assertEqual( True, sb.isSetMetaId() )
    self.assert_((  "lorx" == sb.getMetaId() ))
    sb = self.M.getListOfEvents()
    self.assertEqual( True, sb.isSetMetaId() )
    self.assert_((  "loe" == sb.getMetaId() ))
    pass  

  def test_ReadSBML_metaid_Reaction(self):
    s = wrapSBML_L2v1("<listOfReactions>" + 
    "  <reaction metaid='r'>" + 
    "    <listOfReactants metaid='lor'>" + 
    "      <speciesReference metaid='sr1'/>" + 
    "    </listOfReactants>" + 
    "    <listOfProducts metaid='lop'>" + 
    "      <speciesReference metaid='sr2'/>" + 
    "    </listOfProducts>" + 
    "    <listOfModifiers metaid='lom'>" + 
    "      <modifierSpeciesReference metaid='msr'/>" + 
    "    </listOfModifiers>" + 
    "    <kineticLaw metaid='kl'/>" + 
    "  </reaction>" + 
    "</listOfReactions>")
    self.D = libsbml.readSBMLFromString(s)
    self.M = self.D.getModel()
    self.assert_( self.M != None )
    r = self.M.getReaction(0)
    sb = r
    self.assertEqual( True, sb.isSetMetaId() )
    self.assert_((  "r" == sb.getMetaId() ))
    sb = r.getListOfReactants()
    self.assertEqual( True, sb.isSetMetaId() )
    self.assert_((  "lor" == sb.getMetaId() ))
    sb = r.getReactant(0)
    self.assertEqual( True, sb.isSetMetaId() )
    self.assert_((  "sr1" == sb.getMetaId() ))
    sb = r.getListOfProducts()
    self.assertEqual( True, sb.isSetMetaId() )
    self.assert_((  "lop" == sb.getMetaId() ))
    sb = r.getProduct(0)
    self.assertEqual( True, sb.isSetMetaId() )
    self.assert_((  "sr2" == sb.getMetaId() ))
    sb = r.getListOfModifiers()
    self.assertEqual( True, sb.isSetMetaId() )
    self.assert_((  "lom" == sb.getMetaId() ))
    sb = r.getModifier(0)
    self.assertEqual( True, sb.isSetMetaId() )
    self.assert_((  "msr" == sb.getMetaId() ))
    sb = r.getKineticLaw()
    self.assertEqual( True, sb.isSetMetaId() )
    self.assert_((  "kl" == sb.getMetaId() ))
    pass  

  def test_ReadSBML_metaid_Unit(self):
    s = wrapSBML_L2v1("<listOfUnitDefinitions>" + 
    "  <unitDefinition metaid='ud'>" + 
    "    <listOfUnits metaid='lou'>" + 
    "      <unit metaid='u'/>" + 
    "    </listOfUnits>" + 
    "  </unitDefinition>" + 
    "</listOfUnitDefinitions>")
    self.D = libsbml.readSBMLFromString(s)
    self.M = self.D.getModel()
    self.assert_( self.M != None )
    ud = self.M.getUnitDefinition(0)
    sb = ud
    self.assertEqual( True, sb.isSetMetaId() )
    self.assert_((  "ud" == sb.getMetaId() ))
    sb = ud.getListOfUnits()
    self.assertEqual( True, sb.isSetMetaId() )
    self.assert_((  "lou" == sb.getMetaId() ))
    sb = ud.getUnit(0)
    self.assertEqual( True, sb.isSetMetaId() )
    self.assert_((  "u" == sb.getMetaId() ))
    pass  

  def test_ReadSBML_notes(self):
    s = wrapSBML_L2v3("<listOfReactions>" + 
    "<reaction name='J1'>" + 
    "  <kineticLaw formula='k1*X0'>" + 
    "    <notes>This is a test note.</notes>" + 
    "    <listOfParameters>" + 
    "      <parameter name='k1' value='0'/>" + 
    "    </listOfParameters>" + 
    "  </kineticLaw>" + 
    "</reaction>" + 
    "</listOfReactions>")
    self.D = libsbml.readSBMLFromString(s)
    self.M = self.D.getModel()
    r = self.M.getReaction(0)
    kl = r.getKineticLaw()
    self.assert_( kl.getNotes() != None )
    notes = kl.getNotes().getChild(0).getCharacters()
    self.assert_( (  "This is a test note." != notes ) == False )
    pass  

  def test_ReadSBML_notes_ListOf(self):
    s = wrapSBML_L2v1("<listOfFunctionDefinitions>" + 
    "  <notes>My Functions</notes>" + 
    "  <functionDefinition/>" + 
    "</listOfFunctionDefinitions>" + 
    "<listOfUnitDefinitions>" + 
    "  <notes>My Units</notes>" + 
    "  <unitDefinition/>" + 
    "</listOfUnitDefinitions>" + 
    "<listOfCompartments>" + 
    "  <notes>My Compartments</notes>" + 
    "  <compartment/>" + 
    "</listOfCompartments>")
    self.D = libsbml.readSBMLFromString(s)
    self.M = self.D.getModel()
    self.assert_( self.M != None )
    sb = self.M.getListOfFunctionDefinitions()
    self.assertEqual( True, sb.isSetNotes() )
    notes = sb.getNotes().getChild(0).getCharacters()
    self.assert_( (  "My Functions" != notes ) == False )
    sb = self.M.getListOfUnitDefinitions()
    self.assertEqual( True, sb.isSetNotes() )
    notes = sb.getNotes().getChild(0).getCharacters()
    self.assert_( (  "My Units" != notes ) == False )
    sb = self.M.getListOfCompartments()
    self.assertEqual( True, sb.isSetNotes() )
    notes = sb.getNotes().getChild(0).getCharacters()
    self.assert_( (  "My Compartments" != notes ) == False )
    pass  

  def test_ReadSBML_notes_sbml(self):
    s = wrapXML("<sbml level='1' version='1'>" + 
    "  <notes>Notes are not allowed as part of the SBML element.</notes>" + 
    "</sbml>")
    self.D = libsbml.readSBMLFromString(s)
    self.assert_( self.D.getNotes() != None )
    notes = self.D.getNotes().getChild(0).getCharacters()
    self.assert_( (  "Notes are not allowed as part of the SBML element." != notes ) == False )
    self.assert_( self.D.getNumErrors() > 0 )
    pass  

  def test_ReadSBML_notes_sbml_L2(self):
    s = wrapXML("<sbml xmlns=\"http://www.sbml.org/sbml/level2\" level=\"2\" version=\"1\"> " + 
    "  <notes>" + 
    "    <html xmlns=\"http://www.w3.org/1999/xhtml\">" + 
    "		 </html>" + 
    "	  </notes>" + 
    "	  <model>" + 
    "   </model>" + 
    " </sbml>")
    self.D = libsbml.readSBMLFromString(s)
    self.assert_( self.D.getNotes() != None )
    self.assert_( self.D.getNumErrors() == 0 )
    pass  

  def test_ReadSBML_notes_xmlns(self):
    s = wrapSBML_L2v3("<notes>" + 
    "  <body xmlns=\"http://www.w3.org/1999/xhtml\">Some text.</body>" + 
    "</notes>")
    self.D = libsbml.readSBMLFromString(s)
    self.M = self.D.getModel()
    self.assert_( self.M.getNotes() != None )
    ns = self.M.getNotes().getChild(0).getNamespaces()
    self.assert_( ns.getLength() == 1 )
    self.assert_((  "http://www.w3.org/1999/xhtml" == ns.getURI(0) ))
    notes = self.M.getNotes().getChild(0).getChild(0).getCharacters()
    self.assert_( (  "Some text." != notes ) == False )
    pass  

def suite():
  suite = unittest.TestSuite()
  suite.addTest(unittest.makeSuite(TestReadSBML))

  return suite

if __name__ == "__main__":
  if unittest.TextTestRunner(verbosity=1).run(suite()).wasSuccessful() :
    sys.exit(0)
  else:
    sys.exit(1)
