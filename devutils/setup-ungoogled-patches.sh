#!/bin/bash

# This script will setup Ungoogled-chromium patches.
rm -rf ungoogled-patches && mkdir ungoogled-patches
cp -r ungoogled-chromium/patches/* ungoogled-patches
for i in $(ls ungoogled-patches/**/**/*.patch)
#for f in 'ungoogled-patches/**/*.patch'
do
  cp $i $i.orig
done
