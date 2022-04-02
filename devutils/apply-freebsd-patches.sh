#!/bin/bash

# This script will apply all BSD patches.
# We need to use dos2unix first. One of the patches we have requires it.
echo "Applying BSD patches. None of them should fail."
for i in $(ls freebsd-patches/chromium/files/patch-*)
do
  #patch -d build/src -Np0 -i ../../$i --dry-run | grep FAILED
  patch -d build/src -Np0 -i ../../$i | grep rejects
done
