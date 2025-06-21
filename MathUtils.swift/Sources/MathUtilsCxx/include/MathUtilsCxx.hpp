//
//  MathUtilsCxx.hpp
//  MathUtils.swift
//
//  Created by Larry Zeng on 6/19/25.
//

#ifndef MathUtilsCxx_hpp
#define MathUtilsCxx_hpp

#include <swift/bridging>
#include <vector>
#include <math_utils.h>

std::vector<bool> batchEven(int* arr, int size) SWIFT_NAME(batchEven(of:size:));

std::vector<uint8_t> additive_encode(const std::vector<uint8_t>& data, uint8_t shift) SWIFT_NAME(additiveEncode(_:shift:));
std::vector<uint8_t> additive_decode(const std::vector<uint8_t>& data, uint8_t shift) SWIFT_NAME(additiveDecode(_:shift:));

#endif /* MathUtilsCxx_hpp */
