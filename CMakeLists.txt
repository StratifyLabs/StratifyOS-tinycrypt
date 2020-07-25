cmake_minimum_required (VERSION 3.6)

# Grab the SDK location
if(NOT DEFINED SOS_SDK_PATH)
	if(DEFINED ENV{SOS_SDK_PATH})
		set(SOS_SDK_PATH $ENV{SOS_SDK_PATH})
	elseif( ${CMAKE_HOST_SYSTEM_NAME} STREQUAL "Darwin" )
		message(WARNING "default SDK locations are deprecated")
		set(SOS_SDK_PATH /Applications/StratifyLabs-SDK)
	elseif( ${CMAKE_HOST_SYSTEM_NAME} STREQUAL "Windows" )
		message(WARNING "default SDK locations are deprecated")
		set(SOS_SDK_PATH C:/StratifyLabs-SDK)
	elseif( ${CMAKE_HOST_SYSTEM_NAME} STREQUAL "Linux" )
		message(WARNING "default SDK locations are deprecated")
		set(SOS_SDK_PATH /StratifyLabs-SDK)
	endif()
endif()
if(NOT DEFINED SOS_SDK_PATH)
	message(FATAL_ERROR "Please set environment variable SOS_SDK_PATH to location of the StratifyLabs-SDK directory")
endif()
set(SOS_TOOLCHAIN_CMAKE_PATH ${SOS_SDK_PATH}/Tools/gcc/arm-none-eabi/cmake)

include(${SOS_TOOLCHAIN_CMAKE_PATH}/sos-variables.cmake)

if( ${SOS_BUILD_CONFIG} STREQUAL arm )
  message(STATUS "Load SOS Lib Toolchain for arm: " ${SOS_TOOLCHAIN_CMAKE_PATH})
  set(CMAKE_TOOLCHAIN_FILE ${SOS_TOOLCHAIN_CMAKE_PATH}/sos-lib-toolchain.cmake)
elseif( ${SOS_BUILD_CONFIG} STREQUAL link )
  set(CMAKE_TOOLCHAIN_FILE ${SOS_TOOLCHAIN_CMAKE_PATH}/link-toolchain.cmake)
endif()

set(SOS_NAME tinycrypt)
project(${SOS_NAME} CXX C ASM)

set(TINYCRYPT_SOURCE_FOLDER ${CMAKE_SOURCE_DIR}/tinycrypt/lib/source)
set(TINYCRYPT_INCLUDE_FOLDER ${CMAKE_SOURCE_DIR}/tinycrypt/lib/include/tinycrypt)
set(SOS_SOURCELIST
  ${TINYCRYPT_SOURCE_FOLDER}/aes_decrypt.c
  ${TINYCRYPT_SOURCE_FOLDER}/ccm_mode.c 
  ${TINYCRYPT_SOURCE_FOLDER}/ctr_prng.c 
  ${TINYCRYPT_SOURCE_FOLDER}/ecc_dsa.c 
  ${TINYCRYPT_SOURCE_FOLDER}/hmac_prng.c
  ${TINYCRYPT_SOURCE_FOLDER}/aes_encrypt.c 
  ${TINYCRYPT_SOURCE_FOLDER}/cmac_mode.c 
  ${TINYCRYPT_SOURCE_FOLDER}/ecc.c 
  ${TINYCRYPT_SOURCE_FOLDER}/ecc_platform_specific.c	
  ${TINYCRYPT_SOURCE_FOLDER}/sha256.c
  ${TINYCRYPT_SOURCE_FOLDER}/cbc_mode.c 
  ${TINYCRYPT_SOURCE_FOLDER}/ctr_mode.c 
  ${TINYCRYPT_SOURCE_FOLDER}/ecc_dh.c 
  ${TINYCRYPT_SOURCE_FOLDER}/hmac.c 
  ${TINYCRYPT_SOURCE_FOLDER}/utils.c
  ${TINYCRYPT_INCLUDE_FOLDER}/aes.h
  ${TINYCRYPT_INCLUDE_FOLDER}/cbc_mode.h
  ${TINYCRYPT_INCLUDE_FOLDER}/ccm_mode.h
  ${TINYCRYPT_INCLUDE_FOLDER}/cmac_mode.h
  ${TINYCRYPT_INCLUDE_FOLDER}/constants.h
  ${TINYCRYPT_INCLUDE_FOLDER}/ctr_mode.h
  ${TINYCRYPT_INCLUDE_FOLDER}/ctr_prng.h
  ${TINYCRYPT_INCLUDE_FOLDER}/ecc.h
  ${TINYCRYPT_INCLUDE_FOLDER}/ecc_dh.h
  ${TINYCRYPT_INCLUDE_FOLDER}/ecc_dsa.h
  ${TINYCRYPT_INCLUDE_FOLDER}/ecc_platform_specific.h
  ${TINYCRYPT_INCLUDE_FOLDER}/hmac.h
  ${TINYCRYPT_INCLUDE_FOLDER}/hmac_prng.h
  ${TINYCRYPT_INCLUDE_FOLDER}/sha256.h
  ${TINYCRYPT_INCLUDE_FOLDER}/utils.h
)

set(SOS_INCLUDE_DIRECTORIES 
  ${CMAKE_SOURCE_DIR}/tinycrypt/lib/include
)

install(DIRECTORY ${CMAKE_SOURCE_DIR}/tinycrypt/lib/include DESTINATION .)
#install(FILES ${CMAKE_SOURCE_DIR}/tinycrypt_api.h DESTINATION include)

include( ${CMAKE_SOURCE_DIR}/${SOS_BUILD_CONFIG}.cmake )


