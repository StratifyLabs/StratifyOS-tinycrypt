#ifndef TINYCRYPT_API_H
#define TINYCRYPT_API_H

#include <mcu/types.h>
#include <sos/api/crypt_api.h>

#if defined __cplusplus
extern "C" {
#endif


#if defined __link
#define CORRECT_API_REQUEST &correct_api
#else
enum {
	CORRECT_API_REQUEST = MCU_API_REQUEST_CODE('f','e','c','c')
};
#endif

#if defined __cplusplus
}
#endif


#endif // TINYCRYPT_API_H
