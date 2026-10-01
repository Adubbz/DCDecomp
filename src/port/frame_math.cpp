#include "stubs/frame.hpp"
#include "vu0_ops.hpp"

namespace {

// pre_trance_normal parks its matrix in VU0 registers for the trance_normal calls that follow.
float g_pick_matrix[4][4];

} // namespace

// Identical to MulMatrix: m0 = m1 * m2 with m2's rows taken as column vectors.
void MulFrameMatrix(sceVu0FMATRIX m0, sceVu0FMATRIX m1, sceVu0FMATRIX m2) {
    float r[4][4];
    for (int i = 0; i < 4; i++) {
        vu0::Apply(r[i], m1, m2[i]);
    }
    for (int i = 0; i < 4; i++) {
        vu0::Copy(m0[i], r[i]);
    }
}

// Rows 0-2 are scaled on all four lanes by scale x, y and z; row 3 passes through (times vf0.w).
void ScaleMatrix(sceVu0FMATRIX m0, sceVu0FMATRIX m1, sceVu0FVECTOR scale) {
    float s[3] = {scale[0], scale[1], scale[2]};
    float r[4][4];
    for (int i = 0; i < 3; i++) {
        for (int j = 0; j < 4; j++) {
            r[i][j] = m1[i][j] * s[i];
        }
    }
    vu0::Copy(r[3], m1[3]);
    for (int i = 0; i < 4; i++) {
        vu0::Copy(m0[i], r[i]);
    }
}

void CopyMatrix(sceVu0FMATRIX m0, sceVu0FMATRIX m1) {
    std::memmove(m0, m1, sizeof(float) * 16);
}

void ZeroMatrix(sceVu0FMATRIX m0) {
    std::memset(m0, 0, sizeof(float) * 16);
}

// x and y of each of the eight corners are divided by |z|; z and w take part in the extremes
// undivided.
void ScreenBound(sceVu0FVECTOR *screen, sceVu0FVECTOR max, sceVu0FVECTOR min) {
    float corner[8][4];
    for (int i = 0; i < 8; i++) {
        vu0::Copy(corner[i], screen[i]);
        float q = vu0::Div(1.0f, std::fabs(corner[i][2]));
        corner[i][0] = vu0::Mul(corner[i][0], q);
        corner[i][1] = vu0::Mul(corner[i][1], q);
    }

    float hi[4];
    float lo[4];
    vu0::Max(hi, corner[0], corner[1]);
    vu0::Min(lo, corner[0], corner[1]);
    for (int i = 2; i < 8; i++) {
        vu0::Max(hi, hi, corner[i]);
        vu0::Min(lo, lo, corner[i]);
    }
    vu0::Copy(max, hi);
    vu0::Copy(min, lo);
}

void pre_trance_normal(sceVu0FMATRIX matrix) {
    std::memcpy(g_pick_matrix, matrix, sizeof(g_pick_matrix));
}

// Retail loads all three corners from p0 onwards (the caller's corners are contiguous) but stores
// them through p0, p1 and p2. The plane's w is a lane vopmsub never writes; it is zeroed.
void trance_normal(float *p0, float *p1, float *p2, float *plane) {
    float a[4];
    float b[4];
    float c[4];
    vu0::Apply(a, g_pick_matrix, p0);
    vu0::Apply(b, g_pick_matrix, p0 + 4);
    vu0::Apply(c, g_pick_matrix, p0 + 8);

    float e0[4] = {b[0] - a[0], b[1] - a[1], b[2] - a[2], b[3] - a[3]};
    float e1[4] = {c[0] - a[0], c[1] - a[1], c[2] - a[2], c[3] - a[3]};
    float n[4] = {0.0f, 0.0f, 0.0f, 0.0f};
    vu0::Cross(n, e0, e1);

    vu0::Copy(p0, a);
    vu0::Copy(p1, b);
    vu0::Copy(p2, c);
    vu0::Copy(plane, n);
}
