#
# @file    TestFunctionDefinition_newSetters.rb
# @brief   FunctionDefinition unit tests for new set function API
#
# @author  Akiya Jouraku (Ruby conversion)
# @author  Sarah Keating 
#
# $Id$
# $HeadURL$
#
# This test file was converted from src/sbml/test/TestFunctionDefinition_newSetters.c
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

class TestFunctionDefinition_newSetters < Test::Unit::TestCase

  def setup
    @@e = LibSBML::FunctionDefinition.new(2,4)
    if (@@e == nil)
    end
  end

  def teardown
    @@e = nil
  end

  def test_FunctionDefinition_setId1
    id =  "1e1";
    i = @@e.setId(id)
    assert( i == LibSBML::LIBSBML_INVALID_ATTRIBUTE_VALUE )
    assert_equal false, @@e.isSetId()
  end

  def test_FunctionDefinition_setId2
    id =  "e1";
    i = @@e.setId(id)
    assert( i == LibSBML::LIBSBML_OPERATION_SUCCESS )
    assert (( id == @@e.getId() ))
    assert_equal true, @@e.isSetId()
    i = @@e.setId("")
    assert( i == LibSBML::LIBSBML_OPERATION_SUCCESS )
    assert_equal false, @@e.isSetId()
  end

  def test_FunctionDefinition_setMath1
    math = LibSBML::parseFormula("2 * k")
    i = @@e.setMath(math)
    assert( i == LibSBML::LIBSBML_OPERATION_SUCCESS )
    assert( @@e.getMath() != math )
    assert_equal true, @@e.isSetMath()
    i = @@e.setMath(nil)
    assert( i == LibSBML::LIBSBML_OPERATION_SUCCESS )
    assert( @@e.getMath() == nil )
    assert_equal false, @@e.isSetMath()
    math = nil
  end

  def test_FunctionDefinition_setMath2
    math = LibSBML::ASTNode.new(LibSBML::AST_TIMES)
    i = @@e.setMath(math)
    assert( i == LibSBML::LIBSBML_INVALID_OBJECT )
    assert_equal false, @@e.isSetMath()
    math = nil
  end

  def test_FunctionDefinition_setName1
    name =  "3Set_k2";
    i = @@e.setName(name)
    assert( i == LibSBML::LIBSBML_OPERATION_SUCCESS )
    assert_equal true, @@e.isSetName()
  end

  def test_FunctionDefinition_setName2
    name =  "Set k2";
    i = @@e.setName(name)
    assert( i == LibSBML::LIBSBML_OPERATION_SUCCESS )
    assert (( name == @@e.getName() ))
    assert_equal true, @@e.isSetName()
    i = @@e.unsetName()
    assert( i == LibSBML::LIBSBML_OPERATION_SUCCESS )
    assert_equal false, @@e.isSetName()
  end

  def test_FunctionDefinition_setName3
    i = @@e.setName("")
    assert( i == LibSBML::LIBSBML_OPERATION_SUCCESS )
    assert_equal false, @@e.isSetName()
  end

end
