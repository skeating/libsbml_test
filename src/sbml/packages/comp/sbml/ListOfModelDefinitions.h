/**
 * @file    ListOfModelDefinitions.h
 * @brief   Definition of ListOfModelDefinitions, the SBase derived class of modelDefinitions package.
 * @author  Lucian Smith 
 *
 *<!---------------------------------------------------------------------------
 * This file is part of libSBML.  Please visit http://sbml.org for more
 * information about SBML, and the latest version of libSBML.
 *
 * Copyright 2011 California Institute of Technology.
 * 
 * This library is free software; you can redistribute it and/or modify it
 * under the terms of the GNU Lesser General Public License as published by
 * the Free Software Foundation.  A copy of the license agreement is provided
 * in the file named "LICENSE.txt" included with this software distribution
 * and also available online as http://sbml.org/software/libsbml/license.html
 *------------------------------------------------------------------------- -->
 *
 * @class ListOfModelDefinitions
 * @ingroup comp
 * @brief  @htmlinclude pkg-marker-comp.html
 * Implementation of the %ListOfModelDefinitions construct from the &ldquo;comp&rdquo; package.
 * 
 * The ListOfModelDefinitions is a container for the extended 
 * SBMLDocument that allows one to define multiple Models in a single file
 * for use in Submodel objects.
 * 
 * The various ListOf___ classes in SBML are merely containers used for
 * organizing the main components of an SBML model.  All are derived from
 * the abstract class SBase, and inherit the various attributes and
 * subelements of SBase, such as "metaid" as and "annotation".  The
 * ListOf___ classes do not add any attributes of their own.
 *
 * Readers may wonder about the motivations for using the ListOf___
 * containers.  A simpler approach in XML might be to place the components
 * all directly at the top level of the model definition.  The choice made
 * in SBML is to group them within XML elements named after
 * ListOf<em>Classname</em>, in part because it helps organize the
 * components.  More importantly, the fact that the container classes are
 * derived from SBase means that software tools can add information @em about
 * the lists themselves into each list container's "annotation".
 *
 * @see ModelDefinitions
 * @see ListOfDeletions
 * @see ListOfExternalModelDefinitions
 * @see ListOfPorts
 * @see ListOfReplacedElements
 * @see ListOfSubmodels
 */


#ifndef ListOfModelDefinitions_H__
#define ListOfModelDefinitions_H__


#include <sbml/common/extern.h>
#include <sbml/common/sbmlfwd.h>
#include <sbml/packages/comp/common/compfwd.h>

#ifdef __cplusplus

#include <string>

#include <sbml/ListOf.h>
#include <sbml/packages/comp/sbml/ModelDefinition.h>

LIBSBML_CPP_NAMESPACE_BEGIN


class LIBSBML_EXTERN ListOfModelDefinitions : public ListOf
{
public:

  /**
   * Creates and returns a deep copy of this ListOfModelDefinitions object.
   *
   * @return a (deep) copy of this ListOfModelDefinitions.
   */
  virtual ListOfModelDefinitions* clone () const;


  /**
   * Creates a new ListOfModelDefinitions with the given level, version, and
   * package version.
   *
   * @param level the SBML Level
   * @param version the Version within the SBML Level
   * @param pkgVersion the version of the package
   */
  ListOfModelDefinitions(unsigned int level      = CompExtension::getDefaultLevel(), 
                         unsigned int version    = CompExtension::getDefaultVersion(), 
                         unsigned int pkgVersion = CompExtension::getDefaultPackageVersion());


  /**
   * Creates a new ListOfModelDefinitions with the given CompPkgNamespaces
   * object.
   */
  ListOfModelDefinitions(CompPkgNamespaces* compns);


  /**
   * Get a ModelDefinition from the ListOfModelDefinitions.
   *
   * @param n the index number of the ModelDefinition to get.
   * 
   * @return the nth ModelDefinition in this ListOfModelDefinitions.
   *
   * @see size()
   */
  virtual ModelDefinition* get(unsigned int n); 


  /**
   * Get a ModelDefinition from the ListOfModelDefinitions.
   *
   * @param n the index number of the ModelDefinition to get.
   * 
   * @return the nth ModelDefinition in this ListOfModelDefinitions.
   *
   * @see size()
   */
  virtual const ModelDefinition* get(unsigned int n) const; 


 /**
   * Get a Model from the ListOfModelDefinitions
   * based on its identifier.
   *
   * @param sid a string representing the identifier 
   * of the Model to get.
   * 
   * @return Model in this ListOfModelDefinitions
   * with the given @p sid or @c NULL if no such
   * Member exists.
   *
   * @see get(unsigned int n)
   * @see size()
   */
  virtual ModelDefinition* get (const std::string& sid);


  /**
   * Get a Model from the ListOfModelDefinitions
   * based on its identifier.
   *
   * @param sid a string representing the identifier 
   * of the Model to get.
   * 
   * @return Model in this ListOfModelDefinitions
   * with the given @p sid or @c NULL if no such
   * Model exists.
   *
   * @see get(unsigned int n)
   * @see size()
   */
  virtual const ModelDefinition* get (const std::string& sid) const;


  /**
   * Removes the nth item from this ListOfModelDefinitions items and returns
   * a pointer to it.
   *
   * The caller owns the returned item and is responsible for deleting it.
   *
   * @param n the index of the item to remove
   *
   * @see size()
   */
  virtual ModelDefinition* remove (unsigned int n);


  /**
   * Removes the item with given identifer from this ListOfModelDefinitions
   * items and returns a pointer to it.
   *
   * The caller owns the returned item and is responsible for deleting it.
   *
   * @param sid the id of the item to remove
   *
   * @see size()
   */  
   virtual ModelDefinition *remove (const std::string &sid);


  /**
   * Returns the libSBML type code for the objects contained in this ListOf
   * (i.e., ModelDefinition objects, if the list is non-empty).
   * 
   * LibSBML attaches an identifying code to every kind of SBML object.
   * These are known as <em>SBML type codes</em>.  @if clike The set of
   * possible type codes for the &ldquo;comp&rdquo; package is defined in the enumeration
   * #SBMLCompTypeCode_t.  The names of the type codes all begin with the
   * characters <code>SBML_COMP</code>. @endif@~
   * 
   * @return the SBML type code for the objects contained in this ListOf
   * instance, or @link SBMLTypeCode_t#SBML_UNKNOWN SBML_UNKNOWN@endlink (default).
   */
  virtual int getItemTypeCode () const;


  /**
   * Returns the XML element name of
   * this SBML object.
   *
   * @return the string of the name of this element.
   */
  virtual const std::string& getElementName () const;


protected:

  /** @cond doxygenLibsbmlInternal */
  /**
   * @return the SBML object corresponding to next XMLToken in the
   * XMLInputStream or NULL if the token was not recognized.
   */
  virtual SBase* createObject (XMLInputStream& stream);

  virtual void writeXMLNS (XMLOutputStream& stream) const;
  /** @endcond */
};


LIBSBML_CPP_NAMESPACE_END

#endif /* __cplusplus */


#ifndef SWIG

LIBSBML_CPP_NAMESPACE_BEGIN
BEGIN_C_DECLS

//
// C API will be added here.
//

END_C_DECLS
LIBSBML_CPP_NAMESPACE_END


#endif  /* !SWIG */
#endif  /* ListOfModelDefinitions_H__ */
