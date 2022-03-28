#!/bin/bash

# This script will apply all BSD patches.
echo "Applying BSD patches. None of them should fail."
for i in $(ls files/patch-*)
do
  #patch -d build/src -Np0 -i ../../$i --dry-run | grep FAILED
  patch -d build/src -Np0 -i ../../$i | grep rejects
done
