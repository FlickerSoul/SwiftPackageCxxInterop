#include "complex_math.h"
#include <complex>

std::complex<double> complex_addition(double real1, double imag1, double real2, double imag2) {
    // Create two complex numbers and add them
    std::complex<double> z1(real1, imag1);
    std::complex<double> z2(real2, imag2);
    return z1 + z2;
}

double complex_abs(double real, double imag) {
    // Create complex number and return its magnitude
    std::complex<double> z(real, imag);
    return std::abs(z);
}

double complex_arg(double real, double imag) {
    // Create complex number and return its argument (phase angle)
    std::complex<double> z(real, imag);
    return std::arg(z);
}
