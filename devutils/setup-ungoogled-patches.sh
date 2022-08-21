#!/bin/bash

# This script will setup Ungoogled-chromium patches.
CHROMIUM_VERSION=$(grep 'PORTVERSION=\t*' Makefile | sed 's/PORTVERSION=\t//')
UG_REVISION=$(grep 'UG_REVISION=\t*' Makefile | sed 's/UG_REVISION=\t//')
# Clear out the current set of ungoogled-chromium patches.
rm -rf ungoogled-patches
# Download the new set of ungoogled-chromium patches.
curl -o ungoogled-chromium-$CHROMIUM_VERSION-$UG_REVISION.tar.gz https://codeload.github.com/ungoogled-software/ungoogled-chromium/tar.gz/$CHROMIUM_VERSION-$UG_REVISION
tar -xf ungoogled-chromium-$CHROMIUM_VERSION-$UG_REVISION.tar.gz ungoogled-chromium-$CHROMIUM_VERSION-$UG_REVISION/patches --strip-components=1
mv patches ungoogled-patches
for i in $(ls ungoogled-patches/**/**/*.patch)
#for f in 'ungoogled-patches/**/*.patch'
do
  cp $i $i.orig
done
