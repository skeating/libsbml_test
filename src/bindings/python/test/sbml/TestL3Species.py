#
# @file    TestL3Species.py
# @brief   L3 Species unit tests
#
# @author  Akiya Jouraku (Python conversion)
# @author  Sarah Keating 
#
# $Id$
# $HeadURL$
#
# This test file was converted from src/sbml/test/TestL3Species.c
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

def isnan(x):
  return (x != x)
  pass
class TestL3Species(unittest.TestCase):

  S = None

  def setUp(self):
    self.S = libsbml.Species(3,1)
    if (self.S == None):
      pass    
    pass  

  def tearDown(self):
    self.S = None
    pass  

  def test_L3_Species_ModelHistory(self):
    history = libsbml.ModelHistory()
    i = self.S.setModelHistory(history)
    self.assert_( i == libsbml.LIBSBML_INVALID_OBJECT )
    self.assertEqual( False, self.S.isSetModelHistory() )
    mc = libsbml.ModelCreator()
    date = libsbml.Date(2005,12,30,12,15,45,1,2,0)
    mc.setFamilyName( "Keating")
    mc.setGivenName( "Sarah")
    mc.setEmail( "sbml-team@caltech.edu")
    mc.setOrganisation( "UH")
    history.addCreator(mc)
    history.setCreatedDate(date)
    history.setModifiedDate(date)
    i = self.S.setModelHistory(history)
    self.assert_( i == libsbml.LIBSBML_OPERATION_SUCCESS )
    self.assertEqual( True, self.S.isSetModelHistory() )
    i = self.S.unsetModelHistory()
    self.assert_( i == libsbml.LIBSBML_OPERATION_SUCCESS )
    self.assertEqual( False, self.S.isSetModelHistory() )
    self.assert_( self.S.getModelHistory() == None )
    history = None
    pass  

  def test_L3_Species_NS(self):
    self.assert_( self.S.getNamespaces() != None )
    self.assert_( self.S.getNamespaces().getLength() == 1 )
    self.assert_((     "http://www.sbml.org/sbml/level3/version1/core" == self.S.getNamespaces().getURI(0) ))
    pass  

  def test_L3_Species_boundaryCondition(self):
    self.assert_( self.S.isSetBoundaryCondition() == False )
    self.S.setBoundaryCondition(True)
    self.assert_( self.S.getBoundaryCondition() == True )
    self.assert_( self.S.isSetBoundaryCondition() == True )
    self.S.setBoundaryCondition(False)
    self.assert_( self.S.getBoundaryCondition() == False )
    self.assert_( self.S.isSetBoundaryCondition() == True )
    pass  

  def test_L3_Species_compartment(self):
    compartment =  "cell";
    self.assertEqual( False, self.S.isSetCompartment() )
    self.S.setCompartment(compartment)
    self.assert_(( compartment == self.S.getCompartment() ))
    self.assertEqual( True, self.S.isSetCompartment() )
    if (self.S.getCompartment() == compartment):
      pass    
    pass  

  def test_L3_Species_constant(self):
    self.assert_( self.S.isSetConstant() == False )
    self.S.setConstant(True)
    self.assert_( self.S.getConstant() == True )
    self.assert_( self.S.isSetConstant() == True )
    self.S.setConstant(False)
    self.assert_( self.S.getConstant() == False )
    self.assert_( self.S.isSetConstant() == True )
    pass  

  def test_L3_Species_conversionFactor(self):
    units =  "volume";
    self.assertEqual( False, self.S.isSetConversionFactor() )
    self.S.setConversionFactor(units)
    self.assert_(( units == self.S.getConversionFactor() ))
    self.assertEqual( True, self.S.isSetConversionFactor() )
    if (self.S.getConversionFactor() == units):
      pass    
    self.S.unsetConversionFactor()
    self.assertEqual( False, self.S.isSetConversionFactor() )
    if (self.S.getConversionFactor() != None):
      pass    
    pass  

  def test_L3_Species_create(self):
    self.assert_( self.S.getTypeCode() == libsbml.SBML_SPECIES )
    self.assert_( self.S.getMetaId() == "" )
    self.assert_( self.S.getNotes() == None )
    self.assert_( self.S.getAnnotation() == None )
    self.assert_( self.S.getId() == "" )
    self.assert_( self.S.getName() == "" )
    self.assert_( self.S.getCompartment() == "" )
    self.assertEqual( True, isnan(self.S.getInitialAmount()) )
    self.assertEqual( True, isnan(self.S.getInitialConcentration()) )
    self.assert_( self.S.getSubstanceUnits() == "" )
    self.assert_( self.S.getHasOnlySubstanceUnits() == False )
    self.assert_( self.S.getBoundaryCondition() == False )
    self.assert_( self.S.getConstant() == False )
    self.assert_( self.S.getConversionFactor() == "" )
    self.assertEqual( False, self.S.isSetId() )
    self.assertEqual( False, self.S.isSetName() )
    self.assertEqual( False, self.S.isSetCompartment() )
    self.assertEqual( False, self.S.isSetInitialAmount() )
    self.assertEqual( False, self.S.isSetInitialConcentration() )
    self.assertEqual( False, self.S.isSetSubstanceUnits() )
    self.assertEqual( False, self.S.isSetHasOnlySubstanceUnits() )
    self.assertEqual( False, self.S.isSetBoundaryCondition() )
    self.assertEqual( False, self.S.isSetConstant() )
    self.assertEqual( False, self.S.isSetConversionFactor() )
    pass  

  def test_L3_Species_createWithNS(self):
    xmlns = libsbml.XMLNamespaces()
    xmlns.add( "http://www.sbml.org", "testsbml")
    sbmlns = libsbml.SBMLNamespaces(3,1)
    sbmlns.addNamespaces(xmlns)
    s = libsbml.Species(sbmlns)
    self.assert_( s.getTypeCode() == libsbml.SBML_SPECIES )
    self.assert_( s.getMetaId() == "" )
    self.assert_( s.getNotes() == None )
    self.assert_( s.getAnnotation() == None )
    self.assert_( s.getLevel() == 3 )
    self.assert_( s.getVersion() == 1 )
    self.assert_( s.getNamespaces() != None )
    self.assert_( s.getNamespaces().getLength() == 2 )
    self.assert_( s.getId() == "" )
    self.assert_( s.getName() == "" )
    self.assert_( s.getCompartment() == "" )
    self.assertEqual( True, isnan(s.getInitialAmount()) )
    self.assertEqual( True, isnan(s.getInitialConcentration()) )
    self.assert_( s.getSubstanceUnits() == "" )
    self.assert_( s.getHasOnlySubstanceUnits() == False )
    self.assert_( s.getBoundaryCondition() == False )
    self.assert_( s.getConstant() == False )
    self.assert_( s.getConversionFactor() == "" )
    self.assertEqual( False, s.isSetId() )
    self.assertEqual( False, s.isSetName() )
    self.assertEqual( False, s.isSetCompartment() )
    self.assertEqual( False, s.isSetInitialAmount() )
    self.assertEqual( False, s.isSetInitialConcentration() )
    self.assertEqual( False, s.isSetSubstanceUnits() )
    self.assertEqual( False, s.isSetHasOnlySubstanceUnits() )
    self.assertEqual( False, s.isSetBoundaryCondition() )
    self.assertEqual( False, s.isSetConstant() )
    self.assertEqual( False, s.isSetConversionFactor() )
    s = None
    pass  

  def test_L3_Species_free_NULL(self):
    pass  

  def test_L3_Species_hasOnlySubstanceUnits(self):
    self.assert_( self.S.isSetHasOnlySubstanceUnits() == False )
    self.S.setHasOnlySubstanceUnits(True)
    self.assert_( self.S.getHasOnlySubstanceUnits() == True )
    self.assert_( self.S.isSetHasOnlySubstanceUnits() == True )
    self.S.setHasOnlySubstanceUnits(False)
    self.assert_( self.S.getHasOnlySubstanceUnits() == False )
    self.assert_( self.S.isSetHasOnlySubstanceUnits() == True )
    pass  

  def test_L3_Species_hasRequiredAttributes(self):
    s = libsbml.Species(3,1)
    self.assertEqual( False, s.hasRequiredAttributes() )
    s.setId( "id")
    self.assertEqual( False, s.hasRequiredAttributes() )
    s.setCompartment( "cell")
    self.assertEqual( False, s.hasRequiredAttributes() )
    s.setHasOnlySubstanceUnits(False)
    self.assertEqual( False, s.hasRequiredAttributes() )
    s.setBoundaryCondition(False)
    self.assertEqual( False, s.hasRequiredAttributes() )
    s.setConstant(False)
    self.assertEqual( True, s.hasRequiredAttributes() )
    s = None
    pass  

  def test_L3_Species_id(self):
    id =  "mitochondria";
    self.assertEqual( False, self.S.isSetId() )
    self.S.setId(id)
    self.assert_(( id == self.S.getId() ))
    self.assertEqual( True, self.S.isSetId() )
    if (self.S.getId() == id):
      pass    
    pass  

  def test_L3_Species_initialAmount(self):
    initialAmount = 0.2
    self.assertEqual( False, self.S.isSetInitialAmount() )
    self.assertEqual( True, isnan(self.S.getInitialAmount()) )
    self.S.setInitialAmount(initialAmount)
    self.assert_( self.S.getInitialAmount() == initialAmount )
    self.assertEqual( True, self.S.isSetInitialAmount() )
    self.S.unsetInitialAmount()
    self.assertEqual( False, self.S.isSetInitialAmount() )
    self.assertEqual( True, isnan(self.S.getInitialAmount()) )
    pass  

  def test_L3_Species_initialConcentration(self):
    initialConcentration = 0.2
    self.assertEqual( False, self.S.isSetInitialConcentration() )
    self.assertEqual( True, isnan(self.S.getInitialConcentration()) )
    self.S.setInitialConcentration(initialConcentration)
    self.assert_( self.S.getInitialConcentration() == initialConcentration )
    self.assertEqual( True, self.S.isSetInitialConcentration() )
    self.S.unsetInitialConcentration()
    self.assertEqual( False, self.S.isSetInitialConcentration() )
    self.assertEqual( True, isnan(self.S.getInitialConcentration()) )
    pass  

  def test_L3_Species_name(self):
    name =  "My_Favorite_Factory";
    self.assertEqual( False, self.S.isSetName() )
    self.S.setName(name)
    self.assert_(( name == self.S.getName() ))
    self.assertEqual( True, self.S.isSetName() )
    if (self.S.getName() == name):
      pass    
    self.S.unsetName()
    self.assertEqual( False, self.S.isSetName() )
    if (self.S.getName() != None):
      pass    
    pass  

  def test_L3_Species_substanceUnits(self):
    units =  "volume";
    self.assertEqual( False, self.S.isSetSubstanceUnits() )
    self.S.setSubstanceUnits(units)
    self.assert_(( units == self.S.getSubstanceUnits() ))
    self.assertEqual( True, self.S.isSetSubstanceUnits() )
    if (self.S.getSubstanceUnits() == units):
      pass    
    self.S.unsetSubstanceUnits()
    self.assertEqual( False, self.S.isSetSubstanceUnits() )
    if (self.S.getSubstanceUnits() != None):
      pass    
    pass  

def suite():
  suite = unittest.TestSuite()
  suite.addTest(unittest.makeSuite(TestL3Species))

  return suite

if __name__ == "__main__":
  if unittest.TextTestRunner(verbosity=1).run(suite()).wasSuccessful() :
    sys.exit(0)
  else:
    sys.exit(1)
