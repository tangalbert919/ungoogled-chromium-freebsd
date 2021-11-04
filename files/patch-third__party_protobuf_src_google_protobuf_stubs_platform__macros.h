--- third_party/protobuf/src/google/protobuf/stubs/platform_macros.h.orig	2021-04-14 18:41:35 UTC
+++ third_party/protobuf/src/google/protobuf/stubs/platform_macros.h
@@ -118,7 +118,7 @@ GOOGLE_PROTOBUF_PLATFORM_ERROR
 
 #undef GOOGLE_PROTOBUF_PLATFORM_ERROR
 
-#if defined(GOOGLE_PROTOBUF_OS_ANDROID) || defined(GOOGLE_PROTOBUF_OS_IPHONE) || defined(__OpenBSD__)
+#if defined(GOOGLE_PROTOBUF_OS_ANDROID) || defined(GOOGLE_PROTOBUF_OS_IPHONE) || defined(__FreeBSD__)
 // Android ndk does not support the __thread keyword very well yet. Here
 // we use pthread_key_create()/pthread_getspecific()/... methods for
 // TLS support on android.
