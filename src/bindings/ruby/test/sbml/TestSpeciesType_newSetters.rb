#
# @file    TestSpeciesType_newSetters.rb
# @brief   SpeciesType unit tests for new set function API
#
# @author  Akiya Jouraku (Ruby conversion)
# @author  Sarah Keating 
#
# $Id$
# $HeadURL$
#
# This test file was converted from src/sbml/test/TestSpeciesType_newSetters.c
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

class TestSpeciesType_newSetters < Test::Unit::TestCase

  def setup
    @@st = LibSBML::SpeciesType.new(2,2)
    if (@@st == nil)
    end
  end

  def teardown
    @@st = nil
  end

  def test_SpeciesType_setId2
    i = @@st.setId( "1cell")
    assert( i == LibSBML::LIBSBML_INVALID_ATTRIBUTE_VALUE )
    assert_equal false, @@st.isSetId()
  end

  def test_SpeciesType_setId3
    i = @@st.setId( "cell")
    assert( i == LibSBML::LIBSBML_OPERATION_SUCCESS )
    assert_equal true, @@st.isSetId()
    assert ((  "cell"  == @@st.getId() ))
  end

  def test_SpeciesType_setId4
    i = @@st.setId( "cell")
    assert( i == LibSBML::LIBSBML_OPERATION_SUCCESS )
    assert_equal true, @@st.isSetId()
    assert ((  "cell"  == @@st.getId() ))
    i = @@st.setId("")
    assert( i == LibSBML::LIBSBML_OPERATION_SUCCESS )
    assert_equal false, @@st.isSetId()
  end

  def test_SpeciesType_setName1
    i = @@st.setName( "cell")
    assert( i == LibSBML::LIBSBML_OPERATION_SUCCESS )
    assert_equal true, @@st.isSetName()
    i = @@st.unsetName()
    assert( i == LibSBML::LIBSBML_OPERATION_SUCCESS )
    assert_equal false, @@st.isSetName()
  end

  def test_SpeciesType_setName2
    i = @@st.setName( "1cell")
    assert( i == LibSBML::LIBSBML_OPERATION_SUCCESS )
    assert_equal true, @@st.isSetName()
    i = @@st.unsetName()
    assert( i == LibSBML::LIBSBML_OPERATION_SUCCESS )
    assert_equal false, @@st.isSetName()
  end

  def test_SpeciesType_setName3
    i = @@st.setName( "cell")
    assert( i == LibSBML::LIBSBML_OPERATION_SUCCESS )
    assert_equal true, @@st.isSetName()
    i = @@st.setName("")
    assert( i == LibSBML::LIBSBML_OPERATION_SUCCESS )
    assert_equal false, @@st.isSetName()
  end

end
