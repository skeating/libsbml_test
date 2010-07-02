#
# @file    TestConstraint.py
# @brief   SBML Constraint unit tests
#
# @author  Akiya Jouraku (Python conversion)
# @author  Sarah Keating 
#
# $Id$
# $HeadURL$
#
# This test file was converted from src/sbml/test/TestConstraint.c
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


class TestConstraint(unittest.TestCase):

  global C
  C = None

  def setUp(self):
    self.C = libsbml.Constraint(2,4)
    if (self.C == None):
      pass    
    pass  

  def tearDown(self):
    _dummyList = [ self.C ]; _dummyList[:] = []; del _dummyList
    pass  

  def test_Constraint_create(self):
    self.assert_( self.C.getTypeCode() == libsbml.SBML_CONSTRAINT )
    self.assert_( self.C.getMetaId() == "" )
    self.assert_( self.C.getNotes() == None )
    self.assert_( self.C.getAnnotation() == None )
    self.assertEqual( False, self.C.isSetMessage() )
    self.assertEqual( False, self.C.isSetMath() )
    pass  

  def test_Constraint_createWithNS(self):
    xmlns = libsbml.XMLNamespaces()
    xmlns.add( "http://www.sbml.org", "testsbml")
    sbmlns = libsbml.SBMLNamespaces(2,2)
    sbmlns.addNamespaces(xmlns)
    object = libsbml.Constraint(sbmlns)
    self.assert_( object.getTypeCode() == libsbml.SBML_CONSTRAINT )
    self.assert_( object.getMetaId() == "" )
    self.assert_( object.getNotes() == None )
    self.assert_( object.getAnnotation() == None )
    self.assert_( object.getLevel() == 2 )
    self.assert_( object.getVersion() == 2 )
    self.assert_( object.getNamespaces() != None )
    self.assert_( object.getNamespaces().getLength() == 2 )
    _dummyList = [ object ]; _dummyList[:] = []; del _dummyList
    pass  

  def test_Constraint_free_NULL(self):
    _dummyList = [ None ]; _dummyList[:] = []; del _dummyList
    pass  

  def test_Constraint_setMath(self):
    math = libsbml.parseFormula("2 * k")
    self.C.setMath(math)
    self.assert_( self.C.getMath() != math )
    self.assertEqual( True, self.C.isSetMath() )
    self.C.setMath(self.C.getMath())
    self.assert_( self.C.getMath() != math )
    self.C.setMath(None)
    self.assertEqual( False, self.C.isSetMath() )
    if (self.C.getMath() != None):
      pass    
    _dummyList = [ math ]; _dummyList[:] = []; del _dummyList
    pass  

  def test_Constraint_setMessage(self):
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
    self.C.setMessage(node)
    self.assert_( self.C.getMessage() != node )
    self.assert_( self.C.isSetMessage() == True )
    self.C.setMessage(self.C.getMessage())
    self.assert_( self.C.getMessage() != node )
    self.assert_( self.C.getMessageString() != None )
    self.C.unsetMessage()
    self.assertEqual( False, self.C.isSetMessage() )
    if (self.C.getMessage() != None):
      pass    
    _dummyList = [ node ]; _dummyList[:] = []; del _dummyList
    pass  

def suite():
  suite = unittest.TestSuite()
  suite.addTest(unittest.makeSuite(TestConstraint))

  return suite

if __name__ == "__main__":
  if unittest.TextTestRunner(verbosity=1).run(suite()).wasSuccessful() :
    sys.exit(0)
  else:
    sys.exit(1)
