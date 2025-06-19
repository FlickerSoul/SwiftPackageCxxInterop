# C/xx Swift Package Interop

This is an example package demonstrating how to use the C and C++ interoperability in Swift Package. 


## Project Structure

```text
.
├── MathUtils
│   ├── Makefile
│   ├── math_utils.c
│   ├── math_utils.h
├── MathUtils.swift
│   ├── Package.swift
│   ├── Sources
│   │   ├── MathUtils
│   │   │   └── MathUtils.swift
│   │   ├── MathUtilsC
│   │   │   ├── include
│   │   │   │   └── math_utils.h
│   │   │   ├── lib
│   │   │   │   └── libmath_utils.a
│   │   │   ├── math_utils.pk
│   │   │   └── module.modulemap
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
└── README.md
```

The `MathUtils` is just a simple c library that can be compiled using the companion `Makefile`. 

The `MathUtils.swift` is a swift package that hosts a c++ target using the compiled `MathUtils` c library, a swift target that uses the definitions from both the c library and the c++ library. It also provides an executable `MathUtilsExecutable` that outputs the results by calling the swift target which uses the c and c++ library under the hood.

Note that `extern "C"` is needed for the c headers (see [here](https://forums.swift.org/t/import-of-c-module-appears-within-extern-c-language-linkage-specification/65606/2)).

