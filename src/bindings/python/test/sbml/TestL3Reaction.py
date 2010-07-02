#
# @file    TestL3Reaction.py
# @brief   L3 Reaction unit tests
#
# @author  Akiya Jouraku (Python conversion)
# @author  Sarah Keating 
#
# $Id$
# $HeadURL$
#
# This test file was converted from src/sbml/test/TestL3Reaction.c
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


class TestL3Reaction(unittest.TestCase):

  global R
  R = None

  def setUp(self):
    self.R = libsbml.Reaction(3,1)
    if (self.R == None):
      pass    
    pass  

  def tearDown(self):
    _dummyList = [ self.R ]; _dummyList[:] = []; del _dummyList
    pass  

  def test_L3_Reaction_NS(self):
    self.assert_( self.R.getNamespaces() != None )
    self.assert_( self.R.getNamespaces().getLength() == 1 )
    self.assert_((     "http://www.sbml.org/sbml/level3/version1/core" == self.R.getNamespaces().getURI(0) ))
    pass  

  def test_L3_Reaction_compartment(self):
    compartment =  "cell";
    self.assertEqual( False, self.R.isSetCompartment() )
    self.R.setCompartment(compartment)
    self.assert_(( compartment == self.R.getCompartment() ))
    self.assertEqual( True, self.R.isSetCompartment() )
    if (self.R.getCompartment() == compartment):
      pass    
    self.R.unsetCompartment()
    self.assertEqual( False, self.R.isSetCompartment() )
    if (self.R.getCompartment() != None):
      pass    
    pass  

  def test_L3_Reaction_create(self):
    self.assert_( self.R.getTypeCode() == libsbml.SBML_REACTION )
    self.assert_( self.R.getMetaId() == "" )
    self.assert_( self.R.getNotes() == None )
    self.assert_( self.R.getAnnotation() == None )
    self.assert_( self.R.getId() == "" )
    self.assert_( self.R.getName() == "" )
    self.assert_( self.R.getCompartment() == "" )
    self.assert_( self.R.getFast() == False )
    self.assert_( self.R.getReversible() == True )
    self.assertEqual( False, self.R.isSetId() )
    self.assertEqual( False, self.R.isSetName() )
    self.assertEqual( False, self.R.isSetCompartment() )
    self.assertEqual( False, self.R.isSetFast() )
    self.assertEqual( False, self.R.isSetReversible() )
    pass  

  def test_L3_Reaction_createWithNS(self):
    xmlns = libsbml.XMLNamespaces()
    xmlns.add( "http://www.sbml.org", "testsbml")
    sbmlns = libsbml.SBMLNamespaces(3,1)
    sbmlns.addNamespaces(xmlns)
    r = libsbml.Reaction(sbmlns)
    self.assert_( r.getTypeCode() == libsbml.SBML_REACTION )
    self.assert_( r.getMetaId() == "" )
    self.assert_( r.getNotes() == None )
    self.assert_( r.getAnnotation() == None )
    self.assert_( r.getLevel() == 3 )
    self.assert_( r.getVersion() == 1 )
    self.assert_( r.getNamespaces() != None )
    self.assert_( r.getNamespaces().getLength() == 2 )
    self.assert_( r.getId() == "" )
    self.assert_( r.getName() == "" )
    self.assert_( r.getCompartment() == "" )
    self.assert_( r.getFast() == False )
    self.assert_( r.getReversible() == True )
    self.assertEqual( False, r.isSetId() )
    self.assertEqual( False, r.isSetName() )
    self.assertEqual( False, r.isSetCompartment() )
    self.assertEqual( False, r.isSetFast() )
    self.assertEqual( False, r.isSetReversible() )
    _dummyList = [ r ]; _dummyList[:] = []; del _dummyList
    pass  

  def test_L3_Reaction_fast(self):
    self.assert_( self.R.isSetFast() == False )
    self.R.setFast(True)
    self.assert_( self.R.getFast() == True )
    self.assert_( self.R.isSetFast() == True )
    self.R.setFast(False)
    self.assert_( self.R.getFast() == False )
    self.assert_( self.R.isSetFast() == True )
    pass  

  def test_L3_Reaction_free_NULL(self):
    _dummyList = [ None ]; _dummyList[:] = []; del _dummyList
    pass  

  def test_L3_Reaction_hasRequiredAttributes(self):
    r = libsbml.Reaction(3,1)
    self.assertEqual( False, r.hasRequiredAttributes() )
    r.setId( "id")
    self.assertEqual( False, r.hasRequiredAttributes() )
    r.setFast(False)
    self.assertEqual( False, r.hasRequiredAttributes() )
    r.setReversible(False)
    self.assertEqual( True, r.hasRequiredAttributes() )
    _dummyList = [ r ]; _dummyList[:] = []; del _dummyList
    pass  

  def test_L3_Reaction_id(self):
    id =  "mitochondria";
    self.assertEqual( False, self.R.isSetId() )
    self.R.setId(id)
    self.assert_(( id == self.R.getId() ))
    self.assertEqual( True, self.R.isSetId() )
    if (self.R.getId() == id):
      pass    
    pass  

  def test_L3_Reaction_name(self):
    name =  "My_Favorite_Factory";
    self.assertEqual( False, self.R.isSetName() )
    self.R.setName(name)
    self.assert_(( name == self.R.getName() ))
    self.assertEqual( True, self.R.isSetName() )
    if (self.R.getName() == name):
      pass    
    self.R.unsetName()
    self.assertEqual( False, self.R.isSetName() )
    if (self.R.getName() != None):
      pass    
    pass  

  def test_L3_Reaction_reversible(self):
    self.assert_( self.R.isSetReversible() == False )
    self.R.setReversible(True)
    self.assert_( self.R.getReversible() == True )
    self.assert_( self.R.isSetReversible() == True )
    self.R.setReversible(False)
    self.assert_( self.R.getReversible() == False )
    self.assert_( self.R.isSetReversible() == True )
    pass  

def suite():
  suite = unittest.TestSuite()
  suite.addTest(unittest.makeSuite(TestL3Reaction))

  return suite

if __name__ == "__main__":
  if unittest.TextTestRunner(verbosity=1).run(suite()).wasSuccessful() :
    sys.exit(0)
  else:
    sys.exit(1)
