//
//  main.swift
//  MathUtil.swift
//
//  Created by Larry Zeng on 6/19/25.
//

import MathUtils
import Foundation

@main
enum MathUtilsExecutable {
    static func main() {
        separator()
        externalLib()
        separator()
        swiftPackageLib()
        separator()
    }

    private static func swiftPackageLib() {
        print("evens in [1, 2, 3, 4, 5, 6, 7, 8, 9]:", batchEven(of: [1, 2, 3, 4, 5, 6, 7, 8, 9]))
        
        separator()
        
        let text = "Hello, World!"
        let key = "KEY"
        let encodedBytes = [UInt8](text.data(using: .ascii)!)
        let keyBytes = [UInt8](key.data(using: .ascii)!)
        
        let encrypted = xorCipher(input: encodedBytes, key: keyBytes)!
        let decrypted = xorCipher(input: encrypted, key: keyBytes)!
        
        let decryptedText = String(data: Data(decrypted), encoding: .ascii)!
        
        print("xor cipher result of `\(text)` using key `\(key)` is \(encrypted)")
        print("xor decipher result is \(decrypted)")
        print("xor decipher result text is `\(decryptedText)`")
        
        separator()
        
        let encoded = additiveEncode(input: encodedBytes, shift: 7)
        let decoded = additiveDecode(input: encoded, shift: 7)
        let decodedText = String(data: Data(decoded), encoding: .ascii)!
        
        print("additive encoded result of `\(text)` using key `\(key)` is \(encoded)")
        print("additive decoded result is \(decoded)")
        print("additive decoded result text is `\(decodedText)`")
    }
    
    private static func externalLib() {
        print("is 3 odd?", isOdd(3))
        print("is 4 even?", isEven(4))
        print("3 + 4i + 5 + 6i = \(add(r1: 3, i1: 4, r2: 5, i2: 6))")
        print("abs(3 + 4i) = \(abs(r: 3, i: 4))")
        print("arg(3 + 4i) = \(arg(r: 3, i: 4))")
    }

    private static func separator() {
        print("=====================================")
    }
}
