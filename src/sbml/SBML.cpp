/**
 * \file    SBML.cpp
 * \brief   SBML utility functions
 * \author  Ben Bornstein
 *
 * $Id$
 * $Source$
 */
/* Copyright 2006 California Institute of Technology and Japan Science and
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


#include <iomanip>
#include <sstream>

#include <sbml/xml/XMLAttributes.h>
#include <sbml/xml/XMLOutputStream.h>
#include <sbml/xml/XMLErrorLog.h>

#include <sbml/SBMLErrorLog.h>

#include "SBML.h"


using namespace std;


/**
 * @return true if sboTerm is in the correct format (a zero-padded, seven
 * digit string preceded by SBO:), false otherwise.
 */
bool
SBML::checkSBOTerm (const string& sboTerm)
{
  unsigned int size = sboTerm.size();
  bool         okay = (size == 11);

  unsigned int sbo[4] = {83, 66, 79, 58};
  unsigned int n = 0;
  while (okay && n < 4)
  {
    okay = (sboTerm[n] == sbo[n]);
    n++;
  }
  
  for (n = 4; okay && n < size; ++n) okay = isdigit(sboTerm[n]);

  return okay;
}


/**
 * @return true if sboTerm is in the range [0 -- 9999999], false
 * otherwise.
 */
bool
SBML::checkSBOTerm (int sboTerm)
{
  return (sboTerm >= 0 && sboTerm <= 9999999);
}


/**
 * Reads (and checks) sboTerm from the given XMLAttributes set.
 *
 * @return the sboTerm as an integer or -1 if the sboTerm was not in the
 * correct format or not found.
 */
int
SBML::readSBOTerm (const XMLAttributes& attributes, SBMLErrorLog* log)
{
  const string msg0906 = "The value of a sboTerm attribute must have the data "
    "type SBOTerm, which is a string consisting of the characters 'S', 'B', "
    "'O', ':' followed by exactly seven digits. (References: L2V2 Section 3.1.8.)";

  int index = attributes.getIndex("sboTerm");
  if (index == -1)
  {
    return -1;
  }
  else if (!checkSBOTerm(attributes.getValue(index)))
  {
    log->add(XMLError(10308, msg0906));
    return -1;
  }
  else
  {
    return sboTermToInt( attributes.getValue(index) );
  }
}


/**
 * Writes sboTerm as an XMLAttribute to the given XMLOutputStream.
 */
void
SBML::writeSBOTerm (XMLOutputStream& stream, int sboTerm)
{
  stream.writeAttribute( "sboTerm", sboTermToString(sboTerm) );
}


/**
 * @return the given string sboTerm as an integer.  If the sboTerm is not
 * in the correct format (a zero-padded, seven digit string), -1 is
 * returned.
 */
int
SBML::sboTermToInt (const string& sboTerm)
{
  int result = -1;

  if ( checkSBOTerm(sboTerm) )
  {
    result  = (sboTerm[10] - 48);
    result += (sboTerm[9] - 48) * 10;
    result += (sboTerm[8] - 48) * 100;
    result += (sboTerm[7] - 48) * 1000;
    result += (sboTerm[6] - 48) * 10000;
    result += (sboTerm[5] - 48) * 100000;
    result += (sboTerm[4] - 48) * 1000000;
  }

  return result;
}


/**
 * @return the given integer sboTerm as a zero-padded seven digit string.
 * If the sboTerm is not in the correct range ([0 -- 9999999]), an empty
 * string is returned.
 */
string
SBML::sboTermToString (int sboTerm)
{
  string result;

  if ( checkSBOTerm(sboTerm) )
  {
    ostringstream stream;
    stream << setw(7) << setfill('0') << sboTerm;
    result = stream.str();
  }

  return result;
}
