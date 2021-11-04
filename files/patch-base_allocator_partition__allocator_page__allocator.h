--- base/allocator/partition_allocator/page_allocator.h.orig	2021-10-20 14:19:42.388728000 +0200
+++ base/allocator/partition_allocator/page_allocator.h	2021-10-20 14:19:51.276423000 +0200
@@ -159,7 +159,7 @@
 // Whether decommitted memory is guaranteed to be zeroed when it is
 // recommitted. Do not assume that this will not change over time.
 constexpr BASE_EXPORT bool DecommittedMemoryIsAlwaysZeroed() {
-#if defined(OS_APPLE)
+#if defined(OS_APPLE) || defined(OS_FREEBSD)
   return false;
 #else
   return true;
