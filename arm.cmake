# Linking with the kernel
set(SOS_CONFIG release)
set(SOS_OPTION kernel)
include(${SOS_TOOLCHAIN_CMAKE_PATH}/sos-lib-std.cmake)

set(SOS_CONFIG debug)
include(${SOS_TOOLCHAIN_CMAKE_PATH}/sos-lib-std.cmake)

# Link within an app
set(SOS_OPTION "")
set(SOS_CONFIG release)
set(SOS_BUILD_FLAGS -mlong-calls)
#include(${SOS_TOOLCHAIN_CMAKE_PATH}/sos-lib-std.cmake)


