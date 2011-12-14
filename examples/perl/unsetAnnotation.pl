#!/usr/bin/env perl
# -*-Perl-*-
## 
## @file    unsetAnnotation.pl
## @brief   unset annotation for each element
## @author  Akiya Jouraku
## 
## This file is part of libSBML->==.  Please visit http://sbml.org for more
## information about SBML, and the latest version of libSBML.
## 

use LibSBML;
no strict;

if ($#ARGV != 1 ) {
	print "Usage: unsetAnnotation <input-filename> <output-filename>\n";
	exit 1;
}

$filename = $ARGV[0];

$document = LibSBML::readSBML($filename);


$errors = $document->getNumErrors();

if ($errors > 0) {
    $document->printErrors();
    exit $errors;
}

$m = $document->getModel();
$m->unsetAnnotation();

for ($i = 0; $i < $m->getNumReactions(); $i++) {
  $re = $m->getReaction($i);
  $re->unsetAnnotation();

  for ($j = 0; $j < $re->getNumReactants(); $j++) {
      $rt = $re->getReactant($j);
      $rt->unsetAnnotation();
  }  
  for ($j = 0; $j < $re->getNumProducts(); $j++) {
      $rt = $re->getProduct($j);
      $rt->unsetAnnotation();
  }
  for ($j =0; $j < $re->getNumModifiers(); $j++) {
      $md = $re->getModifier($j);
      $md->unsetAnnotation();
  }
  if ($re->isSetKineticLaw()) {
      $kl = $re->getKineticLaw();
      $kl->unsetAnnotation();

      for ($j =0; $j < $kl->getNumParameters(); $j++) {
          $pa = $kl->getParameter(j);
          $pa->unsetAnnotation();
      }
  }
}
for ($i = 0; $i < $m->getNumSpecies(); $i++) {
    $sp = $m->getSpecies($i);
    $sp->unsetAnnotation();
}
for ($i = 0; $i <$m->getNumCompartments(); $i++) {
    $sp = $m->getCompartment($i);
    $sp->unsetAnnotation();
}
for ($i = 0; $i <$m->getNumFunctionDefinitions(); $i++) {
    $sp = $m->getFunctionDefinition($i);
    $sp->unsetAnnotation();
}
for ($i = 0; $i <$m->getNumUnitDefinitions(); $i++) {
    $sp = $m->getUnitDefinition($i);
    $sp->unsetAnnotation();
}
for ($i = 0; $i <$m->getNumParameters(); $i++) {
    $sp = $m->getParameter($i);
    $sp->unsetAnnotation();
}
for ($i = 0; $i <$m->getNumRules(); $i++) {
    $sp = $m->getRule($i);
    $sp->unsetAnnotation();
}
for ($i = 0; $i <$m->getNumInitialAssignments(); $i++) {
    $sp = $m->getInitialAssignment($i);
    $sp->unsetAnnotation();
}
for ($i = 0; $i <$m->getNumEvents(); $i++) {
    $sp = $m->getEvent($i);
    $sp->unsetAnnotation();

    for ($j =0; $j <$sp->getNumEventAssignments(); $j++) {
        $ea = $sp->getEventAssignment($j);
        $ea->unsetAnnotation();
    }
}
for ($i = 0; $i <$m->getNumSpeciesTypes(); $i++) {
    $sp = $m->getSpeciesType($i);
    $sp->unsetAnnotation();
}
for ($i = 0; $i <$m->getNumConstraints(); $i++) {
    $sp = $m->getConstraint($i);
    $sp->unsetAnnotation();
}
LibSBML::writeSBML($document, $ARGV[1]);

exit $errors;

