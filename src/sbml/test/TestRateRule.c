/**
 * \file    TestRateRule.c
 * \brief   RateRule unit tests
 * \author  Ben Bornstein
 *
 * $Id$
 * $Source$
 */
/* Copyright 2002 California Institute of Technology and
 * Japan Science and Technology Corporation.
 *
 * This library is free software; you can redistribute it and/or modify it
 * under the terms of the GNU Lesser General Public License as published
 * by the Free Software Foundation; either version 2.1 of the License, or
 * any later version.
 *
 * This library is distributed in the hope that it will be useful, but
 * WITHOUT ANY WARRANTY, WITHOUT EVEN THE IMPLIED WARRANTY OF
 * MERCHANTABILITY OR FITNESS FOR A PARTICULAR PURPOSE.  The software and
 * documentation provided hereunder is on an "as is" basis, and the
 * California Institute of Technology and Japan Science and Technology
 * Corporation have no obligations to provide maintenance, support,
 * updates, enhancements or modifications.  In no event shall the
 * California Institute of Technology or the Japan Science and Technology
 * Corporation be liable to any party for direct, indirect, special,
 * incidental or consequential damages, including lost profits, arising
 * out of the use of this software and its documentation, even if the
 * California Institute of Technology and/or Japan Science and Technology
 * Corporation have been advised of the possibility of such damage.  See
 * the GNU Lesser General Public License for more details.
 *
 * You should have received a copy of the GNU Lesser General Public License
 * along with this library; if not, write to the Free Software Foundation,
 * Inc., 59 Temple Place, Suite 330, Boston, MA 02111-1307 USA.
 *
 * The original code contained here was initially developed by:
 *
 *     Ben Bornstein
 *     The Systems Biology Markup Language Development Group
 *     ERATO Kitano Symbiotic Systems Project
 *     Control and Dynamical Systems, MC 107-81
 *     California Institute of Technology
 *     Pasadena, CA, 91125, USA
 *
 *     http://www.cds.caltech.edu/erato
 *     mailto:sbml-team@caltech.edu
 *
 * Contributor(s):
 */


#include "common/common.h"
#include "math/FormulaParser.h"

#include "SBase.h"
#include "Rule.h"
#include "RateRule.h"

#include <check.h>


static RateRule_t *RR;


void
RateRuleTest_setup (void)
{
  RR = RateRule_create();

  if (RR == NULL)
  {
    fail("RateRule_create() returned a NULL pointer.");
  }
}


void
RateRuleTest_teardown (void)
{
  RateRule_free(RR);
}

START_TEST (test_RateRule_create)
{
  fail_unless( SBase_getTypeCode  ((SBase_t *) RR) == SBML_RATE_RULE );
  fail_unless( SBase_getMetaId    ((SBase_t *) RR) == NULL );
  fail_unless( SBase_getNotes     ((SBase_t *) RR) == NULL );
  fail_unless( SBase_getAnnotation((SBase_t *) RR) == NULL );

  fail_unless( Rule_getFormula     ((Rule_t *) RR) == NULL );
  fail_unless( Rule_getMath        ((Rule_t *) RR) == NULL );
  fail_unless( RateRule_getVariable(RR) == NULL );
}
END_TEST


START_TEST (test_RateRule_createWith)
{
  ASTNode_t  *math = SBML_parseFormula("f(W)");
  RateRule_t *rr   = RateRule_createWith("dx", math);


  fail_unless( SBase_getTypeCode  ((SBase_t *) rr) == SBML_RATE_RULE );
  fail_unless( SBase_getMetaId    ((SBase_t *) rr) == NULL );
  fail_unless( SBase_getNotes     ((SBase_t *) rr) == NULL );
  fail_unless( SBase_getAnnotation((SBase_t *) rr) == NULL );

  fail_unless( !strcmp(Rule_getFormula((Rule_t *) rr), "f(W)") );
  fail_unless( Rule_getMath((Rule_t *) rr) == math );

  fail_unless( !strcmp(RateRule_getVariable(rr), "dx") );

  RateRule_free(rr);
}
END_TEST


START_TEST (test_RateRule_free_NULL)
{
  RateRule_free(NULL);
}
END_TEST


START_TEST (test_RateRule_setVariable)
{
  char *variable = "x";


  RateRule_setVariable(RR, variable);

  fail_unless( !strcmp(RateRule_getVariable(RR), variable) );
  fail_unless( RateRule_isSetVariable(RR) );

  if (RateRule_getVariable(RR) == variable)
  {
    fail("RateRule_setVariable(...) did not make a copy of string.");
  }

  /* Reflexive case (pathological) */
  RateRule_setVariable(RR, RateRule_getVariable(RR));
  fail_unless( !strcmp(RateRule_getVariable(RR), variable) );

  RateRule_setVariable(RR, NULL);
  fail_unless( !RateRule_isSetVariable(RR) );

  if (RateRule_getVariable(RR) != NULL)
  {
    fail("RateRule_setVariable(RR, NULL) did not clear string.");
  }
}
END_TEST


Suite *
create_suite_RateRule (void)
{
  Suite *suite = suite_create("RateRule");
  TCase *tcase = tcase_create("RateRule");


  tcase_add_checked_fixture( tcase,
                             RateRuleTest_setup,
                             RateRuleTest_teardown );

  tcase_add_test( tcase, test_RateRule_create      );
  tcase_add_test( tcase, test_RateRule_createWith  );
  tcase_add_test( tcase, test_RateRule_free_NULL   );
  tcase_add_test( tcase, test_RateRule_setVariable );

  suite_add_tcase(suite, tcase);

  return suite;
}
