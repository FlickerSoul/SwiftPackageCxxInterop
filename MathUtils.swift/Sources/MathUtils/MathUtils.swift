// The Swift Programming Language
// https://docs.swift.org/swift-book

import MathUtilsCWrapper
import MathUtilsCxx
import Foundation

public func batchEvenOdd(of data: [Int32]) -> [Bool] {
    var mutableData = data
    let result = mutableData.withUnsafeMutableBufferPointer { buffer in
        MathUtilsCxx.batchEvenOdd(of: buffer.baseAddress, size: Int32(buffer.count))
    }
    
    return result.map { $0.__convertToBool() }
}

public func isEven(_ number: Int32) -> Bool {
    return MathUtilsCWrapper.isEven(number) == 1
}

public func isOdd(_ number: Int32) -> Bool {
    return MathUtilsCWrapper.isOdd(number) == 1
}
