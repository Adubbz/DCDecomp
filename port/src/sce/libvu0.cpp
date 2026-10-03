#include <libvu0.h>

#include <algorithm>
#include <cfloat>
#include <cmath>
#include <cstdint>
#include <cstring>

// The vector unit's arithmetic in C++. Each function writes the same lanes as
// the library does and leaves the others as it leaves them. A matrix is four
// column vectors, so m[i] is column i and m * v sums m[i] * v[i].

namespace {

/** Copies a vector, so a result may alias an operand. */
void Load(float out[4], const float in[4]) {
    std::memcpy(out, in, sizeof(float) * 4);
}

/** Copies a matrix, so a result may alias an operand. */
void Load(float out[4][4], const float in[4][4]) {
    std::memcpy(out, in, sizeof(float) * 16);
}

/** Multiplies a column vector by a matrix. */
void Apply(float out[4], const float m[4][4], const float v[4]) {
    float r[4];
    for (int i = 0; i < 4; i++) {
        r[i] = m[0][i] * v[0] + m[1][i] * v[1] + m[2][i] * v[2] + m[3][i] * v[3];
    }
    Load(out, r);
}

/** Multiplies two matrices: out = a * b. */
void Multiply(float out[4][4], const float a[4][4], const float b[4][4]) {
    float r[4][4];
    for (int i = 0; i < 4; i++) {
        Apply(r[i], a, b[i]);
    }
    Load(out, r);
}

/** The vector unit's float to fixed-point conversion: truncates toward zero and saturates. */
int ToFixed(float value, float scale) {
    float scaled = std::trunc(value * scale);
    if (!(scaled > -2147483648.0f)) {
        return std::isnan(scaled) ? 0 : INT32_MIN;
    }
    if (scaled >= 2147483648.0f) {
        return INT32_MAX;
    }
    return static_cast<int>(scaled);
}

/** Rotates m1 by the matrix whose first three columns are x, y and z: m0 = rotation * m1. */
void Rotate(sceVu0FMATRIX m0, sceVu0FMATRIX m1, const float (&x)[4], const float (&y)[4], const float (&z)[4]) {
    const float rotation[4][4] = {
        {x[0], x[1], x[2], x[3]},
        {y[0], y[1], y[2], y[3]},
        {z[0], z[1], z[2], z[3]},
        {0.0f, 0.0f, 0.0f, 1.0f},
    };
    Multiply(m0, rotation, m1);
}

/** The status flags a clip test reads: sticky zero and sticky sign, as the vector unit sets them. */
int ClipFlags(float value) {
    if (value == 0.0f) {
        return 0x40;
    }
    return std::signbit(value) ? 0x80 : 0;
}

/** Tests a screen-space vertex against the 4096x4096 drawing area and positive w. */
int ClipScreenFlags(const float v[4]) {
    return ClipFlags(v[0]) | ClipFlags(v[1]) | ClipFlags(v[3]) | ClipFlags(4096.0f - v[0]) | ClipFlags(4096.0f - v[1]);
}

} // namespace

void sceVu0CopyVector(sceVu0FVECTOR v0, sceVu0FVECTOR v1) {
    Load(v0, v1);
}

void sceVu0CopyVectorXYZ(sceVu0FVECTOR v0, sceVu0FVECTOR v1) {
    v0[0] = v1[0];
    v0[1] = v1[1];
    v0[2] = v1[2];
}

void sceVu0FTOI0Vector(sceVu0IVECTOR v0, sceVu0FVECTOR v1) {
    for (int i = 0; i < 4; i++) {
        v0[i] = ToFixed(v1[i], 1.0f);
    }
}

void sceVu0FTOI4Vector(sceVu0IVECTOR v0, sceVu0FVECTOR v1) {
    for (int i = 0; i < 4; i++) {
        v0[i] = ToFixed(v1[i], 16.0f);
    }
}

void sceVu0ITOF0Vector(sceVu0FVECTOR v0, sceVu0IVECTOR v1) {
    for (int i = 0; i < 4; i++) {
        v0[i] = static_cast<float>(v1[i]);
    }
}

void sceVu0ITOF4Vector(sceVu0FVECTOR v0, sceVu0IVECTOR v1) {
    for (int i = 0; i < 4; i++) {
        v0[i] = static_cast<float>(v1[i]) / 16.0f;
    }
}

void sceVu0ScaleVector(sceVu0FVECTOR v0, sceVu0FVECTOR v1, float s) {
    for (int i = 0; i < 4; i++) {
        v0[i] = v1[i] * s;
    }
}

void sceVu0ScaleVectorXYZ(sceVu0FVECTOR v0, sceVu0FVECTOR v1, float s) {
    float r[4];
    Load(r, v1);
    for (int i = 0; i < 3; i++) {
        r[i] *= s;
    }
    Load(v0, r);
}

void sceVu0AddVector(sceVu0FVECTOR v0, sceVu0FVECTOR v1, sceVu0FVECTOR v2) {
    for (int i = 0; i < 4; i++) {
        v0[i] = v1[i] + v2[i];
    }
}

void sceVu0SubVector(sceVu0FVECTOR v0, sceVu0FVECTOR v1, sceVu0FVECTOR v2) {
    for (int i = 0; i < 4; i++) {
        v0[i] = v1[i] - v2[i];
    }
}

void sceVu0MulVector(sceVu0FVECTOR v0, sceVu0FVECTOR v1, sceVu0FVECTOR v2) {
    for (int i = 0; i < 4; i++) {
        v0[i] = v1[i] * v2[i];
    }
}

void sceVu0InterVector(sceVu0FVECTOR v0, sceVu0FVECTOR v1, sceVu0FVECTOR v2, float r) {
    float inverse = 1.0f - r;
    for (int i = 0; i < 4; i++) {
        v0[i] = v1[i] * r + v2[i] * inverse;
    }
}

void sceVu0InterVectorXYZ(sceVu0FVECTOR v0, sceVu0FVECTOR v1, sceVu0FVECTOR v2, float r) {
    float inverse = 1.0f - r;
    float result[4];
    for (int i = 0; i < 3; i++) {
        result[i] = v1[i] * r + v2[i] * inverse;
    }
    result[3] = v1[3];
    Load(v0, result);
}

void sceVu0DivVector(sceVu0FVECTOR v0, sceVu0FVECTOR v1, float q) {
    sceVu0ScaleVector(v0, v1, 1.0f / q);
}

void sceVu0DivVectorXYZ(sceVu0FVECTOR v0, sceVu0FVECTOR v1, float q) {
    sceVu0ScaleVectorXYZ(v0, v1, 1.0f / q);
}

float sceVu0InnerProduct(sceVu0FVECTOR v0, sceVu0FVECTOR v1) {
    return v0[0] * v1[0] + v0[1] * v1[1] + v0[2] * v1[2];
}

void sceVu0OuterProduct(sceVu0FVECTOR v0, sceVu0FVECTOR v1, sceVu0FVECTOR v2) {
    float r[4] = {
        v1[1] * v2[2] - v2[1] * v1[2],
        v1[2] * v2[0] - v2[2] * v1[0],
        v1[0] * v2[1] - v2[0] * v1[1],
        0.0f,
    };
    Load(v0, r);
}

// The unit's divide by zero gives its largest value rather than an infinity, so a zero vector
// normalises to zero instead of NaN; CCloth::Step normalises every resting vertex's speed.
void sceVu0Normalize(sceVu0FVECTOR v0, sceVu0FVECTOR v1) {
    float length = std::sqrt(sceVu0InnerProduct(v1, v1));
    float scale = length == 0.0f ? FLT_MAX : 1.0f / length;
    float r[4] = {v1[0] * scale, v1[1] * scale, v1[2] * scale, 0.0f};
    Load(v0, r);
}

void sceVu0ApplyMatrix(sceVu0FVECTOR v0, sceVu0FMATRIX m, sceVu0FVECTOR v1) {
    Apply(v0, m, v1);
}

void sceVu0UnitMatrix(sceVu0FMATRIX m) {
    for (int i = 0; i < 4; i++) {
        for (int j = 0; j < 4; j++) {
            m[i][j] = i == j ? 1.0f : 0.0f;
        }
    }
}

void sceVu0CopyMatrix(sceVu0FMATRIX m0, sceVu0FMATRIX m1) {
    Load(m0, m1);
}

void sceVu0TransposeMatrix(sceVu0FMATRIX m0, sceVu0FMATRIX m1) {
    float r[4][4];
    for (int i = 0; i < 4; i++) {
        for (int j = 0; j < 4; j++) {
            r[i][j] = m1[j][i];
        }
    }
    Load(m0, r);
}

void sceVu0MulMatrix(sceVu0FMATRIX m0, sceVu0FMATRIX m1, sceVu0FMATRIX m2) {
    Multiply(m0, m1, m2);
}

// The inverse of a rigid transform: the rotation is transposed and the
// translation carried back through it. m1[3][3] is kept as it is.
void sceVu0InversMatrix(sceVu0FMATRIX m0, sceVu0FMATRIX m1) {
    float r[4][4];
    for (int i = 0; i < 3; i++) {
        for (int j = 0; j < 3; j++) {
            r[i][j] = m1[j][i];
        }
        r[i][3] = 0.0f;
    }
    for (int j = 0; j < 3; j++) {
        r[3][j] = -(r[0][j] * m1[3][0] + r[1][j] * m1[3][1] + r[2][j] * m1[3][2]);
    }
    r[3][3] = m1[3][3];
    Load(m0, r);
}

void sceVu0RotMatrixX(sceVu0FMATRIX m0, sceVu0FMATRIX m1, float rx) {
    float c = std::cos(rx);
    float s = std::sin(rx);
    Rotate(m0, m1, {1.0f, 0.0f, 0.0f, 0.0f}, {0.0f, c, s, 0.0f}, {0.0f, -s, c, 0.0f});
}

void sceVu0RotMatrixY(sceVu0FMATRIX m0, sceVu0FMATRIX m1, float ry) {
    float c = std::cos(ry);
    float s = std::sin(ry);
    Rotate(m0, m1, {c, 0.0f, -s, 0.0f}, {0.0f, 1.0f, 0.0f, 0.0f}, {s, 0.0f, c, 0.0f});
}

void sceVu0RotMatrixZ(sceVu0FMATRIX m0, sceVu0FMATRIX m1, float rz) {
    float c = std::cos(rz);
    float s = std::sin(rz);
    Rotate(m0, m1, {c, s, 0.0f, 0.0f}, {-s, c, 0.0f, 0.0f}, {0.0f, 0.0f, 1.0f, 0.0f});
}

void sceVu0RotMatrix(sceVu0FMATRIX m0, sceVu0FMATRIX m1, sceVu0FVECTOR rot) {
    sceVu0RotMatrixZ(m0, m1, rot[2]);
    sceVu0RotMatrixY(m0, m0, rot[1]);
    sceVu0RotMatrixX(m0, m0, rot[0]);
}

void sceVu0TransMatrix(sceVu0FMATRIX m0, sceVu0FMATRIX m1, sceVu0FVECTOR tv) {
    float r[4][4];
    Load(r, m1);
    for (int i = 0; i < 3; i++) {
        r[3][i] += tv[i];
    }
    Load(m0, r);
}

void sceVu0CameraMatrix(sceVu0FMATRIX m, sceVu0FVECTOR p, sceVu0FVECTOR zd, sceVu0FVECTOR yd) {
    sceVu0FMATRIX camera;
    sceVu0FVECTOR xd;
    sceVu0UnitMatrix(camera);
    sceVu0OuterProduct(xd, yd, zd);
    sceVu0Normalize(camera[0], xd);
    sceVu0Normalize(camera[2], zd);
    sceVu0OuterProduct(camera[1], camera[2], camera[0]);
    sceVu0TransMatrix(camera, camera, p);
    sceVu0InversMatrix(m, camera);
}

void sceVu0NormalLightMatrix(sceVu0FMATRIX m, sceVu0FVECTOR l0, sceVu0FVECTOR l1, sceVu0FVECTOR l2) {
    sceVu0FVECTOR direction;
    sceVu0ScaleVector(direction, l0, -1.0f);
    sceVu0Normalize(m[0], direction);
    sceVu0ScaleVector(direction, l1, -1.0f);
    sceVu0Normalize(m[1], direction);
    sceVu0ScaleVector(direction, l2, -1.0f);
    sceVu0Normalize(m[2], direction);
    m[3][0] = 0.0f;
    m[3][1] = 0.0f;
    m[3][2] = 0.0f;
    m[3][3] = 1.0f;
    sceVu0TransposeMatrix(m, m);
}

void sceVu0LightColorMatrix(sceVu0FMATRIX m, sceVu0FVECTOR c0, sceVu0FVECTOR c1, sceVu0FVECTOR c2, sceVu0FVECTOR a) {
    sceVu0CopyVector(m[0], c0);
    sceVu0CopyVector(m[1], c1);
    sceVu0CopyVector(m[2], c2);
    sceVu0CopyVector(m[3], a);
}

void sceVu0ViewScreenMatrix(sceVu0FMATRIX m, float scrz, float ax, float ay, float cx, float cy, float zmin, float zmax, float nearz, float farz) {
    float         az = farz * nearz * (-zmin + zmax) / (-nearz + farz);
    float         cz = (-zmax * nearz + zmin * farz) / (-nearz + farz);
    sceVu0FMATRIX scale;

    sceVu0UnitMatrix(m);
    m[0][0] = scrz;
    m[1][1] = scrz;
    m[2][2] = 0.0f;
    m[3][3] = 0.0f;
    m[2][3] = 1.0f;
    m[3][2] = 1.0f;

    sceVu0UnitMatrix(scale);
    scale[0][0] = ax;
    scale[1][1] = ay;
    scale[2][2] = az;
    scale[3][0] = cx;
    scale[3][1] = cy;
    scale[3][2] = cz;
    sceVu0MulMatrix(m, scale, m);
}

// Projects onto the plane a*x + b*y + c*z = 1 along lp: a direction when mode
// is set, a point light's position when it is not.
void sceVu0DropShadowMatrix(sceVu0FMATRIX m, sceVu0FVECTOR lp, float a, float b, float c, int mode) {
    float x = lp[0];
    float y = lp[1];
    float z = lp[2];
    float d = a * x + b * y + c * z;

    if (mode) {
        float e = 1.0f - d;
        m[0][0] = a * x + e;
        m[0][1] = a * y;
        m[0][2] = a * z;
        m[0][3] = a;
        m[1][0] = b * x;
        m[1][1] = b * y + e;
        m[1][2] = b * z;
        m[1][3] = b;
        m[2][0] = c * x;
        m[2][1] = c * y;
        m[2][2] = c * z + e;
        m[2][3] = c;
        m[3][0] = -x;
        m[3][1] = -y;
        m[3][2] = -z;
        m[3][3] = e - 1.0f;
    } else {
        float k = -1.0f / d;
        m[0][0] = k * (a * x - d);
        m[0][1] = k * (a * y);
        m[0][2] = k * (a * z);
        m[0][3] = 0.0f;
        m[1][0] = k * (b * x);
        m[1][1] = k * (b * y - d);
        m[1][2] = k * (b * z);
        m[1][3] = 0.0f;
        m[2][0] = k * (c * x);
        m[2][1] = k * (c * y);
        m[2][2] = k * (c * z - d);
        m[2][3] = 0.0f;
        m[3][0] = k * -x;
        m[3][1] = k * -y;
        m[3][2] = k * -z;
        m[3][3] = k * -d;
    }
}

// Returns 1 when every vertex, once transformed by ms, lies outside the box
// minv..maxv scaled by its w, and 0 as soon as one does not.
int sceVu0ClipAll(sceVu0FVECTOR minv, sceVu0FVECTOR maxv, sceVu0FMATRIX ms, sceVu0FVECTOR *vm, int n) {
    for (int i = 0; i < n; i++) {
        float p[4];
        Apply(p, ms, vm[i]);
        int flags = ClipFlags(p[0] - minv[0] * p[3]) | ClipFlags(p[1] - minv[1] * p[3]) | ClipFlags(p[3] - minv[3]) |
                    ClipFlags(maxv[0] * p[3] - p[0]) | ClipFlags(maxv[1] * p[3] - p[1]) | ClipFlags(maxv[3] - p[3]);
        if (flags == 0) {
            return 0;
        }
    }
    return 1;
}

void sceVu0ClampVector(sceVu0FVECTOR v0, sceVu0FVECTOR v1, float min, float max) {
    for (int i = 0; i < 4; i++) {
        v0[i] = std::min(std::max(v1[i], min), max);
    }
}

int sceVu0ClipScreen(sceVu0FVECTOR v0) {
    return ClipScreenFlags(v0);
}

int sceVu0ClipScreen3(sceVu0FVECTOR v0, sceVu0FVECTOR v1, sceVu0FVECTOR v2) {
    return ClipScreenFlags(v0) | ClipScreenFlags(v1) | ClipScreenFlags(v2);
}

void sceVu0RotTransPersN(sceVu0IVECTOR *v0, sceVu0FMATRIX m0, sceVu0FVECTOR *v1, int n, int mode) {
    for (int i = 0; i < n; i++) {
        sceVu0RotTransPers(v0[i], m0, v1[i], mode);
    }
}

// Transforms and divides by w, then converts to the GS's 12.4 fixed point;
// with mode set, z and w are converted as plain integers instead.
void sceVu0RotTransPers(sceVu0IVECTOR v0, sceVu0FMATRIX m0, sceVu0FVECTOR v1, int mode) {
    float p[4];
    Apply(p, m0, v1);
    float q = 1.0f / p[3];
    for (int i = 0; i < 3; i++) {
        p[i] *= q;
    }
    for (int i = 0; i < 4; i++) {
        v0[i] = ToFixed(p[i], mode && i >= 2 ? 1.0f : 16.0f);
    }
}

// The port has no vector unit to reset.
void sceVpu0Reset() {
}
