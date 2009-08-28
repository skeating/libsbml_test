#
# @file    TestParameter.py
# @brief   Parameter unit tests
#
# @author  Akiya Jouraku (Python conversion)
# @author  Ben Bornstein 
#
# $Id$
# $HeadURL$
#
# This test file was converted from src/sbml/test/TestParameter.c
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

class TestParameter(unittest.TestCase):

  P = None

  def setUp(self):
    self.P = libsbml.Parameter(2,4)
    if (self.P == None):
      pass    
    pass  

  def tearDown(self):
    self.P = None
    pass  

  def test_Parameter_create(self):
    self.assert_( self.P.getTypeCode() == libsbml.SBML_PARAMETER )
    self.assert_( self.P.getMetaId() == "" )
    self.assert_( self.P.getNotes() == None )
    self.assert_( self.P.getAnnotation() == None )
    self.assert_( self.P.getId() == "" )
    self.assert_( self.P.getName() == "" )
    self.assert_( self.P.getUnits() == "" )
    self.assert_( self.P.getConstant() == True )
    self.assertEqual( False, self.P.isSetId() )
    self.assertEqual( False, self.P.isSetName() )
    self.assertEqual( False, self.P.isSetValue() )
    self.assertEqual( False, self.P.isSetUnits() )
    pass  

  def test_Parameter_createWithNS(self):
    xmlns = libsbml.XMLNamespaces()
    xmlns.add( "http://www.sbml.org", "testsbml")
    sbmlns = libsbml.SBMLNamespaces(2,1)
    sbmlns.addNamespaces(xmlns)
    object = libsbml.Parameter(sbmlns)
    self.assert_( object.getTypeCode() == libsbml.SBML_PARAMETER )
    self.assert_( object.getMetaId() == "" )
    self.assert_( object.getNotes() == None )
    self.assert_( object.getAnnotation() == None )
    self.assert_( object.getLevel() == 2 )
    self.assert_( object.getVersion() == 1 )
    self.assert_( object.getNamespaces() != None )
    self.assert_( object.getNamespaces().getLength() == 2 )
    object = None
    pass  

  def test_Parameter_free_NULL(self):
    pass  

  def test_Parameter_setId(self):
    id =  "Km1";
    self.P.setId(id)
    self.assert_(( id == self.P.getId() ))
    self.assertEqual( True, self.P.isSetId() )
    if (self.P.getId() == id):
      pass    
    self.P.setId(self.P.getId())
    self.assert_(( id == self.P.getId() ))
    self.P.setId("")
    self.assertEqual( False, self.P.isSetId() )
    if (self.P.getId() != None):
      pass    
    pass  

  def test_Parameter_setName(self):
    name =  "Forward_Michaelis_Menten_Constant";
    self.P.setName(name)
    self.assert_(( name == self.P.getName() ))
    self.assertEqual( True, self.P.isSetName() )
    if (self.P.getName() == name):
      pass    
    self.P.setName(self.P.getName())
    self.assert_(( name == self.P.getName() ))
    self.P.setName("")
    self.assertEqual( False, self.P.isSetName() )
    if (self.P.getName() != None):
      pass    
    pass  

  def test_Parameter_setUnits(self):
    units =  "second";
    self.P.setUnits(units)
    self.assert_(( units == self.P.getUnits() ))
    self.assertEqual( True, self.P.isSetUnits() )
    if (self.P.getUnits() == units):
      pass    
    self.P.setUnits(self.P.getUnits())
    self.assert_(( units == self.P.getUnits() ))
    self.P.setUnits("")
    self.assertEqual( False, self.P.isSetUnits() )
    if (self.P.getUnits() != None):
      pass    
    pass  

def suite():
  suite = unittest.TestSuite()
  suite.addTest(unittest.makeSuite(TestParameter))

  return suite

if __name__ == "__main__":
  if unittest.TextTestRunner(verbosity=1).run(suite()).wasSuccessful() :
    sys.exit(0)
  else:
    sys.exit(1)
