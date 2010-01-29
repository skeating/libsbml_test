#
# @file    TestConstraint_newSetters.py
# @brief   Constraint unit tests for new set function API
#
# @author  Akiya Jouraku (Python conversion)
# @author  Sarah Keating 
#
# $Id$
# $HeadURL$
#
# This test file was converted from src/sbml/test/TestConstraint_newSetters.c
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

class TestConstraint_newSetters(unittest.TestCase):

  C = None

  def setUp(self):
    self.C = libsbml.Constraint(2,4)
    if (self.C == None):
      pass    
    pass  

  def tearDown(self):
    self.C = None
    pass  

  def test_Constraint_setMath1(self):
    math = libsbml.parseFormula("2 * k")
    i = self.C.setMath(math)
    self.assert_( i == libsbml.LIBSBML_OPERATION_SUCCESS )
    self.assert_( self.C.getMath() != math )
    self.assertEqual( True, self.C.isSetMath() )
    i = self.C.setMath(None)
    self.assert_( i == libsbml.LIBSBML_OPERATION_SUCCESS )
    self.assert_( self.C.getMath() == None )
    self.assertEqual( False, self.C.isSetMath() )
    math = None
    pass  

  def test_Constraint_setMath2(self):
    math = libsbml.ASTNode(libsbml.AST_TIMES)
    i = self.C.setMath(math)
    self.assert_( i == libsbml.LIBSBML_INVALID_OBJECT )
    self.assertEqual( False, self.C.isSetMath() )
    math = None
    pass  

  def test_Constraint_setMessage1(self):
    node = libsbml.XMLNode()
    i = self.C.setMessage(node)
    self.assert_( i == libsbml.LIBSBML_INVALID_OBJECT )
    self.assert_( self.C.isSetMessage() == False )
    i = self.C.unsetMessage()
    self.assert_( i == libsbml.LIBSBML_OPERATION_SUCCESS )
    self.assertEqual( False, self.C.isSetMessage() )
    if (self.C.getMessage() != None):
      pass    
    node = None
    pass  

  def test_Constraint_setMessage2(self):
    text = libsbml.XMLNode.convertStringToXMLNode(" Some text ",None)
    triple = libsbml.XMLTriple("p", "http://www.w3.org/1999/xhtml", "")
    att = libsbml.XMLAttributes()
    xmlns = libsbml.XMLNamespaces()
    xmlns.add( "http://www.w3.org/1999/xhtml", "")
    p = libsbml.XMLNode(triple,att,xmlns)
    p.addChild(text)
    triple1 = libsbml.XMLTriple("message", "", "")
    att1 = libsbml.XMLAttributes()
    node = libsbml.XMLNode(triple1,att1)
    node.addChild(p)
    i = self.C.setMessage(node)
    self.assert_( i == libsbml.LIBSBML_OPERATION_SUCCESS )
    self.assert_( self.C.isSetMessage() == True )
    i = self.C.unsetMessage()
    self.assert_( i == libsbml.LIBSBML_OPERATION_SUCCESS )
    self.assertEqual( False, self.C.isSetMessage() )
    if (self.C.getMessage() != None):
      pass    
    node = None
    pass  

def suite():
  suite = unittest.TestSuite()
  suite.addTest(unittest.makeSuite(TestConstraint_newSetters))

  return suite

if __name__ == "__main__":
  if unittest.TextTestRunner(verbosity=1).run(suite()).wasSuccessful() :
    sys.exit(0)
  else:
    sys.exit(1)
