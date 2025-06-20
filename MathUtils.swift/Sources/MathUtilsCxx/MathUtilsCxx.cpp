//
//  MathUtilsCxx.cpp
//  MathUtils.swift
//
//  Created by Larry Zeng on 6/19/25.
//

#include "MathUtilsCxx.hpp"

std::vector<bool> batchEven(int* arr, int size) {
    std::vector<bool> results;
    results.reserve(size);
    
    for (int i = 0; i < size; ++i) {
        bool even = isEven(arr[i]);
        results.push_back(even);
    }

    return results;
}
