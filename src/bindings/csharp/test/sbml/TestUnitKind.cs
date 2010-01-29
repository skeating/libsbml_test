/// 
///  @file    TestUnitKind.cs
///  @brief   UnitKind enumeration unit tests
///  @author  Frank Bergmann (Csharp conversion)
///  @author  Akiya Jouraku (Csharp conversion)
///  @author  Ben Bornstein 
/// 
///  $Id$
///  $HeadURL$
/// 
///  This test file was converted from src/sbml/test/TestUnitKind.c
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

  public class TestUnitKind {
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


    public void test_UnitKind_equals()
    {
      assertEquals( 1, libsbml.UnitKind_equals(libsbml.UNIT_KIND_AMPERE,libsbml.UNIT_KIND_AMPERE) );
      assertEquals( 1, libsbml.UnitKind_equals(libsbml.UNIT_KIND_INVALID,libsbml.UNIT_KIND_INVALID) );
      assertEquals( 1, libsbml.UnitKind_equals(libsbml.UNIT_KIND_LITER,libsbml.UNIT_KIND_LITER) );
      assertEquals( 1, libsbml.UnitKind_equals(libsbml.UNIT_KIND_LITRE,libsbml.UNIT_KIND_LITRE) );
      assertEquals( 1, libsbml.UnitKind_equals(libsbml.UNIT_KIND_METER,libsbml.UNIT_KIND_METER) );
      assertEquals( 1, libsbml.UnitKind_equals(libsbml.UNIT_KIND_METRE,libsbml.UNIT_KIND_METRE) );
      assertEquals( 1, libsbml.UnitKind_equals(libsbml.UNIT_KIND_LITER,libsbml.UNIT_KIND_LITRE) );
      assertEquals( 1, libsbml.UnitKind_equals(libsbml.UNIT_KIND_LITRE,libsbml.UNIT_KIND_LITER) );
      assertEquals( 1, libsbml.UnitKind_equals(libsbml.UNIT_KIND_METER,libsbml.UNIT_KIND_METRE) );
      assertEquals( 1, libsbml.UnitKind_equals(libsbml.UNIT_KIND_METRE,libsbml.UNIT_KIND_METER) );
      assertEquals( 0, libsbml.UnitKind_equals(libsbml.UNIT_KIND_AMPERE,libsbml.UNIT_KIND_WEBER) );
    }

    public void test_UnitKind_forName()
    {
      assertTrue( libsbml.UnitKind_forName("ampere") == libsbml.UNIT_KIND_AMPERE );
      assertTrue( libsbml.UnitKind_forName("becquerel") == libsbml.UNIT_KIND_BECQUEREL );
      assertTrue( libsbml.UnitKind_forName("candela") == libsbml.UNIT_KIND_CANDELA );
      assertTrue( libsbml.UnitKind_forName("Celsius") == libsbml.UNIT_KIND_CELSIUS );
      assertTrue( libsbml.UnitKind_forName("coulomb") == libsbml.UNIT_KIND_COULOMB );
      assertTrue( libsbml.UnitKind_forName("dimensionless") == libsbml.UNIT_KIND_DIMENSIONLESS );
      assertTrue( libsbml.UnitKind_forName("farad") == libsbml.UNIT_KIND_FARAD );
      assertTrue( libsbml.UnitKind_forName("gram") == libsbml.UNIT_KIND_GRAM );
      assertTrue( libsbml.UnitKind_forName("gray") == libsbml.UNIT_KIND_GRAY );
      assertTrue( libsbml.UnitKind_forName("henry") == libsbml.UNIT_KIND_HENRY );
      assertTrue( libsbml.UnitKind_forName("hertz") == libsbml.UNIT_KIND_HERTZ );
      assertTrue( libsbml.UnitKind_forName("item") == libsbml.UNIT_KIND_ITEM );
      assertTrue( libsbml.UnitKind_forName("joule") == libsbml.UNIT_KIND_JOULE );
      assertTrue( libsbml.UnitKind_forName("katal") == libsbml.UNIT_KIND_KATAL );
      assertTrue( libsbml.UnitKind_forName("kelvin") == libsbml.UNIT_KIND_KELVIN );
      assertTrue( libsbml.UnitKind_forName("kilogram") == libsbml.UNIT_KIND_KILOGRAM );
      assertTrue( libsbml.UnitKind_forName("liter") == libsbml.UNIT_KIND_LITER );
      assertTrue( libsbml.UnitKind_forName("litre") == libsbml.UNIT_KIND_LITRE );
      assertTrue( libsbml.UnitKind_forName("lumen") == libsbml.UNIT_KIND_LUMEN );
      assertTrue( libsbml.UnitKind_forName("lux") == libsbml.UNIT_KIND_LUX );
      assertTrue( libsbml.UnitKind_forName("meter") == libsbml.UNIT_KIND_METER );
      assertTrue( libsbml.UnitKind_forName("metre") == libsbml.UNIT_KIND_METRE );
      assertTrue( libsbml.UnitKind_forName("mole") == libsbml.UNIT_KIND_MOLE );
      assertTrue( libsbml.UnitKind_forName("newton") == libsbml.UNIT_KIND_NEWTON );
      assertTrue( libsbml.UnitKind_forName("ohm") == libsbml.UNIT_KIND_OHM );
      assertTrue( libsbml.UnitKind_forName("pascal") == libsbml.UNIT_KIND_PASCAL );
      assertTrue( libsbml.UnitKind_forName("radian") == libsbml.UNIT_KIND_RADIAN );
      assertTrue( libsbml.UnitKind_forName("second") == libsbml.UNIT_KIND_SECOND );
      assertTrue( libsbml.UnitKind_forName("siemens") == libsbml.UNIT_KIND_SIEMENS );
      assertTrue( libsbml.UnitKind_forName("sievert") == libsbml.UNIT_KIND_SIEVERT );
      assertTrue( libsbml.UnitKind_forName("steradian") == libsbml.UNIT_KIND_STERADIAN );
      assertTrue( libsbml.UnitKind_forName("tesla") == libsbml.UNIT_KIND_TESLA );
      assertTrue( libsbml.UnitKind_forName("volt") == libsbml.UNIT_KIND_VOLT );
      assertTrue( libsbml.UnitKind_forName("watt") == libsbml.UNIT_KIND_WATT );
      assertTrue( libsbml.UnitKind_forName("weber") == libsbml.UNIT_KIND_WEBER );
      assertTrue( libsbml.UnitKind_forName(null) == libsbml.UNIT_KIND_INVALID );
      assertTrue( libsbml.UnitKind_forName("") == libsbml.UNIT_KIND_INVALID );
      assertTrue( libsbml.UnitKind_forName("foobar") == libsbml.UNIT_KIND_INVALID );
    }

    public void test_UnitKind_isValidUnitKindString()
    {
      assertEquals( 0, libsbml.UnitKind_isValidUnitKindString("fun-foam-unit for kids!",1,1) );
      assertEquals( 1, libsbml.UnitKind_isValidUnitKindString("litre",2,2) );
      assertEquals( 0, libsbml.UnitKind_isValidUnitKindString("liter",2,2) );
      assertEquals( 1, libsbml.UnitKind_isValidUnitKindString("liter",1,2) );
      assertEquals( 0, libsbml.UnitKind_isValidUnitKindString("meter",2,3) );
      assertEquals( 1, libsbml.UnitKind_isValidUnitKindString("metre",2,1) );
      assertEquals( 1, libsbml.UnitKind_isValidUnitKindString("meter",1,2) );
      assertEquals( 1, libsbml.UnitKind_isValidUnitKindString("Celsius",2,1) );
      assertEquals( 0, libsbml.UnitKind_isValidUnitKindString("Celsius",2,2) );
    }

    public void test_UnitKind_toString()
    {
      string s;
      s = libsbml.UnitKind_toString(libsbml.UNIT_KIND_AMPERE);
      assertTrue((  "ampere" == s ));
      s = libsbml.UnitKind_toString(libsbml.UNIT_KIND_BECQUEREL);
      assertTrue((  "becquerel" == s ));
      s = libsbml.UnitKind_toString(libsbml.UNIT_KIND_CANDELA);
      assertTrue((  "candela" == s ));
      s = libsbml.UnitKind_toString(libsbml.UNIT_KIND_CELSIUS);
      assertTrue((  "Celsius" == s ));
      s = libsbml.UnitKind_toString(libsbml.UNIT_KIND_COULOMB);
      assertTrue((  "coulomb" == s ));
      s = libsbml.UnitKind_toString(libsbml.UNIT_KIND_DIMENSIONLESS);
      assertTrue((  "dimensionless" == s ));
      s = libsbml.UnitKind_toString(libsbml.UNIT_KIND_FARAD);
      assertTrue((  "farad" == s ));
      s = libsbml.UnitKind_toString(libsbml.UNIT_KIND_GRAM);
      assertTrue((  "gram" == s ));
      s = libsbml.UnitKind_toString(libsbml.UNIT_KIND_GRAY);
      assertTrue((  "gray" == s ));
      s = libsbml.UnitKind_toString(libsbml.UNIT_KIND_HENRY);
      assertTrue((  "henry" == s ));
      s = libsbml.UnitKind_toString(libsbml.UNIT_KIND_HERTZ);
      assertTrue((  "hertz" == s ));
      s = libsbml.UnitKind_toString(libsbml.UNIT_KIND_ITEM);
      assertTrue((  "item" == s ));
      s = libsbml.UnitKind_toString(libsbml.UNIT_KIND_JOULE);
      assertTrue((  "joule" == s ));
      s = libsbml.UnitKind_toString(libsbml.UNIT_KIND_KATAL);
      assertTrue((  "katal" == s ));
      s = libsbml.UnitKind_toString(libsbml.UNIT_KIND_KELVIN);
      assertTrue((  "kelvin" == s ));
      s = libsbml.UnitKind_toString(libsbml.UNIT_KIND_KILOGRAM);
      assertTrue((  "kilogram" == s ));
      s = libsbml.UnitKind_toString(libsbml.UNIT_KIND_LITER);
      assertTrue((  "liter" == s ));
      s = libsbml.UnitKind_toString(libsbml.UNIT_KIND_LITRE);
      assertTrue((  "litre" == s ));
      s = libsbml.UnitKind_toString(libsbml.UNIT_KIND_LUMEN);
      assertTrue((  "lumen" == s ));
      s = libsbml.UnitKind_toString(libsbml.UNIT_KIND_LUX);
      assertTrue((  "lux" == s ));
      s = libsbml.UnitKind_toString(libsbml.UNIT_KIND_METER);
      assertTrue((  "meter" == s ));
      s = libsbml.UnitKind_toString(libsbml.UNIT_KIND_METRE);
      assertTrue((  "metre" == s ));
      s = libsbml.UnitKind_toString(libsbml.UNIT_KIND_MOLE);
      assertTrue((  "mole" == s ));
      s = libsbml.UnitKind_toString(libsbml.UNIT_KIND_NEWTON);
      assertTrue((  "newton" == s ));
      s = libsbml.UnitKind_toString(libsbml.UNIT_KIND_OHM);
      assertTrue((  "ohm" == s ));
      s = libsbml.UnitKind_toString(libsbml.UNIT_KIND_PASCAL);
      assertTrue((  "pascal" == s ));
      s = libsbml.UnitKind_toString(libsbml.UNIT_KIND_RADIAN);
      assertTrue((  "radian" == s ));
      s = libsbml.UnitKind_toString(libsbml.UNIT_KIND_SECOND);
      assertTrue((  "second" == s ));
      s = libsbml.UnitKind_toString(libsbml.UNIT_KIND_SIEMENS);
      assertTrue((  "siemens" == s ));
      s = libsbml.UnitKind_toString(libsbml.UNIT_KIND_SIEVERT);
      assertTrue((  "sievert" == s ));
      s = libsbml.UnitKind_toString(libsbml.UNIT_KIND_STERADIAN);
      assertTrue((  "steradian" == s ));
      s = libsbml.UnitKind_toString(libsbml.UNIT_KIND_TESLA);
      assertTrue((  "tesla" == s ));
      s = libsbml.UnitKind_toString(libsbml.UNIT_KIND_VOLT);
      assertTrue((  "volt" == s ));
      s = libsbml.UnitKind_toString(libsbml.UNIT_KIND_WATT);
      assertTrue((  "watt" == s ));
      s = libsbml.UnitKind_toString(libsbml.UNIT_KIND_WEBER);
      assertTrue((  "weber" == s ));
      s = libsbml.UnitKind_toString(libsbml.UNIT_KIND_INVALID);
      assertTrue((  "(Invalid UnitKind)" == s ));
      s = libsbml.UnitKind_toString(-1);
      assertTrue((  "(Invalid UnitKind)" == s ));
      s = libsbml.UnitKind_toString(libsbml.UNIT_KIND_INVALID + 1);
      assertTrue((  "(Invalid UnitKind)" == s ));
    }

  }
}
