#ifndef COMPLEX_MATH_H
#define COMPLEX_MATH_H

#include <complex>
#include <swift/bridging>

// Complex number addition
// Takes two complex numbers represented as (real1, imag1) and (real2, imag2)
// Returns the sum as a std::complex<double>
std::complex<double> complex_addition(double real1, double imag1, double real2, double imag2) SWIFT_NAME(add(r1:i1:r2:i2:));

// Complex number absolute value (magnitude)
// Takes a complex number represented as (real, imag)
// Returns the magnitude |z| = sqrt(real² + imag²)
double complex_abs(double real, double imag) SWIFT_NAME(abs(r:i:));

// Complex number argument (phase angle)
// Takes a complex number represented as (real, imag)
// Returns the argument in radians: arg(z) = atan2(imag, real)
double complex_arg(double real, double imag) SWIFT_NAME(arg(r:i:));

#endif // COMPLEX_MATH_H
