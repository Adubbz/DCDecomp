#include <libvu0.h>

#include <bit>
#include <cfloat>
#include <cmath>
#include <cstdint>
#include <cstring>

#include "chararead.hpp"
#include "mathutil.hpp"
#include "stubs/cloth.hpp"
#include "stubs/visualvu1.hpp"
#include "test.hpp"

namespace {

bool Same(const float *a, const float *b, int n) {
    return std::memcmp(a, b, sizeof(float) * n) == 0;
}

} // namespace

DC_TEST(math_vector_max_min_all_lanes) {
    float a[4] = {1.0f, -2.0f, 3.0f, 10.0f};
    float b[4] = {-1.0f, 5.0f, 3.5f, -10.0f};
    float c[4] = {0.0f, 4.0f, -8.0f, 20.0f};
    float d[4] = {2.0f, -9.0f, 0.0f, -30.0f};
    float out[4];

    VectorMax(out, a, b);
    const float max2[4] = {1.0f, 5.0f, 3.5f, 10.0f};
    DC_CHECK(Same(out, max2, 4));

    VectorMax(out, a, b, c);
    const float max3[4] = {1.0f, 5.0f, 3.5f, 20.0f};
    DC_CHECK(Same(out, max3, 4));

    VectorMax(out, a, b, c, d);
    const float max4[4] = {2.0f, 5.0f, 3.5f, 20.0f};
    DC_CHECK(Same(out, max4, 4));

    VectorMin(out, a, b);
    const float min2[4] = {-1.0f, -2.0f, 3.0f, -10.0f};
    DC_CHECK(Same(out, min2, 4));

    VectorMin(out, a, b, c, d);
    const float min4[4] = {-1.0f, -9.0f, -8.0f, -30.0f};
    DC_CHECK(Same(out, min4, 4));

    float hi[4];
    float lo[4];
    VectorMaxMin(hi, lo, a, b);
    DC_CHECK(Same(hi, max2, 4) && Same(lo, min2, 4));
    VectorMaxMin(hi, lo, a, b, c);
    const float min3[4] = {-1.0f, -2.0f, -8.0f, -10.0f};
    DC_CHECK(Same(hi, max3, 4) && Same(lo, min3, 4));
    VectorMaxMin(hi, lo, a, b, c, d);
    DC_CHECK(Same(hi, max4, 4) && Same(lo, min4, 4));
}

// PickUpNearPoly passes the outputs of one VectorMaxMin back in as inputs.
DC_TEST(math_vector_max_min_aliasing) {
    float a[4] = {1.0f, 2.0f, 3.0f, 4.0f};
    float b[4] = {4.0f, 3.0f, 2.0f, 1.0f};
    VectorMaxMin(a, b, a, b);
    const float hi[4] = {4.0f, 3.0f, 3.0f, 4.0f};
    const float lo[4] = {1.0f, 2.0f, 2.0f, 1.0f};
    DC_CHECK(Same(a, hi, 4) && Same(b, lo, 4));
}

// vmax/vmini order by sign and magnitude, so -0 is below +0 whichever operand comes first.
DC_TEST(math_vector_max_min_signed_zero) {
    float pz[4] = {0.0f, -0.0f, 0.0f, -0.0f};
    float nz[4] = {-0.0f, 0.0f, -0.0f, 0.0f};
    float out[4];
    VectorMax(out, pz, nz);
    for (int i = 0; i < 4; i++) {
        DC_CHECK(out[i] == 0.0f && !std::signbit(out[i]));
    }
    VectorMin(out, pz, nz);
    for (int i = 0; i < 4; i++) {
        DC_CHECK(out[i] == 0.0f && std::signbit(out[i]));
    }
}

// Retail stores an unwritten register lane as w; the port writes 0 there, which no caller reads.
DC_TEST(math_plane_normal) {
    float v0[4] = {1.0f, 1.0f, 1.0f, 7.0f};
    float v1[4] = {3.0f, 1.0f, 1.0f, 7.0f};
    float v2[4] = {1.0f, 4.0f, 1.0f, 7.0f};
    float n[4] = {9.0f, 9.0f, 9.0f, 9.0f};
    PlaneNormal(n, v0, v1, v2);
    DC_CHECK(n[0] == 0.0f && n[1] == 0.0f && n[2] == 6.0f && n[3] == 0.0f);

    PlaneNormal(n, v0, v2, v1);
    DC_CHECK(n[2] == -6.0f);
}

DC_TEST(math_dist_vector) {
    float v[4] = {3.0f, 4.0f, 12.0f, 1000.0f};
    DC_CHECK(DistVector(v) == 13.0f);

    float a[4] = {1.0f, 1.0f, 1.0f, 100.0f};
    float b[4] = {4.0f, 5.0f, 13.0f, -7.0f};
    DC_CHECK(DistVector(a, b) == 13.0f);
    DC_CHECK(DistVector(b, a) == 13.0f);
    DC_CHECK(vuabs(v) == 13.0f);

    float zero[4] = {0.0f, 0.0f, 0.0f, 5.0f};
    DC_CHECK(DistVector(zero) == 0.0f);
}

// The matrices are column-major: m[i] is column i, and the product applies right first.
DC_TEST(math_mul_matrix_order) {
    sceVu0FMATRIX translate = {
        {1.0f, 0.0f, 0.0f, 0.0f},
        {0.0f, 1.0f, 0.0f, 0.0f},
        {0.0f, 0.0f, 1.0f, 0.0f},
        {1.0f, 2.0f, 3.0f, 1.0f},
    };
    sceVu0FMATRIX scale = {
        {2.0f, 0.0f, 0.0f, 0.0f},
        {0.0f, 3.0f, 0.0f, 0.0f},
        {0.0f, 0.0f, 4.0f, 0.0f},
        {0.0f, 0.0f, 0.0f, 1.0f},
    };
    sceVu0FMATRIX out;

    MulMatrix(out, translate, scale);
    const float scale_then_translate[4][4] = {
        {2.0f, 0.0f, 0.0f, 0.0f},
        {0.0f, 3.0f, 0.0f, 0.0f},
        {0.0f, 0.0f, 4.0f, 0.0f},
        {1.0f, 2.0f, 3.0f, 1.0f},
    };
    DC_CHECK(Same(&out[0][0], &scale_then_translate[0][0], 16));

    MulMatrix(out, scale, translate);
    const float translate_then_scale[4][4] = {
        {2.0f, 0.0f, 0.0f,  0.0f},
        {0.0f, 3.0f, 0.0f,  0.0f},
        {0.0f, 0.0f, 4.0f,  0.0f},
        {2.0f, 6.0f, 12.0f, 1.0f},
    };
    DC_CHECK(Same(&out[0][0], &translate_then_scale[0][0], 16));
}

// product[i][j] = sum over k of right[i][k] * left[k][j], worked by hand for two integer matrices;
// the library's sceVu0MulMatrix agrees, and an output aliasing an input is fine.
DC_TEST(math_mul_matrix_values) {
    sceVu0FMATRIX left = {
        {1.0f,  2.0f,  3.0f,  4.0f },
        {5.0f,  6.0f,  7.0f,  8.0f },
        {9.0f,  10.0f, 11.0f, 12.0f},
        {13.0f, 14.0f, 15.0f, 16.0f},
    };
    sceVu0FMATRIX right = {
        {1.0f,  0.0f, 2.0f, 0.0f},
        {0.0f,  1.0f, 0.0f, 3.0f},
        {-1.0f, 0.0f, 1.0f, 0.0f},
        {0.0f,  2.0f, 0.0f, 1.0f},
    };
    const float expected[4][4] = {
        {19.0f, 22.0f, 25.0f, 28.0f},
        {44.0f, 48.0f, 52.0f, 56.0f},
        {8.0f,  8.0f,  8.0f,  8.0f },
        {23.0f, 26.0f, 29.0f, 32.0f},
    };
    sceVu0FMATRIX out;
    MulMatrix(out, left, right);
    DC_CHECK(Same(&out[0][0], &expected[0][0], 16));

    sceVu0FMATRIX library;
    sceVu0MulMatrix(library, left, right);
    DC_CHECK(Same(&out[0][0], &library[0][0], 16));

    MulMatrix(left, left, right);
    DC_CHECK(Same(&left[0][0], &expected[0][0], 16));
}

DC_TEST(math_rot_matrix_y) {
    CreateSinTable();
    const float   angle = 0.7f;
    sceVu0FMATRIX m;
    std::memset(m, 0x7F, sizeof(m));
    RotMatrixY(m, angle);

    DC_CHECK(m[0][0] == Cosf(angle) && m[2][2] == Cosf(angle));
    DC_CHECK(m[2][0] == Sinf(angle) && m[0][2] == -Sinf(angle));
    DC_CHECK_NEAR(m[0][0], std::cos(angle), 0.01f);
    DC_CHECK_NEAR(m[2][0], std::sin(angle), 0.01f);
    const float identity_rest[][3] = {
        {0, 1, 0.0f},
        {0, 3, 0.0f},
        {1, 0, 0.0f},
        {1, 1, 1.0f},
        {1, 2, 0.0f},
        {1, 3, 0.0f},
        {2, 1, 0.0f},
        {2, 3, 0.0f},
        {3, 0, 0.0f},
        {3, 1, 0.0f},
        {3, 2, 0.0f},
        {3, 3, 1.0f}
    };
    for (const auto &entry : identity_rest) {
        DC_CHECK(m[(int) entry[0]][(int) entry[1]] == entry[2]);
    }

    // x rotates towards -z, as sceVu0RotMatrixY turns it.
    float x[4] = {1.0f, 0.0f, 0.0f, 1.0f};
    float r[4];
    sceVu0ApplyMatrix(r, m, x);
    DC_CHECK_NEAR(r[0], std::cos(angle), 0.01f);
    DC_CHECK_NEAR(r[2], -std::sin(angle), 0.01f);
}

// A count below one still transforms one vector: the loop tests count - 1 after the first.
DC_TEST(math_apply_matrix_n) {
    sceVu0FMATRIX m = {
        {0.0f,  1.0f,  0.0f,  0.0f},
        {-1.0f, 0.0f,  0.0f,  0.0f},
        {0.0f,  0.0f,  2.0f,  0.0f},
        {10.0f, 20.0f, 30.0f, 1.0f},
    };
    sceVu0FVECTOR in[3] = {
        {1.0f, 0.0f, 0.0f, 1.0f},
        {0.0f, 1.0f, 1.0f, 1.0f},
        {1.0f, 2.0f, 3.0f, 0.0f},
    };
    sceVu0FVECTOR out[3];
    const float   expected[3][4] = {
        {10.0f, 21.0f, 30.0f, 1.0f},
        {9.0f,  20.0f, 32.0f, 1.0f},
        {-2.0f, 1.0f,  6.0f,  0.0f},
    };

    ApplyMatrixN(out, m, in, 3);
    DC_CHECK(Same(&out[0][0], &expected[0][0], 12));

    sceVu0FVECTOR one[2] = {
        {0.0f, 0.0f, 0.0f, 0.0f},
        {5.0f, 5.0f, 5.0f, 5.0f}
    };
    ApplyMatrixN(one, m, in, 0);
    DC_CHECK(Same(one[0], expected[0], 4));
    DC_CHECK(one[1][0] == 5.0f);

    ApplyMatrixN(in, m, in, 3);
    DC_CHECK(Same(&in[0][0], &expected[0][0], 12));
}

DC_TEST(math_inverse_length) {
    float v[4] = {3.0f, 4.0f, 12.0f, 99.0f};
    DC_CHECK_NEAR(InverseLength(v), 1.0f / 13.0f, 1e-8f);

    // The unit's divide by zero saturates instead of giving an infinity.
    float zero[4] = {0.0f, 0.0f, 0.0f, 1.0f};
    DC_CHECK(InverseLength(zero) == FLT_MAX);
}

// d = a - b = (-4, 0, 0), |d| = 4, q = 2 / 4: the slack d - d * q = (-2, 0, 0) moves a by +1 and b
// by -1, which leaves them the rest length 2 apart. Both w lanes are kept.
DC_TEST(math_stretch_bind2) {
    float a[4] = {0.0f, 0.0f, 0.0f, 7.0f};
    float b[4] = {4.0f, 0.0f, 0.0f, 9.0f};
    float spring[4] = {2.0f, 0.5f, 0.5f, 123.0f};
    StretchBind2(a, b, spring);
    DC_CHECK(a[0] == 1.0f && a[1] == 0.0f && a[2] == 0.0f && a[3] == 7.0f);
    DC_CHECK(b[0] == 3.0f && b[1] == 0.0f && b[2] == 0.0f && b[3] == 9.0f);

    // Uneven weights: a takes 0.25 of the slack and b 0.75.
    float c[4] = {0.0f, 0.0f, 0.0f, 1.0f};
    float d[4] = {0.0f, 0.0f, 6.0f, 1.0f};
    float uneven[4] = {2.0f, 0.25f, 0.75f, 0.0f};
    StretchBind2(c, d, uneven);
    DC_CHECK(c[2] == 1.0f && d[2] == 3.0f);

    // Coincident points stay put: q saturates and 0 * q is 0.
    float e[4] = {1.0f, 2.0f, 3.0f, 1.0f};
    float f[4] = {1.0f, 2.0f, 3.0f, 1.0f};
    StretchBind2(e, f, spring);
    DC_CHECK(e[0] == 1.0f && e[1] == 2.0f && e[2] == 3.0f && f[0] == 1.0f && f[1] == 2.0f && f[2] == 3.0f);
}
