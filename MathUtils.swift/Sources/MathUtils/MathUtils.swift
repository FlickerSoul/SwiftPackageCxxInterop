// The Swift Programming Language
// https://docs.swift.org/swift-book

import ExternalMathUtilsCWrapper
import ExternalMathUtilsCxxWrapper
import MathUtilsCxx
import Foundation

public func batchEven(of data: [Int32]) -> [String] {
    var mutableData = data
    let result = mutableData.withUnsafeMutableBufferPointer { buffer in
        MathUtilsCxx.batchEven(of: buffer.baseAddress, size: Int32(buffer.count))
    }
    
    return result.map { $0.__convertToBool() ? "Even" : "Odd" }
}

public func isEven(_ number: Int32) -> Bool {
    return ExternalMathUtilsCWrapper.isEven(number) == 1
}

public func isOdd(_ number: Int32) -> Bool {
    return ExternalMathUtilsCWrapper.isOdd(number) == 1
}

public func add(r1: Double, i1: Double, r2: Double, i2: Double) -> (Double, Double) {
    let imaginary = ExternalMathUtilsCxxWrapper.add(r1: r1, i1: i1, r2: r2, i2: i2)
    return (imaginary.real(), imaginary.imag())
}

public func abs(r: Double, i: Double) -> Double {
    return ExternalMathUtilsCxxWrapper.abs(r: r, i: i)
}

public func arg(r: Double, i: Double) -> Double {
    return ExternalMathUtilsCxxWrapper.arg(r: r, i: i)
}

