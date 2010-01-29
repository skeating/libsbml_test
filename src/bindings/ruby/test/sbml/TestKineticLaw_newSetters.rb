#
# @file    TestKineticLaw_newSetters.rb
# @brief   KineticLaw unit tests for new set function API
#
# @author  Akiya Jouraku (Ruby conversion)
# @author  Sarah Keating 
#
# $Id$
# $HeadURL$
#
# This test file was converted from src/sbml/test/TestKineticLaw_newSetters.c
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
require 'test/unit'
require 'libSBML'

class TestKineticLaw_newSetters < Test::Unit::TestCase

  def setup
    @@kl = LibSBML::KineticLaw.new(2,4)
    if (@@kl == nil)
    end
  end

  def teardown
    @@kl = nil
  end

  def test_KineticLaw_addParameter1
    @@kl = LibSBML::KineticLaw.new(2,2)
    p = LibSBML::Parameter.new(2,2)
    i = @@kl.addParameter(p)
    assert( i == LibSBML::LIBSBML_INVALID_OBJECT )
    p.setId( "p")
    i = @@kl.addParameter(p)
    assert( i == LibSBML::LIBSBML_OPERATION_SUCCESS )
    assert( @@kl.getNumParameters() == 1 )
    p = nil
    @@kl = nil
  end

  def test_KineticLaw_addParameter2
    @@kl = LibSBML::KineticLaw.new(2,2)
    p = LibSBML::Parameter.new(2,1)
    p.setId( "p")
    i = @@kl.addParameter(p)
    assert( i == LibSBML::LIBSBML_VERSION_MISMATCH )
    assert( @@kl.getNumParameters() == 0 )
    p = nil
    @@kl = nil
  end

  def test_KineticLaw_addParameter3
    @@kl = LibSBML::KineticLaw.new(2,2)
    p = LibSBML::Parameter.new(1,2)
    p.setId( "p")
    i = @@kl.addParameter(p)
    assert( i == LibSBML::LIBSBML_LEVEL_MISMATCH )
    assert( @@kl.getNumParameters() == 0 )
    p = nil
    @@kl = nil
  end

  def test_KineticLaw_addParameter4
    @@kl = LibSBML::KineticLaw.new(2,2)
    p = nil
    i = @@kl.addParameter(p)
    assert( i == LibSBML::LIBSBML_OPERATION_FAILED )
    assert( @@kl.getNumParameters() == 0 )
    @@kl = nil
  end

  def test_KineticLaw_createParameter
    @@kl = LibSBML::KineticLaw.new(2,2)
    p = @@kl.createParameter()
    assert( @@kl.getNumParameters() == 1 )
    assert( (p).getLevel() == 2 )
    assert( (p).getVersion() == 2 )
    @@kl = nil
  end

  def test_KineticLaw_setFormula1
    formula =  "k1*X0";
    i = @@kl.setFormula(formula)
    assert( i == LibSBML::LIBSBML_OPERATION_SUCCESS )
    assert (( formula == @@kl.getFormula() ))
    assert_equal true, @@kl.isSetFormula()
  end

  def test_KineticLaw_setFormula2
    i = @@kl.setFormula("")
    assert( i == LibSBML::LIBSBML_OPERATION_SUCCESS )
    assert_equal false, @@kl.isSetFormula()
  end

  def test_KineticLaw_setFormula3
    formula =  "k1 X0";
    i = @@kl.setFormula(formula)
    assert( i == LibSBML::LIBSBML_INVALID_OBJECT )
    assert_equal false, @@kl.isSetFormula()
  end

  def test_KineticLaw_setMath1
    math = LibSBML::ASTNode.new(LibSBML::AST_TIMES)
    a = LibSBML::ASTNode.new()
    b = LibSBML::ASTNode.new()
    a.setName( "a")
    b.setName( "b")
    math.addChild(a)
    math.addChild(b)
    i = @@kl.setMath(math)
    assert( i == LibSBML::LIBSBML_OPERATION_SUCCESS )
    assert_equal true, @@kl.isSetMath()
    math1 = @@kl.getMath()
    assert( math1 != nil )
    formula = LibSBML::formulaToString(math1)
    assert( formula != nil )
    assert ((  "a * b" == formula ))
    math = nil
  end

  def test_KineticLaw_setMath2
    math = LibSBML::ASTNode.new(LibSBML::AST_TIMES)
    a = LibSBML::ASTNode.new()
    a.setName( "a")
    math.addChild(a)
    i = @@kl.setMath(math)
    assert( i == LibSBML::LIBSBML_INVALID_OBJECT )
    assert_equal false, @@kl.isSetMath()
    math = nil
  end

  def test_KineticLaw_setMath3
    i = @@kl.setMath(nil)
    assert( i == LibSBML::LIBSBML_OPERATION_SUCCESS )
    assert_equal false, @@kl.isSetMath()
  end

  def test_KineticLaw_setSubstanceUnits1
    i = @@kl.setSubstanceUnits( "mole")
    assert( i == LibSBML::LIBSBML_UNEXPECTED_ATTRIBUTE )
    assert_equal false, @@kl.isSetSubstanceUnits()
    i = @@kl.unsetSubstanceUnits()
    assert( i == LibSBML::LIBSBML_UNEXPECTED_ATTRIBUTE )
    assert_equal false, @@kl.isSetSubstanceUnits()
  end

  def test_KineticLaw_setSubstanceUnits2
    kl1 = LibSBML::KineticLaw.new(1,2)
    i = kl1.setSubstanceUnits( "mole")
    assert( i == LibSBML::LIBSBML_OPERATION_SUCCESS )
    assert_equal true, kl1.isSetSubstanceUnits()
    i = kl1.unsetSubstanceUnits()
    assert( i == LibSBML::LIBSBML_OPERATION_SUCCESS )
    assert_equal false, kl1.isSetSubstanceUnits()
    kl1 = nil
  end

  def test_KineticLaw_setSubstanceUnits3
    kl1 = LibSBML::KineticLaw.new(1,2)
    i = kl1.setSubstanceUnits( "1second")
    assert( i == LibSBML::LIBSBML_INVALID_ATTRIBUTE_VALUE )
    assert_equal false, kl1.isSetSubstanceUnits()
    i = kl1.unsetSubstanceUnits()
    assert( i == LibSBML::LIBSBML_OPERATION_SUCCESS )
    assert_equal false, kl1.isSetSubstanceUnits()
    kl1 = nil
  end

  def test_KineticLaw_setSubstanceUnits4
    kl1 = LibSBML::KineticLaw.new(1,2)
    i = kl1.setSubstanceUnits("")
    assert( i == LibSBML::LIBSBML_OPERATION_SUCCESS )
    assert_equal false, kl1.isSetSubstanceUnits()
    kl1 = nil
  end

  def test_KineticLaw_setTimeUnits1
    i = @@kl.setTimeUnits( "second")
    assert( i == LibSBML::LIBSBML_UNEXPECTED_ATTRIBUTE )
    assert_equal false, @@kl.isSetTimeUnits()
    i = @@kl.unsetTimeUnits()
    assert( i == LibSBML::LIBSBML_UNEXPECTED_ATTRIBUTE )
    assert_equal false, @@kl.isSetTimeUnits()
  end

  def test_KineticLaw_setTimeUnits2
    kl1 = LibSBML::KineticLaw.new(1,2)
    i = kl1.setTimeUnits( "second")
    assert( i == LibSBML::LIBSBML_OPERATION_SUCCESS )
    assert_equal true, kl1.isSetTimeUnits()
    i = kl1.unsetTimeUnits()
    assert( i == LibSBML::LIBSBML_OPERATION_SUCCESS )
    assert_equal false, kl1.isSetTimeUnits()
    kl1 = nil
  end

  def test_KineticLaw_setTimeUnits3
    kl1 = LibSBML::KineticLaw.new(1,2)
    i = kl1.setTimeUnits( "1second")
    assert( i == LibSBML::LIBSBML_INVALID_ATTRIBUTE_VALUE )
    assert_equal false, kl1.isSetTimeUnits()
    i = kl1.unsetTimeUnits()
    assert( i == LibSBML::LIBSBML_OPERATION_SUCCESS )
    assert_equal false, kl1.isSetTimeUnits()
    kl1 = nil
  end

  def test_KineticLaw_setTimeUnits4
    kl1 = LibSBML::KineticLaw.new(1,2)
    i = kl1.setTimeUnits("")
    assert( i == LibSBML::LIBSBML_OPERATION_SUCCESS )
    assert_equal false, kl1.isSetTimeUnits()
    kl1 = nil
  end

end
