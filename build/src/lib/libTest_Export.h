
#ifndef libTest_EXPORT_H
#define libTest_EXPORT_H

#ifdef LIBTEST_STATIC_DEFINE
#  define libTest_EXPORT
#  define LIBTEST_NO_EXPORT
#else
#  ifndef libTest_EXPORT
#    ifdef libTest_EXPORTS
        /* We are building this library */
#      define libTest_EXPORT __attribute__((visibility("default")))
#    else
        /* We are using this library */
#      define libTest_EXPORT __attribute__((visibility("default")))
#    endif
#  endif

#  ifndef LIBTEST_NO_EXPORT
#    define LIBTEST_NO_EXPORT __attribute__((visibility("hidden")))
#  endif
#endif

#ifndef LIBTEST_DEPRECATED
#  define LIBTEST_DEPRECATED __attribute__ ((__deprecated__))
#  define LIBTEST_DEPRECATED_EXPORT libTest_EXPORT __attribute__ ((__deprecated__))
#  define LIBTEST_DEPRECATED_NO_EXPORT LIBTEST_NO_EXPORT __attribute__ ((__deprecated__))
#endif

#define DEFINE_NO_DEPRECATED 0
#if DEFINE_NO_DEPRECATED
# define LIBTEST_NO_DEPRECATED
#endif

#endif
