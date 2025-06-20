//
//  main.swift
//  MathUtil.swift
//
//  Created by Larry Zeng on 6/19/25.
//

import MathUtils

@main
struct MathUtilsExecutable {
  static func main() {
      print("evens in [1, 2, 3, 4, 5, 6, 7, 8, 9]:", batchEven(of: [1, 2, 3, 4, 5, 6, 7, 8, 9]))
      print("is 3 odd?", isOdd(3))
      print("is 4 even?", isEven(4))
      print("3 + 4i + 5 + 6i = \(add(r1: 3, i1: 4, r2: 5, i2: 6))")
      print("abs(3 + 4i) = \(abs(r: 3, i: 4))")
      print("arg(3 + 4i) = \(arg(r: 3, i: 4))")
  }
}
