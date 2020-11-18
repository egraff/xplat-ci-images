#!/bin/bash

#
# Post-image script for buildroot
#

CURR_DIR=$(dirname "$BASH_SOURCE")

# Source post-build files from post-image.d
for i in ${CURR_DIR}/post-image.d/*.sh ; do
  if [ -r "$i" ]; then
    . $i
  fi
done
unset i
