#!/bin/bash

#
# Post-fakeroot script for buildroot
#

CURR_DIR=$(dirname "$BASH_SOURCE")

# Source post-build files from post-fakeroot.d
for i in ${CURR_DIR}/post-fakeroot.d/*.sh ; do
  if [ -r "$i" ]; then
    . $i
  fi
done
unset i
