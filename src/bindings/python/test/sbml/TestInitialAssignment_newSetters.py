#
# @file    TestInitialAssignment_newSetters.py
# @brief   InitialAssignment unit tests for new set function API
#
# @author  Akiya Jouraku (Python conversion)
# @author  Sarah Keating 
#
# $Id$
# $HeadURL$
#
# This test file was converted from src/sbml/test/TestInitialAssignment_newSetters.c
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

class TestInitialAssignment_newSetters(unittest.TestCase):

  E = None

  def setUp(self):
    self.E = libsbml.InitialAssignment(2,4)
    if (self.E == None):
      pass    
    pass  

  def tearDown(self):
    self.E = None
    pass  

  def test_InitialAssignment_setMath1(self):
    math = libsbml.parseFormula("2 * k")
    i = self.E.setMath(math)
    self.assert_( i == libsbml.LIBSBML_OPERATION_SUCCESS )
    self.assert_( self.E.getMath() != math )
    self.assertEqual( True, self.E.isSetMath() )
    i = self.E.setMath(None)
    self.assert_( i == libsbml.LIBSBML_OPERATION_SUCCESS )
    self.assert_( self.E.getMath() == None )
    self.assertEqual( False, self.E.isSetMath() )
    math = None
    pass  

  def test_InitialAssignment_setMath2(self):
    math = libsbml.ASTNode(libsbml.AST_TIMES)
    i = self.E.setMath(math)
    self.assert_( i == libsbml.LIBSBML_INVALID_OBJECT )
    self.assertEqual( False, self.E.isSetMath() )
    math = None
    pass  

  def test_InitialAssignment_setSymbol1(self):
    id =  "1e1";
    i = self.E.setSymbol(id)
    self.assert_( i == libsbml.LIBSBML_INVALID_ATTRIBUTE_VALUE )
    self.assertEqual( False, self.E.isSetSymbol() )
    pass  

  def test_InitialAssignment_setSymbol2(self):
    id =  "e1";
    i = self.E.setSymbol(id)
    self.assert_( i == libsbml.LIBSBML_OPERATION_SUCCESS )
    self.assert_(( id == self.E.getSymbol() ))
    self.assertEqual( True, self.E.isSetSymbol() )
    i = self.E.setSymbol("")
    self.assert_( i == libsbml.LIBSBML_OPERATION_SUCCESS )
    self.assertEqual( False, self.E.isSetSymbol() )
    pass  

def suite():
  suite = unittest.TestSuite()
  suite.addTest(unittest.makeSuite(TestInitialAssignment_newSetters))

  return suite

if __name__ == "__main__":
  if unittest.TextTestRunner(verbosity=1).run(suite()).wasSuccessful() :
    sys.exit(0)
  else:
    sys.exit(1)
