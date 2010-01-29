/// 
///  @file    TestModelHistory.cs
///  @brief   ModelHistory unit tests
///  @author  Frank Bergmann (Csharp conversion)
///  @author  Akiya Jouraku (Csharp conversion)
///  @author  Sarah Keating 
/// 
///  $Id$
///  $HeadURL$
/// 
///  This test file was converted from src/sbml/test/TestModelHistory.c
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

  public class TestModelHistory {
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


    public void test_Date_create()
    {
      Date date = new  Date(2005,12,30,12,15,45,1,2,0);
      assertTrue( date != null );
      assertTrue( date.getYear() == 2005 );
      assertTrue( date.getMonth() == 12 );
      assertTrue( date.getDay() == 30 );
      assertTrue( date.getHour() == 12 );
      assertTrue( date.getMinute() == 15 );
      assertTrue( date.getSecond() == 45 );
      assertTrue( date.getSignOffset() == 1 );
      assertTrue( date.getHoursOffset() == 2 );
      assertTrue( date.getMinutesOffset() == 0 );
      date = null;
    }

    public void test_Date_createFromString()
    {
      string dd =  "2012-12-02T14:56:11Z";;
      Date date = new  Date(dd);
      assertTrue( date != null );
      assertTrue((  "2012-12-02T14:56:11Z" == date.getDateAsString() ));
      assertTrue( date.getYear() == 2012 );
      assertTrue( date.getMonth() == 12 );
      assertTrue( date.getDay() == 2 );
      assertTrue( date.getHour() == 14 );
      assertTrue( date.getMinute() == 56 );
      assertTrue( date.getSecond() == 11 );
      assertTrue( date.getSignOffset() == 0 );
      assertTrue( date.getHoursOffset() == 0 );
      assertTrue( date.getMinutesOffset() == 0 );
      date = null;
    }

    public void test_Date_getDateAsString()
    {
      string dd =  "2005-02-02T14:56:11Z";;
      Date date = new  Date(dd);
      assertTrue( date != null );
      assertTrue( date.getYear() == 2005 );
      assertTrue( date.getMonth() == 2 );
      assertTrue( date.getDay() == 2 );
      assertTrue( date.getHour() == 14 );
      assertTrue( date.getMinute() == 56 );
      assertTrue( date.getSecond() == 11 );
      assertTrue( date.getSignOffset() == 0 );
      assertTrue( date.getHoursOffset() == 0 );
      assertTrue( date.getMinutesOffset() == 0 );
      date.setYear(2012);
      date.setMonth(3);
      date.setDay(28);
      date.setHour(23);
      date.setMinute(4);
      date.setSecond(32);
      date.setSignOffset(1);
      date.setHoursOffset(2);
      date.setMinutesOffset(32);
      assertTrue((  "2012-03-28T23:04:32+02:32" == date.getDateAsString() ));
      date = null;
    }

    public void test_Date_setters()
    {
      Date date = new  Date(2005,12,30,12,15,45,1,2,0);
      assertTrue( date != null );
      date.setYear(2012);
      date.setMonth(3);
      date.setDay(28);
      date.setHour(23);
      date.setMinute(4);
      date.setSecond(32);
      date.setSignOffset(1);
      date.setHoursOffset(2);
      date.setMinutesOffset(32);
      assertTrue( date.getYear() == 2012 );
      assertTrue( date.getMonth() == 3 );
      assertTrue( date.getDay() == 28 );
      assertTrue( date.getHour() == 23 );
      assertTrue( date.getMinute() == 4 );
      assertTrue( date.getSecond() == 32 );
      assertTrue( date.getSignOffset() == 1 );
      assertTrue( date.getHoursOffset() == 2 );
      assertTrue( date.getMinutesOffset() == 32 );
      assertTrue((  "2012-03-28T23:04:32+02:32" == date.getDateAsString() ));
      date = null;
    }

    public void test_ModelCreator_create()
    {
      ModelCreator mc = new  ModelCreator();
      assertTrue( mc != null );
      mc = null;
    }

    public void test_ModelCreator_setters()
    {
      ModelCreator mc = new  ModelCreator();
      assertTrue( mc != null );
      assertTrue( mc.isSetFamilyName() == false );
      assertTrue( mc.isSetGivenName() == false );
      assertTrue( mc.isSetEmail() == false );
      assertTrue( mc.isSetOrganisation() == false );
      mc.setFamilyName( "Keating");
      mc.setGivenName( "Sarah");
      mc.setEmail( "sbml-team@caltech.edu");
      mc.setOrganisation( "UH");
      assertTrue((  "Keating" == mc.getFamilyName() ));
      assertTrue((  "Sarah" == mc.getGivenName() ));
      assertTrue((  "sbml-team@caltech.edu" == mc.getEmail() ));
      assertTrue((  "UH" == mc.getOrganisation() ));
      assertTrue( mc.isSetFamilyName() == true );
      assertTrue( mc.isSetGivenName() == true );
      assertTrue( mc.isSetEmail() == true );
      assertTrue( mc.isSetOrganisation() == true );
      mc.unsetFamilyName();
      mc.unsetGivenName();
      mc.unsetEmail();
      mc.unsetOrganisation();
      assertTrue((  "" == mc.getFamilyName() ));
      assertTrue((  "" == mc.getGivenName() ));
      assertTrue((  "" == mc.getEmail() ));
      assertTrue((  "" == mc.getOrganisation() ));
      assertTrue( mc.isSetFamilyName() == false );
      assertTrue( mc.isSetGivenName() == false );
      assertTrue( mc.isSetEmail() == false );
      assertTrue( mc.isSetOrganisation() == false );
      assertTrue( mc.isSetOrganization() == false );
      mc.setOrganization( "UH");
      assertTrue((  "UH" == mc.getOrganization() ));
      assertTrue( mc.isSetOrganization() == true );
      mc.unsetOrganisation();
      assertTrue((  "" == mc.getOrganization() ));
      assertTrue( mc.isSetOrganization() == false );
      mc = null;
    }

    public void test_ModelHistory_addCreator()
    {
      ModelCreator newMC;
      ModelHistory history = new  ModelHistory();
      assertTrue( history.getNumCreators() == 0 );
      assertTrue( history != null );
      ModelCreator mc = new  ModelCreator();
      assertTrue( mc != null );
      mc.setFamilyName( "Keating");
      mc.setGivenName( "Sarah");
      mc.setEmail( "sbml-team@caltech.edu");
      mc.setOrganisation( "UH");
      history.addCreator(mc);
      assertTrue( history.getNumCreators() == 1 );
      mc = null;
      newMC = history.getListCreators().get(0);
      assertTrue( newMC != null );
      assertTrue((  "Keating" == newMC.getFamilyName() ));
      assertTrue((  "Sarah" == newMC.getGivenName() ));
      assertTrue((  "sbml-team@caltech.edu" == newMC.getEmail() ));
      assertTrue((  "UH" == newMC.getOrganisation() ));
      history = null;
    }

    public void test_ModelHistory_addModifiedDate()
    {
      ModelHistory history = new  ModelHistory();
      assertTrue( history != null );
      assertTrue( history.isSetModifiedDate() == false );
      assertTrue( history.getNumModifiedDates() == 0 );
      Date date = new  Date(2005,12,30,12,15,45,1,2,0);
      history.addModifiedDate(date);
      date = null;
      assertTrue( history.getNumModifiedDates() == 1 );
      assertTrue( history.isSetModifiedDate() == true );
      Date newdate = history.getListModifiedDates().get(0);
      assertTrue( newdate.getYear() == 2005 );
      assertTrue( newdate.getMonth() == 12 );
      assertTrue( newdate.getDay() == 30 );
      assertTrue( newdate.getHour() == 12 );
      assertTrue( newdate.getMinute() == 15 );
      assertTrue( newdate.getSecond() == 45 );
      assertTrue( newdate.getSignOffset() == 1 );
      assertTrue( newdate.getHoursOffset() == 2 );
      assertTrue( newdate.getMinutesOffset() == 0 );
      Date date1 = new  Date(2008,11,2,16,42,40,1,2,0);
      history.addModifiedDate(date1);
      date1 = null;
      assertTrue( history.getNumModifiedDates() == 2 );
      assertTrue( history.isSetModifiedDate() == true );
      Date newdate1 = history.getModifiedDate(1);
      assertTrue( newdate1.getYear() == 2008 );
      assertTrue( newdate1.getMonth() == 11 );
      assertTrue( newdate1.getDay() == 2 );
      assertTrue( newdate1.getHour() == 16 );
      assertTrue( newdate1.getMinute() == 42 );
      assertTrue( newdate1.getSecond() == 40 );
      assertTrue( newdate1.getSignOffset() == 1 );
      assertTrue( newdate1.getHoursOffset() == 2 );
      assertTrue( newdate1.getMinutesOffset() == 0 );
      history = null;
    }

    public void test_ModelHistory_create()
    {
      ModelHistory history = new  ModelHistory();
      assertTrue( history != null );
      assertTrue( history.getListCreators() != null );
      assertTrue( history.getCreatedDate() == null );
      assertTrue( history.getModifiedDate() == null );
      history = null;
    }

    public void test_ModelHistory_setCreatedDate()
    {
      ModelHistory history = new  ModelHistory();
      assertTrue( history != null );
      assertTrue( history.isSetCreatedDate() == false );
      Date date = new  Date(2005,12,30,12,15,45,1,2,0);
      history.setCreatedDate(date);
      assertTrue( history.isSetCreatedDate() == true );
      date = null;
      Date newdate = history.getCreatedDate();
      assertTrue( newdate.getYear() == 2005 );
      assertTrue( newdate.getMonth() == 12 );
      assertTrue( newdate.getDay() == 30 );
      assertTrue( newdate.getHour() == 12 );
      assertTrue( newdate.getMinute() == 15 );
      assertTrue( newdate.getSecond() == 45 );
      assertTrue( newdate.getSignOffset() == 1 );
      assertTrue( newdate.getHoursOffset() == 2 );
      assertTrue( newdate.getMinutesOffset() == 0 );
      history = null;
    }

    public void test_ModelHistory_setModifiedDate()
    {
      ModelHistory history = new  ModelHistory();
      assertTrue( history != null );
      assertTrue( history.isSetModifiedDate() == false );
      Date date = new  Date(2005,12,30,12,15,45,1,2,0);
      history.setModifiedDate(date);
      date = null;
      assertTrue( history.isSetModifiedDate() == true );
      Date newdate = history.getModifiedDate();
      assertTrue( newdate.getYear() == 2005 );
      assertTrue( newdate.getMonth() == 12 );
      assertTrue( newdate.getDay() == 30 );
      assertTrue( newdate.getHour() == 12 );
      assertTrue( newdate.getMinute() == 15 );
      assertTrue( newdate.getSecond() == 45 );
      assertTrue( newdate.getSignOffset() == 1 );
      assertTrue( newdate.getHoursOffset() == 2 );
      assertTrue( newdate.getMinutesOffset() == 0 );
      history = null;
    }

  }
}
