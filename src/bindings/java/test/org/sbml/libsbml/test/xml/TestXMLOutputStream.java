/*
 *
 * @file    TestXMLOutputStream.java
 * @brief   XMLOutputStream unit tests
 *
 * @author  Akiya Jouraku (Java conversion)
 * @author  Sarah Keating 
 *
 * $Id$
 * $HeadURL$
 *
 * This test file was converted from src/sbml/test/TestXMLOutputStream.c
 * with the help of conversion sciprt (ctest_converter.pl).
 *
 *<!---------------------------------------------------------------------------
 * This file is part of libSBML.  Please visit http://sbml.org for more
 * information about SBML, and the latest version of libSBML.
 *
 * Copyright 2005-2009 California Institute of Technology.
 * Copyright 2002-2005 California Institute of Technology and
 *                     Japan Science and Technology Corporation.
 * 
 * This library is free software; you can redistribute it and/or modify it
 * under the terms of the GNU Lesser General Public License as published by
 * the Free Software Foundation.  A copy of the license agreement is provided
 * in the file named "LICENSE.txt" included with this software distribution
 * and also available online as http://sbml.org/software/libsbml/license.html
 *--------------------------------------------------------------------------->*/


package org.sbml.libsbml.test.xml;

import org.sbml.libsbml.*;

import java.io.File;
import java.lang.AssertionError;

public class TestXMLOutputStream {

  static void assertTrue(boolean condition) throws AssertionError
  {
    if (condition == true)
    {
      return;
    }
    throw new AssertionError();
  }

  static void assertEquals(Object a, Object b) throws AssertionError
  {
    if ( (a == null) && (b == null) )
    {
      return;
    }
    else if ( (a == null) || (b == null) )
    {
      throw new AssertionError();
    }
    else if (a.equals(b))
    {
      return;
    }

    throw new AssertionError();
  }

  static void assertNotEquals(Object a, Object b) throws AssertionError
  {
    if ( (a == null) && (b == null) )
    {
      throw new AssertionError();
    }
    else if ( (a == null) || (b == null) )
    {
      return;
    }
    else if (a.equals(b))
    {
      throw new AssertionError();
    }
  }

  static void assertEquals(boolean a, boolean b) throws AssertionError
  {
    if ( a == b )
    {
      return;
    }
    throw new AssertionError();
  }

  static void assertNotEquals(boolean a, boolean b) throws AssertionError
  {
    if ( a != b )
    {
      return;
    }
    throw new AssertionError();
  }

  static void assertEquals(int a, int b) throws AssertionError
  {
    if ( a == b )
    {
      return;
    }
    throw new AssertionError();
  }

  static void assertNotEquals(int a, int b) throws AssertionError
  {
    if ( a != b )
    {
      return;
    }
    throw new AssertionError();
  }

  public void test_XMLOutputStream_CharacterReference()
  {
    OStringStream oss = new OStringStream();
    XMLOutputStream stream = new  XMLOutputStream(oss,"",false);
    stream.startElement( "testcr");
    stream.writeAttribute( "chars",    "one"     );
    stream.writeAttribute( "amp",      "&"       );
    stream.writeAttribute( "deccr",    "&#0168;"  );
    stream.writeAttribute( "hexcr",    "&#x00a8;");
    stream.writeAttribute( "lhexcr",   "&#x00A8;");
    stream.writeAttribute( "nodeccr1", "&#01688"  );
    stream.writeAttribute( "nodeccr2", "&#;"     );
    stream.writeAttribute( "nodeccr3", "&#00a8;" );
    stream.writeAttribute( "nodeccr4", "&#00A8;" );
    stream.writeAttribute( "nohexcr1", "&#x;"    );
    stream.writeAttribute( "nohexcr2", "&#xABCD" );
    stream.endElement( "testcr");
    String expected = "<testcr chars=\"one\" amp=\"&amp;\" deccr=\"&#0168;\" hexcr=\"&#x00a8;\" " +
    "lhexcr=\"&#x00A8;\" nodeccr1=\"&amp;#01688\" nodeccr2=\"&amp;#;\" " + 
    "nodeccr3=\"&amp;#00a8;\" nodeccr4=\"&amp;#00A8;\" " + 
    "nohexcr1=\"&amp;#x;\" nohexcr2=\"&amp;#xABCD\"/>";
    String s = oss.str();
    assertTrue(s.equals(expected));
    stream = null;
  }

  public void test_XMLOutputStream_Elements()
  {
    double d = 2.4;
    long l = 123456789;
    long ui = 5;
    long i = -3;
    OStringStream oss = new OStringStream();
    XMLOutputStream stream = new  XMLOutputStream(oss,"",false);
    stream.startElement( "fred");
    stream.writeAttribute( "chars", "two");
    stream.writeAttribute( "bool",true);
    stream.writeAttribute( "double",d);
    stream.writeAttribute( "long",l);
    stream.writeAttribute( "uint",ui);
    stream.writeAttribute( "int",i);
    stream.endElement( "fred");
    String expected =  "<fred chars=\"two\" bool=\"true\" double=\"2.4\" long=\"123456789\" uint=\"5\" int=\"-3\"/>";;
    String s = oss.str();
    assertTrue(s.equals(expected));
    stream = null;
  }

  public void test_XMLOutputStream_PredefinedEntity()
  {
    OStringStream oss = new OStringStream();
    XMLOutputStream stream = new  XMLOutputStream(oss,"",false);
    stream.startElement( "testpde");
    stream.writeAttribute( "amp",     "&"     );
    stream.writeAttribute( "apos",    "'"     );
    stream.writeAttribute( "gt",      ">"     );
    stream.writeAttribute( "lt",      "<"     );
    stream.writeAttribute( "quot",    "\""    );
    stream.writeAttribute( "pdeamp",  "&amp;" );
    stream.writeAttribute( "pdeapos", "&apos;");
    stream.writeAttribute( "pdegt",   "&gt;"  );
    stream.writeAttribute( "pdelt",   "&lt;"  );
    stream.writeAttribute( "pdequot", "&quot;");
    stream.endElement( "testpde");
    String expected = "<testpde amp=\"&amp;\" apos=\"&apos;\" gt=\"&gt;\" lt=\"&lt;\" " +
                      "quot=\"&quot;\" pdeamp=\"&amp;\" pdeapos=\"&apos;\" pdegt=\"&gt;\" " + 
                      "pdelt=\"&lt;\" pdequot=\"&quot;\"/>";
    String s = oss.str();
    assertTrue(s.equals(expected));
    stream = null;
  }

  public void test_XMLOutputStream_createStdout()
  {
    XMLOutputStream stream = new  XMLOutputStream(libsbml.cout,"UTF-8",false);
    assertTrue( stream != null );
    stream = null;
  }

  public void test_XMLOutputStream_createStdoutWithProgramInfo()
  {
    XMLOutputStream stream = new  XMLOutputStream(libsbml.cout,"UTF-8",false, "foo", "bar");
    assertTrue( stream != null );
    stream = null;
  }

  public void test_XMLOutputStream_createString()
  {
    String expected =  "<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n";;
    OStringStream oss = new OStringStream();
    XMLOutputStream stream = new  XMLOutputStream(oss,"UTF-8",true);
    assertTrue( stream != null );
    String str = oss.str();
    assertTrue(str.equals(expected));
    stream = null;
  }

  public void test_XMLOutputStream_createStringWithProgramInfo()
  {
    String expected =  "<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n";;
    OStringStream oss = new OStringStream();
    XMLOutputStream stream = new  XMLOutputStream(oss,"UTF-8",true, "", "");
    assertTrue( stream != null );
    String str = oss.str();
    assertTrue(str.equals(expected));
    stream = null;
  }

  public void test_XMLOutputStream_startEnd()
  {
    OStringStream oss = new OStringStream();
    XMLOutputStream stream = new  XMLOutputStream(oss,"",false);
    assertTrue( stream != null );
    stream.startEndElement( "id");
    String str = oss.str();
    assertTrue(str.equals( "<id/>"));
    stream = null;
  }

  /**
   * Loads the SWIG-generated libSBML Java module when this class is
   * loaded, or reports a sensible diagnostic message about why it failed.
   */
  static
  {
    String varname;
    String shlibname;

    if (System.getProperty("mrj.version") != null)
    {
      varname = "DYLD_LIBRARY_PATH";    // We're on a Mac.
      shlibname = "libsbmlj.jnilib and/or libsbml.dylib";
    }
    else
    {
      varname = "LD_LIBRARY_PATH";      // We're not on a Mac.
      shlibname = "libsbmlj.so and/or libsbml.so";
    }

    try
    {
      System.loadLibrary("sbmlj");
      // For extra safety, check that the jar file is in the classpath.
      Class.forName("org.sbml.libsbml.libsbml");
    }
    catch (SecurityException e)
    {
      e.printStackTrace();
      System.err.println("Could not load the libSBML library files due to a"+
                         " security exception.\n");
      System.exit(1);
    }
    catch (UnsatisfiedLinkError e)
    {
      e.printStackTrace();
      System.err.println("Error: could not link with the libSBML library files."+
                         " It is likely\nyour " + varname +
                         " environment variable does not include the directories\n"+
                         "containing the " + shlibname + " library files.\n");
      System.exit(1);
    }
    catch (ClassNotFoundException e)
    {
      e.printStackTrace();
      System.err.println("Error: unable to load the file libsbmlj.jar."+
                         " It is likely\nyour -classpath option and CLASSPATH" +
                         " environment variable\n"+
                         "do not include the path to libsbmlj.jar.\n");
      System.exit(1);
    }
  }
}
