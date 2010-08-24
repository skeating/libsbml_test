#!/bin/sh
#
# @file   uninstall-libsbml-pkg.sh
# @brief  This shell script uninstalls the libSBML package for MacOSX.
# @author Akiya Jouraku
#
# $Id$
# $HeadURL$
#
#<!---------------------------------------------------------------------------
# This file is part of libSBML.  Please visit http://sbml.org for more
# information about SBML, and the latest version of libSBML.
#
# Copyright 2005-2010 California Institute of Technology.
# Copyright 2002-2005 California Institute of Technology and
#                     Japan Science and Technology Corporation.
# 
# This library is free software; you can redistribute it and/or modify it
# under the terms of the GNU Lesser General Public License as published by
# the Free Software Foundation.  A copy of the license agreement is provided
# in the file named "LICENSE.txt" included with this software distribution
# and also available online as http://sbml.org/software/libsbml/license.html
#----------------------------------------------------------------------- -->*/

set -e

LSBOM=/usr/bin/lsbom
RECEIPT_LIBSBML=/Library/Receipts/libSBML.pkg
ARCHIVE_LIBSBML=${RECEIPT_LIBSBML}/Contents/Archive.bom
PKGUTIL=/usr/sbin/pkgutil
MYPATH=uninstall-libsbml-pkg.sh
DEBUG=

if [ ${EUID} != 0 ] ; then
  echo "Please run this shell script as the user 'root'."
  exit 1
fi	

OSX_MAJOR_VER=`uname -r | cut -f1 -d'.'`

if expr ${OSX_MAJOR_VER} \>= 10 | grep -q 1; then
  #
  # Snow Leopard
  #
  LIBSBML_PKGID=`${PKGUTIL} --pkgs | grep libsbml`

  if ! (echo "${LIBSBML_PKGID}" | grep -q -i libsbml); then
    echo "libSBML is not installed."
    exit 0
  fi

  for f in `${PKGUTIL} --files ${LIBSBML_PKGID}`; do
    if echo $f | grep -q ${MYPATH} ; then
          MYPATH="/$f"
    elif [ -f "/$f" -o -L "/$f" ]; then
        ${DEBUG} /bin/rm "/$f" && echo "Removed /$f"
    fi
  done

  ${DEBUG} /bin/rm $MYPATH && echo "Removed $MYPATH"

  ${PKGUTIL} --forget ${LIBSBML_PKGID}
else
  #
  # Leopard
  #
  if [ ! -e ${ARCHIVE_LIBSBML} ]; then
    echo "libSBML is not installed."
    exit 0
  fi


  for f in `${LSBOM} -f -l ${ARCHIVE_LIBSBML} | awk '{print $1}' | sed 's/^\.//'`; do
    if echo $f | grep -q ${MYPATH} ; then
      MYPATH=$f 
    elif [ -e $f -o -L $f ]; then
      ${DEBUG} /bin/rm $f && echo "Removed $f"
    fi
  done

  if [ -d ${RECEIPT_LIBSBML} ]; then
    ${DEBUG} /bin/rm -rf ${RECEIPT_LIBSBML} && echo "Removed ${RECEIPT_LIBSBML}"
  fi

  ${DEBUG} /bin/rm $MYPATH && echo "Removed $MYPATH"
fi

echo 
echo Uninstall finished successfully.
