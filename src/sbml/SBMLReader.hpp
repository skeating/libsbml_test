/**
 * Filename    : SBMLReader.hpp
 * Description : Reads an SBML Document into memory
 * Author(s)   : SBML Development Group <sysbio-team@caltech.edu>
 * Organization: JST ERATO Kitano Symbiotic Systems Project
 * Created     : 2002-10-15
 * Revision    : $Id$
 * Source      : $Source$
 *
 * Copyright 2002 California Institute of Technology and
 * Japan Science and Technology Corporation.
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
 * California Institute of Technology and Japan Science and Technology
 * Corporation have no obligations to provide maintenance, support,
 * updates, enhancements or modifications.  In no event shall the
 * California Institute of Technology or the Japan Science and Technology
 * Corporation be liable to any party for direct, indirect, special,
 * incidental or consequential damages, including lost profits, arising
 * out of the use of this software and its documentation, even if the
 * California Institute of Technology and/or Japan Science and Technology
 * Corporation have been advised of the possibility of such damage.  See
 * the GNU Lesser General Public License for more details.
 *
 * You should have received a copy of the GNU Lesser General Public License
 * along with this library; if not, write to the Free Software Foundation,
 * Inc., 59 Temple Place, Suite 330, Boston, MA 02111-1307 USA.
 *
 * The original code contained here was initially developed by:
 *
 *     Ben Bornstein
 *     The Systems Biology Markup Language Development Group
 *     ERATO Kitano Symbiotic Systems Project
 *     Control and Dynamical Systems, MC 107-81
 *     California Institute of Technology
 *     Pasadena, CA, 91125, USA
 *
 *     http://www.cds.caltech.edu/erato
 *     mailto:sysbio-team@caltech.edu
 *
 * Contributor(s):
 *   Stefan Hoops
 */


#ifndef SBMLReader_hpp
#define SBMLReader_hpp


#include <string>

#include "extern.h"
#include "SBMLDocument.hpp"
#include "XMLSchemaValidation.h"


class SBMLReader
{
public:

  /**
   * Creates a new SBMLReader and returns it.
   *
   * By default schema validation is off (XML_SCHEMA_VALIDATION_NONE) and
   * schemaFilenames are empty.
   */
  LIBSBML_EXTERN
  SBMLReader (XMLSchemaValidation_t level = XML_SCHEMA_VALIDATION_NONE);

  /**
   * Destorys this SBMLReader.
   */
  LIBSBML_EXTERN
  virtual ~SBMLReader ();


  /**
   * @return the schema filename used by this SBMLReader to validate SBML
   * Level 1 version 1 documents.
   */
  LIBSBML_EXTERN
  const std::string& getSchemaFilenameL1v1 () const;

  /**
   * @return the schema filename used by this SBMLReader to validate SBML
   * Level 1 version 2 documents.
   */
  LIBSBML_EXTERN
  const std::string& getSchemaFilenameL1v2 () const;

  /**
   * @return the schema filename used by this SBMLReader to validate SBML
   * Level 2 version 1 documents.
   */
  LIBSBML_EXTERN
  const std::string& getSchemaFilenameL2v1 () const;

  /**
   * Sets the schema validation level used by this SBMLReader.
   */
  LIBSBML_EXTERN
  XMLSchemaValidation_t getSchemaValidationLevel() const;

  /**
   * Reads the SBML document from the given file and returns a pointer to
   * it.
   */
  LIBSBML_EXTERN
  SBMLDocument* readSBML (const std::string& filename);

  /**
   * Reads the SBML document from the given XML string and returns a
   * pointer to it.
   *
   * The XML string must be complete and legal XML document.  Among other
   * things, it must start with an XML processing instruction.  For e.g.,:
   *
   *   <?xml version='1.0' encoding='UTF-8'?>
   */
  LIBSBML_EXTERN
  SBMLDocument* readSBMLFromString (const std::string& xml);

  /**
   * Sets the schema filename used by this SBMLReader to validate SBML
   * Level 1 version 1 documents.
   *
   * The filename should be either i) an absolute path or ii) relative to
   * the directory contain the SBML file(s) to be read.
   */
  LIBSBML_EXTERN
  void setSchemaFilenameL1v1 (const std::string& filename);

  /**
   * Sets the schema filename used by this SBMLReader to validate SBML
   * Level 1 version 2 documents.
   *
   * The filename should be either i) an absolute path or ii) relative to
   * the directory contain the SBML file(s) to be read.
   */
  LIBSBML_EXTERN
  void setSchemaFilenameL1v2 (const std::string& filename);

  /**
   * Sets the schema filename used by this SBMLReader to validate SBML Level
   * 2 version 1 documents.
   *
   * The filename should be either i) an absolute path or ii) relative to the
   * directory contain the SBML file(s) to be read.
   */
  LIBSBML_EXTERN
  void setSchemaFilenameL2v1 (const std::string& filename);

  /**
   * Sets the schema validation level used by this SBMLReader.
   *
   * The levels are:
   *
   *   XML_SCHEMA_VALIDATION_NONE (0) turns schema validation off.
   *
   *   XML_SCHEMA_VALIDATION_BASIC (1) validates an XML instance document
   *   against an XML Schema.  Those who wish to perform schema checking on
   *   SBML documents should use this option.
   *
   *   XML_SCHEMA_VALIDATION_FULL (2) validates both the instance document
   *   itself *and* the XML Schema document.  The XML Schema document is
   *   checked for violation of particle unique attribution constraints and
   *   particle derivation restrictions, which is both time-consuming and
   *   memory intensive.
   */
  LIBSBML_EXTERN
  void setSchemaValidationLevel (XMLSchemaValidation_t level);


protected:

  char*          getSchemaLocation (SBMLDocument* d) const;
  SBMLDocument*  readSBML_internal (const char* filename, const char* xml);


  XMLSchemaValidation_t schemaValidationLevel;

  std::string schemaFilenameL1v1;
  std::string schemaFilenameL1v2;
  std::string schemaFilenameL2v1;
};


#endif  // SBMLReader_hpp
