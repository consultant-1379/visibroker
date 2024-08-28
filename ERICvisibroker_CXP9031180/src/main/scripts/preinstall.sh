#!/bin/bash
# ********************************************************************
# Name    : preinstall
# ********************************************************************
#
# (c) Ericsson Radio Systems AB 2016 - All rights reserved.
#
# The copyright to the computer program(s) herein is the property
# of Ericsson Radio Systems AB, Sweden. The programs may be used
# and/or copied only with the written permission from Ericsson Radio
# Systems AB or in accordance with the terms and conditions stipulated
# in the agreement/contract under which the program(s) have been
# supplied.
# ********************************************************************
#
# This is a preinstall script used to setup visibroker user and group. This can
# be considered technical debt as user and group should be set up in the
# JBOSS Image.
#
# Usage   :
#           There are no parameters for this script
#
# ********************************************************************

# ********************************************************************
#
#   variable Section
#
# ********************************************************************

declare VISIBROKERUSER=visibroker
declare VISIBROKERGROUP=205
declare LOG_TAG="VISIBROKER"

# ********************************************************************
#
#   Command Section
#
# ********************************************************************
LOGGER=/bin/logger
USERADD=/usr/sbin/useradd

# ***********************************************************************
#
#         Configuration Section and Global Variables
#
# ***********************************************************************
SCRIPT_NAME="${0}"

# ***********************************************************************
#
#                             Functions
#
# ***********************************************************************

### Function: configureVISIBROKERUSER ###
#
# Add user VISIBROKERUSER as part of this RPM installation.
#
# Arguments     : None
#
# Return Values : 0 successful, 1 otherwise
#
# Global Variables:
#   VISIBROKERUSER
#   VISIBROKERGROUP
#*******************************
function configureVisibrokerUser() {

    local retVal=0
	
	${USERADD} -g ${VISIBROKERGROUP} -u 502 ${VISIBROKERUSER} > /dev/null 2>&1
	retVal=$?
	
	case  $retVal in
	
	0)
		${LOGGER} -t  ${LOG_TAG} -p auth.info "( ${SCRIPT_NAME} ) : User ${VISIBROKERUSER} with uid 502 and gid  ${VISIBROKERGROUP} created successfully"
		;;
	*)
		${LOGGER} -t ${LOG_TAG} -p auth.error "( ${SCRIPT_NAME} ): Unable to add user ${VISIBROKERUSER}"
		return 1
		;;
		
	esac
	
    return 0
}

# ***********************************************************************
#
#                    Main body of program
#
# ***********************************************************************

#**************************
#   Step 1
#**************************
    configureVisibrokerUser || exit 1
    exit 0
