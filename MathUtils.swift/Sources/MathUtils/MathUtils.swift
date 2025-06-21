// The Swift Programming Language
// https://docs.swift.org/swift-book

import ExternalMathUtilsCWrapper
import ExternalMathUtilsCxxWrapper
import MathUtilsC
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
    return ExternalMathUtilsCWrapper.is_even(number) == 1
}

public func isOdd(_ number: Int32) -> Bool {
    return ExternalMathUtilsCWrapper.is_odd(number) == 1
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

public func xorCipher(input: [UInt8], key: [UInt8]) -> [UInt8]? {
    var mutableInput = input
    var mutableKey = key
    var outputLength = -1

    let output = MathUtilsC.xorCipher(input: &mutableInput, inputLength: mutableInput.count, key: &mutableKey, keyLength: mutableKey.count, outputLength: &outputLength)
    
    guard outputLength >= 0, let output else {
        return nil
    }
    
    let result = Array(UnsafeBufferPointer(start: output, count: outputLength))
    output.deallocate()
    
    return result
}

public func xorDecipher(input: [UInt8], key: [UInt8]) -> [UInt8]? {
    var mutableInput = input
    var mutableKey = key
    var outputLength = -1

    let output = MathUtilsC.xorDecipher(input: &mutableInput, inputLength: mutableInput.count, key: &mutableKey, keyLength: mutableKey.count, outputLength: &outputLength)
    
    guard outputLength >= 0, let output else {
        return nil
    }
    
    let result = Array(UnsafeBufferPointer(start: output, count: outputLength))
    output.deallocate()
    
    return result
}

public func additiveEncode(input: [UInt8], shift: UInt8) -> [UInt8] {
    let output = MathUtilsCxx.additiveEncode(.init(input), shift: shift)
    
    var result = [UInt8]()
    for value in output {
        result.append(value)
    }
    
    return result
}

public func additiveDecode(input: [UInt8], shift: UInt8) -> [UInt8] {
    let output = MathUtilsCxx.additiveDecode(.init(input), shift: shift)
    
    var result = [UInt8]()
    for value in output {
        result.append(value)
    }
    
    return result
}
