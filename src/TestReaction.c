/**
 * Filename    : TestReaction.c
 * Description : SBML Reaction unit tests
 * Author(s)   : SBML Development Group <sysbio-team@caltech.edu>
 * Organization: JST ERATO Kitano Symbiotic Systems Project
 * Created     : 2002-11-25
 * Revision    : $Id$
 * Source      : $Source$
 *
 * Copyright 2002 California Institute of Technology and
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
 *     mailto:sysbio-team@caltech.edu
 *
 * Contributor(s):
 */


#include <check.h>

#include "sbml/common.h"
#include "sbml/Reaction.h"


static Reaction_t *R;


void
ReactionTest_setup (void)
{
  R = Reaction_create();

  if (R == NULL)
  {
    fail("Reaction_create() returned a NULL pointer.");
  }
}


void
ReactionTest_teardown (void)
{
  Reaction_free(R);
}


START_TEST (test_Reaction_create)
{
  fail_unless( SBase_getTypeCode  (R) == SBML_REACTION, NULL );
  fail_unless( SBase_getMetaId    (R) == NULL, NULL );
  fail_unless( SBase_getNotes     (R) == NULL, NULL );
  fail_unless( SBase_getAnnotation(R) == NULL, NULL );

  fail_unless( Reaction_getId        (R) == NULL, NULL );
  fail_unless( Reaction_getName      (R) == NULL, NULL );
  fail_unless( Reaction_getKineticLaw(R) == NULL, NULL );
  fail_unless( Reaction_getReversible(R) != 0   , NULL );
  fail_unless( Reaction_getFast      (R) == 0   , NULL );

  fail_unless( !Reaction_isSetId        (R), NULL );
  fail_unless( !Reaction_isSetName      (R), NULL );
  fail_unless( !Reaction_isSetKineticLaw(R), NULL );

  fail_unless( Reaction_getNumReactants(R) == 0, NULL );
  fail_unless( Reaction_getNumProducts (R) == 0, NULL );
  fail_unless( Reaction_getNumModifiers(R) == 0, NULL );
}
END_TEST


START_TEST (test_Reaction_createWith)
{
  KineticLaw_t *kl = KineticLaw_create();
  Reaction_t   *r  = Reaction_createWith("r1", kl, 0, 1);


  fail_unless( SBase_getTypeCode  (r) == SBML_REACTION, NULL );
  fail_unless( SBase_getMetaId    (r) == NULL, NULL );
  fail_unless( SBase_getNotes     (r) == NULL, NULL );
  fail_unless( SBase_getAnnotation(r) == NULL, NULL );

  fail_unless( Reaction_getName(r) == NULL, NULL );

  fail_unless( !strcmp(Reaction_getId(r), "r1"), NULL );

  fail_unless( Reaction_getKineticLaw(r) == kl, NULL );
  fail_unless( Reaction_getReversible(r) ==  0, NULL );
  fail_unless( Reaction_getFast      (r) ==  1, NULL );

  fail_unless( Reaction_isSetId        (r), NULL );
  fail_unless( !Reaction_isSetName     (r), NULL );
  fail_unless( Reaction_isSetKineticLaw(r), NULL );

  fail_unless( Reaction_getNumReactants(r) == 0, NULL );
  fail_unless( Reaction_getNumProducts (r) == 0, NULL );
  fail_unless( Reaction_getNumModifiers(r) == 0, NULL );

  Reaction_free(r);
}
END_TEST


START_TEST (test_Reaction_free_NULL)
{
  Reaction_free(NULL);
}
END_TEST


START_TEST (test_Reaction_setId)
{
  char *id = "J1";


  Reaction_setId(R, id);

  fail_unless( !strcmp(Reaction_getId(R), id), NULL );
  fail_unless( Reaction_isSetId(R), NULL );

  if (Reaction_getId(R) == id)
  {
    fail("Reaction_setId(...) did not make a copy of string.");
  }

  /* Reflexive case (pathological) */
  Reaction_setId(R, Reaction_getId(R));
  fail_unless( !strcmp(Reaction_getId(R), id), NULL );

  Reaction_setId(R, NULL);
  fail_unless( !Reaction_isSetId(R), NULL );

  if (Reaction_getId(R) != NULL)
  {
    fail("Reaction_setId(R, NULL) did not clear string.");
  }
}
END_TEST


START_TEST (test_Reaction_setName)
{
  char *name = "MapK Cascade";


  Reaction_setName(R, name);

  fail_unless( !strcmp(Reaction_getName(R), name), NULL );
  fail_unless( Reaction_isSetName(R), NULL );

  if (Reaction_getName(R) == name)
  {
    fail("Reaction_setName(...) did not make a copy of string.");
  }

  /* Reflexive case (pathological) */
  Reaction_setName(R, Reaction_getName(R));
  fail_unless( !strcmp(Reaction_getName(R), name), NULL );

  Reaction_setName(R, NULL);
  fail_unless( !Reaction_isSetName(R), NULL );

  if (Reaction_getName(R) != NULL)
  {
    fail("Reaction_setName(R, NULL) did not clear string.");
  }
}
END_TEST


START_TEST (test_Reaction_addReactant)
{
  Reaction_addReactant(R, SpeciesReference_create());

  fail_unless( Reaction_getNumReactants(R) == 1, NULL );
  fail_unless( Reaction_getNumProducts (R) == 0, NULL );
  fail_unless( Reaction_getNumModifiers(R) == 0, NULL );
}
END_TEST


START_TEST (test_Reaction_addProduct)
{
  Reaction_addProduct(R, SpeciesReference_create());

  fail_unless( Reaction_getNumReactants(R) == 0, NULL );
  fail_unless( Reaction_getNumProducts (R) == 1, NULL );
  fail_unless( Reaction_getNumModifiers(R) == 0, NULL );
}
END_TEST


START_TEST (test_Reaction_addModifier)
{
  Reaction_addModifier(R, ModifierSpeciesReference_create());

  fail_unless( Reaction_getNumReactants(R) == 0, NULL );
  fail_unless( Reaction_getNumProducts (R) == 0, NULL );
  fail_unless( Reaction_getNumModifiers(R) == 1, NULL );
}
END_TEST


START_TEST (test_Reaction_getReactant)
{
  SpeciesReference_t *sr1 = SpeciesReference_create();
  SpeciesReference_t *sr2 = SpeciesReference_create();


  SpeciesReference_setSpecies(sr1, "R1");
  SpeciesReference_setSpecies(sr2, "R2");

  Reaction_addReactant(R, sr1);
  Reaction_addReactant(R, sr2);

  fail_unless( Reaction_getNumReactants(R) == 2, NULL );
  fail_unless( Reaction_getNumProducts (R) == 0, NULL );
  fail_unless( Reaction_getNumModifiers(R) == 0, NULL );

  sr1 = Reaction_getReactant(R, 0);
  sr2 = Reaction_getReactant(R, 1);

  fail_unless( !strcmp(SpeciesReference_getSpecies(sr1), "R1"), NULL );
  fail_unless( !strcmp(SpeciesReference_getSpecies(sr2), "R2"), NULL );
}
END_TEST


START_TEST (test_Reaction_getReactantById)
{
  SpeciesReference_t *sr1 = SpeciesReference_createWith("R1", 1, 1);
  SpeciesReference_t *sr2 = SpeciesReference_createWith("R2", 1, 1);


  Reaction_addReactant(R, sr1);
  Reaction_addReactant(R, sr2);

  fail_unless( Reaction_getNumReactants(R) == 2, NULL );
  fail_unless( Reaction_getNumProducts (R) == 0, NULL );
  fail_unless( Reaction_getNumModifiers(R) == 0, NULL );

  fail_unless( Reaction_getReactantById(R, "R1") == sr1 , NULL );
  fail_unless( Reaction_getReactantById(R, "R2") == sr2 , NULL );
  fail_unless( Reaction_getReactantById(R, "R3") == NULL, NULL );
}
END_TEST


START_TEST (test_Reaction_getProduct)
{
  SpeciesReference_t *sr1 = SpeciesReference_create();
  SpeciesReference_t *sr2 = SpeciesReference_create();


  SpeciesReference_setSpecies(sr1, "P1");
  SpeciesReference_setSpecies(sr2, "P2");

  Reaction_addProduct(R, sr1);
  Reaction_addProduct(R, sr2);

  fail_unless( Reaction_getNumReactants(R) == 0, NULL );
  fail_unless( Reaction_getNumProducts (R) == 2, NULL );
  fail_unless( Reaction_getNumModifiers(R) == 0, NULL );

  sr1 = Reaction_getProduct(R, 0);
  sr2 = Reaction_getProduct(R, 1);

  fail_unless( !strcmp(SpeciesReference_getSpecies(sr1), "P1"), NULL );
  fail_unless( !strcmp(SpeciesReference_getSpecies(sr2), "P2"), NULL );
}
END_TEST


START_TEST (test_Reaction_getProductById)
{
  SpeciesReference_t *sr1 = SpeciesReference_createWith("P1", 1, 1);
  SpeciesReference_t *sr2 = SpeciesReference_createWith("P2", 1, 1);


  Reaction_addProduct(R, sr1);
  Reaction_addProduct(R, sr2);

  fail_unless( Reaction_getNumReactants(R) == 0, NULL );
  fail_unless( Reaction_getNumProducts (R) == 2, NULL );
  fail_unless( Reaction_getNumModifiers(R) == 0, NULL );

  fail_unless( Reaction_getProductById(R, "P1") == sr1 , NULL );
  fail_unless( Reaction_getProductById(R, "P2") == sr2 , NULL );
  fail_unless( Reaction_getProductById(R, "P3") == NULL, NULL );
}
END_TEST


START_TEST (test_Reaction_getModifier)
{
  ModifierSpeciesReference_t *msr1 = ModifierSpeciesReference_create();
  ModifierSpeciesReference_t *msr2 = ModifierSpeciesReference_create();


  ModifierSpeciesReference_setSpecies(msr1, "M1");
  ModifierSpeciesReference_setSpecies(msr2, "M2");

  Reaction_addModifier(R, msr1);
  Reaction_addModifier(R, msr2);

  fail_unless( Reaction_getNumReactants(R) == 0, NULL );
  fail_unless( Reaction_getNumProducts (R) == 0, NULL );
  fail_unless( Reaction_getNumModifiers(R) == 2, NULL );

  msr1 = Reaction_getModifier(R, 0);
  msr2 = Reaction_getModifier(R, 1);

  fail_unless(!strcmp(ModifierSpeciesReference_getSpecies(msr1), "M1"), NULL);
  fail_unless(!strcmp(ModifierSpeciesReference_getSpecies(msr2), "M2"), NULL);
}
END_TEST


START_TEST (test_Reaction_getModifierById)
{
  ModifierSpeciesReference_t *msr1 = ModifierSpeciesReference_createWith("M1");
  ModifierSpeciesReference_t *msr2 = ModifierSpeciesReference_createWith("M2");


  Reaction_addModifier(R, msr1);
  Reaction_addModifier(R, msr2);

  fail_unless( Reaction_getNumReactants(R) == 0, NULL );
  fail_unless( Reaction_getNumProducts (R) == 0, NULL );
  fail_unless( Reaction_getNumModifiers(R) == 2, NULL );

  fail_unless( Reaction_getModifierById(R, "M1") == msr1, NULL );
  fail_unless( Reaction_getModifierById(R, "M2") == msr2, NULL );
  fail_unless( Reaction_getModifierById(R, "M3") == NULL, NULL );
}
END_TEST


Suite *
create_suite_Reaction (void)
{
  Suite *suite = suite_create("Reaction");
  TCase *tcase = tcase_create("Reaction");


  tcase_add_checked_fixture(tcase, ReactionTest_setup, ReactionTest_teardown);

  tcase_add_test( tcase, test_Reaction_create          );
  tcase_add_test( tcase, test_Reaction_createWith      );
  tcase_add_test( tcase, test_Reaction_free_NULL       );
  tcase_add_test( tcase, test_Reaction_setId           );
  tcase_add_test( tcase, test_Reaction_setName         );
  tcase_add_test( tcase, test_Reaction_addReactant     );
  tcase_add_test( tcase, test_Reaction_addProduct      );
  tcase_add_test( tcase, test_Reaction_addModifier     );
  tcase_add_test( tcase, test_Reaction_getReactant     );
  tcase_add_test( tcase, test_Reaction_getReactantById );
  tcase_add_test( tcase, test_Reaction_getProduct      );
  tcase_add_test( tcase, test_Reaction_getProductById  );
  tcase_add_test( tcase, test_Reaction_getModifier     );
  tcase_add_test( tcase, test_Reaction_getModifierById );

  suite_add_tcase(suite, tcase);

  return suite;
}
