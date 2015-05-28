/**
 * @file:   Input.cpp
 * @brief:  Implementation of the Input class
 * @author: Generated by autocreate code
 *
 * <!--------------------------------------------------------------------------
 * This file is part of libSBML.  Please visit http://sbml.org for more
 * information about SBML, and the latest version of libSBML.
 *
 * Copyright (C) 2013-2015 jointly by the following organizations:
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
 */


#include <sbml/packages/qual/sbml/Input.h>
#include <sbml/packages/qual/validator/QualSBMLError.h>


using namespace std;


LIBSBML_CPP_NAMESPACE_BEGIN
#ifdef __cplusplus


/*
 * Creates a new Input with the given level, version, and package version.
 */
Input::Input (unsigned int level, unsigned int version, unsigned int pkgVersion)
  : SBase(level, version)
   ,mId ("")
   ,mQualitativeSpecies ("")
   ,mTransitionEffect (INPUT_TRANSITION_EFFECT_UNKNOWN)
   ,mName ("")
   ,mSign (INPUT_SIGN_VALUE_NOTSET)
   ,mThresholdLevel (SBML_INT_MAX)
   ,mIsSetThresholdLevel (false)
{
  // set an SBMLNamespaces derived object of this package
  setSBMLNamespacesAndOwn(new QualPkgNamespaces(level, version, pkgVersion));
}


/*
 * Creates a new Input with the given QualPkgNamespaces object.
 */
Input::Input (QualPkgNamespaces* qualns)
  : SBase(qualns)
   ,mId ("")
   ,mQualitativeSpecies ("")
   ,mTransitionEffect (INPUT_TRANSITION_EFFECT_UNKNOWN)
   ,mName ("")
   ,mSign (INPUT_SIGN_VALUE_NOTSET)
   ,mThresholdLevel (SBML_INT_MAX)
   ,mIsSetThresholdLevel (false)
{
  // set the element namespace of this object
  setElementNamespace(qualns->getURI());

  // load package extensions bound with this object (if any) 
  loadPlugins(qualns);
}


/*
 * Copy constructor for Input.
 */
Input::Input (const Input& orig)
  : SBase(orig)
  , mId (orig.mId)
  , mQualitativeSpecies (orig.mQualitativeSpecies)
  , mTransitionEffect (orig.mTransitionEffect)
  , mName (orig.mName)
  , mSign (orig.mSign)
  , mThresholdLevel (orig.mThresholdLevel)
  , mIsSetThresholdLevel (orig.mIsSetThresholdLevel)
{
}


/*
 * Assignment for Input.
 */
Input&
Input::operator=(const Input& rhs)
{
  if (&rhs != this)
  {
    SBase::operator=(rhs);
    mId  = rhs.mId;
    mQualitativeSpecies  = rhs.mQualitativeSpecies;
    mTransitionEffect  = rhs.mTransitionEffect;
    mName  = rhs.mName;
    mSign  = rhs.mSign;
    mThresholdLevel  = rhs.mThresholdLevel;
    mIsSetThresholdLevel  = rhs.mIsSetThresholdLevel;
  }
  return *this;
}


/*
 * Clone for Input.
 */
Input*
Input::clone () const
{
  return new Input(*this);
}


/*
 * Destructor for Input.
 */
Input::~Input ()
{
}


/*
 * Returns the value of the "id" attribute of this Input.
 */
const std::string&
Input::getId() const
{
  return mId;
}


/*
 * Returns the value of the "qualitativeSpecies" attribute of this Input.
 */
const std::string&
Input::getQualitativeSpecies() const
{
  return mQualitativeSpecies;
}


/*
 * Returns the value of the "transitionEffect" attribute of this Input.
 */
InputTransitionEffect_t
Input::getTransitionEffect() const
{
  return mTransitionEffect;
}


/*
 * Returns the value of the "name" attribute of this Input.
 */
const std::string&
Input::getName() const
{
  return mName;
}


/*
 * Returns the value of the "sign" attribute of this Input.
 */
InputSign_t
Input::getSign() const
{
  return mSign;
}


/*
 * Returns the value of the "thresholdLevel" attribute of this Input.
 */
int
Input::getThresholdLevel() const
{
  return mThresholdLevel;
}


/*
 * Returns true/false if id is set.
 */
bool
Input::isSetId() const
{
  return (mId.empty() == false);
}


/*
 * Returns true/false if qualitativeSpecies is set.
 */
bool
Input::isSetQualitativeSpecies() const
{
  return (mQualitativeSpecies.empty() == false);
}


/*
 * Returns true/false if transitionEffect is set.
 */
bool
Input::isSetTransitionEffect() const
{
  return (mTransitionEffect != INPUT_TRANSITION_EFFECT_UNKNOWN);
}


/*
 * Returns true/false if name is set.
 */
bool
Input::isSetName() const
{
  return (mName.empty() == false);
}


/*
 * Returns true/false if sign is set.
 */
bool
Input::isSetSign() const
{
  return (mSign != INPUT_SIGN_VALUE_NOTSET);
}


/*
 * Returns true/false if thresholdLevel is set.
 */
bool
Input::isSetThresholdLevel() const
{
  return mIsSetThresholdLevel;
}


/*
 * Sets id and returns value indicating success.
 */
int
Input::setId(const std::string& id)
{
  return SyntaxChecker::checkAndSetSId(id, mId);
}


/*
 * Sets qualitativeSpecies and returns value indicating success.
 */
int
Input::setQualitativeSpecies(const std::string& qualitativeSpecies)
{
  if (!(SyntaxChecker::isValidInternalSId(qualitativeSpecies)))
  {
    return LIBSBML_INVALID_ATTRIBUTE_VALUE;
  }
  else
  {
    mQualitativeSpecies = qualitativeSpecies;
    return LIBSBML_OPERATION_SUCCESS;
  }
}


/*
 * Sets transitionEffect and returns value indicating success.
 */
int
Input::setTransitionEffect(InputTransitionEffect_t transitionEffect)
{
  if (InputTransitionEffect_isValidInputTransitionEffect(transitionEffect) == 0)
  {
    mTransitionEffect = INPUT_TRANSITION_EFFECT_UNKNOWN;
    return LIBSBML_INVALID_ATTRIBUTE_VALUE;
  }
  else
  {
    mTransitionEffect = transitionEffect;
    return LIBSBML_OPERATION_SUCCESS;
  }
}


/*
 * Sets name and returns value indicating success.
 */
int
Input::setName(const std::string& name)
{
  mName = name;
  return LIBSBML_OPERATION_SUCCESS;
}


/*
 * Sets sign and returns value indicating success.
 */
int
Input::setSign(const InputSign_t sign)
{
  if (InputSign_isValidInputSign(sign) == 0)
  {
    mSign = INPUT_SIGN_VALUE_NOTSET;
    return LIBSBML_INVALID_ATTRIBUTE_VALUE;
  }
  else
  {
    mSign = sign;
    return LIBSBML_OPERATION_SUCCESS;
  }
}


/*
 * Sets thresholdLevel and returns value indicating success.
 */
int
Input::setThresholdLevel(int thresholdLevel)
{
  mThresholdLevel = thresholdLevel;
  mIsSetThresholdLevel = true;
  return LIBSBML_OPERATION_SUCCESS;
}


/*
 * Unsets id and returns value indicating success.
 */
int
Input::unsetId()
{
  mId.erase();

  if (mId.empty() == true)
  {
    return LIBSBML_OPERATION_SUCCESS;
  }
  else
  {
    return LIBSBML_OPERATION_FAILED;
  }
}


/*
 * Unsets qualitativeSpecies and returns value indicating success.
 */
int
Input::unsetQualitativeSpecies()
{
  mQualitativeSpecies.erase();

  if (mQualitativeSpecies.empty() == true)
  {
    return LIBSBML_OPERATION_SUCCESS;
  }
  else
  {
    return LIBSBML_OPERATION_FAILED;
  }
}


/*
 * Unsets transitionEffect and returns value indicating success.
 */
int
Input::unsetTransitionEffect()
{
  mTransitionEffect = INPUT_TRANSITION_EFFECT_UNKNOWN;
  return LIBSBML_OPERATION_SUCCESS;
}


/*
 * Unsets name and returns value indicating success.
 */
int
Input::unsetName()
{
  mName.erase();

  if (mName.empty() == true)
  {
    return LIBSBML_OPERATION_SUCCESS;
  }
  else
  {
    return LIBSBML_OPERATION_FAILED;
  }
}


/*
 * Unsets sign and returns value indicating success.
 */
int
Input::unsetSign()
{
  mSign = INPUT_SIGN_VALUE_NOTSET;
  return LIBSBML_OPERATION_SUCCESS;
}


/*
 * Unsets thresholdLevel and returns value indicating success.
 */
int
Input::unsetThresholdLevel()
{
  mThresholdLevel = SBML_INT_MAX;
  mIsSetThresholdLevel = false;

  if (isSetThresholdLevel() == false)
  {
    return LIBSBML_OPERATION_SUCCESS;
  }
  else
  {
    return LIBSBML_OPERATION_FAILED;
  }
}


/*
 * rename attributes that are SIdRefs or instances in math
 */
void
Input::renameSIdRefs(const std::string& oldid, const std::string& newid)
{
  if (isSetQualitativeSpecies() == true && mQualitativeSpecies == oldid)
  {
    setQualitativeSpecies(newid);
  }

}


/*
 * Returns the XML element name of this object
 */
const std::string&
Input::getElementName () const
{
  static const string name = "input";
  return name;
}


/*
 * Returns the libSBML type code for this SBML object.
 */
int
Input::getTypeCode () const
{
  return SBML_QUAL_INPUT;
}


/*
 * check if all the required attributes are set
 */
bool
Input::hasRequiredAttributes () const
{
  bool allPresent = true;

  if (isSetQualitativeSpecies() == false)
    allPresent = false;

  if (isSetTransitionEffect() == false)
    allPresent = false;

  return allPresent;
}


  /** @cond doxygenLibsbmlInternal */

/*
 * write contained elements
 */
void
Input::writeElements (XMLOutputStream& stream) const
{
  SBase::writeElements(stream);

  SBase::writeExtensionElements(stream);
}


  /** @endcond */


  /** @cond doxygenLibsbmlInternal */

/*
 * Accepts the given SBMLVisitor.
 */
bool
Input::accept (SBMLVisitor& v) const
{
  return v.visit(*this);
}


  /** @endcond */


  /** @cond doxygenLibsbmlInternal */

/*
 * Sets the parent SBMLDocument.
 */
void
Input::setSBMLDocument (SBMLDocument* d)
{
  SBase::setSBMLDocument(d);
}


  /** @endcond */


  /** @cond doxygenLibsbmlInternal */

/*
 * Enables/Disables the given package with this element.
 */
void
Input::enablePackageInternal(const std::string& pkgURI,
             const std::string& pkgPrefix, bool flag)
{
  SBase::enablePackageInternal(pkgURI, pkgPrefix, flag);
}


  /** @endcond */


  /** @cond doxygenLibsbmlInternal */

/*
 * Get the list of expected attributes for this element.
 */
void
Input::addExpectedAttributes(ExpectedAttributes& attributes)
{
  SBase::addExpectedAttributes(attributes);

  attributes.add("id");
  attributes.add("qualitativeSpecies");
  attributes.add("transitionEffect");
  attributes.add("name");
  attributes.add("sign");
  attributes.add("thresholdLevel");
}


  /** @endcond */


  /** @cond doxygenLibsbmlInternal */

/*
 * Read values from the given XMLAttributes set into their specific fields.
 */
void
Input::readAttributes (const XMLAttributes& attributes,
                             const ExpectedAttributes& expectedAttributes)
{
  const unsigned int sbmlLevel   = getLevel  ();
  const unsigned int sbmlVersion = getVersion();

  unsigned int numErrs;

  /* look to see whether an unknown attribute error was logged
   * during the read of the listOfInputs - which will have
   * happened immediately prior to this read
  */

  if (getErrorLog() != NULL && 
    static_cast<ListOfInputs*>(getParentSBMLObject())->size() < 2)
  {
    numErrs = getErrorLog()->getNumErrors();
    for (int n = numErrs-1; n >= 0; n--)      
    {
      if (getErrorLog()->getError(n)->getErrorId() == UnknownPackageAttribute)
      {
        const std::string details = 
          getErrorLog()->getError(n)->getMessage();
        getErrorLog()->remove(UnknownPackageAttribute);
        getErrorLog()->logPackageError("qual", QualTransitionLOInputAttributes,
          getPackageVersion(), sbmlLevel, sbmlVersion, details);
      } 
      else if (getErrorLog()->getError(n)->getErrorId() == UnknownCoreAttribute)
      {
        const std::string details = 
          getErrorLog()->getError(n)->getMessage();
        getErrorLog()->remove(UnknownCoreAttribute);
        getErrorLog()->logPackageError("qual", QualTransitionLOInputAttributes,
          getPackageVersion(), sbmlLevel, sbmlVersion, details);
      } 
    }
  }

  SBase::readAttributes(attributes, expectedAttributes);

  // look to see whether an unknown attribute error was logged
  if (getErrorLog() != NULL)
  {
    unsigned int numErrs = getErrorLog()->getNumErrors();
    for (int n = numErrs-1; n >= 0; n--)
    {
      if (getErrorLog()->getError(n)->getErrorId() == UnknownPackageAttribute)
      {
        const std::string details =
                          getErrorLog()->getError(n)->getMessage();
        getErrorLog()->remove(UnknownPackageAttribute);
        getErrorLog()->logPackageError("qual", QualInputAllowedAttributes,
                       getPackageVersion(), sbmlLevel, sbmlVersion, details);
      }
      else if (getErrorLog()->getError(n)->getErrorId() == UnknownCoreAttribute)
      {
        const std::string details =
                          getErrorLog()->getError(n)->getMessage();
        getErrorLog()->remove(UnknownCoreAttribute);
        getErrorLog()->logPackageError("qual", QualInputAllowedCoreAttributes,
                       getPackageVersion(), sbmlLevel, sbmlVersion, details);
      }
    }
  }

  bool assigned = false;

  //
  // id SId  ( use = "optional" )
  //
  assigned = attributes.readInto("id", mId);

   if (assigned == true)
  {
    // check string is not empty and correct syntax

    if (mId.empty() == true)
    {
      logEmptyString(mId, getLevel(), getVersion(), "<Input>");
    }
    else if (SyntaxChecker::isValidSBMLSId(mId) == false)
    {
      logError(InvalidIdSyntax, sbmlLevel, sbmlVersion, "The id '" + mId + "' does not conform to the syntax.");
    }
  }

  //
  // qualitativeSpecies SIdRef   ( use = "required" )
  //
  assigned = attributes.readInto("qualitativeSpecies", mQualitativeSpecies);

  if (assigned == true)
  {
    // check string is not empty and correct syntax

    if (mQualitativeSpecies.empty() == true)
    {
      logEmptyString(mQualitativeSpecies, getLevel(), getVersion(), "<Input>");
    }
    else if (SyntaxChecker::isValidSBMLSId(mQualitativeSpecies) == false)
    {
      logError(InvalidIdSyntax, getLevel(), getVersion(), 
        "The syntax of the attribute qualitativeSpecies='" + mQualitativeSpecies 
        + "' does not conform to the syntax.");
    }
  }
  else
  {
    std::string message = "Qual attribute 'qualitativeSpecies' is missing.";
    getErrorLog()->logPackageError("qual", QualInputAllowedAttributes,
                   getPackageVersion(), sbmlLevel, sbmlVersion, message);
  }

  //
  // transitionEffect string   ( use = "required" )
  //
  std::string effect;
  assigned = attributes.readInto("transitionEffect", effect);

  if (assigned == true)
  {
    // check string is not empty

    if (effect.empty() == true)
    {
      logEmptyString(effect, getLevel(), getVersion(), "<Input>");
    }
    else 
    {
       mTransitionEffect = InputTransitionEffect_fromString( effect.c_str() );
       if (InputTransitionEffect_isValidInputTransitionEffect(mTransitionEffect) == 0)
       {
          std::string msg = "The transitionEffect on the <input> ";
          if (isSetId()) {
            msg += "with id '" + getId() + "' ";
          }
          msg += "is '" + effect + "', which is not a valid option.";
          getErrorLog()->logPackageError("qual", QualInputTransEffectMustBeInputEffect,
                       getPackageVersion(), sbmlLevel, sbmlVersion, msg);
       }
    }
  }
  else
  {
    std::string message = "Qual attribute 'transitionEffect' is missing.";
    getErrorLog()->logPackageError("qual", QualInputAllowedAttributes,
                   getPackageVersion(), sbmlLevel, sbmlVersion, message);
  }

  //
  // name string   ( use = "optional" )
  //
  assigned = attributes.readInto("name", mName);

  if (assigned == true)
  {
    // check string is not empty

    if (mName.empty() == true)
    {
      logEmptyString(mName, getLevel(), getVersion(), "<Input>");
    }
  }

  //
  // sign string   ( use = "optional" )
  //
  std::string sign;
  assigned = attributes.readInto("sign", sign, getErrorLog(), false);

  if (assigned == true)
  {
    // check string is not empty

    if (sign.empty() == true)
    {
      logEmptyString(sign, getLevel(), getVersion(), "<Input>");
    }
    else 
    {
       mSign = InputSign_fromString( sign.c_str() );
       if (InputSign_isValidInputSign(mSign) == 0)
       {
          std::string msg = "The inputSign on the <input> ";
          if (isSetId()) {
            msg += "with id '" + getId() + "' ";
          }
          msg += "is '" + sign + "', which is not a valid option.";
          getErrorLog()->logPackageError("qual", QualInputSignMustBeSignEnum,
                       getPackageVersion(), sbmlLevel, sbmlVersion, msg);
       }
    }
  }

  //
  // thresholdLevel int   ( use = "optional" )
  //
  numErrs = getErrorLog()->getNumErrors();
  mIsSetThresholdLevel = attributes.readInto("thresholdLevel", mThresholdLevel);

  if (mIsSetThresholdLevel == false)
  {
    if (getErrorLog() != NULL)
    {
      if (getErrorLog()->getNumErrors() == numErrs + 1 &&
              getErrorLog()->contains(XMLAttributeTypeMismatch))
      {
        getErrorLog()->remove(XMLAttributeTypeMismatch);
        getErrorLog()->logPackageError("qual", QualInputThreshMustBeInteger,
                     getPackageVersion(), sbmlLevel, sbmlVersion);
      }
    }
  }
  else
  {
    if (mThresholdLevel < 0)
    {
      std::stringstream msg;
      msg << "The threshholdLevel of the <input> ";
      if (isSetId()) {
        msg << "with id '" << getId() << "' ";
      }
      msg << "is '" << mThresholdLevel << "', which is negative.";
      getErrorLog()->logPackageError("qual", QualInputThreshMustBeNonNegative,
                   getPackageVersion(), sbmlLevel, sbmlVersion, msg.str());
    }
  }

}


  /** @endcond */


  /** @cond doxygenLibsbmlInternal */

/*
 * Write values of XMLAttributes to the output stream.
 */
  void
Input::writeAttributes (XMLOutputStream& stream) const
{
  SBase::writeAttributes(stream);

  if (isSetId() == true)
    stream.writeAttribute("id", getPrefix(), mId);

  if (isSetQualitativeSpecies() == true)
    stream.writeAttribute("qualitativeSpecies", getPrefix(), mQualitativeSpecies);

  if (isSetTransitionEffect() == true)
    stream.writeAttribute("transitionEffect", getPrefix(), 
                     InputTransitionEffect_toString(mTransitionEffect));

  if (isSetName() == true)
    stream.writeAttribute("name", getPrefix(), mName);

  if (isSetSign() == true)
    stream.writeAttribute("sign", getPrefix(), InputSign_toString(mSign));

  if (isSetThresholdLevel() == true)
    stream.writeAttribute("thresholdLevel", getPrefix(), mThresholdLevel);

  SBase::writeExtensionAttributes(stream);

}


  /** @endcond */


/*
 * Constructor 
 */
ListOfInputs::ListOfInputs(unsigned int level, 
                           unsigned int version, 
                           unsigned int pkgVersion)
 : ListOf(level, version)
{
  setSBMLNamespacesAndOwn(new QualPkgNamespaces(level, version, pkgVersion)); 
}


/*
 * Constructor 
 */
ListOfInputs::ListOfInputs(QualPkgNamespaces* qualns)
  : ListOf(qualns)
{
  setElementNamespace(qualns->getURI());
}


/*
 * Returns a deep copy of this ListOfInputs 
 */
ListOfInputs* 
ListOfInputs::clone () const
 {
  return new ListOfInputs(*this);
}


/*
 * Get a Input from the ListOfInputs by index.
*/
Input*
ListOfInputs::get(unsigned int n)
{
  return static_cast<Input*>(ListOf::get(n));
}


/*
 * Get a Input from the ListOfInputs by index.
 */
const Input*
ListOfInputs::get(unsigned int n) const
{
  return static_cast<const Input*>(ListOf::get(n));
}


/*
 * Get a Input from the ListOfInputs by id.
 */
Input*
ListOfInputs::get(const std::string& sid)
{
  return const_cast<Input*>(
    static_cast<const ListOfInputs&>(*this).get(sid));
}


/*
 * Get a Input from the ListOfInputs by id.
 */
const Input*
ListOfInputs::get(const std::string& sid) const
{
  vector<SBase*>::const_iterator result;

  result = find_if( mItems.begin(), mItems.end(), IdEq<Input>(sid) );
  return (result == mItems.end()) ? 0 : static_cast <Input*> (*result);
}


Input*
ListOfInputs::getBySpecies(const std::string& sid)
{
  return const_cast<Input*>(
    static_cast<const ListOfInputs&>(*this).getBySpecies(sid));
}

/**
 * Used by ListOfInputs::get() to lookup an Input based by its 
 * qualitativeSpecies.
 */
struct IdEqQS : public std::unary_function<SBase*, bool>
{
  const string& id;

  IdEqQS (const string& id) : id(id) { }
  bool operator() (SBase* sb)
       { return (static_cast <Input *> (sb)->getQualitativeSpecies()  == id); } 
};



/*
 * Get a Input from the ListOfInputs by id.
 */
const Input*
ListOfInputs::getBySpecies(const std::string& sid) const
{
  vector<SBase*>::const_iterator result;

  result = find_if( mItems.begin(), mItems.end(), IdEqQS(sid) );
  return (result == mItems.end()) ? 0 : static_cast <Input*> (*result);
}


/*
 * Removes the nth Input from this ListOfInputs
 */
Input*
ListOfInputs::remove(unsigned int n)
{
  return static_cast<Input*>(ListOf::remove(n));
}


/*
 * Removes the Input from this ListOfInputs with the given identifier
 */
Input*
ListOfInputs::remove(const std::string& sid)
{
  SBase* item = NULL;
  vector<SBase*>::iterator result;

  result = find_if( mItems.begin(), mItems.end(), IdEq<Input>(sid) );

  if (result != mItems.end())
  {
    item = *result;
    mItems.erase(result);
  }

  return static_cast <Input*> (item);
}


/*
 * Returns the XML element name of this object
 */
const std::string&
ListOfInputs::getElementName () const
{
  static const string name = "listOfInputs";
  return name;
}


/*
 * Returns the libSBML type code for the objects in this LIST_OF.
 */
int
ListOfInputs::getItemTypeCode () const
{
  return SBML_QUAL_INPUT;
}


  /** @cond doxygenLibsbmlInternal */

/*
 * Creates a new Input in this ListOfInputs
 */
SBase*
ListOfInputs::createObject(XMLInputStream& stream)
{
  const std::string& name   = stream.peek().getName();
  SBase* object = NULL;

  if (name == "input")
  {
    QUAL_CREATE_NS(qualns, getSBMLNamespaces());
    object = new Input(qualns);
    appendAndOwn(object);
    delete qualns;
  }
  
  return object;
}


  /** @endcond */


  /** @cond doxygenLibsbmlInternal */

/*
 * Write the namespace for the Qual package.
 */
void
ListOfInputs::writeXMLNS(XMLOutputStream& stream) const
{
  XMLNamespaces xmlns;

  std::string prefix = getPrefix();

  if (prefix.empty())
  {
    XMLNamespaces* thisxmlns = getNamespaces();
    if (thisxmlns && thisxmlns->hasURI(QualExtension::getXmlnsL3V1V1()))
    {
      xmlns.add(QualExtension::getXmlnsL3V1V1(),prefix);
    }
  }

  stream << xmlns;
}


  /** @endcond */


#endif /* __cplusplus */  
/** @cond doxygenIgnored */

LIBSBML_EXTERN
Input_t *
Input_create(unsigned int level, unsigned int version,
             unsigned int pkgVersion)
{
  return new Input(level, version, pkgVersion);
}


LIBSBML_EXTERN
void
Input_free(Input_t * i)
{
  if (i != NULL)
    delete i;
}


LIBSBML_EXTERN
Input_t *
Input_clone(Input_t * i)
{
  if (i != NULL)
  {
    return static_cast<Input_t*>(i->clone());
  }
  else
  {
    return NULL;
  }
}


LIBSBML_EXTERN
char *
Input_getId(Input_t * i)
{
  if (i == NULL)
    return NULL;

  return i->getId().empty() ? NULL : safe_strdup(i->getId().c_str());
}


LIBSBML_EXTERN
char *
Input_getQualitativeSpecies(Input_t * i)
{
  if (i == NULL)
    return NULL;

  return i->getQualitativeSpecies().empty() ? NULL : safe_strdup(i->getQualitativeSpecies().c_str());
}


LIBSBML_EXTERN
InputTransitionEffect_t
Input_getTransitionEffect(Input_t * i)
{
  if (i == NULL)
    return INPUT_TRANSITION_EFFECT_UNKNOWN;

  return i->getTransitionEffect();
}


LIBSBML_EXTERN
char *
Input_getName(Input_t * i)
{
  if (i == NULL)
    return NULL;

  return i->getName().empty() ? NULL : safe_strdup(i->getName().c_str());
}


LIBSBML_EXTERN
InputSign_t
Input_getSign(Input_t * i)
{
  if (i == NULL)
    return INPUT_SIGN_VALUE_NOTSET;

  return i->getSign();
}


LIBSBML_EXTERN
int
Input_getThresholdLevel(Input_t * i)
{
  return (i != NULL) ? i->getThresholdLevel() : SBML_INT_MAX;
}


LIBSBML_EXTERN
int
Input_isSetId(Input_t * i)
{
  return (i != NULL) ? static_cast<int>(i->isSetId()) : 0;
}


LIBSBML_EXTERN
int
Input_isSetQualitativeSpecies(Input_t * i)
{
  return (i != NULL) ? static_cast<int>(i->isSetQualitativeSpecies()) : 0;
}


LIBSBML_EXTERN
int
Input_isSetTransitionEffect(Input_t * i)
{
  return (i != NULL) ? static_cast<int>(i->isSetTransitionEffect()) : 0;
}


LIBSBML_EXTERN
int
Input_isSetName(Input_t * i)
{
  return (i != NULL) ? static_cast<int>(i->isSetName()) : 0;
}


LIBSBML_EXTERN
int
Input_isSetSign(Input_t * i)
{
  return (i != NULL) ? static_cast<int>(i->isSetSign()) : 0;
}


LIBSBML_EXTERN
int
Input_isSetThresholdLevel(Input_t * i)
{
  return (i != NULL) ? static_cast<int>(i->isSetThresholdLevel()) : 0;
}


LIBSBML_EXTERN
int
Input_setId(Input_t * i, const char * id)
{
  return (i != NULL) ? i->setId(id) : LIBSBML_INVALID_OBJECT;
}


LIBSBML_EXTERN
int
Input_setQualitativeSpecies(Input_t * i, const char * qualitativeSpecies)
{
  return (i != NULL) ? i->setQualitativeSpecies(qualitativeSpecies) : LIBSBML_INVALID_OBJECT;
}


LIBSBML_EXTERN
int
Input_setTransitionEffect(Input_t * i, InputTransitionEffect_t transitionEffect)
{
  return (i != NULL) ? i->setTransitionEffect(transitionEffect) : LIBSBML_INVALID_OBJECT;
}


LIBSBML_EXTERN
int
Input_setName(Input_t * i, const char * name)
{
  return (i != NULL) ? i->setName(name) : LIBSBML_INVALID_OBJECT;
}


LIBSBML_EXTERN
int
Input_setSign(Input_t * i, InputSign_t sign)
{
  return (i != NULL) ? i->setSign(sign) : LIBSBML_INVALID_OBJECT;
}


LIBSBML_EXTERN
int
Input_setThresholdLevel(Input_t * i, int thresholdLevel)
{
  return (i != NULL) ? i->setThresholdLevel(thresholdLevel) : LIBSBML_INVALID_OBJECT;
}


LIBSBML_EXTERN
int
Input_unsetId(Input_t * i)
{
  return (i != NULL) ? i->unsetId() : LIBSBML_INVALID_OBJECT;
}


LIBSBML_EXTERN
int
Input_unsetQualitativeSpecies(Input_t * i)
{
  return (i != NULL) ? i->unsetQualitativeSpecies() : LIBSBML_INVALID_OBJECT;
}


LIBSBML_EXTERN
int
Input_unsetTransitionEffect(Input_t * i)
{
  return (i != NULL) ? i->unsetTransitionEffect() : LIBSBML_INVALID_OBJECT;
}


LIBSBML_EXTERN
int
Input_unsetName(Input_t * i)
{
  return (i != NULL) ? i->unsetName() : LIBSBML_INVALID_OBJECT;
}


LIBSBML_EXTERN
int
Input_unsetSign(Input_t * i)
{
  return (i != NULL) ? i->unsetSign() : LIBSBML_INVALID_OBJECT;
}


LIBSBML_EXTERN
int
Input_unsetThresholdLevel(Input_t * i)
{
  return (i != NULL) ? i->unsetThresholdLevel() : LIBSBML_INVALID_OBJECT;
}


LIBSBML_EXTERN
int
Input_hasRequiredAttributes(Input_t * i)
{
  return (i != NULL) ? static_cast<int>(i->hasRequiredAttributes()) : 0;
}


LIBSBML_EXTERN
Input_t *
ListOfInputs_getById(ListOf_t * lo, const char * sid)
{
  if (lo == NULL)
    return NULL;

  return (sid != NULL) ? static_cast <ListOfInputs *>(lo)->get(sid) : NULL;
}


LIBSBML_EXTERN
Input_t *
ListOfInputs_removeById(ListOf_t * lo, const char * sid)
{
  if (lo == NULL)
    return NULL;

  return (sid != NULL) ? static_cast <ListOfInputs *>(lo)->remove(sid) : NULL;
}

static
const char* INPUT_TRANSITION_EFFECT_STRINGS[] =
{
    "none"
  , "consumption"
  , "unknown"
};


LIBSBML_EXTERN
const char* 
InputTransitionEffect_toString(InputTransitionEffect_t effect)
{
  int max = INPUT_TRANSITION_EFFECT_UNKNOWN;

  if (effect < INPUT_TRANSITION_EFFECT_NONE || effect >= max)
  {
      return NULL;
  }

  return INPUT_TRANSITION_EFFECT_STRINGS[effect];
}


LIBSBML_EXTERN
InputTransitionEffect_t 
InputTransitionEffect_fromString(const char* s)
{
  if (s == NULL) 
  {
    return INPUT_TRANSITION_EFFECT_UNKNOWN;
  }

  int max = INPUT_TRANSITION_EFFECT_UNKNOWN;
  for (int i = 0; i < max; i++)
  {
    if (strcmp(INPUT_TRANSITION_EFFECT_STRINGS[i], s) == 0)
      return (InputTransitionEffect_t)i;
  }
  return INPUT_TRANSITION_EFFECT_UNKNOWN;
}


LIBSBML_EXTERN
int 
InputTransitionEffect_isValidInputTransitionEffect(InputTransitionEffect_t effect)
{
  int max = INPUT_TRANSITION_EFFECT_UNKNOWN;

  if (effect < INPUT_TRANSITION_EFFECT_NONE || effect >= max)
  {
    return 0;
  }
  else
  {
    return 1;
  }
}


LIBSBML_EXTERN
int 
InputTransitionEffect_isValidInputTransitionEffectString(const char* s)
{
  return InputTransitionEffect_isValidInputTransitionEffect
                                         (InputTransitionEffect_fromString(s));
}


static
const char* INPUT_SIGN_STRINGS[] =
{
    "positive"
  , "negative"
  , "dual"
  , "unknown"
  , "NOT SET"
};


LIBSBML_EXTERN
const char* 
InputSign_toString(InputSign_t effect)
{
  int max = INPUT_SIGN_VALUE_NOTSET;

  if (effect < INPUT_SIGN_POSITIVE || effect >= max)
  {
      return NULL;
  }

  return INPUT_SIGN_STRINGS[effect];
}


LIBSBML_EXTERN
InputSign_t 
InputSign_fromString(const char* s)
{
  if (s == NULL) 
  {
    return INPUT_SIGN_VALUE_NOTSET;
  }

  int max = INPUT_SIGN_VALUE_NOTSET;
  for (int i = 0; i < max; i++)
  {
    if (strcmp(INPUT_SIGN_STRINGS[i], s) == 0)
      return (InputSign_t)i;
  }
  return INPUT_SIGN_VALUE_NOTSET;
}


LIBSBML_EXTERN
int 
InputSign_isValidInputSign(InputSign_t effect)
{
  int max = INPUT_SIGN_VALUE_NOTSET;

  if (effect < INPUT_SIGN_POSITIVE || effect >= max)
  {
    return 0;
  }
  else
  {
    return 1;
  }
}


LIBSBML_EXTERN
int 
InputSign_isValidInputSignString(const char* s)
{
  return InputSign_isValidInputSign(InputSign_fromString(s));
}


/** @endcond */
LIBSBML_CPP_NAMESPACE_END


