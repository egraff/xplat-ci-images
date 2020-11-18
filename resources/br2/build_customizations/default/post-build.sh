#!/bin/bash

#
# Post-build script for buildroot
#

CURR_DIR=$(dirname "$BASH_SOURCE")

# Source post-build files from post-build.d
for i in ${CURR_DIR}/post-build.d/*.sh ; do
  if [ -r "$i" ]; then
    . $i
  fi
done
unset i
