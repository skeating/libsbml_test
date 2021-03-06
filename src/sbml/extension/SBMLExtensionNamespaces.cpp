/**
 * @file    SBMLExtensionNamespaces.cpp
 * @brief   implementation of C-API for the SBMLExtensionNamespaces class 
 * @author  Frank Bergmann
 *
 * $Id $
 * 
 * <!--------------------------------------------------------------------------
 * This file is part of libSBML.  Please visit http://sbml.org for more
 * information about SBML, and the latest version of libSBML.
 *
 * Copyright (C) 2019 jointly by the following organizations:
 *     1. California Institute of Technology, Pasadena, CA, USA
 *     2. University of Heidelberg, Heidelberg, Germany
 *
 * Copyright (C) 2013-2018 jointly by the following organizations:
 *     1. California Institute of Technology, Pasadena, CA, USA
 *     2. EMBL European Bioinformatics Institute (EMBL-EBI), Hinxton, UK
 *     3. University of Heidelberg, Heidelberg, Germany
 *
 * Copyright (C) 2009-2013 jointly by the following organizations: 
 *     1. California Institute of Technology, Pasadena, CA, USA
 *     2. EMBL European Bioinformatics Institute (EMBL-EBI), Hinxton, UK
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
 * ------------------------------------------------------------------------ -->
 *
 *
 */


#include <sbml/SBMLNamespaces.h>
#include <sbml/common/common.h>
#include <sbml/extension/SBMLExtensionRegistry.h>
#include <sbml/extension/SBMLExtensionException.h>
#include <sbml/extension/ISBMLExtensionNamespaces.h>
#include <sbml/extension/SBMLExtensionNamespaces.h>

LIBSBML_CPP_NAMESPACE_BEGIN
#ifdef __cplusplus
BEGIN_C_DECLS


#endif /* __cplusplus */
/** @cond doxygenIgnored */
LIBSBML_EXTERN
SBMLExtensionNamespaces_t*
SBMLExtensionNamespaces_clone(SBMLExtensionNamespaces_t* extns)
{
  if (extns == NULL) return NULL;
  return (SBMLExtensionNamespaces_t*)extns->clone();
}

LIBSBML_EXTERN
int
SBMLExtensionNamespaces_free(SBMLExtensionNamespaces_t* extns)
{
  if (extns == NULL) return LIBSBML_INVALID_OBJECT;
  delete extns;
  return LIBSBML_OPERATION_SUCCESS;
}

LIBSBML_EXTERN
char*
SBMLExtensionNamespaces_getURI(SBMLExtensionNamespaces_t* extns)
{
  if (extns == NULL) return NULL;
  return safe_strdup(extns->getURI().c_str());
}

LIBSBML_EXTERN
unsigned int
SBMLExtensionNamespaces_getPackageVersion(SBMLExtensionNamespaces_t* extns)
{
  if (extns == NULL) return SBML_INT_MAX;
  return extns->getPackageVersion();
}

LIBSBML_EXTERN
char*
SBMLExtensionNamespaces_getPackageName(SBMLExtensionNamespaces_t* extns)
{
  if (extns == NULL) return NULL;
  return safe_strdup(extns->getPackageName().c_str());
}

LIBSBML_EXTERN
int
SBMLExtensionNamespaces_setPackageVersion(SBMLExtensionNamespaces_t* extns,
    unsigned int pkgVersion)
{
  if (extns == NULL) return LIBSBML_INVALID_OBJECT;
  extns->setPackageVersion(pkgVersion);
  return LIBSBML_OPERATION_SUCCESS;
}
/** @endcond */

END_C_DECLS
LIBSBML_CPP_NAMESPACE_END
