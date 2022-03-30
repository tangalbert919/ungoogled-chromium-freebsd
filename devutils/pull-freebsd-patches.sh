#!/bin/bash

FREEBSD_HASH=$(grep 'FREEBSD_HASH=\t*' Makefile | sed 's/FREEBSD_HASH=\t//')
#echo $FREEBSD_HASH
# Clear out the current set of patches so we can download the new set.
rm -rf freebsd-patches
# Download the new set of FreeBSD patches.
curl -o freebsd-ports-$FREEBSD_HASH.tar.gz https://codeload.github.com/freebsd/freebsd-ports/tar.gz/$FREEBSD_HASH
tar -xvf freebsd-ports-$FREEBSD_HASH.tar.gz freebsd-ports-$FREEBSD_HASH/www/chromium --strip-components=1
mv www freebsd-patches
