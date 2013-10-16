/**
 * @file    GraphicalObject.h
 * @brief   Definition of GraphicalObject for SBML Layout.
 * @author  Ralph Gauges
 * 
 * <!--------------------------------------------------------------------------
 * Description : SBML Layout GraphicalObject C++ Header
 * Organization: European Media Laboratories Research gGmbH
 * Created     : 2004-07-15
 *
 * Copyright 2004 European Media Laboratories Research gGmbH
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
 * European Media Laboratories Research gGmbH have no obligations to
 * provide maintenance, support, updates, enhancements or modifications.
 * In no event shall the European Media Laboratories Research gGmbH be
 * liable to any party for direct, indirect, special, incidental or
 * consequential damages, including lost profits, arising out of the use of
 * this software and its documentation, even if the European Media
 * Laboratories Research gGmbH have been advised of the possibility of such
 * damage.  See the GNU Lesser General Public License for more details.
 *
 * You should have received a copy of the GNU Lesser General Public License
 * along with this library; if not, write to the Free Software Foundation,
 * Inc., 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301, USA.
 *
 * The original code contained here was initially developed by:
 *
 *     Ralph Gauges
 *     Bioinformatics Group
 *     European Media Laboratories Research gGmbH
 *     Schloss-Wolfsbrunnenweg 31c
 *     69118 Heidelberg
 *     Germany
 *
 *     http://www.eml-research.de/english/Research/BCB/
 *     mailto:ralph.gauges@eml-r.villa-bosch.de
 *
 * Contributor(s):
 *
 *     Akiya Jouraku <jouraku@bio.keio.ac.jp>
 *     Modified this file for package extension in libSBML5
 *------------------------------------------------------------------------- -->
 *
 * @class GraphicalObject
 * @ingroup layout
 * @brief @htmlinclude pkg-marker-layout.html
 * The basic &ldquo;layout&rdquo; package element for storing layout information.
 *
 * All the more specific layout elements (CompartmentGlyph, GeneralGlyph, SpeciesGlyph, ReactionGlyph, ReferenceGlyph, TextGlyph, and SpeciesReferenceGlyph) are derived from the class GraphicalObject. Each object of class GraphicalObject has a mandatory BoundingBox, which specifies the position and the size of the object.
 * While GraphicalObject is the base class for most elements in the &ldquo;layout&rdquo; package, it is not an abstract class. It can be instantiated when used in the listOfAdditionalGraphicalObjects to describe additional elements and relationships. Since it only describes a BoundingBox, programs are encouraged to add Annotation objects that describe program-specific graphical information.
 */

#ifndef GraphicalObject_H__
#define GraphicalObject_H__


#include <sbml/common/extern.h>
#include <sbml/common/sbmlfwd.h>
#include <sbml/packages/layout/common/layoutfwd.h>


#ifdef __cplusplus


#include <string>

#include <sbml/SBase.h>
#include <sbml/packages/layout/sbml/BoundingBox.h>
#include <sbml/packages/layout/extension/LayoutExtension.h>

LIBSBML_CPP_NAMESPACE_BEGIN

class LIBSBML_EXTERN GraphicalObject : public SBase
{
protected:
  /** @cond doxygenLibsbmlInternal */
  std::string mId;
  std::string mMetaIdRef;
  BoundingBox mBoundingBox;
  bool mBoundingBoxExplicitlySet;
  /** @endcond */
        

public:

  /**
   * Creates a new GraphicalObject.
   */
  
  GraphicalObject (unsigned int level      = LayoutExtension::getDefaultLevel(),
                   unsigned int version    = LayoutExtension::getDefaultVersion(),
                   unsigned int pkgVersion = LayoutExtension::getDefaultPackageVersion());


  /**
   * Creates a new GraphicalObject with the given LayoutPkgNamespaces
   */
  GraphicalObject (LayoutPkgNamespaces* layoutns);

  /**
   * Creates a new GraphicalObject with the given @p id.
   *
   * (FOR BACKWARD COMPATIBILITY)
   *
   */
  
  GraphicalObject (LayoutPkgNamespaces* layoutns, const std::string& id);

  /**
   * Creates a new GraphicalObject with the given @p id and 2D coordinates for
   * the bounding box.
   *
   * (FOR BACKWARD COMPATIBILITY)
   *
   */
  
  GraphicalObject (LayoutPkgNamespaces* layoutns, const std::string& id,
                   double x, double y, double w, double h);

  /**
   * Creates a new GraphicalObject with the given @p id and 3D coordinates for
   * the bounding box.
   *
   * (FOR BACKWARD COMPATIBILITY)
   *
   */
  
  GraphicalObject (LayoutPkgNamespaces* layoutns, const std::string& id,
                   double x, double y, double z,
                   double w, double h, double d);

  /**
   * Creates a new GraphicalObject with the given @p id and 3D coordinates for
   * the bounding box.
   *
   * (FOR BACKWARD COMPATIBILITY)
   *
   */
  
  GraphicalObject (LayoutPkgNamespaces* layoutns, const std::string& id, const Point* p, const Dimensions* d);

  /**
   * Creates a new GraphicalObject with the given @p id and 3D coordinates for
   * the bounding box.
   *
   * (FOR BACKWARD COMPATIBILITY)
   *
   */
  
  GraphicalObject (LayoutPkgNamespaces* layoutns, const std::string& id, const BoundingBox* bb);


  /**
   * Creates a new GraphicalObject from the given XMLNode
   *
   * (FOR BACKWARD COMPATIBILITY)
   *
   */
  GraphicalObject(const XMLNode& node, unsigned int l2version=4);

  /**
   * Copy constructor.
   */
   GraphicalObject(const GraphicalObject& source);

  /**
   * Assignment operator.
   */
   virtual GraphicalObject& operator=(const GraphicalObject& source);


  /**
   * Destructor.
   */ 
  
  virtual ~GraphicalObject ();

  /**
   * Does nothing. No defaults are defined for GraphicalObject.
   */ 
  
  void initDefaults ();


  /**
   * Returns a List of all child SBase objects, including those nested to an
   * arbitrary depth
   *
   * @return a List* of pointers to all children objects.
   */
  virtual List* getAllElements(ElementFilter* filter=NULL);


  /**
   * Renames all the @c MetaIdRef attributes on this element.
   *
   * This method works by looking at all meta-attribute values, comparing
   * the identifiers to the value of @p oldid.  If any matches are found,
   * the matching identifiers are replaced with @p newid.  The method does
   * @em not descend into child elements.
   *
   * @param oldid the old identifier
   * @param newid the new identifier
   */
  virtual void renameMetaIdRefs(const std::string& oldid, const std::string& newid);

  /**
   * Returns the value of the "id" attribute of this GraphicalObject.
   */
  virtual const std::string& getId () const;


  /**
   * Predicate returning @c true or @c false depending on whether this
   * GraphicalObject's "id" attribute has been set.
   */
  virtual bool isSetId () const;

  
  /**
   * Sets the value of the "id" attribute of this GraphicalObject.
   */
  virtual int setId (const std::string& id);


  /**
   * Unsets the value of the "id" attribute of this GraphicalObject.
   */
  virtual int unsetId ();

  /**
   * Returns the value of the "metaidRef" attribute of this GraphicalObject.
   */
  virtual const std::string& getMetaIdRef () const;


  /**
   * Predicate returning @c true or @c false depending on whether this
   * GraphicalObject's "metaidRef" attribute has been set.
   */
  virtual bool isSetMetaIdRef () const;

  
  /**
   * Sets the value of the "metaidRef" attribute of this GraphicalObject.
   */
  virtual int setMetaIdRef (const std::string& metaid);


  /**
   * Unsets the value of the "metaidRef" attribute of this GraphicalObject.
   */
  virtual int unsetMetaIdRef ();
  
  /**
   * Sets the boundingbox for the GraphicalObject.
   */ 
  
  void setBoundingBox (const BoundingBox* bb);

  /**
   * Returns the bounding box for the GraphicalObject.
   */ 
  
  BoundingBox* getBoundingBox ();

  /**
   * Returns the bounding box for the GraphicalObject.
   */ 
  
  const BoundingBox* getBoundingBox() const;


  bool getBoundingBoxExplicitlySet() const;
  /** @cond doxygenLibsbmlInternal */
  /**
   * Subclasses should override this method to write out their contained
   * SBML objects as XML elements.  Be sure to call your parents
   * implementation of this method as well.  For example:
   *
   *   SBase::writeElements(stream);
   *   mReactants.write(stream);
   *   mProducts.write(stream);
   *   ...
   */
  virtual void writeElements (XMLOutputStream& stream) const;
  /** @endcond */

  /**
   * Returns the XML element name of
   * this SBML object.
   */
  virtual const std::string& getElementName () const ;

  /**
   * @return a (deep) copy of this GraphicalObject.
   */
  virtual GraphicalObject* clone () const;


  /**
   * Returns the libSBML type code of this object instance.
   *
   * @copydetails doc_what_are_typecodes
   *
   * @return the SBML type code for this object: SBMLLayoutTypeCode_t#SBML_LAYOUT_GRAPHICALOBJECT
   *
   * @see getElementName()
   * @see getPackageName()
   */
  virtual int getTypeCode () const;


  /**
   * Accepts the given SBMLVisitor.
   *
   * @return the result of calling <code>v.visit()</code>, which indicates
   * whether or not the Visitor would like to visit the SBML object's next
   * sibling object (if available).
   */
  virtual bool accept (SBMLVisitor& v) const;
    

   /**
    * Creates an XMLNode object from this.
    */
    virtual XMLNode toXML() const;


  /** @cond doxygenLibsbmlInternal */
  /**
   * Sets the parent SBMLDocument of this SBML object.
   *
   * @param d the SBMLDocument object to use
   */
  virtual void setSBMLDocument (SBMLDocument* d);
  /** @endcond */


  /** @cond doxygenLibsbmlInternal */
  /**
   * Sets this SBML object to child SBML objects (if any).
   * (Creates a child-parent relationship by the parent)
   *
   * Subclasses must override this function if they define
   * one ore more child elements.
   * Basically, this function needs to be called in
   * constructor, copy constructor, assignment operator.
   *
   * @see setSBMLDocument
   * @see enablePackageInternal
   */
  virtual void connectToChild ();
  /** @endcond */


  /** @cond doxygenLibsbmlInternal */
  /**
   * Enables/Disables the given package with this element and child
   * elements (if any).
   * (This is an internal implementation for enablePakcage function)
   *
   * @note Subclasses in which one or more child elements are defined
   * must override this function.
   */
  virtual void enablePackageInternal(const std::string& pkgURI,
                                     const std::string& pkgPrefix, bool flag);
  /** @endcond */
    
protected:
  /** @cond doxygenLibsbmlInternal */
  /**
   * @return the SBML object corresponding to next XMLToken in the
   * XMLInputStream or NULL if the token was not recognized.
   */
  virtual SBase*
  createObject (XMLInputStream& stream);
  /** @endcond */


  /** @cond doxygenLibsbmlInternal */
  /**
   * Subclasses should override this method to get the list of
   * expected attributes.
   * This function is invoked from corresponding readAttributes()
   * function.
   */
  virtual void addExpectedAttributes(ExpectedAttributes& attributes);
  /** @endcond */


  /** @cond doxygenLibsbmlInternal */
  /**
   * Subclasses should override this method to read values from the given
   * XMLAttributes set into their specific fields.  Be sure to call your
   * parents implementation of this method as well.
   */
  virtual void readAttributes (const XMLAttributes& attributes, 
                               const ExpectedAttributes& expectedAttributes);
  /** @endcond */


  /** @cond doxygenLibsbmlInternal */
  /**
   * Subclasses should override this method to write their XML attributes
   * to the XMLOutputStream.  Be sure to call your parents implementation
   * of this method as well.  For example:
   *
   *   SBase::writeAttributes(stream);
   *   stream.writeAttribute( "id"  , mId   );
   *   stream.writeAttribute( "name", mName );
   *   ...
   */
  virtual void writeAttributes (XMLOutputStream& stream) const;
  /** @endcond */


  /** @cond doxygenLibsbmlInternal */
  /**
   *
   * Subclasses should override this method to write their xmlns attriubutes
   * (if any) to the XMLOutputStream. 
   *
   */
  virtual void writeXMLNS (XMLOutputStream& stream) const;
  /** @endcond */
};


/**
 * @class ListOfGraphicalObjects
 * @ingroup layout
 * @brief  @htmlinclude pkg-marker-layout.html
 * Implementation of the %ListOfAdditionalGraphicalObjects construct from the &ldquo;layout&rdquo; package.
 * 
 * The ListOfGraphicalObjects class in libSBML actually represents the ListOfAdditionalGraphicalObjects class in the &ldquo;layout&rdquo; package, and is a container for the additional GraphicalObject elements of a Layout.
 * 
 * @copydetails doc_what_is_listof
 *
 * @see GraphicalObject
 */
class LIBSBML_EXTERN ListOfGraphicalObjects : public ListOf
{
public:

  /**
   * @return a (deep) copy of this ListOfGraphicalObjects.
   */
  virtual ListOfGraphicalObjects* clone () const;


  /**
   * Ctor.
   */
   ListOfGraphicalObjects(unsigned int level      = LayoutExtension::getDefaultLevel(),
                          unsigned int version    = LayoutExtension::getDefaultVersion(),
                          unsigned int pkgVersion = LayoutExtension::getDefaultPackageVersion());


  /**
   * Ctor.
   */
   ListOfGraphicalObjects(LayoutPkgNamespaces* layoutns);


  /**
   * Returns the libSBML type code for the SBML objects
   * contained in this ListOf object.
   * 
   * @copydetails doc_what_are_typecodes
   *
   * @return the SBML type code for this object, or
   * @link SBMLTypeCode_t#SBML_UNKNOWN SBML_UNKNOWN@endlink (default).
   *
   * @see getElementName()
   * @see getPackageName()
   */
  virtual int getItemTypeCode () const;

  /**
   * Returns the XML element name of
   * this SBML object.
   */
  virtual const std::string& getElementName () const;

  /** @cond doxygenLibsbmlInternal */
  /* 
   * Allow overwriting the element name (as used by the generalGlyph)
   */ 
  void setElementName(const std::string& elementName);
  /** @endcond **/

  /**
   * Get a GraphicalObject from the ListOfGraphicalObjects.
   *
   * @param n the index number of the GraphicalObject to get.
   * 
   * @return the nth GraphicalObject in this ListOfGraphicalObjects.
   *
   * @see size()
   */
  virtual GraphicalObject * get(unsigned int n); 


  /**
   * Get a GraphicalObject from the ListOfGraphicalObjects.
   *
   * @param n the index number of the GraphicalObject to get.
   * 
   * @return the nth GraphicalObject in this ListOfGraphicalObjects.
   *
   * @see size()
   */
  virtual const GraphicalObject * get(unsigned int n) const; 

  /**
   * Get a GraphicalObject from the ListOfGraphicalObjects
   * based on its identifier.
   *
   * @param sid a string representing the identifier 
   * of the GraphicalObject to get.
   * 
   * @return GraphicalObject in this ListOfGraphicalObjects
   * with the given @p sid or @c NULL if no such
   * GraphicalObject exists.
   *
   * @see get(unsigned int n)
   * @see size()
   */
  virtual GraphicalObject* get (const std::string& sid);


  /**
   * Get a GraphicalObject from the ListOfGraphicalObjects
   * based on its identifier.
   *
   * @param sid a string representing the identifier 
   * of the GraphicalObject to get.
   * 
   * @return GraphicalObject in this ListOfGraphicalObjects
   * with the given @p sid or @c NULL if no such
   * GraphicalObject exists.
   *
   * @see get(unsigned int n)
   * @see size()
   */
  virtual const GraphicalObject* get (const std::string& sid) const;


  /**
   * Removes the nth item from this ListOfGraphicalObjects items and returns a pointer to
   * it.
   *
   * The caller owns the returned item and is responsible for deleting it.
   *
   * @param n the index of the item to remove
   *
   * @see size()
   */
  virtual GraphicalObject* remove (unsigned int n);


  /**
   * Removes item in this ListOfGraphicalObjects items with the given identifier.
   *
   * The caller owns the returned item and is responsible for deleting it.
   * If none of the items in this list have the identifier @p sid, then @c
   * NULL is returned.
   *
   * @param sid the identifier of the item to remove
   *
   * @return the item removed.  As mentioned above, the caller owns the
   * returned item.
   */
  virtual GraphicalObject* remove (const std::string& sid);


   /**
    * Creates an XMLNode object from this.
    */
    XMLNode toXML() const;
    
protected:

  /** @cond doxygenLibsbmlInternal */
  /**
   * @return the SBML object corresponding to next XMLToken in the
   * XMLInputStream or NULL if the token was not recognized.
   */
  virtual SBase* createObject (XMLInputStream& stream);
  
  virtual bool isValidTypeForList(SBase * item);
  /** @endcond */

private:
  std::string mElementName;

};



LIBSBML_CPP_NAMESPACE_END

#endif /* __cplusplus */


#ifndef SWIG

LIBSBML_CPP_NAMESPACE_BEGIN
BEGIN_C_DECLS



/*
 * Creates a new GraphicalObject.
 */
LIBSBML_EXTERN
GraphicalObject_t *
GraphicalObject_create (void);


/*
 * Creates a GraphicalObject from a template.
 */
LIBSBML_EXTERN
GraphicalObject_t *
GraphicalObject_createFrom (const GraphicalObject_t *temp);

/*
 * Frees all memory taken up by the GraphicalObject.
 */ 
LIBSBML_EXTERN
void
GraphicalObject_free (GraphicalObject_t *go);


/*
 * Sets the boundingbox for the GraphicalObject.
 */ 
LIBSBML_EXTERN
void
GraphicalObject_setBoundingBox (GraphicalObject_t *go, const BoundingBox_t *bb);

/*
 * Returns the bounding box for the GraphicalObject.
 */ 
LIBSBML_EXTERN
BoundingBox_t *
GraphicalObject_getBoundingBox (GraphicalObject_t *go);

/*
 * Does nothing. No defaults are defined for GraphicalObject.
 */ 
LIBSBML_EXTERN
void
GraphicalObject_initDefaults (GraphicalObject_t *go);

/*
 * @return a (deep) copy of this GraphicalObject.
 */
LIBSBML_EXTERN
GraphicalObject_t *
GraphicalObject_clone (const GraphicalObject_t *m);


LIBSBML_EXTERN
int
GraphicalObject_isSetId (const GraphicalObject_t *go);

LIBSBML_EXTERN
const char *
GraphicalObject_getId (const GraphicalObject_t *go);


LIBSBML_EXTERN
int
GraphicalObject_setId (GraphicalObject_t *go, const char *sid);


LIBSBML_EXTERN
void
GraphicalObject_unsetId (GraphicalObject_t *go);


END_C_DECLS
LIBSBML_CPP_NAMESPACE_END

#endif  /* !SWIG */
#endif  /* GraphicalObject_H__ */
