#!/bin/bash

# This script will apply all BSD patches.
# We need to use dos2unix first. One of the patches we have requires it.
dos2unix build/src/third_party/vulkan_memory_allocator/include/vk_mem_alloc.h
echo "Applying BSD patches. None of them should fail."
for i in $(ls files/patch-*)
do
  #patch -d build/src -Np0 -i ../../$i --dry-run | grep FAILED
  patch -d build/src -Np0 -i ../../$i | grep rejects
done
