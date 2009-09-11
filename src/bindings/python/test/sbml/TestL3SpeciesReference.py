#
# @file    TestL3SpeciesReference.py
# @brief   L3 SpeciesReference unit tests
#
# @author  Akiya Jouraku (Python conversion)
# @author  Sarah Keating 
#
# $Id$
# $HeadURL$
#
# This test file was converted from src/sbml/test/TestL3SpeciesReference.c
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
import sys
import unittest
import libsbml

def isnan(x):
  return (x != x)
  pass
class TestL3SpeciesReference(unittest.TestCase):

  SR = None

  def setUp(self):
    self.SR = libsbml.SpeciesReference(3,1)
    if (self.SR == None):
      pass    
    pass  

  def tearDown(self):
    self.SR = None
    pass  

  def test_L3_SpeciesReference_constant(self):
    self.assert_( self.SR.isSetConstant() == False )
    self.SR.setConstant(True)
    self.assert_( self.SR.getConstant() == True )
    self.assert_( self.SR.isSetConstant() == True )
    self.SR.setConstant(False)
    self.assert_( self.SR.getConstant() == False )
    self.assert_( self.SR.isSetConstant() == True )
    pass  

  def test_L3_SpeciesReference_create(self):
    self.assert_( self.SR.getTypeCode() == libsbml.SBML_SPECIES_REFERENCE )
    self.assert_( self.SR.getMetaId() == "" )
    self.assert_( self.SR.getNotes() == None )
    self.assert_( self.SR.getAnnotation() == None )
    self.assert_( self.SR.getId() == "" )
    self.assert_( self.SR.getName() == "" )
    self.assert_( self.SR.getSpecies() == "" )
    self.assertEqual( True, isnan(self.SR.getStoichiometry()) )
    self.assert_( self.SR.getConstant() == False )
    self.assertEqual( False, self.SR.isSetId() )
    self.assertEqual( False, self.SR.isSetName() )
    self.assertEqual( False, self.SR.isSetSpecies() )
    self.assertEqual( False, self.SR.isSetStoichiometry() )
    self.assertEqual( False, self.SR.isSetConstant() )
    pass  

  def test_L3_SpeciesReference_createWithNS(self):
    xmlns = libsbml.XMLNamespaces()
    xmlns.add( "http://www.sbml.org", "testsbml")
    sbmlns = libsbml.SBMLNamespaces(3,1)
    sbmlns.addNamespaces(xmlns)
    sr = libsbml.SpeciesReference(sbmlns)
    self.assert_( sr.getTypeCode() == libsbml.SBML_SPECIES_REFERENCE )
    self.assert_( sr.getMetaId() == "" )
    self.assert_( sr.getNotes() == None )
    self.assert_( sr.getAnnotation() == None )
    self.assert_( sr.getLevel() == 3 )
    self.assert_( sr.getVersion() == 1 )
    self.assert_( sr.getNamespaces() != None )
    self.assert_( sr.getNamespaces().getLength() == 2 )
    self.assert_( sr.getId() == "" )
    self.assert_( sr.getName() == "" )
    self.assert_( sr.getSpecies() == "" )
    self.assertEqual( True, isnan(sr.getStoichiometry()) )
    self.assert_( sr.getConstant() == False )
    self.assertEqual( False, sr.isSetId() )
    self.assertEqual( False, sr.isSetName() )
    self.assertEqual( False, sr.isSetSpecies() )
    self.assertEqual( False, sr.isSetStoichiometry() )
    self.assertEqual( False, sr.isSetConstant() )
    sr = None
    pass  

  def test_L3_SpeciesReference_free_NULL(self):
    pass  

  def test_L3_SpeciesReference_hasRequiredAttributes(self):
    sr = libsbml.SpeciesReference(3,1)
    self.assertEqual( False, sr.hasRequiredAttributes() )
    sr.setSpecies( "id")
    self.assertEqual( False, sr.hasRequiredAttributes() )
    sr.setConstant(False)
    self.assertEqual( True, sr.hasRequiredAttributes() )
    sr = None
    pass  

  def test_L3_SpeciesReference_id(self):
    id =  "mitochondria";
    self.assertEqual( False, self.SR.isSetId() )
    self.SR.setId(id)
    self.assert_(( id == self.SR.getId() ))
    self.assertEqual( True, self.SR.isSetId() )
    if (self.SR.getId() == id):
      pass    
    pass  

  def test_L3_SpeciesReference_name(self):
    name =  "My_Favorite_Factory";
    self.assertEqual( False, self.SR.isSetName() )
    self.SR.setName(name)
    self.assert_(( name == self.SR.getName() ))
    self.assertEqual( True, self.SR.isSetName() )
    if (self.SR.getName() == name):
      pass    
    self.SR.unsetName()
    self.assertEqual( False, self.SR.isSetName() )
    if (self.SR.getName() != None):
      pass    
    pass  

  def test_L3_SpeciesReference_species(self):
    species =  "cell";
    self.assertEqual( False, self.SR.isSetSpecies() )
    self.SR.setSpecies(species)
    self.assert_(( species == self.SR.getSpecies() ))
    self.assertEqual( True, self.SR.isSetSpecies() )
    if (self.SR.getSpecies() == species):
      pass    
    pass  

  def test_L3_SpeciesReference_stoichiometry(self):
    stoichiometry = 0.2
    self.assertEqual( False, self.SR.isSetStoichiometry() )
    self.assertEqual( True, isnan(self.SR.getStoichiometry()) )
    self.SR.setStoichiometry(stoichiometry)
    self.assert_( self.SR.getStoichiometry() == stoichiometry )
    self.assertEqual( True, self.SR.isSetStoichiometry() )
    self.SR.unsetStoichiometry()
    self.assertEqual( False, self.SR.isSetStoichiometry() )
    self.assertEqual( True, isnan(self.SR.getStoichiometry()) )
    pass  

def suite():
  suite = unittest.TestSuite()
  suite.addTest(unittest.makeSuite(TestL3SpeciesReference))

  return suite

if __name__ == "__main__":
  if unittest.TextTestRunner(verbosity=1).run(suite()).wasSuccessful() :
    sys.exit(0)
  else:
    sys.exit(1)
