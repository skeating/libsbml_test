/// 
///  @file    TestXMLError.cs
///  @brief   XMLError unit tests, C++ version
///  @author  Frank Bergmann (Csharp conversion)
///  @author  Akiya Jouraku (Csharp conversion)
///  @author  Michael Hucka 
/// 
///  $Id:$
///  $HeadURL:$
/// 
///  This test file was converted from src/sbml/test/TestXMLError.cpp
///  with the help of conversion sciprt (ctest_converter.pl).
/// 
/// <!---------------------------------------------------------------------------
///  This file is part of libSBML.  Please visit http://sbml.org for more
///  information about SBML, and the latest version of libSBML.
/// 
///  Copyright 2005-2008 California Institute of Technology.
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

  public class TestXMLError {
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


    public void test_XMLError_create()
    {
      XMLError error = new XMLError();
      assertTrue( error != null );
      error = null;
      error = new XMLError(libsbml.DuplicateXMLAttribute);
      assertTrue( error.getErrorId() == libsbml.DuplicateXMLAttribute );
      assertTrue( error.getSeverity() == libsbml.LIBSBML_SEV_ERROR );
      assertTrue( error.getSeverityAsString() == "Error" );
      assertTrue( error.getCategory() == libsbml.LIBSBML_CAT_XML );
      assertTrue( error.getCategoryAsString() == "XML content" );
      assertTrue( error.getMessage() == "Duplicate attribute." );
      error = null;
      error = new XMLError(12345, "My message");
      assertTrue( error.getErrorId() == 12345 );
      assertTrue( error.getMessage() == "My message" );
      assertTrue( error.getSeverity() == libsbml.LIBSBML_SEV_FATAL );
      assertTrue( error.getSeverityAsString() == "Fatal error" );
      assertTrue( error.getCategory() == libsbml.LIBSBML_CAT_INTERNAL );
      assertTrue( error.getCategoryAsString() == "Internal" );
      error = null;
      error = new XMLError(12345, "My message",0,0,libsbml.LIBSBML_SEV_INFO,libsbml.LIBSBML_CAT_SYSTEM);
      assertTrue( error.getErrorId() == 12345 );
      assertTrue( error.getMessage() == "My message" );
      assertTrue( error.getSeverity() == libsbml.LIBSBML_SEV_INFO );
      assertTrue( error.getSeverityAsString() == "Information" );
      assertTrue( error.getCategory() == libsbml.LIBSBML_CAT_SYSTEM );
      assertTrue( error.getCategoryAsString() == "Operating system" );
      assertEquals( true, error.isInfo() );
      assertEquals( true, error.isSystem() );
      error = null;
      error = new XMLError(10000, "Another message",0,0,libsbml.LIBSBML_SEV_FATAL,libsbml.LIBSBML_CAT_XML);
      assertTrue( error.getErrorId() == 10000 );
      assertTrue( error.getMessage() == "Another message" );
      assertTrue( error.getSeverity() == libsbml.LIBSBML_SEV_FATAL );
      assertTrue( error.getSeverityAsString() == "Fatal error" );
      assertTrue( error.getCategory() == libsbml.LIBSBML_CAT_XML );
      assertTrue( error.getCategoryAsString() == "XML content" );
      assertEquals( true, error.isFatal() );
      assertEquals( true, error.isXML() );
      error = null;
    }

  }
}
