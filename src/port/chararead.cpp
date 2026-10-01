#include "chararead.hpp"

#include "stubs/cloth.hpp"
#include "vu0_ops.hpp"

// One spring between a and b: with d = a - b and q = spring.x / |d|, a moves by -(d - d*q) *
// spring.y and b by +(d - d*q) * spring.z, on xyz. Both w lanes are kept.
void StretchBind2(float *point_a, float *point_b, float *spring) {
    float d[3] = {point_a[0] - point_b[0], point_a[1] - point_b[1], point_a[2] - point_b[2]};
    float length_squared = d[0] * d[0];
    length_squared = length_squared + d[1] * d[1];
    length_squared = length_squared + d[2] * d[2];
    float q = vu0::Rsqrt(spring[0], length_squared);
    float pull_a = spring[1];
    float pull_b = spring[2];

    for (int i = 0; i < 3; i++) {
        float slack = d[i] - vu0::Mul(d[i], q);
        point_a[i] = point_a[i] - slack * pull_a;
        point_b[i] = point_b[i] + slack * pull_b;
    }
}

float vuabs(float *vector) {
    return vu0::Sqrt(vu0::LengthSquared(vector));
}
