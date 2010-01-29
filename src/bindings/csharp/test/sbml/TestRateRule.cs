/// 
///  @file    TestRateRule.cs
///  @brief   RateRule unit tests
///  @author  Frank Bergmann (Csharp conversion)
///  @author  Akiya Jouraku (Csharp conversion)
///  @author  Ben Bornstein 
/// 
///  $Id$
///  $HeadURL$
/// 
///  This test file was converted from src/sbml/test/TestRateRule.c
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

  public class TestRateRule {
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

    private Rule RR;

    public void setUp()
    {
      RR = new  RateRule(1,2);
      if (RR == null);
      {
      }
    }

    public void tearDown()
    {
      RR = null;
    }

    public void test_RateRule_create()
    {
      assertTrue( RR.getTypeCode() == libsbml.SBML_RATE_RULE );
      assertTrue( RR.getMetaId() == "" );
      assertTrue( RR.getNotes() == null );
      assertTrue( RR.getAnnotation() == null );
      assertTrue( RR.getFormula() == "" );
      assertTrue( RR.getMath() == null );
      assertTrue( RR.getVariable() == "" );
      assertTrue( RR.getType() == libsbml.RULE_TYPE_RATE );
    }

    public void test_RateRule_createWithNS()
    {
      XMLNamespaces xmlns = new  XMLNamespaces();
      xmlns.add( "http://www.sbml.org", "testsbml");
      SBMLNamespaces sbmlns = new  SBMLNamespaces(2,1);
      sbmlns.addNamespaces(xmlns);
      Rule object1 = new  RateRule(sbmlns);
      assertTrue( object1.getTypeCode() == libsbml.SBML_RATE_RULE );
      assertTrue( object1.getMetaId() == "" );
      assertTrue( object1.getNotes() == null );
      assertTrue( object1.getAnnotation() == null );
      assertTrue( object1.getLevel() == 2 );
      assertTrue( object1.getVersion() == 1 );
      assertTrue( object1.getNamespaces() != null );
      assertTrue( object1.getNamespaces().getLength() == 2 );
      object1 = null;
    }

    public void test_RateRule_free_NULL()
    {
    }

    public void test_RateRule_setVariable()
    {
      string variable =  "x";;
      RR.setVariable(variable);
      assertTrue(( variable == RR.getVariable() ));
      assertEquals( true, RR.isSetVariable() );
      if (RR.getVariable() == variable);
      {
      }
      RR.setVariable(RR.getVariable());
      assertTrue(( variable == RR.getVariable() ));
      RR.setVariable("");
      assertEquals( false, RR.isSetVariable() );
      if (RR.getVariable() != null);
      {
      }
    }

  }
}
