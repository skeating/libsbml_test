#
# @file    TestL3Species.rb
# @brief   L3 Species unit tests
#
# @author  Akiya Jouraku (Ruby conversion)
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
require 'test/unit'
require 'libSBML'

class TestL3Species < Test::Unit::TestCase

  def isnan(x)
    return (x != x)
  end
  def setup
    @@s = LibSBML::Species.new(3,1)
    if (@@s == nil)
    end
  end

  def teardown
    @@s = nil
  end

  def test_L3_Species_boundaryCondition
    assert( @@s.isSetBoundaryCondition() == false )
    @@s.setBoundaryCondition(true)
    assert( @@s.getBoundaryCondition() == true )
    assert( @@s.isSetBoundaryCondition() == true )
    @@s.setBoundaryCondition(false)
    assert( @@s.getBoundaryCondition() == false )
    assert( @@s.isSetBoundaryCondition() == true )
  end

  def test_L3_Species_compartment
    compartment =  "cell";
    assert_equal false, @@s.isSetCompartment()
    @@s.setCompartment(compartment)
    assert (( compartment == @@s.getCompartment() ))
    assert_equal true, @@s.isSetCompartment()
    if (@@s.getCompartment() == compartment)
    end
  end

  def test_L3_Species_constant
    assert( @@s.isSetConstant() == false )
    @@s.setConstant(true)
    assert( @@s.getConstant() == true )
    assert( @@s.isSetConstant() == true )
    @@s.setConstant(false)
    assert( @@s.getConstant() == false )
    assert( @@s.isSetConstant() == true )
  end

  def test_L3_Species_conversionFactor
    units =  "volume";
    assert_equal false, @@s.isSetConversionFactor()
    @@s.setConversionFactor(units)
    assert (( units == @@s.getConversionFactor() ))
    assert_equal true, @@s.isSetConversionFactor()
    if (@@s.getConversionFactor() == units)
    end
    @@s.unsetConversionFactor()
    assert_equal false, @@s.isSetConversionFactor()
    if (@@s.getConversionFactor() != nil)
    end
  end

  def test_L3_Species_create
    assert( @@s.getTypeCode() == LibSBML::SBML_SPECIES )
    assert( @@s.getMetaId() == "" )
    assert( @@s.getNotes() == nil )
    assert( @@s.getAnnotation() == nil )
    assert( @@s.getId() == "" )
    assert( @@s.getName() == "" )
    assert( @@s.getCompartment() == "" )
    assert_equal true, isnan(@@s.getInitialAmount())
    assert_equal true, isnan(@@s.getInitialConcentration())
    assert( @@s.getSubstanceUnits() == "" )
    assert( @@s.getHasOnlySubstanceUnits() == false )
    assert( @@s.getBoundaryCondition() == false )
    assert( @@s.getConstant() == false )
    assert( @@s.getConversionFactor() == "" )
    assert_equal false, @@s.isSetId()
    assert_equal false, @@s.isSetName()
    assert_equal false, @@s.isSetCompartment()
    assert_equal false, @@s.isSetInitialAmount()
    assert_equal false, @@s.isSetInitialConcentration()
    assert_equal false, @@s.isSetSubstanceUnits()
    assert_equal false, @@s.isSetHasOnlySubstanceUnits()
    assert_equal false, @@s.isSetBoundaryCondition()
    assert_equal false, @@s.isSetConstant()
    assert_equal false, @@s.isSetConversionFactor()
  end

  def test_L3_Species_createWithNS
    xmlns = LibSBML::XMLNamespaces.new()
    xmlns.add( "http://www.sbml.org", "testsbml")
    sbmlns = LibSBML::SBMLNamespaces.new(3,1)
    sbmlns.addNamespaces(xmlns)
    s = LibSBML::Species.new(sbmlns)
    assert( s.getTypeCode() == LibSBML::SBML_SPECIES )
    assert( s.getMetaId() == "" )
    assert( s.getNotes() == nil )
    assert( s.getAnnotation() == nil )
    assert( s.getLevel() == 3 )
    assert( s.getVersion() == 1 )
    assert( s.getNamespaces() != nil )
    assert( s.getNamespaces().getLength() == 2 )
    assert( s.getId() == "" )
    assert( s.getName() == "" )
    assert( s.getCompartment() == "" )
    assert_equal true, isnan(s.getInitialAmount())
    assert_equal true, isnan(s.getInitialConcentration())
    assert( s.getSubstanceUnits() == "" )
    assert( s.getHasOnlySubstanceUnits() == false )
    assert( s.getBoundaryCondition() == false )
    assert( s.getConstant() == false )
    assert( s.getConversionFactor() == "" )
    assert_equal false, s.isSetId()
    assert_equal false, s.isSetName()
    assert_equal false, s.isSetCompartment()
    assert_equal false, s.isSetInitialAmount()
    assert_equal false, s.isSetInitialConcentration()
    assert_equal false, s.isSetSubstanceUnits()
    assert_equal false, s.isSetHasOnlySubstanceUnits()
    assert_equal false, s.isSetBoundaryCondition()
    assert_equal false, s.isSetConstant()
    assert_equal false, s.isSetConversionFactor()
    s = nil
  end

  def test_L3_Species_free_NULL
  end

  def test_L3_Species_hasOnlySubstanceUnits
    assert( @@s.isSetHasOnlySubstanceUnits() == false )
    @@s.setHasOnlySubstanceUnits(true)
    assert( @@s.getHasOnlySubstanceUnits() == true )
    assert( @@s.isSetHasOnlySubstanceUnits() == true )
    @@s.setHasOnlySubstanceUnits(false)
    assert( @@s.getHasOnlySubstanceUnits() == false )
    assert( @@s.isSetHasOnlySubstanceUnits() == true )
  end

  def test_L3_Species_hasRequiredAttributes
    s = LibSBML::Species.new(3,1)
    assert_equal false, s.hasRequiredAttributes()
    s.setId( "id")
    assert_equal false, s.hasRequiredAttributes()
    s.setCompartment( "cell")
    assert_equal false, s.hasRequiredAttributes()
    s.setHasOnlySubstanceUnits(false)
    assert_equal false, s.hasRequiredAttributes()
    s.setBoundaryCondition(false)
    assert_equal false, s.hasRequiredAttributes()
    s.setConstant(false)
    assert_equal true, s.hasRequiredAttributes()
    s = nil
  end

  def test_L3_Species_id
    id =  "mitochondria";
    assert_equal false, @@s.isSetId()
    @@s.setId(id)
    assert (( id == @@s.getId() ))
    assert_equal true, @@s.isSetId()
    if (@@s.getId() == id)
    end
  end

  def test_L3_Species_initialAmount
    initialAmount = 0.2
    assert_equal false, @@s.isSetInitialAmount()
    assert_equal true, isnan(@@s.getInitialAmount())
    @@s.setInitialAmount(initialAmount)
    assert( @@s.getInitialAmount() == initialAmount )
    assert_equal true, @@s.isSetInitialAmount()
    @@s.unsetInitialAmount()
    assert_equal false, @@s.isSetInitialAmount()
    assert_equal true, isnan(@@s.getInitialAmount())
  end

  def test_L3_Species_initialConcentration
    initialConcentration = 0.2
    assert_equal false, @@s.isSetInitialConcentration()
    assert_equal true, isnan(@@s.getInitialConcentration())
    @@s.setInitialConcentration(initialConcentration)
    assert( @@s.getInitialConcentration() == initialConcentration )
    assert_equal true, @@s.isSetInitialConcentration()
    @@s.unsetInitialConcentration()
    assert_equal false, @@s.isSetInitialConcentration()
    assert_equal true, isnan(@@s.getInitialConcentration())
  end

  def test_L3_Species_name
    name =  "My_Favorite_Factory";
    assert_equal false, @@s.isSetName()
    @@s.setName(name)
    assert (( name == @@s.getName() ))
    assert_equal true, @@s.isSetName()
    if (@@s.getName() == name)
    end
    @@s.unsetName()
    assert_equal false, @@s.isSetName()
    if (@@s.getName() != nil)
    end
  end

  def test_L3_Species_substanceUnits
    units =  "volume";
    assert_equal false, @@s.isSetSubstanceUnits()
    @@s.setSubstanceUnits(units)
    assert (( units == @@s.getSubstanceUnits() ))
    assert_equal true, @@s.isSetSubstanceUnits()
    if (@@s.getSubstanceUnits() == units)
    end
    @@s.unsetSubstanceUnits()
    assert_equal false, @@s.isSetSubstanceUnits()
    if (@@s.getSubstanceUnits() != nil)
    end
  end

end
