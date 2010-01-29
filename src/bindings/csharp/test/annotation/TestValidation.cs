/// 
///  @file    TestValidation.cs
///  @brief   Validation of Date ModelCreator and ModelHistory unit tests
///  @author  Frank Bergmann (Csharp conversion)
///  @author  Akiya Jouraku (Csharp conversion)
///  @author  Sarah Keating 
/// 
///  $Id$
///  $HeadURL$
/// 
///  This test file was converted from src/sbml/test/TestValidation.cpp
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

  public class TestValidation {
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


    public void test_Validation_CVTerm1()
    {
      CVTerm cv = new CVTerm();
      assertTrue( cv != null );
      assertEquals( false, (cv.hasRequiredAttributes()) );
      cv.setQualifierType(libsbml.MODEL_QUALIFIER);
      assertEquals( false, (cv.hasRequiredAttributes()) );
      cv.setModelQualifierType(libsbml.BQM_IS);
      assertEquals( false, (cv.hasRequiredAttributes()) );
      cv.addResource("ggg");
      assertEquals( true, (cv.hasRequiredAttributes()) );
      cv = null;
    }

    public void test_Validation_CVTerm2()
    {
      CVTerm cv = new CVTerm();
      assertTrue( cv != null );
      assertEquals( false, (cv.hasRequiredAttributes()) );
      cv.setQualifierType(libsbml.BIOLOGICAL_QUALIFIER);
      assertEquals( false, (cv.hasRequiredAttributes()) );
      cv.setBiologicalQualifierType(libsbml.BQB_IS);
      assertEquals( false, (cv.hasRequiredAttributes()) );
      cv.addResource("ggg");
      assertEquals( true, (cv.hasRequiredAttributes()) );
      cv = null;
    }

    public void test_Validation_Date1()
    {
      Date date = new Date(200,12,30,12,15,45,1,2,0);
      assertTrue( date != null );
      assertEquals( false, (date.representsValidDate()) );
      date = null;
    }

    public void test_Validation_Date2()
    {
      Date date = new Date(2007,14,30,12,15,45,1,2,0);
      assertTrue( date != null );
      assertEquals( false, (date.representsValidDate()) );
      date = null;
    }

    public void test_Validation_Date3()
    {
      Date date = new Date("Jan 12");
      assertTrue( date != null );
      assertEquals( false, (date.representsValidDate()) );
      date = null;
    }

    public void test_Validation_Date4()
    {
      Date date = new Date(2007,12,30,12,15,45,1,2,0);
      assertTrue( date != null );
      assertEquals( true, date.representsValidDate() );
      date = null;
    }

    public void test_Validation_ModelCreator()
    {
      ModelCreator mc = new ModelCreator();
      assertTrue( mc != null );
      assertEquals( false, (mc.hasRequiredAttributes()) );
      mc.setEmail("k123");
      assertEquals( false, (mc.hasRequiredAttributes()) );
      mc.setFamilyName("Keating");
      assertEquals( false, (mc.hasRequiredAttributes()) );
      mc.setGivenName("Sarah");
      assertEquals( true, mc.hasRequiredAttributes() );
      mc = null;
    }

    public void test_Validation_ModelHistory1()
    {
      ModelHistory mh = new ModelHistory();
      assertTrue( mh != null );
      assertEquals( false, (mh.hasRequiredAttributes()) );
      Date date = new Date(2007,12,30,12,15,45,1,2,0);
      mh.setCreatedDate(date);
      assertEquals( false, (mh.hasRequiredAttributes()) );
      mh.setModifiedDate(date);
      assertEquals( false, (mh.hasRequiredAttributes()) );
      ModelCreator mc = new ModelCreator();
      mc.setFamilyName("Keating");
      mc.setGivenName("Sarah");
      mh.addCreator(mc);
      assertEquals( true, mh.hasRequiredAttributes() );
      mh = null;
    }

    public void test_Validation_ModelHistory2()
    {
      ModelHistory mh = new ModelHistory();
      assertTrue( mh != null );
      assertEquals( false, (mh.hasRequiredAttributes()) );
      Date date = new Date(200,12,30,12,15,45,1,2,0);
      mh.setCreatedDate(date);
      assertEquals( false, (mh.hasRequiredAttributes()) );
      mh.setModifiedDate(date);
      assertEquals( false, (mh.hasRequiredAttributes()) );
      ModelCreator mc = new ModelCreator();
      mc.setFamilyName("Keating");
      mc.setGivenName("Sarah");
      mh.addCreator(mc);
      assertEquals( false, (mh.hasRequiredAttributes()) );
      mh = null;
    }

    public void test_Validation_ModelHistory3()
    {
      ModelHistory mh = new ModelHistory();
      assertTrue( mh != null );
      assertEquals( false, (mh.hasRequiredAttributes()) );
      Date date = new Date(2007,12,30,12,15,45,1,2,0);
      mh.setCreatedDate(date);
      assertEquals( false, (mh.hasRequiredAttributes()) );
      mh.setModifiedDate(date);
      assertEquals( false, (mh.hasRequiredAttributes()) );
      ModelCreator mc = new ModelCreator();
      mc.setFamilyName("Keating");
      mh.addCreator(mc);
      assertEquals( false, (mh.hasRequiredAttributes()) );
      mh = null;
    }

  }
}
