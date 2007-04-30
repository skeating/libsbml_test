/**
 * @file    Constraint.h
 * @brief   SBML Constraint
 * @author  Ben Bornstein
 *
 * $Id$
 * $Source$
 *
 *<!---------------------------------------------------------------------------
 * This file is part of libSBML.  Please visit http://sbml.org for more
 * information about SBML, and the latest version of libSBML.
 *
 * Copyright 2005-2007 California Institute of Technology.
 * Copyright 2002-2005 California Institute of Technology and
 *                     Japan Science and Technology Corporation.
 * 
 * This library is free software; you can redistribute it and/or modify it
 * under the terms of the GNU Lesser General Public License as published by
 * the Free Software Foundation.  A copy of the license agreement is provided
 * in the file named "LICENSE.txt" included with this software distribution
 * and also available online as http://sbml.org/software/libsbml/license.html
 *----------------------------------------------------------------------- -->*/

#ifndef Constraint_h
#define Constraint_h


#include <sbml/common/extern.h>
#include <sbml/common/sbmlfwd.h>


#ifdef __cplusplus


#include <string>

#include <sbml/SBase.h>
#include <sbml/ListOf.h>


class ASTNode;
class XMLNode;
class SBMLVisitor;


class LIBSBML_EXTERN Constraint : public SBase
{
public:

  /**
   * Creates a new Constraint.
   */
  Constraint ();

  /**
   * Destroys this Constraint.
   */
  virtual ~Constraint ();

  /**
   * Copy constructor. Creates a copy of this Constraint.
   */
  Constraint (const Constraint& rhs);

  /**
   * Assignment operator
   */
  Constraint& operator=(const Constraint& orig);

  /**
   * Accepts the given SBMLVisitor.
   *
   * @return the result of calling <code>v.visit()</code>, which indicates
   * whether or not the Visitor would like to visit the Model's next
   * Constraint (if available).
   */
  virtual bool accept (SBMLVisitor& v) const;

  /**
   * @return a (deep) copy of this Constraint.
   */
  virtual SBase* clone () const;


  /**
   * @return the message for this Constraint.
   */
  const XMLNode* getMessage () const;

  /**
   * @return the math for this Constraint.
   */
  const ASTNode* getMath () const;

  /**
   * @return true if the message of this Constraint has been set,
   * false otherwise.
   */
  bool isSetMessage () const;

  /**
   * @return true if the math for this Constraint has been set,
   * false otherwise.
   */
  bool isSetMath () const;

  /**
   * Sets the message of this Constraint to a copy of xhtml.
   */
  void setMessage (const XMLNode* xhtml);

  /**
   * Sets the math of this Constraint to a copy of the given
   * ASTNode.
   */
  void setMath (const ASTNode* math);

  /**
   * Unsets the message of this Constraint.
   */
  void unsetMessage ();

  /**
   * @return the SBMLTypeCode_t of this SBML object or SBML_UNKNOWN
   * (default).
   *
   * @see getElementName()
   */
  virtual SBMLTypeCode_t getTypeCode () const;

  /**
   * @return the name of this element ie "constraint".
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
  virtual bool readOtherXML (XMLInputStream& stream);

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


  ASTNode* mMath;
  XMLNode* mMessage;
};



class LIBSBML_EXTERN ListOfConstraints : public ListOf
{
public:

  /**
   * @return a (deep) copy of this ListOfConstraints.
   */
  virtual SBase* clone () const;

  /**
   * @return the SBMLTypeCode_t of SBML objects contained in this ListOf or
   * SBML_UNKNOWN (default).
   */
  virtual SBMLTypeCode_t getItemTypeCode () const;

  /**
 * @return the name of this element ie "listOfConstraints".
   */
  virtual const std::string& getElementName () const;

  /**
   * @return the ordinal position of the element with respect to its
   * siblings or -1 (default) to indicate the position is not significant.
   */
  virtual int getElementPosition () const;


protected:

  /**
   * @return the SBML object corresponding to next XMLToken in the
   * XMLInputStream or NULL if the token was not recognized.
   */
  virtual SBase* createObject (XMLInputStream& stream);
};


#endif  /* __cplusplus */


#ifndef SWIG


BEGIN_C_DECLS


/**
 * Creates a new Constraint and returns a pointer to it.
 */
LIBSBML_EXTERN
Constraint_t *
Constraint_create (void);

/**
 * Frees the given Constraint.
 */
LIBSBML_EXTERN
void
Constraint_free (Constraint_t *c);


/**
 * @return a (deep) copy of the given Constraint.
 */
LIBSBML_EXTERN
Constraint_t *
Constraint_clone (const Constraint_t *c);


/**
 * @return the message for this Constraint
 */
LIBSBML_EXTERN
const XMLNode_t *
Constraint_getMessage (const Constraint_t *c);


/**
 * @return the math for this Constraint.
 */
LIBSBML_EXTERN
const ASTNode_t *
Constraint_getMath (const Constraint_t *c);


/**
 * @return true (non-zero) if the message of this Constraint has been
 * set, false (0) otherwise.
 */
LIBSBML_EXTERN
int
Constraint_isSetMessage (const Constraint_t *c);


/**
 * @return true (non-zero) if the math of this Constraint has been
 * set, false (0) otherwise.
 */
LIBSBML_EXTERN
int
Constraint_isSetMath (const Constraint_t *c);


/**
 * Sets the message of this Constraint to a copy of xhtml.
 */
LIBSBML_EXTERN
void
Constraint_setMessage (Constraint_t *c, XMLNode_t* xhtml);


/**
 * Sets the math of this Constraint to a copy of the given
 * ASTNode.
 */
LIBSBML_EXTERN
void
Constraint_setMath (Constraint_t *c, const ASTNode_t *math);

/**
 * Unsets the message of this Constraint.
 */
LIBSBML_EXTERN
void 
Constraint_unsetMessage (Constraint_t *c);



END_C_DECLS


#endif  /* !SWIG */
#endif  /* Constraint_h */
