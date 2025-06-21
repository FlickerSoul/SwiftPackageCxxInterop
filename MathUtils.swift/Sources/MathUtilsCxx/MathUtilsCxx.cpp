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


std::vector<uint8_t> additive_encode(const std::vector<uint8_t>& data, uint8_t shift) {
    std::vector<uint8_t> result(data.size());
    for (size_t i = 0; i < data.size(); ++i) {
        result[i] = static_cast<uint8_t>((data[i] + shift) % 256);
    }
    return result;
}

std::vector<uint8_t> additive_decode(const std::vector<uint8_t>& data, uint8_t shift) {
    std::vector<uint8_t> result(data.size());
    for (size_t i = 0; i < data.size(); ++i) {
        result[i] = static_cast<uint8_t>((data[i] - shift + 256) % 256);
    }
    return result;
}
