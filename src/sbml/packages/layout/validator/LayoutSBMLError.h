/**
 * @file   LayoutSBMLError.h
 * @brief  Implementation of the LayoutSBMLError class
 * @author Generated by autocreate code
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

#ifndef LayoutSBMLError_H__
#define LayoutSBMLError_H__



LIBSBML_CPP_NAMESPACE_BEGIN

BEGIN_C_DECLS


/**
 * @enum LayoutSBMLErrorCode_t
 * Codes for all SBML-level errors and warnings from the 'layout' package.
 *
 * These are distinguished from other SBML error codes 
 * by having a number between 6000000 and 6099999.  
 * 
 * @copydetails doc_sbml_error_code_ranges
 */
typedef enum
{
    LayoutUnknownError                      = 6010100 /*!< Unknown error from layout */
  , LayoutNSUndeclared                      = 6010101 /*!< The layout ns is not correctly declared */
  , LayoutElementNotInNs                    = 6010102 /*!< Element not in layout namespace */
  , LayoutDuplicateComponentId              = 6010301 /*!< Duplicate 'id' attribute value */
  , LayoutSIdSyntax                         = 6010302 /*!< 'id' attribute incorrect syntax */
  , LayoutXsiTypeAllowedLocations           = 6010401 /*!< 'xsi:type' allowed locations */
  , LayoutXsiTypeSyntax                     = 6010402 /*!< 'xsi:type' attribute incorrect syntax */
  , LayoutAttributeRequiredMissing          = 6020101 /*!< Required layout:required attribute on <code>&lt;sbml&gt;</code> */
  , LayoutAttributeRequiredMustBeBoolean    = 6020102 /*!< The layout:required attribute must be Boolean */
  , LayoutRequiredFalse                     = 6020103 /*!< The layout:required attribute must be 'false' */
  , LayoutOnlyOneLOLayouts                  = 6020201 /*!< Only one listOfLayouts on <code>&lt;model&gt;</code> */
  , LayoutLOLayoutsNotEmpty                 = 6020202 /*!< ListOf elements cannot be empty */
  , LayoutLOLayoutsAllowedElements          = 6020203 /*!< Allowed elements on ListOfLayouts */
  , LayoutLOLayoutsAllowedAttributes        = 6020204 /*!< Allowed attributes on ListOfLayouts */
  , LayoutLayoutAllowedElements             = 6020301 /*!< Allowed elements on Layout */
  , LayoutLayoutAllowedCoreAttributes       = 6020302 /*!< Allowed core attributes on Layout */
  , LayoutOnlyOneEachListOf                 = 6020303 /*!< Only one each listOf on <code>&lt;layout&gt;</code> */
  , LayoutNoEmptyListOfs                    = 6020304 /*!< ListOf elements cannot be empty */
  , LayoutLayoutAllowedAttributes           = 6020305 /*!< <code>&lt;layout&gt;</code> must have 'id' and may have 'name' */
  , LayoutLayoutNameMustBeString            = 6020306 /*!< 'name' must be string */
  , LayoutLOCompGlyphAllowedAttributes      = 6020307 /*!< Attributes allowed on <code>&lt;listOfCompartmentGlyphs&gt;</code>. */
  , LayoutLOCompGlyphAllowedElements        = 6020308 /*!< Elements allowed on <code>&lt;listOfCompartmentGlyphs&gt;</code>. */
  , LayoutLOSpeciesGlyphAllowedAttributes   = 6020309 /*!< Attributes allowed on <code>&lt;listOfSpeciesGlyphs&gt;</code>. */
  , LayoutLOSpeciesGlyphAllowedElements     = 6020310 /*!< Elements allowed on <code>&lt;listOfSpeciesGlyphs&gt;</code>. */
  , LayoutLORnGlyphAllowedAttributes        = 6020311 /*!< Attributes allowed on <code>&lt;listOfReactionGlyphs&gt;</code>. */
  , LayoutLORnGlyphAllowedElements          = 6020312 /*!< Elements allowed on <code>&lt;listOfReactionGlyphs&gt;</code>. */
  , LayoutLOAddGOAllowedAttribut            = 6020313 /*!< Attributes allowed on <code>&lt;listOfAdditionalGraphicalObjectGlyphs&gt;</code>. */
  , LayoutLOAddGOAllowedElements            = 6020314 /*!< Elements allowed on <code>&lt;listOfAdditionalGraphicalObjectGlyphs&gt;</code>. */
  , LayoutLayoutMustHaveDimensions          = 6020315 /*!< Layout must have <code>&lt;dimensions&gt;</code>. */
  , LayoutLOTextGlyphAllowedAttributes      = 6020316 /*!< Attributes allowed on <code>&lt;listOfTextGlyphs&gt;</code>. */
  , LayoutLOTextGlyphAllowedElements        = 6020317 /*!< Elements allowed on <code>&lt;listOfTextGlyphs&gt;</code>. */
  , LayoutGOAllowedCoreElements             = 6020401 /*!< Core elements allowed on <code>&lt;graphicalObject&gt;</code>. */
  , LayoutGOAllowedCoreAttributes           = 6020402 /*!< Core attributes allowed on <code>&lt;graphicalObject&gt;</code>. */
  , LayoutGOAllowedElements                 = 6020403 /*!< Layout elements allowed on <code>&lt;graphicalObject&gt;</code>. */
  , LayoutGOAllowedAttributes               = 6020404 /*!< Layout attributes allowed on <code>&lt;graphicalObject&gt;</code>. */
  , LayoutGOMetaIdRefMustBeIDREF            = 6020405 /*!< Layout 'metaidRef' must be IDREF. */
  , LayoutGOMetaIdRefMustReferenceObject    = 6020406 /*!< Layout 'metaidRef' must reference existing object. */
  , LayoutGOMustContainBoundingBox          = 6020407 /*!< A <code>&lt;graphicalObject&gt;</code> must contain a <code>&lt;boundingBox&gt;</code>. */
  , LayoutCGAllowedCoreElements             = 6020501 /*!< Core elements allowed on <code>&lt;compartmentGlyph&gt;</code>. */
  , LayoutCGAllowedCoreAttributes           = 6020502 /*!< Core attributes allowed on <code>&lt;compartmentGlyph&gt;</code>. */
  , LayoutCGAllowedElements                 = 6020503 /*!< Layout elements allowed on <code>&lt;compartmentGlyph&gt;</code>. */
  , LayoutCGAllowedAttributes               = 6020504 /*!< Layout attributes allowed on <code>&lt;compartmentGlyph&gt;</code>. */
  , LayoutCGMetaIdRefMustBeIDREF            = 6020505 /*!< Layout 'metaidRef' must be IDREF. */
  , LayoutCGMetaIdRefMustReferenceObject    = 6020506 /*!< Layout 'metaidRef' must reference existing object. */
  , LayoutCGCompartmentSyntax               = 6020507 /*!< CompartmentGlyph 'compartment' must have SIdRef syntax. */
  , LayoutCGCompartmentMustRefComp          = 6020508 /*!< CompartmentGlyph compartment must reference existing compartment. */
  , LayoutCGNoDuplicateReferences           = 6020509 /*!< CompartmentGlyph cannot reference two objects. */
  , LayoutCGOrderMustBeDouble               = 6020510 /*!< CompartmentGlyph order must be double. */
  , LayoutSGAllowedCoreElements             = 6020601 /*!< Core elements allowed on <code>&lt;speciesGlyph&gt;</code>. */
  , LayoutSGAllowedCoreAttributes           = 6020602 /*!< Core attributes allowed on <code>&lt;speciesGlyph&gt;</code>. */
  , LayoutSGAllowedElements                 = 6020603 /*!< Layout elements allowed on <code>&lt;speciesGlyph&gt;</code>. */
  , LayoutSGAllowedAttributes               = 6020604 /*!< Layout attributes allowed on <code>&lt;speciesGlyph&gt;</code>. */
  , LayoutSGMetaIdRefMustBeIDREF            = 6020605 /*!< Layout 'metaidRef' must be IDREF. */
  , LayoutSGMetaIdRefMustReferenceObject    = 6020606 /*!< Layout 'metaidRef' must reference existing object. */
  , LayoutSGSpeciesSyntax                   = 6020607 /*!< SpeciesGlyph 'species' must have SIdRef syntax. */
  , LayoutSGSpeciesMustRefSpecies           = 6020608 /*!< SpeciesGlyph species must reference existing species. */
  , LayoutSGNoDuplicateReferences           = 6020609 /*!< SpeciesGlyph cannot reference two objects. */
  , LayoutRGAllowedCoreElements             = 6020701 /*!< Core elements allowed on <code>&lt;reactionGlyph&gt;</code>. */
  , LayoutRGAllowedCoreAttributes           = 6020702 /*!< Core attributes allowed on <code>&lt;reactionGlyph&gt;</code>. */
  , LayoutRGAllowedElements                 = 6020703 /*!< Layout elements allowed on <code>&lt;reactionGlyph&gt;</code>. */
  , LayoutRGAllowedAttributes               = 6020704 /*!< Layout attributes allowed on <code>&lt;reactionGlyph&gt;</code>. */
  , LayoutRGMetaIdRefMustBeIDREF            = 6020705 /*!< Layout 'metaidRef' must be IDREF. */
  , LayoutRGMetaIdRefMustReferenceObject    = 6020706 /*!< Layout 'metaidRef' must reference existing object. */
  , LayoutRGReactionSyntax                  = 6020707 /*!< ReactionGlyph 'reaction' must have SIdRef syntax. */
  , LayoutRGReactionMustRefReaction         = 6020708 /*!< ReactionGlyph reaction must reference existing reaction. */
  , LayoutRGNoDuplicateReferences           = 6020709 /*!< ReactionGlyph cannot reference two objects. */
  , LayoutLOSpeciesRefGlyphAllowedElements  = 6020710 /*!< Allowed elements on ListOfSpeciesReferenceGlyphs */
  , LayoutLOSpeciesRefGlyphAllowedAttribs   = 6020711 /*!< Allowed attributes on ListOfSpeciesReferenceGlyphs */
  , LayoutLOSpeciesRefGlyphNotEmpty         = 6020712 /*!< ListOfSpeciesReferenceGlyphs not empty */
  , LayoutGGAllowedCoreElements             = 6020801 /*!< Core elements allowed on <code>&lt;generalGlyph&gt;</code>. */
  , LayoutGGAllowedCoreAttributes           = 6020802 /*!< Core attributes allowed on <code>&lt;generalGlyph&gt;</code>. */
  , LayoutGGAllowedElements                 = 6020803 /*!< Layout elements allowed on <code>&lt;generalGlyph&gt;</code>. */
  , LayoutGGAllowedAttributes               = 6020804 /*!< Layout attributes allowed on <code>&lt;generalGlyph&gt;</code>. */
  , LayoutGGMetaIdRefMustBeIDREF            = 6020805 /*!< Layout 'metaidRef' must be IDREF. */
  , LayoutGGMetaIdRefMustReferenceObject    = 6020806 /*!< Layout 'metaidRef' must reference existing object. */
  , LayoutGGReferenceSyntax                 = 6020807 /*!< GeneralGlyph 'reference' must have SIdRef syntax. */
  , LayoutGGReferenceMustRefObject          = 6020808 /*!< GeneralGlyph 'reference' must reference existing element. */
  , LayoutGGNoDuplicateReferences           = 6020809 /*!< GeneralGlyph cannot reference two objects. */
  , LayoutLOReferenceGlyphAllowedElements   = 6020810 /*!< Allowed elements on ListOfReferenceGlyphs */
  , LayoutLOReferenceGlyphAllowedAttribs    = 6020811 /*!< Allowed attributes on ListOfReferenceGlyphs */
  , LayoutLOSubGlyphAllowedElements         = 6020812 /*!< Allowed elements on ListOfSubGlyphs */
  , LayoutLOSubGlyphAllowedAttribs          = 6020813 /*!< Allowed attributes on ListOfSubGlyphs */
  , LayoutTGAllowedCoreElements             = 6020901 /*!< Core elements allowed on <code>&lt;textGlyph&gt;</code>. */
  , LayoutTGAllowedCoreAttributes           = 6020902 /*!< Core attributes allowed on <code>&lt;textGlyph&gt;</code>. */
  , LayoutTGAllowedElements                 = 6020903 /*!< Layout elements allowed on <code>&lt;textGlyph&gt;</code>. */
  , LayoutTGAllowedAttributes               = 6020904 /*!< Layout attributes allowed on <code>&lt;textGlyph&gt;</code>. */
  , LayoutTGMetaIdRefMustBeIDREF            = 6020905 /*!< Layout 'metaidRef' must be IDREF. */
  , LayoutTGMetaIdRefMustReferenceObject    = 6020906 /*!< Layout 'metaidRef' must reference existing object. */
  , LayoutTGOriginOfTextSyntax              = 6020907 /*!< TextGlyph 'originOfText' must have SIdRef syntax. */
  , LayoutTGOriginOfTextMustRefObject       = 6020908 /*!< TextGlyph 'originOfText' must reference existing element. */
  , LayoutTGNoDuplicateReferences           = 6020909 /*!< TextGlyph cannot reference two objects. */
  , LayoutTGGraphicalObjectSyntax           = 6020910 /*!< TextGlyph 'graphicalObject' must have SIdRef syntax. */
  , LayoutTGGraphicalObjectMustRefObject    = 6020911 /*!< TextGlyph 'graphicalObject' must reference existing element. */
  , LayoutTGTextMustBeString                = 6020912 /*!< TextGlyph 'text' must be string. */
  , LayoutSRGAllowedCoreElements            = 6021001 /*!< Core elements allowed on <code>&lt;speciesReferenceGlyph&gt;</code>. */
  , LayoutSRGAllowedCoreAttributes          = 6021002 /*!< Core attributes allowed on <code>&lt;speciesReferenceGlyph&gt;</code>. */
  , LayoutSRGAllowedElements                = 6021003 /*!< Layout elements allowed on <code>&lt;speciesReferenceGlyph&gt;</code>. */
  , LayoutSRGAllowedAttributes              = 6021004 /*!< Layout attributes allowed on <code>&lt;speciesReferenceGlyph&gt;</code>. */
  , LayoutSRGMetaIdRefMustBeIDREF           = 6021005 /*!< Layout 'metaidRef' must be IDREF. */
  , LayoutSRGMetaIdRefMustReferenceObject   = 6021006 /*!< Layout 'metaidRef' must reference existing object. */
  , LayoutSRGSpeciesReferenceSyntax         = 6021007 /*!< SpeciesReferenceGlyph 'speciesReference' must have SIdRef syntax. */
  , LayoutSRGSpeciesRefMustRefObject        = 6021008 /*!< SpeciesReferenceGlyph 'speciesReference' must reference existing element. */
  , LayoutSRGNoDuplicateReferences          = 6021009 /*!< SpeciesReferenceGlyph cannot reference two objects. */
  , LayoutSRGSpeciesGlyphSyntax             = 6021010 /*!< SpeciesReferenceGlyph 'speciesGlyph' must have SIdRef syntax. */
  , LayoutSRGSpeciesGlyphMustRefObject      = 6021011 /*!< SpeciesReferenceGlyph 'speciesGlyph' must reference existing element. */
  , LayoutSRGRoleSyntax                     = 6021012 /*!< SpeciesReferenceGlyph 'role' must be string from enumeration. */
  , LayoutREFGAllowedCoreElements           = 6021101 /*!< Core elements allowed on <code>&lt;referenceGlyph&gt;</code>. */
  , LayoutREFGAllowedCoreAttributes         = 6021102 /*!< Core attributes allowed on <code>&lt;referenceGlyph&gt;</code>. */
  , LayoutREFGAllowedElements               = 6021103 /*!< Layout elements allowed on <code>&lt;referenceGlyph&gt;</code>. */
  , LayoutREFGAllowedAttributes             = 6021104 /*!< Layout attributes allowed on <code>&lt;referenceGlyph&gt;</code>. */
  , LayoutREFGMetaIdRefMustBeIDREF          = 6021105 /*!< Layout 'metaidRef' must be IDREF. */
  , LayoutREFGMetaIdRefMustReferenceObject  = 6021106 /*!< Layout 'metaidRef' must reference existing object. */
  , LayoutREFGReferenceSyntax               = 6021107 /*!< ReferenceGlyph 'reference' must have SIdRef syntax. */
  , LayoutREFGReferenceMustRefObject        = 6021108 /*!< ReferenceGlyph 'reference' must reference existing element. */
  , LayoutREFGNoDuplicateReferences         = 6021109 /*!< ReferenceGlyph cannot reference two objects. */
  , LayoutREFGGlyphSyntax                   = 6021110 /*!< ReferenceGlyph 'glyph' must have SIdRef syntax. */
  , LayoutREFGGlyphMustRefObject            = 6021111 /*!< ReferenceGlyph 'glyph' must reference existing element. */
  , LayoutREFGRoleSyntax                    = 6021112 /*!< ReferenceGlyph 'role' must be string. */

  , LayoutPointAllowedCoreElements          = 6021201 /*!< Core elements allowed on <code>&lt;point&gt;</code>. */
  , LayoutPointAllowedCoreAttributes        = 6021202 /*!< Core attributes allowed on <code>&lt;point&gt;</code>. */
  , LayoutPointAllowedAttributes            = 6021203 /*!< Layout attributes allowed on <code>&lt;point&gt;</code>. */
  , LayoutPointAttributesMustBeDouble       = 6021204 /*!< Layout 'x', 'y' and 'z' must be double. */

  , LayoutBBoxAllowedCoreElements           = 6021301 /*!< Core elements allowed on <code>&lt;boundingBox&gt;</code>. */
  , LayoutBBoxAllowedCoreAttributes         = 6021302 /*!< Core attributes allowed on <code>&lt;boundingBox&gt;</code>. */
  , LayoutBBoxAllowedElements               = 6021303 /*!< Layout elements allowed on <code>&lt;boundingBox&gt;</code>. */
  , LayoutBBoxAllowedAttributes             = 6021304 /*!< Layout attributes allowed on <code>&lt;boundingBox&gt;</code>. */
  , LayoutBBoxConsistent3DDefinition        = 6021305 /*!< Layout consistent dimensions on a <code>&lt;boundingBox&gt;</code> */

  , LayoutCurveAllowedCoreElements          = 6021401 /*!< Core elements allowed on <code>&lt;curve&gt;</code>. */
  , LayoutCurveAllowedCoreAttributes        = 6021402 /*!< Core attributes allowed on <code>&lt;curve&gt;</code>. */
  , LayoutCurveAllowedElements              = 6021403 /*!< Layout elements allowed on <code>&lt;curve&gt;</code>. */
  , LayoutCurveAllowedAttributes            = 6021404 /*!< Layout attributes allowed on <code>&lt;curve&gt;</code>. */
  , LayoutLOCurveSegsAllowedAttributes      = 6021405 /*!< Allowed attributes on ListOfCurveSegments */
  , LayoutLOCurveSegsAllowedElements        = 6021406 /*!< Allowed elements on ListOfCurveSegments */
  , LayoutLOCurveSegsNotEmpty               = 6021407 /*!< No empty ListOfCurveSegments */

  , LayoutLSegAllowedCoreElements           = 6021501 /*!< Core elements allowed on <code>&lt;lineSegment&gt;</code>. */
  , LayoutLSegAllowedCoreAttributes         = 6021502 /*!< Core attributes allowed on <code>&lt;lineSegment&gt;</code>. */
  , LayoutLSegAllowedElements               = 6021503 /*!< Layout elements allowed on <code>&lt;lineSegment&gt;</code>. */
  , LayoutLSegAllowedAttributes             = 6021504 /*!< Layout attributes allowed on <code>&lt;lineSegment&gt;</code>. */

  , LayoutCBezAllowedCoreElements           = 6021601 /*!< Core elements allowed on <code>&lt;cubicBezier&gt;</code>. */
  , LayoutCBezAllowedCoreAttributes         = 6021602 /*!< Core attributes allowed on <code>&lt;cubicBezier&gt;</code>. */
  , LayoutCBezAllowedElements               = 6021603 /*!< Layout elements allowed on <code>&lt;cubicBezier&gt;</code>. */
  , LayoutCBezAllowedAttributes             = 6021604 /*!< Layout attributes allowed on <code>&lt;cubicBezier&gt;</code>. */

  , LayoutDimsAllowedCoreElements           = 6021701 /*!< Core elements allowed on <code>&lt;dimensions&gt;</code>. */
  , LayoutDimsAllowedCoreAttributes         = 6021702 /*!< Core attributes allowed on <code>&lt;dimensions&gt;</code>. */
  , LayoutDimsAllowedAttributes             = 6021703 /*!< Layout attributes allowed on <code>&lt;dimensions&gt;</code>. */
  , LayoutDimsAttributesMustBeDouble        = 6021704 /*!< Layout 'width', 'height' and 'depth' must be double. */

}  LayoutSBMLErrorCode_t;

END_C_DECLS

LIBSBML_CPP_NAMESPACE_END

#endif  /*  LayoutSBMLError_h__  */
