/**
 * \file    SpeciesReference.h
 * \brief   SBML SpeciesReference
 * \author  Ben Bornstein
 *
 * $Id$
 * $Source$
 */
/* Copyright 2002 California Institute of Technology and Japan Science and
 * Technology Corporation.
 *
 * This library is free software; you can redistribute it and/or modify it
 * under the terms of the GNU Lesser General Public License as published by
 * the Free Software Foundation.  A copy of the license agreement is
 * provided in the file named "LICENSE.txt" included with this software
 * distribution.  It is also available online at
 * http://sbml.org/software/libsbml/license.html
 *
 * You should have received a copy of the GNU Lesser General Public License
 * along with this library; if not, write to the Free Software Foundation,
 * Inc., 59 Temple Place, Suite 330, Boston, MA 02111-1307 USA.
 */


#ifndef SpeciesReference_h
#define SpeciesReference_h


#include <sbml/common/extern.h>
#include <sbml/common/sbmlfwd.h>


#ifdef __cplusplus


#include <string>

#include <sbml/SBase.h>
#include <sbml/ListOf.h>


class ASTNode;
class SBMLVisitor;


class LIBSBML_EXTERN SimpleSpeciesReference : public SBase
{
public:

  /**
   * Creates a new SimpleSpeciesReference, optionally with its species
   * attribute set.
   */
  SimpleSpeciesReference (const std::string& species = "");

  /**
   * Destroys this SimpleSpeciesReference.
   */
  virtual ~SimpleSpeciesReference ();


  /**
   * Accepts the given SBMLVisitor.
   *
   * @return the result of calling <code>v.visit()</code>, which indicates
   * whether or not the Visitor would like to visit the Reaction's next
   * SimpleSpeciesReference (if available).
   */
  virtual bool accept (SBMLVisitor& v) const;

  /**
   * @return the species for this SimpleSpeciesReference.
   */
  const std::string& getSpecies () const;

  /**
   * @return true if the species for this SimpleSpeciesReference has been
   * set, false otherwise.
   */
  bool isSetSpecies () const;

  /**
   * Sets the species of this SimpleSpeciesReference to a copy of sid.
   */
  void setSpecies (const std::string& sid);

  /**
   * @return true if this SpeciesReference is a ModiferSpeciesReference,
   * false otherwise.
   */
  bool isModifier () const;


protected:

  /**
   * Subclasses should override this method to read values from the given
   * XMLAttributes set into their specific fields.  Be sure to call your
   * parents implementation of this method as well.
   */
  virtual void readAttributes (const XMLAttributes& attributes);

  /**
   * Subclasses should override this method to write their XML attributes
   * to the XMLOutputStream.  Be sure to call your parents implementation
   * of this method as well.
   */
  virtual void writeAttributes (XMLOutputStream& stream) const;

  std::string  mSpecies;
};



class LIBSBML_EXTERN SpeciesReference : public SimpleSpeciesReference
{
public:

  /**
   * Creates a new SpeciesReference, optionally with its species,
   * stoichiometry, and denominator attributes set.
   */
  SpeciesReference (   const std::string& species       = ""
                     , double             stoichiometry = 1.0
                     , int                denominator   = 1   );

  /**
   * Copies this SpeciesReference.
   */
  SpeciesReference (const SpeciesReference& rhs);

  /**
   * Destroys this SpeciesReference.
   */
  virtual ~SpeciesReference ();


  /**
   * Accepts the given SBMLVisitor.
   *
   * @return the result of calling <code>v.visit()</code>, which indicates
   * whether or not the Visitor would like to visit the Reaction's next
   * SimpleSpeciesReference (if available).
   */
  virtual bool accept (SBMLVisitor& v) const;

  /**
   * @return a (deep) copy of this SpeciesReference.
   */
  virtual SBase* clone () const;

  /**
   * Initializes the fields of this SpeciesReference to their defaults:
   *
   *   - stoichiometry = 1
   *   - denominator   = 1
   */
  void initDefaults ();

  /**
   * @return the stoichiometry of this SpeciesReference.
   */
  double getStoichiometry () const;

  /**
   * @return the stoichiometryMath of this SpeciesReference.
   */
  const ASTNode* getStoichiometryMath () const;

  /**
   * @return the denominator of this SpeciesReference.
   */
  int getDenominator () const;


  /**
   * @return true if the stoichiometryMath of this SpeciesReference has
   * been set, false otherwise.
   */
  bool isSetStoichiometryMath () const;


  /**
   * Sets the stoichiometry of this SpeciesReference to value.
   */
  void setStoichiometry (double value);

  /**
   * Sets the stoichiometryMath of this SpeciesReference to a copy of the
   * given ASTNode.
   */
  void setStoichiometryMath (const ASTNode* math);

  /**
   * Sets the stoichiometryMath of this SpeciesReference to the given
   * formula string.
   */
  void setStoichiometryMath (const std::string& formula);

  /**
   * Sets the denominator of this SpeciesReference to value.
   */
  void setDenominator (int value);

  /**
   * @return the SBMLTypeCode_t of this SBML object or SBML_UNKNOWN
   * (default).
   *
   * @see getElementName()
   */
  virtual SBMLTypeCode_t getTypeCode () const;

  /**
   * Subclasses should override this method to return XML element name of
   * this SBML object.
   */
  virtual const std::string& getElementName () const;

  /**
   * Subclasses should override this method to write out their contained
   * SBML objects as XML elements.  Be sure to call your parents
   * implementation of this method as well.
   */
  virtual void writeElements (XMLOutputStream& stream) const;


protected:

  /**
   * Subclasses should override this method to read (and store) XHTML,
   * MathML, etc. directly from the XMLInputStream.
   *
   * @return true if the subclass read from the stream, false otherwise.
   */
  bool readOtherXML (XMLInputStream& stream);

  /**
   * Subclasses should override this method to read values from the given
   * XMLAttributes set into their specific fields.  Be sure to call your
   * parents implementation of this method as well.
   */
  virtual void readAttributes (const XMLAttributes& attributes);

  /**
   * Subclasses should override this method to write their XML attributes
   * to the XMLOutputStream.  Be sure to call your parents implementation
   * of this method as well.
   */
  virtual void writeAttributes (XMLOutputStream& stream) const;


  double    mStoichiometry;
  int       mDenominator;
  ASTNode*  mStoichiometryMath;
};



class LIBSBML_EXTERN ModifierSpeciesReference : public SimpleSpeciesReference
{
public:

  /**
   * Creates a new ModifierSpeciesReference, optionally with its species
   * attribute set.
   */
  ModifierSpeciesReference (const std::string& species = "");

  /**
   * Destroys this ModifierSpeciesReference.
   */
  virtual ~ModifierSpeciesReference();


  /**
   * Accepts the given SBMLVisitor.
   *
   * @return the result of calling <code>v.visit()</code>, which indicates
   * whether or not the Visitor would like to visit the Reaction's next
   * SimpleSpeciesReference (if available).
   */
  virtual bool accept (SBMLVisitor& v) const;

  /**
   * @return a (deep) copy of this SpeciesReference.
   */
  virtual SBase* clone () const;


  /**
   * @return the SBMLTypeCode_t of this SBML object or SBML_UNKNOWN
   * (default).
   *
   * @see getElementName()
   */
  virtual SBMLTypeCode_t getTypeCode () const;

  /**
   * Subclasses should override this method to return XML element name of
   * this SBML object.
   */
  virtual const std::string& getElementName () const;

#ifdef USE_LAYOUT
  /**
   * Subclasses should override this method to write out their contained
   * SBML objects as XML elements.  Be sure to call your parents
   * implementation of this method as well.
   */
  virtual void writeElements (XMLOutputStream& stream) const;

protected:

  /**
   * Subclasses should override this method to read (and store) XHTML,
   * MathML, etc. directly from the XMLInputStream.
   *
   * @return true if the subclass read from the stream, false otherwise.
   */
  bool readOtherXML (XMLInputStream& stream);

#endif // USE_LAYOUT
};



class LIBSBML_EXTERN ListOfSpeciesReferences : public ListOf
{
public:

  /**
   * Creates a new ListOfSpeciesReferences.
   */
  ListOfSpeciesReferences ();

  /**
   * @return a (deep) copy of this ListOfUnits.
   */
  virtual SBase* clone () const;

  /**
   * @return the SBMLTypeCode_t of SBML objects contained in this ListOf or
   * SBML_UNKNOWN (default).
   */
  virtual SBMLTypeCode_t getItemTypeCode () const;

  /**
   * Subclasses should override this method to return XML element name of
   * this SBML object.
   */
  virtual const std::string& getElementName () const;

  /**
   * @return the ordinal position of the element with respect to its
   * siblings or -1 (default) to indicate the position is not significant.
   */
  virtual int getElementPosition () const;


protected:

  enum SpeciesType { Unknown, Reactant, Product, Modifier };

  /**
   * Sets type of this ListOfSpeciesReferences.
   */
  void setType (SpeciesType type);

  /**
   * @return the SBML object corresponding to next XMLToken in the
   * XMLInputStream or NULL if the token was not recognized.
   */
  virtual SBase* createObject (XMLInputStream& stream);


  SpeciesType mType;


  friend class Reaction;
};


#endif  /* __cplusplus */


#ifndef SWIG


BEGIN_C_DECLS


/**
 * Creates a new SpeciesReference and returns a pointer to it.
 */
LIBSBML_EXTERN
SpeciesReference_t *
SpeciesReference_create (void);

/**
 * Creates a new ModifierSpeciesReference and returns a pointer to it.
 */
LIBSBML_EXTERN
SpeciesReference_t *
SpeciesReference_createModifier (void);

/**
 * Creates a new SpeciesReference with the given species, stoichiometry and
 * denominator and returns a pointer to it.
 */
LIBSBML_EXTERN
SpeciesReference_t *
SpeciesReference_createWith ( const char *species,
                              double      stoichiometry,
                              int         denominator );

/**
 * Frees the given SpeciesReference.
 */
LIBSBML_EXTERN
void
SpeciesReference_free (SpeciesReference_t *sr);

/**
 * @return a (deep) copy of this SpeciesReference
 */
LIBSBML_EXTERN
SpeciesReference_t *
SpeciesReference_clone (const SpeciesReference_t *sr);

/**
 * Initializes the fields of this SpeciesReference to their defaults:
 *
 *   - stoichiometry = 1
 *   - denominator   = 1
 *
 * This function has no effect if the SpeciesReference is a Modifer (see
 * SpeciesReference_isModifier()).
 */
LIBSBML_EXTERN
void
SpeciesReference_initDefaults (SpeciesReference_t *sr);

/**
 * @return true (non-zero) if the SpeciesReference is a
 * ModiferSpeciesReference, false otherwise.
 */
LIBSBML_EXTERN
int
SpeciesReference_isModifier (const SpeciesReference_t *sr);


/**
 * @return the id of this SpeciesReference.
 */
LIBSBML_EXTERN
const char *
SpeciesReference_getId (const SpeciesReference_t *sr);

/**
 * @return the name of this SpeciesReference.
 */
LIBSBML_EXTERN
const char *
SpeciesReference_getName (const SpeciesReference_t *sr);


/**
 * @return the species of this SpeciesReference.
 */
LIBSBML_EXTERN
const char *
SpeciesReference_getSpecies (const SpeciesReference_t *sr);

/**
 * @return the stoichiometry of this SpeciesReference or zero if.
 *
 * This function returns zero if the SpeciesReference is a Modifer (see
 * SpeciesReference_isModifier()).
 */
LIBSBML_EXTERN
double
SpeciesReference_getStoichiometry (const SpeciesReference_t *sr);

/**
 * @return the stoichiometryMath of this SpeciesReference.
 *
 * This function returns NULL if the SpeciesReference is a Modifer (see
 * SpeciesReference_isModifier()).
 */
LIBSBML_EXTERN
const ASTNode_t *
SpeciesReference_getStoichiometryMath (const SpeciesReference_t *sr);

/**
 * @return the denominator of this SpeciesReference.
 *
 * This function returns 0 if the SpeciesReference is a Modifer (see
 * SpeciesReference_isModifier()).
 */
LIBSBML_EXTERN
int
SpeciesReference_getDenominator (const SpeciesReference_t *sr);


/**
 * @return true (non-zero) if the id for this SpeciesReference has been
 * set, false (0) otherwise.
 */
LIBSBML_EXTERN
int
SpeciesReference_isSetId (const SpeciesReference_t *sr);

/**
 * @return true (non-zero) if the name for this SpeciesReference has been
 * set, false (0) otherwise.
 */
LIBSBML_EXTERN
int
SpeciesReference_isSetName (const SpeciesReference_t *sr);


/**
 * @return true (non-zero) if the species for this SpeciesReference
 * has been set, false (0) otherwise.
 */
LIBSBML_EXTERN
int
SpeciesReference_isSetSpecies (const SpeciesReference_t *sr);

/**
 * @return true (non-zero) if the stoichiometryMath of this
 * SpeciesReference has been set, false (0) otherwise.
 *
 * This function returns false if the SpeciesReference is a Modifer (see
 * SpeciesReference_isModifier()).
 */
LIBSBML_EXTERN
int
SpeciesReference_isSetStoichiometryMath (const SpeciesReference_t *sr);


/**
 * Sets the id of this SpeciesReference to a copy of sid.
 */
LIBSBML_EXTERN
void
SpeciesReference_setId (SpeciesReference_t *sr, const char *sid);

/**
 * Sets the name of this SpeciesReference to a copy of name.
 */
LIBSBML_EXTERN
void
SpeciesReference_setName (SpeciesReference_t *sr, const char *name);

/**
 * Sets the species of this SpeciesReference to a copy of sid.
 */
LIBSBML_EXTERN
void
SpeciesReference_setSpecies (SpeciesReference_t *sr, const char *sid);

/**
 * Sets the stoichiometry of this SpeciesReference to value.
 *
 * This function has no effect if the SpeciesReference is a Modifer (see
 * SpeciesReference_isModifier()).
 */
LIBSBML_EXTERN
void
SpeciesReference_setStoichiometry (SpeciesReference_t *sr, double value);

/**
 * Sets the stoichiometryMath of this SpeciesReference to a copy of the
 * given ASTNode.
 *
 * This function has no effect if the SpeciesReference is a Modifer (see
 * SpeciesReference_isModifier()).
 */
LIBSBML_EXTERN
void
SpeciesReference_setStoichiometryMath (  SpeciesReference_t *sr
                                       , const ASTNode_t    *math );

/**
 * Sets the denominator of this SpeciesReference to value.
 *
 * This function has no effect if the SpeciesReference is a Modifer (see
 * SpeciesReference_isModifier()).
 */
LIBSBML_EXTERN
void
SpeciesReference_setDenominator (SpeciesReference_t *sr, int value);


/**
 * Unsets the id of this Species.
 */
LIBSBML_EXTERN
void
SpeciesReference_unsetId (SpeciesReference_t *sr);

/**
 * Unsets the name of this Species.
 */
LIBSBML_EXTERN
void
SpeciesReference_unsetName (SpeciesReference_t *sr);

END_C_DECLS


#endif  /* !SWIG */
#endif  /* SpeciesReference_h */
