#include "stubs/visualvu1.hpp"
#include "vu0_ops.hpp"

float InverseLength(float *vector) {
    return vu0::Rsqrt(1.0f, vu0::LengthSquared(vector));
}
