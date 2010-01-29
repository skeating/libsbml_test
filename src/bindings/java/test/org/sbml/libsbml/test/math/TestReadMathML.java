/*
 *
 * @file    TestReadMathML.java
 * @brief   Read MathML unit tests
 *
 * @author  Akiya Jouraku (Java conversion)
 * @author  Ben Bornstein 
 *
 * $Id$
 * $HeadURL$
 *
 * This test file was converted from src/sbml/test/TestReadMathML.cpp
 * with the help of conversion sciprt (ctest_converter.pl).
 *
 *<!---------------------------------------------------------------------------
 * This file is part of libSBML.  Please visit http://sbml.org for more
 * information about SBML, and the latest version of libSBML.
 *
 * Copyright 2005-2010 California Institute of Technology.
 * Copyright 2002-2005 California Institute of Technology and
 *                     Japan Science and Technology Corporation.
 * 
 * This library is free software; you can redistribute it and/or modify it
 * under the terms of the GNU Lesser General Public License as published by
 * the Free Software Foundation.  A copy of the license agreement is provided
 * in the file named "LICENSE.txt" included with this software distribution
 * and also available online as http://sbml.org/software/libsbml/license.html
 *--------------------------------------------------------------------------->*/


package org.sbml.libsbml.test.math;

import org.sbml.libsbml.*;

import java.io.File;
import java.lang.AssertionError;

public class TestReadMathML {

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
  private String F;
  private ASTNode N;

  public String MATHML_FOOTER()
  {
    return "</math>";
  }

  public String MATHML_HEADER()
  {
    return "<math xmlns='http://www.w3.org/1998/Math/MathML'>\n";
  }

  public String XML_HEADER()
  {
    return "<?xml version='1.0' encoding='UTF-8'?>\n";
  }

  public boolean isnan(double x)
  {
    return (x != x);
  }

  public String wrapMathML(String s)
  {
    String r = XML_HEADER();
    r += MATHML_HEADER();
    r += s;
    r += MATHML_FOOTER();
    return r;
  }

  public String wrapXML(String s)
  {
    String r = XML_HEADER();
    r += s;
    return r;
  }

  public boolean util_isInf(double x)
  {
    return ( (x == util_PosInf()) ||  (x == util_NegInf()) );
  }


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

  protected void setUp() throws Exception
  {
    N = null;
    F = null;
  }

  protected void tearDown() throws Exception
  {
    F = null;
  }

  public void test_element_abs()
  {
    String s = wrapMathML("<apply><abs/><ci> x </ci></apply>");
    N = libsbml.readMathMLFromString(s);
    assertTrue( N != null );
    F = libsbml.formulaToString(N);
    assertTrue(F.equals( "abs(x)"));
  }

  public void test_element_and()
  {
    String s = wrapMathML("<apply> <and/> <ci>a</ci> <ci>b</ci> <ci>c</ci> </apply>"  
    );
    N = libsbml.readMathMLFromString(s);
    assertTrue( N != null );
    F = libsbml.formulaToString(N);
    assertTrue(F.equals( "and(a, b, c)"));
  }

  public void test_element_arccos()
  {
    String s = wrapMathML("<apply><arccos/><ci> x </ci></apply>");
    N = libsbml.readMathMLFromString(s);
    assertTrue( N != null );
    F = libsbml.formulaToString(N);
    assertTrue(F.equals( "acos(x)"));
  }

  public void test_element_arccosh()
  {
    String s = wrapMathML("<apply><arccosh/><ci> x </ci></apply>");
    N = libsbml.readMathMLFromString(s);
    assertTrue( N != null );
    F = libsbml.formulaToString(N);
    assertTrue(F.equals( "arccosh(x)"));
  }

  public void test_element_arccot()
  {
    String s = wrapMathML("<apply><arccot/><ci> x </ci></apply>");
    N = libsbml.readMathMLFromString(s);
    assertTrue( N != null );
    F = libsbml.formulaToString(N);
    assertTrue(F.equals( "arccot(x)"));
  }

  public void test_element_arccoth()
  {
    String s = wrapMathML("<apply><arccoth/><ci> x </ci></apply>");
    N = libsbml.readMathMLFromString(s);
    assertTrue( N != null );
    F = libsbml.formulaToString(N);
    assertTrue(F.equals( "arccoth(x)"));
  }

  public void test_element_arccsc()
  {
    String s = wrapMathML("<apply><arccsc/><ci> x </ci></apply>");
    N = libsbml.readMathMLFromString(s);
    assertTrue( N != null );
    F = libsbml.formulaToString(N);
    assertTrue(F.equals( "arccsc(x)"));
  }

  public void test_element_arccsch()
  {
    String s = wrapMathML("<apply><arccsch/><ci> x </ci></apply>");
    N = libsbml.readMathMLFromString(s);
    assertTrue( N != null );
    F = libsbml.formulaToString(N);
    assertTrue(F.equals( "arccsch(x)"));
  }

  public void test_element_arcsec()
  {
    String s = wrapMathML("<apply><arcsec/><ci> x </ci></apply>");
    N = libsbml.readMathMLFromString(s);
    assertTrue( N != null );
    F = libsbml.formulaToString(N);
    assertTrue(F.equals( "arcsec(x)"));
  }

  public void test_element_arcsech()
  {
    String s = wrapMathML("<apply><arcsech/><ci> x </ci></apply>");
    N = libsbml.readMathMLFromString(s);
    assertTrue( N != null );
    F = libsbml.formulaToString(N);
    assertTrue(F.equals( "arcsech(x)"));
  }

  public void test_element_arcsin()
  {
    String s = wrapMathML("<apply><arcsin/><ci> x </ci></apply>");
    N = libsbml.readMathMLFromString(s);
    assertTrue( N != null );
    F = libsbml.formulaToString(N);
    assertTrue(F.equals( "asin(x)"));
  }

  public void test_element_arcsinh()
  {
    String s = wrapMathML("<apply><arcsinh/><ci> x </ci></apply>");
    N = libsbml.readMathMLFromString(s);
    assertTrue( N != null );
    F = libsbml.formulaToString(N);
    assertTrue(F.equals( "arcsinh(x)"));
  }

  public void test_element_arctan()
  {
    String s = wrapMathML("<apply><arctan/><ci> x </ci></apply>");
    N = libsbml.readMathMLFromString(s);
    assertTrue( N != null );
    F = libsbml.formulaToString(N);
    assertTrue(F.equals( "atan(x)"));
  }

  public void test_element_arctanh()
  {
    String s = wrapMathML("<apply><arctanh/><ci> x </ci></apply>");
    N = libsbml.readMathMLFromString(s);
    assertTrue( N != null );
    F = libsbml.formulaToString(N);
    assertTrue(F.equals( "arctanh(x)"));
  }

  public void test_element_bug_apply_ci_1()
  {
    String s = wrapMathML("<apply>" + 
    "  <ci> Y </ci>" + 
    "  <cn> 1 </cn>" + 
    "</apply>");
    N = libsbml.readMathMLFromString(s);
    assertTrue( N != null );
    assertTrue( N.getType() == libsbml.AST_FUNCTION );
    assertTrue(N.getName().equals( "Y"));
    assertTrue( N.getNumChildren() == 1 );
    ASTNode c = N.getLeftChild();
    assertTrue( c != null );
    assertTrue( c.getType() == libsbml.AST_REAL );
    assertTrue( c.getReal() == 1 );
    assertTrue( c.getNumChildren() == 0 );
  }

  public void test_element_bug_apply_ci_2()
  {
    String s = wrapMathML("<apply>" + 
    "  <ci> Y </ci>" + 
    "  <csymbol encoding='text' " + 
    "   definitionURL='http://www.sbml.org/sbml/symbols/time'> t </csymbol>" + 
    "</apply>");
    N = libsbml.readMathMLFromString(s);
    assertTrue( N != null );
    assertTrue( N.getType() == libsbml.AST_FUNCTION );
    assertTrue(N.getName().equals( "Y"));
    assertTrue( N.getNumChildren() == 1 );
    ASTNode c = N.getLeftChild();
    assertTrue( c != null );
    assertTrue( c.getType() == libsbml.AST_NAME_TIME );
    assertTrue(c.getName().equals( "t"));
    assertTrue( c.getNumChildren() == 0 );
  }

  public void test_element_bug_cn_e_notation_1()
  {
    String s = wrapMathML("<cn type='e-notation'> 2 <sep/> -8 </cn>");
    N = libsbml.readMathMLFromString(s);
    assertTrue( N != null );
    assertTrue( N.getType() == libsbml.AST_REAL_E );
    assertTrue( N.getMantissa() == 2.0 );
    assertTrue( N.getExponent() == -8.0 );
    assertTrue( N.getNumChildren() == 0 );
  }

  public void test_element_bug_cn_e_notation_2()
  {
    String s = wrapMathML("<cn type='e-notation'> -3 <sep/> 4 </cn>");
    N = libsbml.readMathMLFromString(s);
    assertTrue( N != null );
    assertTrue( N.getType() == libsbml.AST_REAL_E );
    assertTrue( N.getMantissa() == -3.0 );
    assertTrue( N.getExponent() == 4.0 );
    assertTrue( N.getNumChildren() == 0 );
  }

  public void test_element_bug_cn_e_notation_3()
  {
    String s = wrapMathML("<cn type='e-notation'> -6 <sep/> -1 </cn>");
    N = libsbml.readMathMLFromString(s);
    assertTrue( N != null );
    assertTrue( N.getType() == libsbml.AST_REAL_E );
    assertTrue( N.getMantissa() == -6.0 );
    assertTrue( N.getExponent() == -1.0 );
    assertTrue( N.getNumChildren() == 0 );
  }

  public void test_element_bug_cn_integer_negative()
  {
    String s = wrapMathML("<cn type='integer'> -7 </cn>");
    N = libsbml.readMathMLFromString(s);
    assertTrue( N != null );
    assertTrue( N.getType() == libsbml.AST_INTEGER );
    assertTrue( N.getInteger() == -7 );
    assertTrue( N.getNumChildren() == 0 );
  }

  public void test_element_bug_csymbol_1()
  {
    String s = wrapMathML("<apply>" + 
    "  <gt/>" + 
    "  <csymbol encoding='text' " + 
    "    definitionURL='http://www.sbml.org/sbml/symbols/time'>time</csymbol>" + 
    "  <cn>5000</cn>" + 
    "</apply>");
    N = libsbml.readMathMLFromString(s);
    assertTrue( N != null );
    assertTrue( N.getType() == libsbml.AST_RELATIONAL_GT );
    assertTrue( N.getNumChildren() == 2 );
    ASTNode c = N.getLeftChild();
    assertTrue( c != null );
    assertTrue( c.getType() == libsbml.AST_NAME_TIME );
    assertTrue(c.getName().equals( "time"));
    assertTrue( c.getNumChildren() == 0 );
    c = N.getRightChild();
    assertTrue( c != null );
    assertTrue( c.getType() == libsbml.AST_REAL );
    assertTrue( c.getReal() == 5000 );
    assertTrue( c.getNumChildren() == 0 );
  }

  public void test_element_bug_csymbol_delay_1()
  {
    String s = wrapMathML("<apply>" + 
    "  <csymbol encoding='text' definitionURL='http://www.sbml.org/sbml/" + 
    "symbols/delay'> my_delay </csymbol>" + 
    "  <ci> x </ci>" + 
    "  <cn> 0.1 </cn>" + 
    "</apply>\n");
    N = libsbml.readMathMLFromString(s);
    assertTrue( N != null );
    assertTrue( N.getType() == libsbml.AST_FUNCTION_DELAY );
    assertTrue(N.getName().equals( "my_delay"));
    assertTrue( N.getNumChildren() == 2 );
    ASTNode c = N.getLeftChild();
    assertTrue( c != null );
    assertTrue( c.getType() == libsbml.AST_NAME );
    assertTrue(c.getName().equals( "x"));
    assertTrue( c.getNumChildren() == 0 );
    c = N.getRightChild();
    assertTrue( c != null );
    assertTrue( c.getType() == libsbml.AST_REAL );
    assertTrue( c.getReal() == 0.1 );
    assertTrue( c.getNumChildren() == 0 );
  }

  public void test_element_bug_math_xmlns()
  {
    String s = wrapXML("<foo:math xmlns:foo='http://www.w3.org/1998/Math/MathML'>" + 
    "  <foo:apply>" + 
    "    <foo:plus/> <foo:cn>1</foo:cn> <foo:cn>2</foo:cn>" + 
    "  </foo:apply>" + 
    "</foo:math>");
    N = libsbml.readMathMLFromString(s);
    assertTrue( N != null );
    F = libsbml.formulaToString(N);
    assertTrue(F.equals( "1 + 2"));
  }

  public void test_element_ceiling()
  {
    String s = wrapMathML("<apply><ceiling/><cn> 1.6 </cn></apply>");
    N = libsbml.readMathMLFromString(s);
    assertTrue( N != null );
    F = libsbml.formulaToString(N);
    assertTrue(F.equals( "ceil(1.6)"));
  }

  public void test_element_ci()
  {
    String s = wrapMathML("<ci> x </ci>");
    N = libsbml.readMathMLFromString(s);
    assertTrue( N != null );
    assertTrue( N.getType() == libsbml.AST_NAME );
    assertTrue(N.getName().equals( "x"));
    assertTrue( N.getNumChildren() == 0 );
  }

  public void test_element_ci_surrounding_spaces_bug()
  {
    String s = wrapMathML("  <ci> s </ci>  ");
    N = libsbml.readMathMLFromString(s);
    assertTrue( N != null );
    assertTrue( N.getType() == libsbml.AST_NAME );
    assertTrue(N.getName().equals( "s"));
    assertTrue( N.getNumChildren() == 0 );
  }

  public void test_element_cn_default()
  {
    String s = wrapMathML("<cn> 12345.7 </cn>");
    N = libsbml.readMathMLFromString(s);
    assertTrue( N != null );
    assertTrue( N.getType() == libsbml.AST_REAL );
    assertTrue( N.getReal() == 12345.7 );
    assertTrue( N.getNumChildren() == 0 );
  }

  public void test_element_cn_e_notation()
  {
    String s = wrapMathML("<cn type='e-notation'> 12.3 <sep/> 5 </cn>");
    N = libsbml.readMathMLFromString(s);
    assertTrue( N != null );
    assertTrue( N.getType() == libsbml.AST_REAL_E );
    assertTrue( N.getMantissa() == 12.3 );
    assertTrue( N.getExponent() == 5 );
    assertTrue( N.getNumChildren() == 0 );
  }

  public void test_element_cn_integer()
  {
    String s = wrapMathML("<cn type='integer'> 12345 </cn>");
    N = libsbml.readMathMLFromString(s);
    assertTrue( N != null );
    assertTrue( N.getType() == libsbml.AST_INTEGER );
    assertTrue( N.getInteger() == 12345 );
    assertTrue( N.getNumChildren() == 0 );
  }

  public void test_element_cn_rational()
  {
    String s = wrapMathML("<cn type='rational'> 12342 <sep/> 2342342 </cn>"  
    );
    N = libsbml.readMathMLFromString(s);
    assertTrue( N != null );
    assertTrue( N.getType() == libsbml.AST_RATIONAL );
    assertTrue( N.getNumerator() == 12342 );
    assertTrue( N.getDenominator() == 2342342 );
    assertTrue( N.getNumChildren() == 0 );
  }

  public void test_element_cn_real()
  {
    String s = wrapMathML("<cn type='real'> 12345.7 </cn>");
    N = libsbml.readMathMLFromString(s);
    assertTrue( N != null );
    assertTrue( N.getType() == libsbml.AST_REAL );
    assertTrue( N.getReal() == 12345.7 );
    assertTrue( N.getNumChildren() == 0 );
  }

  public void test_element_constants_exponentiale()
  {
    String s = wrapMathML("<exponentiale/>");
    N = libsbml.readMathMLFromString(s);
    assertTrue( N != null );
    assertTrue( N.getType() == libsbml.AST_CONSTANT_E );
    assertTrue( N.getNumChildren() == 0 );
  }

  public void test_element_constants_false()
  {
    String s = wrapMathML("<false/>");
    N = libsbml.readMathMLFromString(s);
    assertTrue( N != null );
    assertTrue( N.getType() == libsbml.AST_CONSTANT_FALSE );
    assertTrue( N.getNumChildren() == 0 );
  }

  public void test_element_constants_infinity()
  {
    String s = wrapMathML("<infinity/>");
    N = libsbml.readMathMLFromString(s);
    assertTrue( N != null );
    assertTrue( N.getType() == libsbml.AST_REAL );
    assertTrue( util_isInf(N.getReal()) == true );
    assertTrue( N.getNumChildren() == 0 );
  }

  public void test_element_constants_notanumber()
  {
    String s = wrapMathML("<notanumber/>");
    N = libsbml.readMathMLFromString(s);
    assertTrue( N != null );
    assertTrue( N.getType() == libsbml.AST_REAL );
    assertEquals( true, isnan(N.getReal()) );
    assertTrue( N.getNumChildren() == 0 );
  }

  public void test_element_constants_pi()
  {
    String s = wrapMathML("<pi/>");
    N = libsbml.readMathMLFromString(s);
    assertTrue( N != null );
    assertTrue( N.getType() == libsbml.AST_CONSTANT_PI );
    assertTrue( N.getNumChildren() == 0 );
  }

  public void test_element_constants_true()
  {
    String s = wrapMathML("<true/>");
    N = libsbml.readMathMLFromString(s);
    assertTrue( N != null );
    assertTrue( N.getType() == libsbml.AST_CONSTANT_TRUE );
    assertTrue( N.getNumChildren() == 0 );
  }

  public void test_element_cos()
  {
    String s = wrapMathML("<apply><cos/><ci> x </ci></apply>");
    N = libsbml.readMathMLFromString(s);
    assertTrue( N != null );
    F = libsbml.formulaToString(N);
    assertTrue(F.equals( "cos(x)"));
  }

  public void test_element_cosh()
  {
    String s = wrapMathML("<apply><cosh/><ci> x </ci></apply>");
    N = libsbml.readMathMLFromString(s);
    assertTrue( N != null );
    F = libsbml.formulaToString(N);
    assertTrue(F.equals( "cosh(x)"));
  }

  public void test_element_cot()
  {
    String s = wrapMathML("<apply><cot/><ci> x </ci></apply>");
    N = libsbml.readMathMLFromString(s);
    assertTrue( N != null );
    F = libsbml.formulaToString(N);
    assertTrue(F.equals( "cot(x)"));
  }

  public void test_element_coth()
  {
    String s = wrapMathML("<apply><coth/><ci> x </ci></apply>");
    N = libsbml.readMathMLFromString(s);
    assertTrue( N != null );
    F = libsbml.formulaToString(N);
    assertTrue(F.equals( "coth(x)"));
  }

  public void test_element_csc()
  {
    String s = wrapMathML("<apply><csc/><ci> x </ci></apply>");
    N = libsbml.readMathMLFromString(s);
    assertTrue( N != null );
    F = libsbml.formulaToString(N);
    assertTrue(F.equals( "csc(x)"));
  }

  public void test_element_csch()
  {
    String s = wrapMathML("<apply><csch/><ci> x </ci></apply>");
    N = libsbml.readMathMLFromString(s);
    assertTrue( N != null );
    F = libsbml.formulaToString(N);
    assertTrue(F.equals( "csch(x)"));
  }

  public void test_element_csymbol_delay_1()
  {
    String s = wrapMathML("<csymbol encoding='text' " + "definitionURL='http://www.sbml.org/sbml/symbols/delay'> delay </csymbol>");
    N = libsbml.readMathMLFromString(s);
    assertTrue( N != null );
    assertTrue( N.getType() == libsbml.AST_FUNCTION_DELAY );
    assertTrue(N.getName().equals( "delay"));
    assertTrue( N.getNumChildren() == 0 );
  }

  public void test_element_csymbol_delay_2()
  {
    String s = wrapMathML("<apply>" + 
    "  <csymbol encoding='text' definitionURL='http://www.sbml.org/sbml/" + 
    "symbols/delay'> my_delay </csymbol>" + 
    "  <ci> x </ci>" + 
    "  <cn> 0.1 </cn>" + 
    "</apply>\n");
    N = libsbml.readMathMLFromString(s);
    assertTrue( N != null );
    F = libsbml.formulaToString(N);
    assertTrue(F.equals( "my_delay(x, 0.1)"));
  }

  public void test_element_csymbol_delay_3()
  {
    String s = wrapMathML("<apply>" + 
    "  <power/>" + 
    "  <apply>" + 
    "    <csymbol encoding='text' definitionURL='http://www.sbml.org/sbml/" + 
    "symbols/delay'> delay </csymbol>" + 
    "    <ci> P </ci>" + 
    "    <ci> delta_t </ci>" + 
    "  </apply>\n" + 
    "  <ci> q </ci>" + 
    "</apply>\n");
    N = libsbml.readMathMLFromString(s);
    assertTrue( N != null );
    F = libsbml.formulaToString(N);
    assertTrue(F.equals( "pow(delay(P, delta_t), q)"));
  }

  public void test_element_csymbol_time()
  {
    String s = wrapMathML("<csymbol encoding='text' " + "definitionURL='http://www.sbml.org/sbml/symbols/time'> t </csymbol>");
    N = libsbml.readMathMLFromString(s);
    assertTrue( N != null );
    assertTrue( N.getType() == libsbml.AST_NAME_TIME );
    assertTrue(N.getName().equals( "t"));
    assertTrue( N.getNumChildren() == 0 );
  }

  public void test_element_eq()
  {
    String s = wrapMathML("<apply> <eq/> <ci>a</ci> <ci>b</ci> <ci>c</ci> </apply>"  
    );
    N = libsbml.readMathMLFromString(s);
    assertTrue( N != null );
    F = libsbml.formulaToString(N);
    assertTrue(F.equals( "eq(a, b, c)"));
  }

  public void test_element_exp()
  {
    String s = wrapMathML("<apply><exp/><ci> x </ci></apply>");
    N = libsbml.readMathMLFromString(s);
    assertTrue( N != null );
    F = libsbml.formulaToString(N);
    assertTrue(F.equals( "exp(x)"));
  }

  public void test_element_factorial()
  {
    String s = wrapMathML("<apply><factorial/><cn> 5 </cn></apply>");
    N = libsbml.readMathMLFromString(s);
    assertTrue( N != null );
    F = libsbml.formulaToString(N);
    assertTrue(F.equals( "factorial(5)"));
  }

  public void test_element_floor()
  {
    String s = wrapMathML("<apply><floor/><cn> 1.2 </cn></apply>");
    N = libsbml.readMathMLFromString(s);
    assertTrue( N != null );
    F = libsbml.formulaToString(N);
    assertTrue(F.equals( "floor(1.2)"));
  }

  public void test_element_function_call_1()
  {
    String s = wrapMathML("<apply> <ci> foo </ci> <ci> x </ci> </apply>");
    N = libsbml.readMathMLFromString(s);
    assertTrue( N != null );
    F = libsbml.formulaToString(N);
    assertTrue(F.equals( "foo(x)"));
  }

  public void test_element_function_call_2()
  {
    String s = wrapMathML("<apply> <plus/> <cn> 1 </cn>" + 
    "                <apply> <ci> f </ci> <ci> x </ci> </apply>" + 
    "</apply>");
    N = libsbml.readMathMLFromString(s);
    assertTrue( N != null );
    F = libsbml.formulaToString(N);
    assertTrue(F.equals( "1 + f(x)"));
  }

  public void test_element_geq()
  {
    String s = wrapMathML("<apply> <geq/> <cn>1</cn> <ci>x</ci> <cn>0</cn> </apply>"  
    );
    N = libsbml.readMathMLFromString(s);
    assertTrue( N != null );
    F = libsbml.formulaToString(N);
    assertTrue(F.equals( "geq(1, x, 0)"));
  }

  public void test_element_gt()
  {
    String s = wrapMathML("<apply> <gt/> <infinity/>" + 
    "              <apply> <minus/> <infinity/> <cn>1</cn> </apply>" + 
    "</apply>");
    N = libsbml.readMathMLFromString(s);
    assertTrue( N != null );
    F = libsbml.formulaToString(N);
    assertTrue(F.equals( "gt(INF, INF - 1)"));
  }

  public void test_element_invalid_mathml()
  {
    String invalid = wrapMathML("<lambda>" + 
    "<bvar>" + 
    "<ci definitionURL=\"http://biomodels.net/SBO/#SBO:0000065\">c</ci>" + 
    "</bvar>" + 
    "<apply>" + 
    "  <ci>c</ci>" + 
    "</apply>" + 
    "</lambda>\n");
    N = libsbml.readMathMLFromString(null);
    assertTrue( N == null );
    N = libsbml.readMathMLFromString(invalid);
    assertTrue( N == null );
  }

  public void test_element_lambda()
  {
    String s = wrapMathML("<lambda>" + 
    "  <bvar> <ci>x</ci> </bvar>" + 
    "  <apply> <sin/>" + 
    "          <apply> <plus/> <ci>x</ci> <cn>1</cn> </apply>" + 
    "  </apply>" + 
    "</lambda>");
    N = libsbml.readMathMLFromString(s);
    assertTrue( N != null );
    F = libsbml.formulaToString(N);
    assertTrue(F.equals( "lambda(x, sin(x + 1))"));
  }

  public void test_element_leq()
  {
    String s = wrapMathML("<apply> <leq/> <cn>0</cn> <ci>x</ci> <cn>1</cn> </apply>"  
    );
    N = libsbml.readMathMLFromString(s);
    assertTrue( N != null );
    F = libsbml.formulaToString(N);
    assertTrue(F.equals( "leq(0, x, 1)"));
  }

  public void test_element_ln()
  {
    String s = wrapMathML("<apply><ln/><ci> a </ci></apply>");
    N = libsbml.readMathMLFromString(s);
    assertTrue( N != null );
    F = libsbml.formulaToString(N);
    assertTrue(F.equals( "log(a)"));
  }

  public void test_element_log_1()
  {
    String s = wrapMathML("<apply> <log/> <logbase> <cn type='integer'> 3 </cn> </logbase>" + 
    "               <ci> x </ci>" + 
    "</apply>");
    N = libsbml.readMathMLFromString(s);
    assertTrue( N != null );
    F = libsbml.formulaToString(N);
    assertTrue(F.equals( "log(3, x)"));
  }

  public void test_element_log_2()
  {
    String s = wrapMathML("<apply> <log/> <ci> x </ci> </apply>");
    N = libsbml.readMathMLFromString(s);
    assertTrue( N != null );
    F = libsbml.formulaToString(N);
    assertTrue(F.equals( "log10(x)"));
  }

  public void test_element_lt()
  {
    String s = wrapMathML("<apply> <lt/> <apply> <minus/> <infinity/> <infinity/> </apply>" + 
    "              <cn>1</cn>" + 
    "</apply>");
    N = libsbml.readMathMLFromString(s);
    assertTrue( N != null );
    F = libsbml.formulaToString(N);
    assertTrue(F.equals( "lt(INF - INF, 1)"));
  }

  public void test_element_math()
  {
    String s = wrapXML("<math xmlns='http://www.w3.org/1998/Math/MathML'/>"  
    );
    N = libsbml.readMathMLFromString(s);
    assertTrue( N != null );
    assertTrue( N.getType() == libsbml.AST_UNKNOWN );
  }

  public void test_element_neq()
  {
    String s = wrapMathML("<apply> <neq/> <notanumber/> <notanumber/> </apply>"  
    );
    N = libsbml.readMathMLFromString(s);
    assertTrue( N != null );
    F = libsbml.formulaToString(N);
    assertTrue(F.equals( "neq(NaN, NaN)"));
  }

  public void test_element_not()
  {
    String s = wrapMathML("<apply> <not/> <ci> TooShabby </ci> </apply>");
    N = libsbml.readMathMLFromString(s);
    assertTrue( N != null );
    F = libsbml.formulaToString(N);
    assertTrue(F.equals( "not(TooShabby)"));
  }

  public void test_element_operator_plus()
  {
    String s = wrapMathML("<apply> <plus/> <cn> 1 </cn> <cn> 2 </cn> <cn> 3 </cn> </apply>"  
    );
    N = libsbml.readMathMLFromString(s);
    assertTrue( N != null );
    F = libsbml.formulaToString(N);
    assertTrue(F.equals( "1 + 2 + 3"));
  }

  public void test_element_operator_times()
  {
    String s = wrapMathML("<apply> <times/> <ci> x </ci> <ci> y </ci> <ci> z </ci> </apply>"  
    );
    N = libsbml.readMathMLFromString(s);
    assertTrue( N != null );
    F = libsbml.formulaToString(N);
    assertTrue(F.equals( "x * y * z"));
  }

  public void test_element_or()
  {
    String s = wrapMathML("<apply> <or/> <ci>a</ci> <ci>b</ci> <ci>c</ci> <ci>d</ci> </apply>"  
    );
    N = libsbml.readMathMLFromString(s);
    assertTrue( N != null );
    F = libsbml.formulaToString(N);
    assertTrue(F.equals( "or(a, b, c, d)"));
  }

  public void test_element_piecewise()
  {
    String s = wrapMathML("<piecewise>" + 
    "  <piece>" + 
    "    <apply> <minus/> <ci>x</ci> </apply>" + 
    "    <apply> <lt/> <ci>x</ci> <cn>0</cn> </apply>" + 
    "  </piece>" + 
    "  <piece>" + 
    "    <cn>0</cn>" + 
    "    <apply> <eq/> <ci>x</ci> <cn>0</cn> </apply>" + 
    "  </piece>" + 
    "  <piece>" + 
    "    <ci>x</ci>" + 
    "    <apply> <gt/> <ci>x</ci> <cn>0</cn> </apply>" + 
    "  </piece>" + 
    "</piecewise>");
    N = libsbml.readMathMLFromString(s);
    assertTrue( N != null );
    F = libsbml.formulaToString(N);
    assertTrue(F.equals( "piecewise(-x, lt(x, 0), 0, eq(x, 0), x, gt(x, 0))"));
  }

  public void test_element_piecewise_otherwise()
  {
    String s = wrapMathML("<piecewise>" + 
    "  <piece>" + 
    "    <cn>0</cn>" + 
    "    <apply> <lt/> <ci>x</ci> <cn>0</cn> </apply>" + 
    "  </piece>" + 
    "  <otherwise>" + 
    "    <ci>x</ci>" + 
    "  </otherwise>" + 
    "</piecewise>");
    N = libsbml.readMathMLFromString(s);
    assertTrue( N != null );
    F = libsbml.formulaToString(N);
    assertTrue(F.equals( "piecewise(0, lt(x, 0), x)"));
  }

  public void test_element_power()
  {
    String s = wrapMathML("<apply><power/> <ci>x</ci> <cn>3</cn> </apply>");
    N = libsbml.readMathMLFromString(s);
    assertTrue( N != null );
    F = libsbml.formulaToString(N);
    assertTrue(F.equals( "pow(x, 3)"));
  }

  public void test_element_root_1()
  {
    String s = wrapMathML("<apply> <root/> <degree> <cn type='integer'> 3 </cn> </degree>" + 
    "               <ci> a </ci>" + 
    "</apply>");
    N = libsbml.readMathMLFromString(s);
    assertTrue( N != null );
    F = libsbml.formulaToString(N);
    assertTrue(F.equals( "root(3, a)"));
  }

  public void test_element_root_2()
  {
    String s = wrapMathML("<apply> <root/> <ci> a </ci> </apply>");
    N = libsbml.readMathMLFromString(s);
    assertTrue( N != null );
    F = libsbml.formulaToString(N);
    assertTrue(F.equals( "sqrt(a)"));
  }

  public void test_element_sec()
  {
    String s = wrapMathML("<apply><sec/><ci> x </ci></apply>");
    N = libsbml.readMathMLFromString(s);
    assertTrue( N != null );
    F = libsbml.formulaToString(N);
    assertTrue(F.equals( "sec(x)"));
  }

  public void test_element_sech()
  {
    String s = wrapMathML("<apply><sech/><ci> x </ci></apply>");
    N = libsbml.readMathMLFromString(s);
    assertTrue( N != null );
    F = libsbml.formulaToString(N);
    assertTrue(F.equals( "sech(x)"));
  }

  public void test_element_sin()
  {
    String s = wrapMathML("<apply><sin/><ci> x </ci></apply>");
    N = libsbml.readMathMLFromString(s);
    assertTrue( N != null );
    F = libsbml.formulaToString(N);
    assertTrue(F.equals( "sin(x)"));
  }

  public void test_element_sinh()
  {
    String s = wrapMathML("<apply><sinh/><ci> x </ci></apply>");
    N = libsbml.readMathMLFromString(s);
    assertTrue( N != null );
    F = libsbml.formulaToString(N);
    assertTrue(F.equals( "sinh(x)"));
  }

  public void test_element_tan()
  {
    String s = wrapMathML("<apply><tan/><ci> x </ci></apply>");
    N = libsbml.readMathMLFromString(s);
    assertTrue( N != null );
    F = libsbml.formulaToString(N);
    assertTrue(F.equals( "tan(x)"));
  }

  public void test_element_tanh()
  {
    String s = wrapMathML("<apply><tanh/><ci> x </ci></apply>");
    N = libsbml.readMathMLFromString(s);
    assertTrue( N != null );
    F = libsbml.formulaToString(N);
    assertTrue(F.equals( "tanh(x)"));
  }

  public void test_element_xor()
  {
    String s = wrapMathML("<apply> <xor/> <ci>a</ci> <ci>b</ci> <ci>b</ci> <ci>a</ci> </apply>"  
    );
    N = libsbml.readMathMLFromString(s);
    assertTrue( N != null );
    F = libsbml.formulaToString(N);
    assertTrue(F.equals( "xor(a, b, b, a)"));
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
