#
# @file    TestUnitDefinition.py
# @brief   SBML UnitDefinition unit tests
#
# @author  Akiya Jouraku (Python conversion)
# @author  Ben Bornstein 
#
# $Id$
# $HeadURL$
#
# This test file was converted from src/sbml/test/TestUnitDefinition.c
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


class TestUnitDefinition(unittest.TestCase):

  global UD
  UD = None

  def setUp(self):
    self.UD = libsbml.UnitDefinition(2,4)
    if (self.UD == None):
      pass    
    pass  

  def tearDown(self):
    _dummyList = [ self.UD ]; _dummyList[:] = []; del _dummyList
    pass  

  def test_UnitDefinition_addUnit(self):
    u = libsbml.Unit(2,4)
    u.setKind(libsbml.UNIT_KIND_MOLE)
    self.UD.addUnit(u)
    self.assert_( self.UD.getNumUnits() == 1 )
    _dummyList = [ u ]; _dummyList[:] = []; del _dummyList
    pass  

  def test_UnitDefinition_create(self):
    self.assert_( self.UD.getTypeCode() == libsbml.SBML_UNIT_DEFINITION )
    self.assert_( self.UD.getMetaId() == "" )
    self.assert_( self.UD.getNotes() == None )
    self.assert_( self.UD.getAnnotation() == None )
    self.assert_( self.UD.getId() == "" )
    self.assert_( self.UD.getName() == "" )
    self.assertEqual( False, self.UD.isSetId() )
    self.assertEqual( False, self.UD.isSetName() )
    self.assert_( self.UD.getNumUnits() == 0 )
    pass  

  def test_UnitDefinition_createWithNS(self):
    xmlns = libsbml.XMLNamespaces()
    xmlns.add( "http://www.sbml.org", "testsbml")
    sbmlns = libsbml.SBMLNamespaces(2,1)
    sbmlns.addNamespaces(xmlns)
    object = libsbml.UnitDefinition(sbmlns)
    self.assert_( object.getTypeCode() == libsbml.SBML_UNIT_DEFINITION )
    self.assert_( object.getMetaId() == "" )
    self.assert_( object.getNotes() == None )
    self.assert_( object.getAnnotation() == None )
    self.assert_( object.getLevel() == 2 )
    self.assert_( object.getVersion() == 1 )
    self.assert_( object.getNamespaces() != None )
    self.assert_( object.getNamespaces().getLength() == 2 )
    _dummyList = [ object ]; _dummyList[:] = []; del _dummyList
    pass  

  def test_UnitDefinition_createWithName(self):
    ud = libsbml.UnitDefinition(2,4)
    ud.setName( "mmol_per_liter_per_sec")
    self.assert_( ud.getTypeCode() == libsbml.SBML_UNIT_DEFINITION )
    self.assert_( ud.getMetaId() == "" )
    self.assert_( ud.getNotes() == None )
    self.assert_( ud.getAnnotation() == None )
    self.assert_( ud.getId() == "" )
    self.assert_((  "mmol_per_liter_per_sec" == ud.getName() ))
    self.assertEqual( True, ud.isSetName() )
    self.assert_( ud.getNumUnits() == 0 )
    _dummyList = [ ud ]; _dummyList[:] = []; del _dummyList
    pass  

  def test_UnitDefinition_free_NULL(self):
    _dummyList = [ None ]; _dummyList[:] = []; del _dummyList
    pass  

  def test_UnitDefinition_getUnit(self):
    mole = libsbml.Unit(2,4)
    litre = libsbml.Unit(2,4)
    second = libsbml.Unit(2,4)
    mole.setKind(libsbml.UnitKind_forName("mole"))
    litre.setKind(libsbml.UnitKind_forName("litre"))
    second.setKind(libsbml.UnitKind_forName("second"))
    mole.setScale(-3)
    litre.setExponent(-1)
    second.setExponent(-1)
    self.UD.addUnit(mole)
    self.UD.addUnit(litre)
    self.UD.addUnit(second)
    _dummyList = [ mole ]; _dummyList[:] = []; del _dummyList
    _dummyList = [ litre ]; _dummyList[:] = []; del _dummyList
    _dummyList = [ second ]; _dummyList[:] = []; del _dummyList
    self.assert_( self.UD.getNumUnits() == 3 )
    mole = self.UD.getUnit(0)
    litre = self.UD.getUnit(1)
    second = self.UD.getUnit(2)
    self.assert_( mole.getKind() == libsbml.UNIT_KIND_MOLE )
    self.assert_( litre.getKind() == libsbml.UNIT_KIND_LITRE )
    self.assert_( second.getKind() == libsbml.UNIT_KIND_SECOND )
    self.assert_( mole.getScale() == -3 )
    self.assert_( litre.getExponent() == -1 )
    self.assert_( second.getExponent() == -1 )
    pass  

  def test_UnitDefinition_isVariantOfArea(self):
    dim = libsbml.Unit(2,4)
    dim.setKind(libsbml.UnitKind_forName("dimensionless"))
    u = self.UD.createUnit()
    self.assertEqual( False, self.UD.isVariantOfArea() )
    u.setKind(libsbml.UNIT_KIND_METRE)
    u.setExponent(2)
    self.assertEqual( True, self.UD.isVariantOfArea() )
    u.setScale(-1)
    self.assertEqual( True, self.UD.isVariantOfArea() )
    u.setMultiplier(2)
    self.assertEqual( True, self.UD.isVariantOfArea() )
    u.setOffset(3)
    self.assertEqual( True, self.UD.isVariantOfArea() )
    u.setExponent(3)
    self.assertEqual( False, self.UD.isVariantOfArea() )
    u.setExponent(2)
    self.UD.addUnit(dim)
    self.assertEqual( True, self.UD.isVariantOfArea() )
    pass  

  def test_UnitDefinition_isVariantOfLength(self):
    dim = libsbml.Unit(2,4)
    dim.setKind(libsbml.UnitKind_forName("dimensionless"))
    u = self.UD.createUnit()
    self.assertEqual( False, self.UD.isVariantOfLength() )
    u.setKind(libsbml.UNIT_KIND_METRE)
    u.setExponent(1)
    self.assertEqual( True, self.UD.isVariantOfLength() )
    u.setScale(-1)
    self.assertEqual( True, self.UD.isVariantOfLength() )
    u.setMultiplier(2)
    self.assertEqual( True, self.UD.isVariantOfLength() )
    u.setOffset(3)
    self.assertEqual( True, self.UD.isVariantOfLength() )
    u.setExponent(2)
    self.assertEqual( False, self.UD.isVariantOfLength() )
    u.setExponent(1)
    self.UD.addUnit(dim)
    self.assertEqual( True, self.UD.isVariantOfLength() )
    pass  

  def test_UnitDefinition_isVariantOfSubstancePerTime_1(self):
    dim = libsbml.Unit(2,4)
    dim.setKind(libsbml.UnitKind_forName("dimensionless"))
    perTime = self.UD.createUnit()
    perTime.setKind(libsbml.UnitKind_forName("second"))
    perTime.setExponent(-1)
    u = self.UD.createUnit()
    self.assertEqual( False, self.UD.isVariantOfSubstancePerTime() )
    u.setKind(libsbml.UNIT_KIND_MOLE)
    u.setExponent(1)
    self.assertEqual( True, self.UD.isVariantOfSubstancePerTime() )
    u.setScale(-1)
    perTime.setScale(-1)
    self.assertEqual( True, self.UD.isVariantOfSubstancePerTime() )
    u.setMultiplier(2)
    self.assertEqual( True, self.UD.isVariantOfSubstancePerTime() )
    u.setOffset(3)
    self.assertEqual( True, self.UD.isVariantOfSubstancePerTime() )
    u.setExponent(-3)
    self.assertEqual( False, self.UD.isVariantOfSubstancePerTime() )
    u.setExponent(1)
    perTime.setExponent(-3)
    self.assertEqual( False, self.UD.isVariantOfSubstancePerTime() )
    perTime.setExponent(-1)
    self.UD.addUnit(dim)
    self.assertEqual( True, self.UD.isVariantOfSubstancePerTime() )
    _dummyList = [ dim ]; _dummyList[:] = []; del _dummyList
    pass  

  def test_UnitDefinition_isVariantOfSubstancePerTime_2(self):
    dim = libsbml.Unit(2,4)
    dim.setKind(libsbml.UnitKind_forName("dimensionless"))
    perTime = self.UD.createUnit()
    perTime.setKind(libsbml.UnitKind_forName("second"))
    perTime.setExponent(-1)
    u = self.UD.createUnit()
    self.assertEqual( False, self.UD.isVariantOfSubstancePerTime() )
    u.setKind(libsbml.UNIT_KIND_ITEM)
    u.setExponent(1)
    self.assertEqual( True, self.UD.isVariantOfSubstancePerTime() )
    u.setScale(-1)
    perTime.setScale(-1)
    self.assertEqual( True, self.UD.isVariantOfSubstancePerTime() )
    u.setMultiplier(2)
    self.assertEqual( True, self.UD.isVariantOfSubstancePerTime() )
    u.setOffset(3)
    self.assertEqual( True, self.UD.isVariantOfSubstancePerTime() )
    u.setExponent(-3)
    self.assertEqual( False, self.UD.isVariantOfSubstancePerTime() )
    u.setExponent(1)
    perTime.setExponent(-3)
    self.assertEqual( False, self.UD.isVariantOfSubstancePerTime() )
    perTime.setExponent(-1)
    self.UD.addUnit(dim)
    self.assertEqual( True, self.UD.isVariantOfSubstancePerTime() )
    _dummyList = [ dim ]; _dummyList[:] = []; del _dummyList
    pass  

  def test_UnitDefinition_isVariantOfSubstancePerTime_3(self):
    ud = libsbml.UnitDefinition(2,2)
    dim = libsbml.Unit(2,2)
    dim.setKind(libsbml.UnitKind_forName("dimensionless"))
    perTime = ud.createUnit()
    perTime.setKind(libsbml.UnitKind_forName("second"))
    perTime.setExponent(-1)
    u = ud.createUnit()
    self.assertEqual( False, ud.isVariantOfSubstancePerTime() )
    u.setKind(libsbml.UNIT_KIND_GRAM)
    u.setExponent(1)
    self.assertEqual( True, ud.isVariantOfSubstancePerTime() )
    u.setScale(-1)
    perTime.setScale(-1)
    self.assertEqual( True, ud.isVariantOfSubstancePerTime() )
    u.setMultiplier(2)
    self.assertEqual( True, ud.isVariantOfSubstancePerTime() )
    u.setOffset(3)
    self.assertEqual( True, ud.isVariantOfSubstancePerTime() )
    u.setExponent(-3)
    self.assertEqual( False, ud.isVariantOfSubstancePerTime() )
    u.setExponent(1)
    perTime.setExponent(-3)
    self.assertEqual( False, ud.isVariantOfSubstancePerTime() )
    perTime.setExponent(-1)
    ud.addUnit(dim)
    self.assertEqual( True, ud.isVariantOfSubstancePerTime() )
    _dummyList = [ ud ]; _dummyList[:] = []; del _dummyList
    _dummyList = [ dim ]; _dummyList[:] = []; del _dummyList
    pass  

  def test_UnitDefinition_isVariantOfSubstancePerTime_4(self):
    ud = libsbml.UnitDefinition(2,2)
    dim = ud.createUnit()
    dim.setKind(libsbml.UnitKind_forName("dimensionless"))
    perTime = ud.createUnit()
    perTime.setKind(libsbml.UnitKind_forName("second"))
    perTime.setExponent(-1)
    u = ud.createUnit()
    self.assertEqual( False, ud.isVariantOfSubstancePerTime() )
    u.setKind(libsbml.UNIT_KIND_KILOGRAM)
    u.setExponent(1)
    self.assertEqual( True, ud.isVariantOfSubstancePerTime() )
    u.setScale(-1)
    perTime.setScale(-1)
    self.assertEqual( True, ud.isVariantOfSubstancePerTime() )
    u.setMultiplier(2)
    self.assertEqual( True, ud.isVariantOfSubstancePerTime() )
    u.setOffset(3)
    self.assertEqual( True, ud.isVariantOfSubstancePerTime() )
    u.setExponent(-3)
    self.assertEqual( False, ud.isVariantOfSubstancePerTime() )
    u.setExponent(1)
    perTime.setExponent(-3)
    self.assertEqual( False, ud.isVariantOfSubstancePerTime() )
    perTime.setExponent(-1)
    ud.addUnit(dim)
    self.assertEqual( True, ud.isVariantOfSubstancePerTime() )
    _dummyList = [ ud ]; _dummyList[:] = []; del _dummyList
    pass  

  def test_UnitDefinition_isVariantOfSubstance_1(self):
    dim = libsbml.Unit(2,4)
    dim.setKind(libsbml.UnitKind_forName("dimensionless"))
    u = self.UD.createUnit()
    self.assertEqual( False, self.UD.isVariantOfSubstance() )
    u.setKind(libsbml.UNIT_KIND_MOLE)
    u.setExponent(1)
    self.assertEqual( True, self.UD.isVariantOfSubstance() )
    u.setScale(-1)
    self.assertEqual( True, self.UD.isVariantOfSubstance() )
    u.setMultiplier(2)
    self.assertEqual( True, self.UD.isVariantOfSubstance() )
    u.setOffset(3)
    self.assertEqual( True, self.UD.isVariantOfSubstance() )
    u.setExponent(-3)
    self.assertEqual( False, self.UD.isVariantOfSubstance() )
    u.setExponent(1)
    self.UD.addUnit(dim)
    self.assertEqual( True, self.UD.isVariantOfSubstance() )
    pass  

  def test_UnitDefinition_isVariantOfSubstance_2(self):
    dim = libsbml.Unit(2,4)
    dim.setKind(libsbml.UnitKind_forName("dimensionless"))
    u = self.UD.createUnit()
    self.assertEqual( False, self.UD.isVariantOfSubstance() )
    u.setKind(libsbml.UNIT_KIND_ITEM)
    u.setExponent(1)
    self.assertEqual( True, self.UD.isVariantOfSubstance() )
    u.setScale(-1)
    self.assertEqual( True, self.UD.isVariantOfSubstance() )
    u.setMultiplier(2)
    self.assertEqual( True, self.UD.isVariantOfSubstance() )
    u.setOffset(3)
    self.assertEqual( True, self.UD.isVariantOfSubstance() )
    u.setExponent(-2)
    self.assertEqual( False, self.UD.isVariantOfSubstance() )
    u.setExponent(1)
    self.UD.addUnit(dim)
    self.assertEqual( True, self.UD.isVariantOfSubstance() )
    pass  

  def test_UnitDefinition_isVariantOfTime(self):
    dim = libsbml.Unit(2,4)
    dim.setKind(libsbml.UnitKind_forName("dimensionless"))
    u = self.UD.createUnit()
    self.assertEqual( False, self.UD.isVariantOfTime() )
    u.setKind(libsbml.UNIT_KIND_SECOND)
    u.setExponent(1)
    self.assertEqual( True, self.UD.isVariantOfTime() )
    u.setScale(-10)
    self.assertEqual( True, self.UD.isVariantOfTime() )
    u.setMultiplier(10)
    self.assertEqual( True, self.UD.isVariantOfTime() )
    u.setOffset(30)
    self.assertEqual( True, self.UD.isVariantOfTime() )
    u.setExponent(2)
    self.assertEqual( False, self.UD.isVariantOfTime() )
    u.setExponent(1)
    self.UD.addUnit(dim)
    self.assertEqual( True, self.UD.isVariantOfTime() )
    pass  

  def test_UnitDefinition_isVariantOfVolume_1(self):
    dim = libsbml.Unit(2,4)
    dim.setKind(libsbml.UnitKind_forName("dimensionless"))
    u = self.UD.createUnit()
    self.assertEqual( False, self.UD.isVariantOfVolume() )
    u.setKind(libsbml.UNIT_KIND_LITRE)
    u.setExponent(1)
    self.assertEqual( True, self.UD.isVariantOfVolume() )
    u.setScale(100)
    self.assertEqual( True, self.UD.isVariantOfVolume() )
    u.setMultiplier(5)
    self.assertEqual( True, self.UD.isVariantOfVolume() )
    u.setOffset(-5)
    self.assertEqual( True, self.UD.isVariantOfVolume() )
    u.setExponent(-1)
    self.assertEqual( False, self.UD.isVariantOfVolume() )
    u.setExponent(1)
    self.UD.addUnit(dim)
    self.assertEqual( True, self.UD.isVariantOfVolume() )
    pass  

  def test_UnitDefinition_isVariantOfVolume_2(self):
    dim = libsbml.Unit(2,4)
    dim.setKind(libsbml.UnitKind_forName("dimensionless"))
    u = self.UD.createUnit()
    self.assertEqual( False, self.UD.isVariantOfVolume() )
    u.setKind(libsbml.UNIT_KIND_METRE)
    u.setExponent(3)
    self.assertEqual( True, self.UD.isVariantOfVolume() )
    u.setScale(100)
    self.assertEqual( True, self.UD.isVariantOfVolume() )
    u.setMultiplier(5)
    self.assertEqual( True, self.UD.isVariantOfVolume() )
    u.setOffset(-5)
    self.assertEqual( True, self.UD.isVariantOfVolume() )
    u.setExponent(2)
    self.assertEqual( False, self.UD.isVariantOfVolume() )
    u.setExponent(3)
    self.UD.addUnit(dim)
    self.assertEqual( True, self.UD.isVariantOfVolume() )
    pass  

  def test_UnitDefinition_printUnits(self):
    ud = libsbml.UnitDefinition(2,4)
    ud.setId( "mmls")
    perTime = ud.createUnit()
    perTime.setKind(libsbml.UnitKind_forName("second"))
    perTime.setExponent(-1)
    ud_str = libsbml.UnitDefinition.printUnits(ud,False)
    self.assert_((                 "second (exponent = -1, multiplier = 1, scale = 0)" == ud_str ))
    ud_str1 = libsbml.UnitDefinition.printUnits(ud,True)
    self.assert_((  "(1 second)^-1" == ud_str1 ))
    ud1 = libsbml.UnitDefinition(2,4)
    ud1.setId( "mmls")
    u = ud1.createUnit()
    u.setKind(libsbml.UNIT_KIND_KILOGRAM)
    u.setExponent(1)
    u.setScale(2)
    u.setMultiplier(3.0)
    ud_str2 = libsbml.UnitDefinition.printUnits(ud1,False)
    self.assert_((                 "kilogram (exponent = 1, multiplier = 3, scale = 2)" == ud_str2 ))
    ud_str3 = libsbml.UnitDefinition.printUnits(ud1,True)
    self.assert_((  "(300 kilogram)^1" == ud_str3 ))
    pass  

  def test_UnitDefinition_removeUnit(self):
    o1 = self.UD.createUnit()
    o2 = self.UD.createUnit()
    o3 = self.UD.createUnit()
    self.assert_( self.UD.removeUnit(0) == o1 )
    self.assert_( self.UD.getNumUnits() == 2 )
    self.assert_( self.UD.removeUnit(0) == o2 )
    self.assert_( self.UD.getNumUnits() == 1 )
    self.assert_( self.UD.removeUnit(0) == o3 )
    self.assert_( self.UD.getNumUnits() == 0 )
    _dummyList = [ o1 ]; _dummyList[:] = []; del _dummyList
    _dummyList = [ o2 ]; _dummyList[:] = []; del _dummyList
    _dummyList = [ o3 ]; _dummyList[:] = []; del _dummyList
    pass  

  def test_UnitDefinition_setId(self):
    id =  "mmls";
    self.UD.setId(id)
    self.assert_(( id == self.UD.getId() ))
    self.assertEqual( True, self.UD.isSetId() )
    if (self.UD.getId() == id):
      pass    
    self.UD.setId(self.UD.getId())
    self.assert_(( id == self.UD.getId() ))
    self.UD.setId("")
    self.assertEqual( False, self.UD.isSetId() )
    if (self.UD.getId() != None):
      pass    
    pass  

  def test_UnitDefinition_setName(self):
    name =  "mmol_per_liter_per_sec";
    self.UD.setName(name)
    self.assert_(( name == self.UD.getName() ))
    self.assertEqual( True, self.UD.isSetName() )
    if (self.UD.getName() == name):
      pass    
    self.UD.setName(self.UD.getName())
    self.assert_(( name == self.UD.getName() ))
    self.UD.setName("")
    self.assertEqual( False, self.UD.isSetName() )
    if (self.UD.getName() != None):
      pass    
    pass  

def suite():
  suite = unittest.TestSuite()
  suite.addTest(unittest.makeSuite(TestUnitDefinition))

  return suite

if __name__ == "__main__":
  if unittest.TextTestRunner(verbosity=1).run(suite()).wasSuccessful() :
    sys.exit(0)
  else:
    sys.exit(1)
