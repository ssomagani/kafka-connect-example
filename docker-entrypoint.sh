#!/bin/bash

############################################################################################
# This file is part of VoltDB.
# Copyright (C) 2008-2019 VoltDB Inc.
#
# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU Affero General Public License as
# published by the Free Software Foundation, either version 3 of the
# License, or (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU Affero General Public License for more details.
#
# You should have received a copy of the GNU Affero General Public License
# along with VoltDB.  If not, see <http://www.gnu.org/licenses/>.
############################################################################################

set -e

function init() {
    if [ -f  ${CUSTOM_CONFIG} ]; then
        DEPLOYMENT=${CUSTOM_CONFIG}
    else
        DEPLOYMENT=${DEFAULT_DEPLOYMENT}
    fi

#    INIT_OPTIONS="-C ${DEPLOYMENT} -D ${DIRECTORY_SPEC}"
    INIT_OPTIONS="-C /tmp/deployment.xml -l /tmp/license.xml"
    echo "Run voltdb init $INIT_OPTIONS"
    voltdb init ${INIT_OPTIONS}
}

function execVoltdbStart() {
 
    echo "Run voltdb start "
    exec voltdb start 
#    echo "Started Volt process in the background"
#    sleep 10
#    exec sqlcmd < init.ddl
#    jobs -l
#    fg %1
}

if [ ! -f ${DIRECTORY_SPEC}/voltdbroot/.initialized ]; then
    init
fi

execVoltdbStart

#exec "$@ $OPTIONS"
