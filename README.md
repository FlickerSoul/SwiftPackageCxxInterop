# C/xx Swift Package Interop

This is an example package demonstrating how to use the C and C++ interoperability in Swift Package. 

## Project Structure

```text
.
├── MathUtils.swift
│   ├── Package.swift
│   ├── Sources
│   │   ├── ExternalMathUtilsC
│   │   │   ├── include
│   │   │   │   └── math_utils.h
│   │   │   ├── lib
│   │   │   │   └── libmath_utils.a
│   │   │   ├── math_utils.pk
│   │   │   └── module.modulemap
│   │   ├── ExternalMathUtilsCxx
│   │   │   ├── include
│   │   │   │   └── complex_math.h
│   │   │   ├── lib
│   │   │   │   └── libcomplexmath.a
│   │   │   └── module.modulemap
│   │   ├── MathUtils
│   │   │   └── MathUtils.swift
│   │   ├── MathUtilsCxx
│   │   │   ├── include
│   │   │   │   ├── MathUtilsCxx.hpp
│   │   │   │   └── module.modulemap
│   │   │   └── MathUtilsCxx.cpp
│   │   └── MathUtilsExecutable
│   │       └── MathUtilsExecutable.swift
│   └── Tests
│       └── MathUtilsTests
│           └── MathUtilsTests.swift
├── MathUtilsC
│   ├── Makefile
│   ├── math_utils.c
│   ├── math_utils.h
├── MathUtilsCxx
│   ├── complex_math.cpp
│   ├── complex_math.h
│   └── Makefile
└── README.md
```

The `/MathUtilsC` and `/MathUtilsCxx` are just simple c library and c++ library that can be compiled using the companion `Makefile`s. 

The `MathUtils.swift` is a swift package that references the two compile packages above, in `/MathUtils.swift/Sources/ExternalMathUtilsC` and `/MathUtils.swift/Sources/ExternalMathUtilsCxx`, and contains a c++ target using the `ExternalMathUtilsC`` and a swift target all three c/++ libraries. It also provides an executable `MathUtilsExecutable` that outputs the results by calling the swift target which uses the c and c++ library under the hood.

Note that `extern "C"` is needed for the c headers in `/MathUtils.swift/Sources/ExternalMathUtilsC` (see [here](https://forums.swift.org/t/import-of-c-module-appears-within-extern-c-language-linkage-specification/65606/2)).

## Run The Sample Executable

```zsh
cd MathUtils.swift
swift run
```

