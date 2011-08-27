/**
 * \file    TestSyntaxChecker.c
 * \brief   SyntaxChecker unit tests
 * \author  Sarah Keating
 * 
 * <!--------------------------------------------------------------------------
 * This file is part of libSBML.  Please visit http://sbml.org for more
 * information about SBML, and the latest version of libSBML.
 *
 * Copyright (C) 2009-2011 jointly by the following organizations: 
 *     1. California Institute of Technology, Pasadena, CA, USA
 *     2. EMBL European Bioinformatics Institute (EBML-EBI), Hinxton, UK
 *  
 * Copyright (C) 2006-2008 by the California Institute of Technology,
 *     Pasadena, CA, USA 
 *  
 * Copyright (C) 2002-2005 jointly by the following organizations: 
 *     1. California Institute of Technology, Pasadena, CA, USA
 *     2. Japan Science and Technology Agency, Japan
 * 
 * This library is free software; you can redistribute it and/or modify it
 * under the terms of the GNU Lesser General Public License as published by
 * the Free Software Foundation.  A copy of the license agreement is provided
 * in the file named "LICENSE.txt" included with this software distribution
 * and also available online as http://sbml.org/software/libsbml/license.html
 * ---------------------------------------------------------------------- -->*/

#include <sbml/common/common.h>

#include <sbml/SBase.h>
#include <sbml/SyntaxChecker.h>
#include <sbml/xml/XMLNamespaces.h>
#include <sbml/xml/XMLAttributes.h>
#include <sbml/xml/XMLTriple.h>
#include <sbml/xml/XMLNode.h>

#include <check.h>



#include <sbml/common/extern.h>

BEGIN_C_DECLS

START_TEST (test_SyntaxChecker_validId)
{
  fail_unless( SyntaxChecker_isValidSBMLSId("cell")  == 1 );
  fail_unless( SyntaxChecker_isValidSBMLSId("1cell") == 0 );
  fail_unless( SyntaxChecker_isValidSBMLSId("") == 0 );
}
END_TEST


START_TEST (test_SyntaxChecker_validID)
{
  fail_unless( SyntaxChecker_isValidXMLID("cell")  == 1 );
  fail_unless( SyntaxChecker_isValidXMLID("1cell") == 0 );
  fail_unless( SyntaxChecker_isValidXMLID("_cell") == 1 );
}
END_TEST


START_TEST (test_SyntaxChecker_validUnitId)
{
  fail_unless( SyntaxChecker_isValidUnitSId("cell")  == 1 );
  fail_unless( SyntaxChecker_isValidUnitSId("1cell") == 0 );
}
END_TEST


START_TEST (test_SyntaxChecker_validXHTML)
{
  SBMLNamespaces_t *NS24 = SBMLNamespaces_create(2,4);
  SBMLNamespaces_t *NS31 = SBMLNamespaces_create(3,1);

  XMLToken_t *toptoken;
  XMLNode_t *topnode;
  XMLTriple_t * toptriple = XMLTriple_createWith("notes", "", "");

  XMLToken_t *token;
  XMLNode_t *node;
  XMLTriple_t * triple = XMLTriple_createWith("p", "", "");
  XMLAttributes_t * att = XMLAttributes_create ();
  XMLNamespaces_t *ns = XMLNamespaces_create();
  XMLNamespaces_add(ns, "http://www.w3.org/1999/xhtml", "");
  XMLToken_t *tt = XMLToken_createWithText("This is my text");
  XMLNode_t *n1 = XMLNode_createFromToken(tt);


  toptoken = XMLToken_createWithTripleAttr(toptriple, att);
  topnode = XMLNode_createFromToken(toptoken);

  token = XMLToken_createWithTripleAttrNS(triple, att, ns);
  node = XMLNode_createFromToken(token);
  XMLNode_addChild(node, n1);
  XMLNode_addChild(topnode, node);

  fail_unless( SyntaxChecker_hasExpectedXHTMLSyntax(topnode, NULL) == 1 );
  fail_unless( SyntaxChecker_hasExpectedXHTMLSyntax(topnode, NS24) == 1 );
  fail_unless( SyntaxChecker_hasExpectedXHTMLSyntax(topnode, NS31) == 1 );

  triple = XMLTriple_createWith("html", "", "");
  token = XMLToken_createWithTripleAttrNS(triple, att, ns);
  node = XMLNode_createFromToken(token);
  XMLNode_addChild(node, n1);
  XMLNode_removeChild(topnode, 0);
  XMLNode_addChild(topnode, node);

  fail_unless( SyntaxChecker_hasExpectedXHTMLSyntax(topnode, NULL) == 1 );
  fail_unless( SyntaxChecker_hasExpectedXHTMLSyntax(topnode, NS24) == 0 );
  fail_unless( SyntaxChecker_hasExpectedXHTMLSyntax(topnode, NS31) == 1 );

  triple = XMLTriple_createWith("html", "", "");
  XMLNamespaces_clear(ns);

  token = XMLToken_createWithTripleAttrNS(triple, att, ns);
  node = XMLNode_createFromToken(token);
  XMLNode_addChild(node, n1);
  XMLNode_removeChild(topnode, 0);
  XMLNode_addChild(topnode, node);

  fail_unless( SyntaxChecker_hasExpectedXHTMLSyntax(topnode, NULL) == 0 );
  fail_unless( SyntaxChecker_hasExpectedXHTMLSyntax(topnode, NS24) == 0 );
  fail_unless( SyntaxChecker_hasExpectedXHTMLSyntax(topnode, NS31) == 0 );
}
END_TEST

START_TEST (test_SyntaxChecker_accessWithNULL)
{
  fail_unless(SyntaxChecker_hasExpectedXHTMLSyntax(NULL, NULL) == 0);
  fail_unless(SyntaxChecker_isValidSBMLSId(NULL) == 0);
  fail_unless(SyntaxChecker_isValidUnitSId(NULL) == 0);
  fail_unless(SyntaxChecker_isValidXMLID(NULL) == 0);
}
END_TEST

Suite *
create_suite_SyntaxChecker (void)
{
  Suite *suite = suite_create("SyntaxChecker");
  TCase *tcase = tcase_create("SyntaxChecker");


  tcase_add_test( tcase, test_SyntaxChecker_validId        );
  tcase_add_test( tcase, test_SyntaxChecker_validID        );
  tcase_add_test( tcase, test_SyntaxChecker_validUnitId    );
  tcase_add_test( tcase, test_SyntaxChecker_validXHTML     );
  tcase_add_test( tcase, test_SyntaxChecker_accessWithNULL );


  suite_add_tcase(suite, tcase);

  return suite;
}

END_C_DECLS

