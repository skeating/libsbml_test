/// 
///  @file    TestL3Parameter.cs
///  @brief   L3 Parameter unit tests
///  @author  Frank Bergmann (Csharp conversion)
///  @author  Akiya Jouraku (Csharp conversion)
///  @author  Sarah Keating 
/// 
///  $Id$
///  $HeadURL$
/// 
///  This test file was converted from src/sbml/test/TestL3Parameter.c
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

  public class TestL3Parameter {
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

    public bool isnan(double x)
    {
      return (x != x);
    }

    public void setUp()
    {
      P = new  Parameter(3,1);
      if (P == null);
      {
      }
    }

    public void tearDown()
    {
      P = null;
    }

    public void test_L3_Parameter_NS()
    {
      assertTrue( P.getNamespaces() != null );
      assertTrue( P.getNamespaces().getLength() == 1 );
      assertTrue((     "http://www.sbml.org/sbml/level3/version1/core" == P.getNamespaces().getURI(0) ));
    }

    public void test_L3_Parameter_constant()
    {
      assertTrue( P.isSetConstant() == false );
      P.setConstant(true);
      assertTrue( P.getConstant() == true );
      assertTrue( P.isSetConstant() == true );
      P.setConstant(false);
      assertTrue( P.getConstant() == false );
      assertTrue( P.isSetConstant() == true );
    }

    public void test_L3_Parameter_create()
    {
      assertTrue( P.getTypeCode() == libsbml.SBML_PARAMETER );
      assertTrue( P.getMetaId() == "" );
      assertTrue( P.getNotes() == null );
      assertTrue( P.getAnnotation() == null );
      assertTrue( P.getId() == "" );
      assertTrue( P.getName() == "" );
      assertTrue( P.getUnits() == "" );
      assertEquals( true, isnan(P.getValue()) );
      assertTrue( P.getConstant() == true );
      assertEquals( false, P.isSetId() );
      assertEquals( false, P.isSetName() );
      assertEquals( false, P.isSetValue() );
      assertEquals( false, P.isSetUnits() );
      assertEquals( false, P.isSetConstant() );
    }

    public void test_L3_Parameter_createWithNS()
    {
      XMLNamespaces xmlns = new  XMLNamespaces();
      xmlns.add( "http://www.sbml.org", "testsbml");
      SBMLNamespaces sbmlns = new  SBMLNamespaces(3,1);
      sbmlns.addNamespaces(xmlns);
      Parameter p = new  Parameter(sbmlns);
      assertTrue( p.getTypeCode() == libsbml.SBML_PARAMETER );
      assertTrue( p.getMetaId() == "" );
      assertTrue( p.getNotes() == null );
      assertTrue( p.getAnnotation() == null );
      assertTrue( p.getLevel() == 3 );
      assertTrue( p.getVersion() == 1 );
      assertTrue( p.getNamespaces() != null );
      assertTrue( p.getNamespaces().getLength() == 2 );
      assertTrue( p.getId() == "" );
      assertTrue( p.getName() == "" );
      assertTrue( p.getUnits() == "" );
      assertEquals( true, isnan(p.getValue()) );
      assertTrue( p.getConstant() == true );
      assertEquals( false, p.isSetId() );
      assertEquals( false, p.isSetName() );
      assertEquals( false, p.isSetValue() );
      assertEquals( false, p.isSetUnits() );
      assertEquals( false, p.isSetConstant() );
      p = null;
    }

    public void test_L3_Parameter_free_NULL()
    {
    }

    public void test_L3_Parameter_hasRequiredAttributes()
    {
      Parameter p = new  Parameter(3,1);
      assertEquals( false, p.hasRequiredAttributes() );
      p.setId( "id");
      assertEquals( false, p.hasRequiredAttributes() );
      p.setConstant(false);
      assertEquals( true, p.hasRequiredAttributes() );
      p = null;
    }

    public void test_L3_Parameter_id()
    {
      string id =  "mitochondria";;
      assertEquals( false, P.isSetId() );
      P.setId(id);
      assertTrue(( id == P.getId() ));
      assertEquals( true, P.isSetId() );
      if (P.getId() == id);
      {
      }
    }

    public void test_L3_Parameter_name()
    {
      string name =  "My_Favorite_Factory";;
      assertEquals( false, P.isSetName() );
      P.setName(name);
      assertTrue(( name == P.getName() ));
      assertEquals( true, P.isSetName() );
      if (P.getName() == name);
      {
      }
      P.unsetName();
      assertEquals( false, P.isSetName() );
      if (P.getName() != null);
      {
      }
    }

    public void test_L3_Parameter_units()
    {
      string units =  "volume";;
      assertEquals( false, P.isSetUnits() );
      P.setUnits(units);
      assertTrue(( units == P.getUnits() ));
      assertEquals( true, P.isSetUnits() );
      if (P.getUnits() == units);
      {
      }
      P.unsetUnits();
      assertEquals( false, P.isSetUnits() );
      if (P.getUnits() != null);
      {
      }
    }

    public void test_L3_Parameter_value()
    {
      assertEquals( false, P.isSetValue() );
      assertEquals( true, isnan(P.getValue()) );
      P.setValue(1.5);
      assertEquals( true, P.isSetValue() );
      assertTrue( P.getValue() == 1.5 );
      P.unsetValue();
      assertEquals( false, P.isSetValue() );
      assertEquals( true, isnan(P.getValue()) );
    }

  }
}
