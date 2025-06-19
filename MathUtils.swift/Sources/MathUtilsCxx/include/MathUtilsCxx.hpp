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

std::vector<bool> batchEvenOdd(int* arr, int size) SWIFT_NAME(batchEvenOdd(of:size:));

#endif /* MathUtilsCxx_hpp */
