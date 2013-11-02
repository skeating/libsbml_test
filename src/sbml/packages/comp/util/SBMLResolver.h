/**
 * @file    SBMLResolver.h
 * @brief   Definition of SBMLResolver, the base class for resolving SBML documents.
 * @author  Frank Bergmann
 *
 * <!--------------------------------------------------------------------------
 * This file is part of libSBML.  Please visit http://sbml.org for more
 * information about SBML, and the latest version of libSBML.
 *
 * Copyright (C) 2009-2013 jointly by the following organizations:
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
 * ------------------------------------------------------------------------ -->
 *
 * @class SBMLResolver
 * @sbmlbrief{comp} Base class for SBML resolvers.
 *
 * @htmlinclude libsbml-facility-only-warning.html
 *
 * The SBMLResolver class is the base class for the various SBML @em
 * resolvers: classes of objects that resolve SBML documents.
 *
 * LibSBML provides a number of built-in resolvers, and applications can
 * create their own by subclassing SBMLResolver and following the examples
 * of the existing resolvers.  The following are the built-in resolvers
 * in libSBML @htmlinclude libsbml-version.html:
 * @li SBMLFileResolver
 *
 */

#ifndef SBMLResolver_h
#define SBMLResolver_h

#include <sbml/common/sbmlfwd.h>

#ifdef __cplusplus

#include <string>

LIBSBML_CPP_NAMESPACE_BEGIN

class SBMLUri;
class LIBSBML_EXTERN SBMLResolver
{
public:

  /**
   * Creates a new SBMLResolver object.
   */
  SBMLResolver ();


  /**
   * Copy constructor.  Creates a copy of an SBMLResolver object.
   *
   * @param c the SBMLResolver object to copy.
   *
   * @throws @if python ValueError @else SBMLConstructorException @endif@~
   * Thrown if the argument @p orig is @c NULL.
   */
  SBMLResolver(const SBMLResolver& c);


  /**
   * Destroy this SBMLResolver object.
   */
  virtual ~SBMLResolver ();


  /**
   * Assignment operator for SBMLResolver.
   *
   * @param rhs The object whose values are used as the basis of the
   * assignment.
   *
   * @throws @if python ValueError @else SBMLConstructorException @endif@~
   * Thrown if the argument @p rhs is @c NULL.
   */
  SBMLResolver& operator=(const SBMLResolver& rhs);


  /**
   * Creates and returns a deep copy of this SBMLResolver object.
   *
   * @return a (deep) copy of this SBMLResolver object.
   */
  virtual SBMLResolver* clone() const;


  /**
   * Resolves the document for the given URI.
   *
   * @param uri the URI to the target document
   * @param baseUri base URI, in case the URI is a relative one
   *
   * @return  the document, if this resolver can resolve the document or NULL.
   */
  virtual SBMLDocument* resolve(const std::string &uri, const std::string& baseUri="") const;


  /**
   * Resolves the full URI for the given URI without actually reading the
   * document.
   *
   * @param uri the URI to the target document
   * @param baseUri base URI, in case the URI is a relative one
   *
   * @return  the full URI to the document, if this resolver can resolve the document or NULL.
   */
  virtual SBMLUri* resolveUri(const std::string &uri, const std::string& baseUri="") const;


#ifndef SWIG

#endif // SWIG


protected:
  /** @cond doxygenLibsbmlInternal */

  /** @endcond */


private:
  /** @cond doxygenLibsbmlInternal */


  /** @endcond */
};

LIBSBML_CPP_NAMESPACE_END

#endif  /* __cplusplus */


#ifndef SWIG

LIBSBML_CPP_NAMESPACE_BEGIN
BEGIN_C_DECLS


END_C_DECLS
LIBSBML_CPP_NAMESPACE_END

#endif  /* !SWIG */
#endif  /* SBMLResolver_h */

