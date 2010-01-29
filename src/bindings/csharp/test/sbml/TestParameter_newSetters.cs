/// 
///  @file    TestParameter_newSetters.cs
///  @brief   Parameter unit tests for new set function API
///  @author  Frank Bergmann (Csharp conversion)
///  @author  Akiya Jouraku (Csharp conversion)
///  @author  Sarah Keating 
/// 
///  $Id$
///  $HeadURL$
/// 
///  This test file was converted from src/sbml/test/TestParameter_newSetters.c
///  with the help of conversion sciprt (ctest_converter.pl).
/// 
/// <!---------------------------------------------------------------------------
///  This file is part of libSBML.  Please visit http://sbml.org for more
///  information about SBML, and the latest version of libSBML.
/// 
///  Copyright 2005-2010 California Institute of Technology.
///  Copyright 2002-2005 California Institute of Technology and
///                      Japan Science and Technology Corporation.
///  
///  This library is free software; you can redistribute it and/or modify it
///  under the terms of the GNU Lesser General Public License as published by
///  the Free Software Foundation.  A copy of the license agreement is provided
///  in the file named "LICENSE.txt" included with this software distribution
///  and also available online as http://sbml.org/software/libsbml/license.html
/// --------------------------------------------------------------------------->*/


namespace LibSBMLCSTest {

  using libsbml;

  using  System.IO;

  public class TestParameter_newSetters {
    public class AssertionError : System.Exception 
    {
      public AssertionError() : base()
      {
        
      }
    }


    static void assertTrue(bool condition)
    {
      if (condition == true)
      {
        return;
      }
      throw new AssertionError();
    }

    static void assertEquals(object a, object b)
    {
      if ( (a == null) && (b == null) )
      {
        return;
      }
      else if ( (a == null) || (b == null) )
      {
        throw new AssertionError();
      }
      else if (a.Equals(b))
      {
        return;
      }
  
      throw new AssertionError();
    }

    static void assertNotEquals(object a, object b)
    {
      if ( (a == null) && (b == null) )
      {
        throw new AssertionError();
      }
      else if ( (a == null) || (b == null) )
      {
        return;
      }
      else if (a.Equals(b))
      {
        throw new AssertionError();
      }
    }

    static void assertEquals(bool a, bool b)
    {
      if ( a == b )
      {
        return;
      }
      throw new AssertionError();
    }

    static void assertNotEquals(bool a, bool b)
    {
      if ( a != b )
      {
        return;
      }
      throw new AssertionError();
    }

    static void assertEquals(int a, int b)
    {
      if ( a == b )
      {
        return;
      }
      throw new AssertionError();
    }

    static void assertNotEquals(int a, int b)
    {
      if ( a != b )
      {
        return;
      }
      throw new AssertionError();
    }

    private Parameter P;

    public void setUp()
    {
      P = new  Parameter(1,2);
      if (P == null);
      {
      }
    }

    public void tearDown()
    {
      P = null;
    }

    public void test_Parameter_setConstant1()
    {
      long i = P.setConstant(false);
      assertTrue( i == libsbml.LIBSBML_UNEXPECTED_ATTRIBUTE );
      assertTrue( P.getConstant() == false );
    }

    public void test_Parameter_setConstant2()
    {
      Parameter p = new  Parameter(2,2);
      long i = p.setConstant(false);
      assertTrue( i == libsbml.LIBSBML_OPERATION_SUCCESS );
      assertTrue( p.getConstant() == false );
      p = null;
    }

    public void test_Parameter_setId1()
    {
      long i = P.setId( "1cell");
      assertTrue( i == libsbml.LIBSBML_INVALID_ATTRIBUTE_VALUE );
      assertEquals( false, P.isSetId() );
    }

    public void test_Parameter_setId2()
    {
      long i = P.setId( "cell");
      assertTrue( i == libsbml.LIBSBML_OPERATION_SUCCESS );
      assertEquals( true, P.isSetId() );
      assertTrue((  "cell"  == P.getId() ));
      i = P.setId("");
      assertTrue( i == libsbml.LIBSBML_OPERATION_SUCCESS );
      assertEquals( false, P.isSetId() );
    }

    public void test_Parameter_setName1()
    {
      long i = P.setName( "cell");
      assertTrue( i == libsbml.LIBSBML_OPERATION_SUCCESS );
      assertEquals( true, P.isSetName() );
      i = P.unsetName();
      assertTrue( i == libsbml.LIBSBML_OPERATION_SUCCESS );
      assertEquals( false, P.isSetName() );
    }

    public void test_Parameter_setName2()
    {
      Parameter p = new  Parameter(2,2);
      long i = p.setName( "1cell");
      assertTrue( i == libsbml.LIBSBML_OPERATION_SUCCESS );
      assertEquals( true, p.isSetName() );
      i = p.unsetName();
      assertTrue( i == libsbml.LIBSBML_OPERATION_SUCCESS );
      assertEquals( false, p.isSetName() );
      p = null;
    }

    public void test_Parameter_setName3()
    {
      Parameter p = new  Parameter(1,2);
      long i = p.setName( "11pp");
      assertTrue( i == libsbml.LIBSBML_INVALID_ATTRIBUTE_VALUE );
      assertEquals( false, p.isSetName() );
      i = p.setName("");
      assertTrue( i == libsbml.LIBSBML_OPERATION_SUCCESS );
      assertEquals( false, p.isSetName() );
      p = null;
    }

    public void test_Parameter_setUnits1()
    {
      long i = P.setUnits( "1cell");
      assertTrue( i == libsbml.LIBSBML_INVALID_ATTRIBUTE_VALUE );
      assertEquals( false, P.isSetUnits() );
      i = P.unsetUnits();
      assertTrue( i == libsbml.LIBSBML_OPERATION_SUCCESS );
      assertEquals( false, P.isSetUnits() );
    }

    public void test_Parameter_setUnits2()
    {
      long i = P.setUnits( "litre");
      assertTrue( i == libsbml.LIBSBML_OPERATION_SUCCESS );
      assertEquals( true, P.isSetUnits() );
      i = P.unsetUnits();
      assertTrue( i == libsbml.LIBSBML_OPERATION_SUCCESS );
      assertEquals( false, P.isSetUnits() );
    }

    public void test_Parameter_setUnits3()
    {
      long i = P.setUnits("");
      assertTrue( i == libsbml.LIBSBML_OPERATION_SUCCESS );
      assertEquals( false, P.isSetUnits() );
    }

    public void test_Parameter_setValue1()
    {
      long i = P.setValue(2.0);
      assertTrue( i == libsbml.LIBSBML_OPERATION_SUCCESS );
      assertTrue( P.getValue() == 2.0 );
      assertEquals( true, P.isSetValue() );
      i = P.unsetValue();
      assertTrue( i == libsbml.LIBSBML_OPERATION_SUCCESS );
      assertEquals( false, P.isSetValue() );
    }

    public void test_Parameter_setValue2()
    {
      Parameter p = new  Parameter(2,2);
      long i = p.unsetValue();
      assertTrue( i == libsbml.LIBSBML_OPERATION_SUCCESS );
      assertEquals( false, p.isSetValue() );
      p = null;
    }

  }
}
