//
//  cipher_kit.h
//  MathUtils.swift
//
//  Created by Larry Zeng on 6/21/25.
//

#ifndef cipher_kit_h
#define cipher_kit_h

#include <stdlib.h>
#include <swift/bridging>
#include "lifetimebound.h"

#ifdef __cplusplus
extern "C" {
#endif

unsigned char* xor_cipher(const unsigned char* __counted_by(input_len) input __noescape, size_t input_len,
                          const unsigned char* __counted_by(key_len) key __noescape, size_t key_len,
                          size_t* output_len) SWIFT_NAME(xorCipher(input:inputLength:key:keyLength:outputLength:));

unsigned char* xor_decipher(const unsigned char* __counted_by(input_len) input __noescape, size_t input_len,
                            const unsigned char* __counted_by(key_len) key __noescape, size_t key_len,
                            size_t* output_len) SWIFT_NAME(xorDecipher(input:inputLength:key:keyLength:outputLength:));

#ifdef __cplusplus
}
#endif

#endif /* cipher_kit_h */
