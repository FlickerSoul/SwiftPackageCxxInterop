//
//  cipher_kit.c
//  MathUtils.swift
//
//  Created by Larry Zeng on 6/21/25.
//

#include "cipher_kit.h"

// Encrypts/decrypts data using XOR with a repeating key
unsigned char* xor_cipher(const unsigned char* __counted_by(input_len) input __noescape, size_t input_len,
                          const unsigned char* __counted_by(key_len) key __noescape, size_t key_len,
                          size_t* output_len) {
    if (!input || !key || input_len == 0 || key_len == 0) return NULL;
    
    unsigned char* output = malloc(input_len);
    if (!output) return NULL;
    
    for (size_t i = 0; i < input_len; i++) {
        output[i] = input[i] ^ key[i % key_len];
    }
    
    *output_len = input_len;
    return output;
}

// The inverse is identical - XOR is its own inverse
unsigned char* xor_decipher(const unsigned char* __counted_by(input_len) input __noescape, size_t input_len,
                            const unsigned char* __counted_by(key_len) key __noescape, size_t key_len,
                            size_t* output_len) {
    return xor_cipher(input, input_len, key, key_len, output_len);
}
