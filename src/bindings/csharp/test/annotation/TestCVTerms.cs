/// 
///  @file    TestCVTerms.cs
///  @brief   CVTerms unit tests
///  @author  Frank Bergmann (Csharp conversion)
///  @author  Akiya Jouraku (Csharp conversion)
///  @author  Sarah Keating 
/// 
///  $Id$
///  $HeadURL$
/// 
///  This test file was converted from src/sbml/test/TestCVTerms.c
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

  public class TestCVTerms {
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


    public void test_CVTerm_addResource()
    {
      CVTerm term = new  CVTerm(libsbml.MODEL_QUALIFIER);
      string resource =  "GO6666";;
      XMLAttributes xa;
      assertTrue( term != null );
      assertTrue( term.getQualifierType() == libsbml.MODEL_QUALIFIER );
      term.addResource(resource);
      xa = term.getResources();
      assertTrue( xa.getLength() == 1 );
      assertTrue((  "rdf:resource" == xa.getName(0) ));
      assertTrue((  "GO6666" == xa.getValue(0) ));
      term = null;
    }

    public void test_CVTerm_create()
    {
      CVTerm term = new  CVTerm(libsbml.MODEL_QUALIFIER);
      assertTrue( term != null );
      assertTrue( term.getQualifierType() == libsbml.MODEL_QUALIFIER );
      term = null;
    }

    public void test_CVTerm_createFromNode()
    {
      XMLAttributes xa;
      XMLTriple qual_triple = new  XMLTriple("is", "", "bqbiol");
      XMLTriple bag_triple = new  XMLTriple();
      XMLTriple li_triple = new  XMLTriple();
      XMLAttributes att = new  XMLAttributes();
      att.add( "", "This is my resource");
      XMLAttributes att1 = new  XMLAttributes();
      XMLToken li_token = new  XMLToken(li_triple,att);
      XMLToken bag_token = new  XMLToken(bag_triple,att1);
      XMLToken qual_token = new  XMLToken(qual_triple,att1);
      XMLNode li = new XMLNode(li_token);
      XMLNode bag = new XMLNode(bag_token);
      XMLNode node = new XMLNode(qual_token);
      bag.addChild(li);
      node.addChild(bag);
      CVTerm term = new  CVTerm(node);
      assertTrue( term != null );
      assertTrue( term.getQualifierType() == libsbml.BIOLOGICAL_QUALIFIER );
      assertTrue( term.getBiologicalQualifierType() == libsbml.BQB_IS );
      xa = term.getResources();
      assertTrue( xa.getLength() == 1 );
      assertTrue((  "rdf:resource" == xa.getName(0) ));
      assertTrue((  "This is my resource" == xa.getValue(0) ));
      qual_triple = null;
      bag_triple = null;
      li_triple = null;
      li_token = null;
      bag_token = null;
      qual_token = null;
      att = null;
      att1 = null;
      term = null;
      node = null;
      bag = null;
      li = null;
    }

    public void test_CVTerm_getResources()
    {
      CVTerm term = new  CVTerm(libsbml.MODEL_QUALIFIER);
      string resource =  "GO6666";;
      string resource1 =  "OtherURI";;
      long number;
      term.addResource(resource);
      term.addResource(resource1);
      number = term.getNumResources();
      assertTrue( number == 2 );
      assertTrue((  "GO6666" == term.getResourceURI(0) ));
      assertTrue((  "OtherURI" == term.getResourceURI(1) ));
      term = null;
    }

    public void test_CVTerm_set_get()
    {
      CVTerm term = new  CVTerm(libsbml.MODEL_QUALIFIER);
      assertTrue( term != null );
      assertTrue( term.getQualifierType() == libsbml.MODEL_QUALIFIER );
      term.setModelQualifierType(libsbml.BQM_IS);
      assertTrue( term != null );
      assertTrue( term.getQualifierType() == libsbml.MODEL_QUALIFIER );
      assertTrue( term.getModelQualifierType() == libsbml.BQM_IS );
      term.setQualifierType(libsbml.BIOLOGICAL_QUALIFIER);
      term.setBiologicalQualifierType(libsbml.BQB_IS);
      assertTrue( term.getQualifierType() == libsbml.BIOLOGICAL_QUALIFIER );
      assertTrue( term.getBiologicalQualifierType() == libsbml.BQB_IS );
      term = null;
    }

  }
}
