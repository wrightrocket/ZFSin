#!/usr/bin/env ksh -p
#
# CDDL HEADER START
#
# The contents of this file are subject to the terms of the
# Common Development and Distribution License (the "License").
# You may not use this file except in compliance with the License.
#
# You can obtain a copy of the license at usr/src/OPENSOLARIS.LICENSE
# or http://www.opensolaris.org/os/licensing.
# See the License for the specific language governing permissions
# and limitations under the License.
#
# When distributing Covered Code, include this CDDL HEADER in each
# file and include the License file at usr/src/OPENSOLARIS.LICENSE.
# If applicable, add the following below this CDDL HEADER, with the
# fields enclosed by brackets "[]" replaced with your own identifying
# information: Portions Copyright [yyyy] [name of copyright owner]
#
# CDDL HEADER END
#

#
# Copyright 2007 Sun Microsystems, Inc.  All rights reserved.
# Use is subject to license terms.
#

#
# Copyright (c) 2012 by Delphix. All rights reserved.
#

. $STF_SUITE/include/libtest.shlib
. $STF_SUITE/tests/functional/cli_root/zpool_upgrade/zpool_upgrade.cfg

#
# DESCRIPTION:
# Attempting to upgrade a non-existent pool will return an error
#
# STRATEGY:
# 1. Verify a pool doesn't exist, then try to upgrade it
# 2. Verify a 0 exit status
#

log_assert "Attempting to upgrade a non-existent pool will return an error"
NO_POOL=notapool
FOUND=""

while [ -z "$FOUND" ]
do
   $ZPOOL list $NO_POOL 2>&1 > /dev/null
   if [ $? -ne 0 ]
   then
      FOUND="true"
      log_mustnot $ZPOOL upgrade $NO_POOL
   else
      NO_POOL="${NO_POOL}x"
   fi
done

log_pass "Attempting to upgrade a non-existent pool will return an error"
