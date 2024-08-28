#!/bin/bash
# ********************************************************************
# Name    : postinstall
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
# This is a postinstall script used to install visibroker and assign
# appropriate permissions to directories.
#
# Usage   :
#           There are no parameters for this script
#
# ********************************************************************
USER_INSTALL_DIR=/opt/MicroFocus/VisiBroker

LOGGER=/bin/logger
LOG_TAG=VISIBROKER
CP=/bin/cp
CHMOD=/bin/chmod
CHOWN=/bin/chown
RM=/bin/rm

#Invoke the silent installation process
#<installer_file> -f <path to properties file>

$USER_INSTALL_DIR/visibroker-8.5-dist-bin-8.5-x64.bin -f /opt/MicroFocus/VisiBroker/visinamingproperties.txt
${LOGGER} -t  ${LOG_TAG} -p user.notice "INFORMATION : Visibroker Installed successfully"

#Copy 8.5 SP3 HF3 jars
${CP} $USER_INSTALL_DIR/visibroker-8.5-sp3-hf3/lib/* $USER_INSTALL_DIR/lib/

#Copy 8.5 SP3 HF4 jars
${CP} $USER_INSTALL_DIR/visibroker-8.5-sp3-hf4/lib/* $USER_INSTALL_DIR/lib/

#Copy 8.5 SP3 HF7 jars
${CP} $USER_INSTALL_DIR/visibroker-8.5-sp3-hf7/bin/* $USER_INSTALL_DIR/bin/
${CP} $USER_INSTALL_DIR/visibroker-8.5-sp3-hf7/include/* $USER_INSTALL_DIR/include/
${CP} $USER_INSTALL_DIR/visibroker-8.5-sp3-hf7/lib/* $USER_INSTALL_DIR/lib/

#Copy 8.5 SP4 HF1 jars
${CP} $USER_INSTALL_DIR/visibroker-8.5-sp4-hf1/lib/* $USER_INSTALL_DIR/lib/

#Copy 8.5 SP6 jars
${CP} $USER_INSTALL_DIR/visibroker-8.5-sp6-dist-tar/bin/* $USER_INSTALL_DIR/bin/
${CP} $USER_INSTALL_DIR/visibroker-8.5-sp6-dist-tar/include/* $USER_INSTALL_DIR/include/
${CP} $USER_INSTALL_DIR/visibroker-8.5-sp6-dist-tar/lib/* $USER_INSTALL_DIR/lib/

#Copy 8.5 SP6 HF1 jars
${CP} $USER_INSTALL_DIR/visibroker-8.5-sp6-hf1/lib/* $USER_INSTALL_DIR/lib/

#Copy 8.5 SP6 HF2 jars
${CP} $USER_INSTALL_DIR/visibroker-8.5-sp6-hf2/lib/* $USER_INSTALL_DIR/lib/

#Copy 8.5 SP8 jars
${CP} $USER_INSTALL_DIR/visibroker-8.5-sp8-dist-tar/bin/* $USER_INSTALL_DIR/bin/
${CP} $USER_INSTALL_DIR/visibroker-8.5-sp8-dist-tar/include/* $USER_INSTALL_DIR/include/
${CP} $USER_INSTALL_DIR/visibroker-8.5-sp8-dist-tar/lib/* $USER_INSTALL_DIR/lib/

#removed dom4j jar for CVE
${RM} $USER_INSTALL_DIR/lib/dom4j.jar

${CHOWN} -R visibroker:205 /opt/MicroFocus
${CHMOD} -R 770 /opt/MicroFocus/

${CHOWN} -R visibroker:205 /opt/MicroFocus/VisiBroker
${CHMOD} -R 770 /opt/MicroFocus/VisiBroker