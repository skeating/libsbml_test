#!/usr/bin/env python
#
# @file    compare-classes.py
# @brief   Compare classes in C++ code to those documented via Doxygen
# @author  Michael Hucka
#
# Usage:
#   compare-classes.py /path/to/libsbml/src
#
# This program compares the classes defined in .h and .i files to the classes
# documented via Doxygen @class declarations, and reports any differences.
#
# <!--------------------------------------------------------------------------
# This file is part of libSBML.  Please visit http://sbml.org for more
# information about SBML, and the latest version of libSBML.
#
# Copyright (C) 2013-2017 jointly by the following organizations:
#     1. California Institute of Technology, Pasadena, CA, USA
#     2. EMBL European Bioinformatics Institute (EMBL-EBI), Hinxton, UK
#     3. University of Heidelberg, Heidelberg, Germany
#
# Copyright (C) 2009-2013 jointly by the following organizations:
#     1. California Institute of Technology, Pasadena, CA, USA
#     2. EMBL European Bioinformatics Institute (EMBL-EBI), Hinxton, UK
#
# Copyright (C) 2006-2008 by the California Institute of Technology,
#     Pasadena, CA, USA
#
# Copyright (C) 2002-2005 jointly by the following organizations:
#     1. California Institute of Technology, Pasadena, CA, USA
#     2. Japan Science and Technology Agency, Japan
#
# This library is free software; you can redistribute it and/or modify it
# under the terms of the GNU Lesser General Public License as published by
# the Free Software Foundation.  A copy of the license agreement is provided
# in the file named "LICENSE.txt" included with this software distribution
# and also available online as http://sbml.org/software/libsbml/license.html
# ---------------------------------------------------------------------- -->*/

import os, sys, re
from os.path import join
sys.path.append('../../../src/bindings/swig')
sys.path.append('../../src/bindings/swig')
from libsbmlutils import find_classes


def main(args):
    if len(args) != 2:
        print ("Must be given one argument: the path to the libSBML src/sbml dir")
        sys.exit(1)

    doxygen_classes   = find_classes(args[1], cplusplus=False, swig_too=True, enums_too=False)
    cplusplus_classes = find_classes(args[1], cplusplus=True, swig_too=True, enums_too=False)

    diff_doxygen      = set(doxygen_classes) - set(cplusplus_classes)
    diff_cplusplus    = set(cplusplus_classes) - set(doxygen_classes)

    if len(diff_doxygen) <= 0 and len(diff_cplusplus) <= 0:
        return

    print("")
    print("*"*79)
    print("Warning: differences found in actual vs. documented classes.")

    if len(diff_cplusplus) > 0:
        print("The following public classes lack doxygen declarations:")
        print("Missing: " + "\nMissing: ".join(sorted(diff_cplusplus)))

    if len(diff_doxygen) > 0:
        print("The following have doxygen declarations but are not public:")
        print("Extra: " + "\nExtra: ".join(sorted(diff_doxygen)))

    print("*"*79)
    print("")


if __name__ == '__main__':
    main(sys.argv)
