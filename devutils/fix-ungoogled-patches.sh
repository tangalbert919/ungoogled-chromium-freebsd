#!/bin/bash

# This script will fix the ungoogled-chromium patches so they apply cleanly
# on top of the files with FreeBSD patches already applied.
# Run this after setup-ungoogled-patches.sh.
echo "Applying patches to ungoogled-chromium patches. None of them should fail."
for i in $(ls freebsd-patches/*)
do
	patch -d ungoogled-patches -Np0 -i ../$i | grep rejects
done
