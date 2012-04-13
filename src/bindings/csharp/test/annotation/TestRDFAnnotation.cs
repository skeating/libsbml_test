///  @file    TestRDFAnnotation.cs
///  @brief   fomula units data unit tests
///  @author  Frank Bergmann (Csharp conversion)
///  @author  Akiya Jouraku (Csharp conversion)
///  @author  Ben Bornstein 
///  
///  ====== WARNING ===== WARNING ===== WARNING ===== WARNING ===== WARNING ======
/// 
///  DO NOT EDIT THIS FILE.
/// 
///  This file was generated automatically by converting the file located at
///  src/sbml/test/TestRDFAnnotation.cpp
///  using the conversion program dev/utilities/translateTests/translateTests.pl.
///  Any changes made here will be lost the next time the file is regenerated.
/// 
///  -----------------------------------------------------------------------------
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
///  -----------------------------------------------------------------------------


namespace LibSBMLCSTest.annotation {

  using libsbmlcs;

  using System;

  using System.IO;

  public class TestRDFAnnotation {
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

    private SBMLDocument d;
    private Model m;


  public double util_NaN()
  {
    double z = 0.0;
    return 0.0/z;
  }

  public double util_PosInf()
  {
    double z = 0.0;
    return 1.0/z;
  }

  public double util_NegInf()
  {
    double z = 0.0;
    return -1.0/z;
  }

//  public bool equals(string s)
//  {
//    return s == OSS.str();
//  }

  public bool equals(string s1, string s2)
  {
    return (s1 ==s2);
  }

    public void setUp()
    {
      string filename = "../../sbml/annotation/test/test-data/annotation.xml";
      d = libsbml.readSBML(filename);
      m = d.getModel();
    }

    public void tearDown()
    {
    }

    public void test_RDFAnnotation_delete()
    {
      XMLNode node = RDFAnnotationParser.parseCVTerms(m.getCompartment(0));
      XMLNode n1 = RDFAnnotationParser.deleteRDFAnnotation(node);
      string expected =  "<annotation/>";
      assertTrue( n1.getNumChildren() == 0 );
      assertTrue( n1.getName() ==  "annotation" );
      assertEquals( true, equals(expected,n1.toXMLString()) );
      node = null;
    }

    public void test_RDFAnnotation_deleteWithOther()
    {
      Compartment c = m.getCompartment(1);
      XMLNode node = RDFAnnotationParser.deleteRDFAnnotation(c.getAnnotation());
      string expected = "<annotation>\n" + "  <jd2:JDesignerLayout version=\"2.0\" MajorVersion=\"2\" MinorVersion=\"0\" BuildVersion=\"41\">\n" + 
    "    <jd2:header>\n" + 
    "      <jd2:VersionHeader JDesignerVersion=\"2.0\"/>\n" + 
    "      <jd2:ModelHeader Author=\"Mr Untitled\" ModelVersion=\"0.0\" ModelTitle=\"untitled\"/>\n" + 
    "      <jd2:TimeCourseDetails timeStart=\"0\" timeEnd=\"10\" numberOfPoints=\"1000\"/>\n" + 
    "    </jd2:header>\n" + 
    "  </jd2:JDesignerLayout>\n" + 
    "</annotation>";
      assertEquals( true, equals(expected,node.toXMLString()) );
    }

    public void test_RDFAnnotation_deleteWithOutOther()
    {
      Compartment c = m.getCompartment(2);
      XMLNode node = c.getAnnotation();
      string expected = "<annotation>\n" + "  <jd2:JDesignerLayout version=\"2.0\" MajorVersion=\"2\" MinorVersion=\"0\" BuildVersion=\"41\">\n" + 
    "    <jd2:header>\n" + 
    "      <jd2:VersionHeader JDesignerVersion=\"2.0\"/>\n" + 
    "      <jd2:ModelHeader Author=\"Mr Untitled\" ModelVersion=\"0.0\" ModelTitle=\"untitled\"/>\n" + 
    "      <jd2:TimeCourseDetails timeStart=\"0\" timeEnd=\"10\" numberOfPoints=\"1000\"/>\n" + 
    "    </jd2:header>\n" + 
    "  </jd2:JDesignerLayout>\n" + 
    "</annotation>";
      assertEquals( true, equals(expected,node.toXMLString()) );
    }

    public void test_RDFAnnotation_getModelHistory()
    {
      assertTrue( ! (m == null) );
      ModelHistory history = m.getModelHistory();
      assertTrue( history != null );
      ModelCreator mc = history.getCreator(0);
      assertTrue((  "Le Novere" == mc.getFamilyName() ));
      assertTrue((  "Nicolas" == mc.getGivenName() ));
      assertTrue((  "lenov@ebi.ac.uk" == mc.getEmail() ));
      assertTrue((  "EMBL-EBI" == mc.getOrganisation() ));
      Date date = history.getCreatedDate();
      assertTrue( date.getYear() == 2005 );
      assertTrue( date.getMonth() == 2 );
      assertTrue( date.getDay() == 2 );
      assertTrue( date.getHour() == 14 );
      assertTrue( date.getMinute() == 56 );
      assertTrue( date.getSecond() == 11 );
      assertTrue( date.getSignOffset() == 0 );
      assertTrue( date.getHoursOffset() == 0 );
      assertTrue( date.getMinutesOffset() == 0 );
      assertTrue((  "2005-02-02T14:56:11Z" == date.getDateAsString() ));
      date = history.getModifiedDate();
      assertTrue( date.getYear() == 2006 );
      assertTrue( date.getMonth() == 5 );
      assertTrue( date.getDay() == 30 );
      assertTrue( date.getHour() == 10 );
      assertTrue( date.getMinute() == 46 );
      assertTrue( date.getSecond() == 2 );
      assertTrue( date.getSignOffset() == 0 );
      assertTrue( date.getHoursOffset() == 0 );
      assertTrue( date.getMinutesOffset() == 0 );
      assertTrue((  "2006-05-30T10:46:02Z" == date.getDateAsString() ));
    }

    public void test_RDFAnnotation_parseCVTerms()
    {
      XMLNode node = RDFAnnotationParser.parseCVTerms(m.getCompartment(0));
      assertTrue( node.getNumChildren() == 1 );
      XMLNode rdf = node.getChild(0);
      assertTrue((  "RDF" == rdf.getName() ));
      assertTrue((  "rdf" == rdf.getPrefix() ));
      assertTrue((  "http://www.w3.org/1999/02/22-rdf-syntax-ns#" == rdf.getURI() ));
      assertTrue( rdf.getNumChildren() == 1 );
      XMLNode desc = rdf.getChild(0);
      assertTrue((  "Description" == desc.getName() ));
      assertTrue((  "rdf" == desc.getPrefix() ));
      assertTrue((  "http://www.w3.org/1999/02/22-rdf-syntax-ns#" == desc.getURI() ));
      assertTrue( desc.getNumChildren() == 1 );
      XMLNode is1 = desc.getChild(0);
      assertTrue((  "is" == is1.getName() ));
      assertTrue((  "bqbiol" == is1.getPrefix() ));
      assertTrue( is1.getNumChildren() == 1 );
      XMLNode Bag = is1.getChild(0);
      assertTrue((  "Bag" == Bag.getName() ));
      assertTrue((  "rdf" == Bag.getPrefix() ));
      assertTrue((  "http://www.w3.org/1999/02/22-rdf-syntax-ns#" == Bag.getURI() ));
      assertTrue( Bag.getNumChildren() == 4 );
      XMLNode li = Bag.getChild(0);
      assertTrue((  "li" == li.getName() ));
      assertTrue((  "rdf" == li.getPrefix() ));
      assertTrue((  "http://www.w3.org/1999/02/22-rdf-syntax-ns#" == li.getURI() ));
      assertTrue( li.getNumChildren() == 0 );
      XMLNode li1 = Bag.getChild(1);
      assertTrue((  "li" == li1.getName() ));
      assertTrue((  "rdf" == li1.getPrefix() ));
      assertTrue((  "http://www.w3.org/1999/02/22-rdf-syntax-ns#" == li1.getURI() ));
      assertTrue( li1.getNumChildren() == 0 );
      XMLNode li2 = Bag.getChild(2);
      assertTrue((  "li" == li2.getName() ));
      assertTrue((  "rdf" == li2.getPrefix() ));
      assertTrue((  "http://www.w3.org/1999/02/22-rdf-syntax-ns#" == li2.getURI() ));
      assertTrue( li2.getNumChildren() == 0 );
      XMLNode li3 = Bag.getChild(3);
      assertTrue((  "li" == li3.getName() ));
      assertTrue((  "rdf" == li3.getPrefix() ));
      assertTrue((  "http://www.w3.org/1999/02/22-rdf-syntax-ns#" == li3.getURI() ));
      assertTrue( li3.getNumChildren() == 0 );
      node = null;
    }

    public void test_RDFAnnotation_parseModelHistory()
    {
      XMLNode node = RDFAnnotationParser.parseModelHistory(m);
      assertTrue( node.getNumChildren() == 1 );
      XMLNode rdf = node.getChild(0);
      assertTrue((  "RDF" == rdf.getName() ));
      assertTrue((  "rdf" == rdf.getPrefix() ));
      assertTrue((  "http://www.w3.org/1999/02/22-rdf-syntax-ns#" == rdf.getURI() ));
      assertTrue( rdf.getNumChildren() == 1 );
      XMLNode desc = rdf.getChild(0);
      assertTrue((  "Description" == desc.getName() ));
      assertTrue((  "rdf" == desc.getPrefix() ));
      assertTrue((  "http://www.w3.org/1999/02/22-rdf-syntax-ns#" == desc.getURI() ));
      assertTrue( desc.getNumChildren() == 3 );
      XMLNode creator = desc.getChild(0);
      assertTrue((  "creator" == creator.getName() ));
      assertTrue((  "dc" == creator.getPrefix() ));
      assertTrue((  "http://purl.org/dc/elements/1.1/" == creator.getURI() ));
      assertTrue( creator.getNumChildren() == 1 );
      XMLNode Bag = creator.getChild(0);
      assertTrue((  "Bag" == Bag.getName() ));
      assertTrue((  "rdf" == Bag.getPrefix() ));
      assertTrue((  "http://www.w3.org/1999/02/22-rdf-syntax-ns#" == Bag.getURI() ));
      assertTrue( Bag.getNumChildren() == 1 );
      XMLNode li = Bag.getChild(0);
      assertTrue((  "li" == li.getName() ));
      assertTrue((  "rdf" == li.getPrefix() ));
      assertTrue((  "http://www.w3.org/1999/02/22-rdf-syntax-ns#" == li.getURI() ));
      assertTrue( li.getNumChildren() == 3 );
      XMLNode N = li.getChild(0);
      assertTrue((  "N" == N.getName() ));
      assertTrue((  "vCard" == N.getPrefix() ));
      assertTrue((  "http://www.w3.org/2001/vcard-rdf/3.0#" == N.getURI() ));
      assertTrue( N.getNumChildren() == 2 );
      XMLNode Family = N.getChild(0);
      assertTrue((  "Family" == Family.getName() ));
      assertTrue((  "vCard" == Family.getPrefix() ));
      assertTrue((  "http://www.w3.org/2001/vcard-rdf/3.0#" == Family.getURI() ));
      assertTrue( Family.getNumChildren() == 1 );
      XMLNode Given = N.getChild(1);
      assertTrue((  "Given" == Given.getName() ));
      assertTrue((  "vCard" == Given.getPrefix() ));
      assertTrue((  "http://www.w3.org/2001/vcard-rdf/3.0#" == Given.getURI() ));
      assertTrue( Given.getNumChildren() == 1 );
      XMLNode EMAIL = li.getChild(1);
      assertTrue((  "EMAIL" == EMAIL.getName() ));
      assertTrue((  "vCard" == EMAIL.getPrefix() ));
      assertTrue((  "http://www.w3.org/2001/vcard-rdf/3.0#" == EMAIL.getURI() ));
      assertTrue( EMAIL.getNumChildren() == 1 );
      XMLNode ORG = li.getChild(2);
      assertTrue((  "ORG" == ORG.getName() ));
      assertTrue((  "vCard" == ORG.getPrefix() ));
      assertTrue((  "http://www.w3.org/2001/vcard-rdf/3.0#" == ORG.getURI() ));
      assertTrue( ORG.getNumChildren() == 1 );
      XMLNode Orgname = ORG.getChild(0);
      assertTrue((  "Orgname" == Orgname.getName() ));
      assertTrue((  "vCard" == Orgname.getPrefix() ));
      assertTrue((  "http://www.w3.org/2001/vcard-rdf/3.0#" == Orgname.getURI() ));
      assertTrue( Orgname.getNumChildren() == 1 );
      XMLNode created = desc.getChild(1);
      assertTrue((  "created" == created.getName() ));
      assertTrue((  "dcterms" == created.getPrefix() ));
      assertTrue((  "http://purl.org/dc/terms/" == created.getURI() ));
      assertTrue( created.getNumChildren() == 1 );
      XMLNode cr_date = created.getChild(0);
      assertTrue((  "W3CDTF" == cr_date.getName() ));
      assertTrue((  "dcterms" == cr_date.getPrefix() ));
      assertTrue((  "http://purl.org/dc/terms/" == cr_date.getURI() ));
      assertTrue( cr_date.getNumChildren() == 1 );
      XMLNode modified = desc.getChild(2);
      assertTrue((  "modified" == modified.getName() ));
      assertTrue((  "dcterms" == modified.getPrefix() ));
      assertTrue((  "http://purl.org/dc/terms/" == modified.getURI() ));
      assertTrue( modified.getNumChildren() == 1 );
      XMLNode mo_date = created.getChild(0);
      assertTrue((  "W3CDTF" == mo_date.getName() ));
      assertTrue((  "dcterms" == mo_date.getPrefix() ));
      assertTrue((  "http://purl.org/dc/terms/" == mo_date.getURI() ));
      assertTrue( mo_date.getNumChildren() == 1 );
      node = null;
    }

    public void test_RDFAnnotation_testMissingMetaId()
    {
      SBMLDocument doc = new SBMLDocument ( 3,1 );
      Model model = doc.createModel();
      assertTrue( model != null );
      model.setId("test1");
      CVTerm term = new CVTerm ( libsbml.MODEL_QUALIFIER );
      term.addResource("testResource");
      term.setModelQualifierType(libsbml.BQM_IS);
      model.setMetaId("t1");
      model.addCVTerm(term);
      model.setMetaId("");
      string test = model.toSBML();
      assertTrue( test ==  "<model id=\"test1\"/>" );
    }

  }
}
