#pragma name_counter 245

#include "mathutil.hpp"

#include <libvu0.h>

#include <cmath>
#include <cstdlib>

INCLUDE_RODATA("asm/nonmatchings/mathutil", LIT_245);
INCLUDE_RODATA("asm/nonmatchings/mathutil", LIT_424);
INCLUDE_RODATA("asm/nonmatchings/mathutil", LIT_425);
INCLUDE_RODATA("asm/nonmatchings/mathutil", LIT_1035);
INCLUDE_RODATA("asm/nonmatchings/mathutil", LIT_1037);
INCLUDE_RODATA("asm/nonmatchings/mathutil", __RTTI__Q23std9exception__2);
INCLUDE_RODATA("asm/nonmatchings/mathutil", LIT_1036);
INCLUDE_RODATA("asm/nonmatchings/mathutil", __RTTI__Q23std13bad_exception);
INCLUDE_RODATA("asm/nonmatchings/mathutil", LIT_1039);

INCLUDE_ASM("asm/nonmatchings/mathutil", __construct_array);
INCLUDE_ASM("asm/nonmatchings/mathutil", __construct_new_array);
INCLUDE_ASM("asm/nonmatchings/mathutil", __dl__FPv);
INCLUDE_ASM("asm/nonmatchings/mathutil", __dt__Q23std9exceptionFv);
INCLUDE_ASM("asm/nonmatchings/mathutil", what__Q23std9exceptionCFv);
INCLUDE_ASM("asm/nonmatchings/mathutil", __throw_catch_compare);
INCLUDE_ASM("asm/nonmatchings/mathutil", unexpected__3stdFv);
INCLUDE_ASM("asm/nonmatchings/mathutil", terminate__3stdFv);
INCLUDE_ASM("asm/nonmatchings/mathutil", duhandler__3stdFv);
INCLUDE_ASM("asm/nonmatchings/mathutil", dthandler__3stdFv);
INCLUDE_ASM("asm/nonmatchings/mathutil", __register_global_object);
INCLUDE_ASM("asm/nonmatchings/mathutil", __initialize_cpp_rts);
INCLUDE_ASM("asm/nonmatchings/mathutil", __DecodeUnsignedNumber__FPcPUi);
INCLUDE_ASM("asm/nonmatchings/mathutil", __DecodeSignedNumber__FPcPi);
INCLUDE_ASM("asm/nonmatchings/mathutil", __end__catch);
INCLUDE_ASM("asm/nonmatchings/mathutil", __unexpected);
INCLUDE_ASM("asm/nonmatchings/mathutil", __dt__Q23std13bad_exceptionFv);
INCLUDE_ASM("asm/nonmatchings/mathutil", what__Q23std13bad_exceptionCFv);
INCLUDE_ASM("asm/nonmatchings/mathutil", mwInit);
INCLUDE_ASM("asm/nonmatchings/mathutil", mwOverlayInit);
INCLUDE_ASM("asm/nonmatchings/mathutil", MWNotifyOverlayLoaded);
INCLUDE_ASM("asm/nonmatchings/mathutil", mwBload);
INCLUDE_ASM("asm/nonmatchings/mathutil", mwLoadOverlay);

#define PI 3.1415927f

static float sin_table_num = 1024.0f;
static float sin_table_unit_1 = 162.97466f;
static float SinTable[1024];

float Sinf(float angle);
float Cosf(float angle);

void VectorMax(float *max, float *a, float *b) {
    register float *out = max;
    register float *p0 = a;
    register float *p1 = b;

    asm {
        lqc2    vf15, 0(p0)
        lqc2    vf16, 0(p1)
        vmax    vf18, vf15, vf16
        sqc2    vf18, 0(out)
    }
}

void VectorMax(float *max, float *a, float *b, float *c) {
    register float *out = max;
    register float *p0 = a;
    register float *p1 = b;
    register float *p2 = c;

    asm {
        lqc2    vf15, 0(p0)
        lqc2    vf16, 0(p1)
        lqc2    vf17, 0(p2)
        vmax    vf18, vf15, vf16
        vmax    vf19, vf18, vf17
        sqc2    vf19, 0(out)
    }
}

void VectorMax(float *max, float *a, float *b, float *c, float *d) {
    register float *out = max;
    register float *p0 = a;
    register float *p1 = b;
    register float *p2 = c;
    register float *p3 = d;

    asm {
        lqc2    vf15, 0(p0)
        lqc2    vf16, 0(p1)
        lqc2    vf17, 0(p2)
        lqc2    vf18, 0(p3)
        vmax    vf20, vf15, vf16
        vmax    vf20, vf20, vf17
        vmax    vf20, vf20, vf18
        sqc2    vf20, 0(out)
    }
}

void VectorMin(float *min, float *a, float *b) {
    register float *out = min;
    register float *p0 = a;
    register float *p1 = b;

    asm {
        lqc2    vf15, 0(p0)
        lqc2    vf16, 0(p1)
        vmini   vf18, vf15, vf16
        sqc2    vf18, 0(out)
    }
}

void VectorMin(float *min, float *a, float *b, float *c, float *d) {
    register float *out = min;
    register float *p0 = a;
    register float *p1 = b;
    register float *p2 = c;
    register float *p3 = d;

    asm {
        lqc2    vf15, 0(p0)
        lqc2    vf16, 0(p1)
        lqc2    vf17, 0(p2)
        lqc2    vf18, 0(p3)
        vmini   vf20, vf15, vf16
        vmini   vf20, vf20, vf17
        vmini   vf20, vf20, vf18
        sqc2    vf20, 0(out)
    }
}

void VectorMaxMin(float *max, float *min, float *a, float *b) {
    register float *out_max = max;
    register float *out_min = min;
    register float *p0 = a;
    register float *p1 = b;

    asm {
        lqc2    vf15, 0(p0)
        lqc2    vf16, 0(p1)
        vmax    vf18, vf15, vf16
        vmini   vf20, vf15, vf16
        sqc2    vf18, 0(out_max)
        sqc2    vf20, 0(out_min)
    }
}

void VectorMaxMin(float *max, float *min, float *a, float *b, float *c) {
    register float *out_max = max;
    register float *out_min = min;
    register float *p0 = a;
    register float *p1 = b;
    register float *p2 = c;

    asm {
        lqc2    vf15, 0(p0)
        lqc2    vf16, 0(p1)
        lqc2    vf17, 0(p2)
        vmax    vf18, vf15, vf16
        vmini   vf20, vf15, vf16
        vmax    vf19, vf18, vf17
        vmini   vf21, vf20, vf17
        sqc2    vf19, 0(out_max)
        sqc2    vf21, 0(out_min)
    }
}

void VectorMaxMin(float *max, float *min, float *a, float *b, float *c, float *d) {
    register float *out_max = max;
    register float *out_min = min;
    register float *p0 = a;
    register float *p1 = b;
    register float *p2 = c;
    register float *p3 = d;

    asm {
        lqc2    vf15, 0(p0)
        lqc2    vf16, 0(p1)
        lqc2    vf17, 0(p2)
        lqc2    vf18, 0(p3)
        vmax    vf20, vf15, vf16
        vmini   vf21, vf15, vf16
        vmax    vf20, vf20, vf17
        vmini   vf21, vf21, vf17
        vmax    vf20, vf20, vf18
        vmini   vf21, vf21, vf18
        sqc2    vf20, 0(out_max)
        sqc2    vf21, 0(out_min)
    }
}

void PlaneNormal(float *normal, float *v0, float *v1, float *v2) {
    register float *out = normal;
    register float *p0 = v0;
    register float *p1 = v1;
    register float *p2 = v2;

    asm {
        lqc2    vf15, 0(p0)
        lqc2    vf16, 0(p1)
        lqc2    vf17, 0(p2)
        vsub    vf10, vf16, vf15
        vsub    vf11, vf17, vf15
        vopmula ACC, vf10, vf11
        vopmsub vf12, vf11, vf10
        sqc2    vf12, 0(out)
    }
}

float DistPlanePoint(float *normal, float *on_plane, float *point) {
    sceVu0FVECTOR offset;

    sceVu0SubVector(offset, point, on_plane);
    return sceVu0InnerProduct(normal, offset);
}

float ReflectionPlane(float *normal, float *on_plane, float *point, float *out) {
    sceVu0FVECTOR step;
    float distance;

    distance = 2.0f * DistPlanePoint(normal, on_plane, point);
    sceVu0ScaleVector(step, normal, -distance);
    sceVu0SubVector(out, on_plane, point);
    sceVu0SubVector(out, out, step);
    return distance;
}

int IntersectionPoint_line_poly3(float *from, float *to, float *v0, float *v1, float *v2,
                                 float *normal, float *hit) {
    sceVu0FVECTOR line;
    sceVu0FVECTOR e0;
    sceVu0FVECTOR e1;
    sceVu0FVECTOR e2;
    float above;
    float along;

    sceVu0SubVector(line, to, from);
    sceVu0SubVector(e0, v0, from);
    sceVu0SubVector(e1, v1, from);
    sceVu0SubVector(e2, v2, from);
    above = -sceVu0InnerProduct(normal, e0);
    along = sceVu0InnerProduct(normal, line);
    if (along == 0.0f)
        return 0;
    sceVu0ScaleVector(hit, line, -above / along);
    sceVu0AddVector(hit, hit, from);
    return Check_Point_Poly3_XYZ(hit, v0, v1, v2, normal);
}

int Check_Point_Poly3_XYZ(float *point, float *v0, float *v1, float *v2, float *normal) {
    sceVu0FVECTOR p0;
    sceVu0FVECTOR p1;
    sceVu0FVECTOR p2;
    sceVu0FVECTOR e0;
    sceVu0FVECTOR e1;
    sceVu0FVECTOR e2;
    sceVu0FVECTOR c0;
    sceVu0FVECTOR c1;
    sceVu0FVECTOR c2;
    float d0;
    float d1;
    float d2;

    sceVu0SubVector(p0, point, v0);
    sceVu0SubVector(p1, point, v1);
    sceVu0SubVector(p2, point, v2);
    sceVu0SubVector(e0, v1, v0);
    sceVu0SubVector(e1, v2, v1);
    sceVu0SubVector(e2, v0, v2);
    sceVu0OuterProduct(c0, e0, p0);
    sceVu0OuterProduct(c1, e1, p1);
    sceVu0OuterProduct(c2, e2, p2);
    d0 = sceVu0InnerProduct(c0, normal);
    d1 = sceVu0InnerProduct(c1, normal);
    d2 = sceVu0InnerProduct(c2, normal);
    if (d0 >= 0.0f && d1 >= 0.0f && d2 >= 0.0f)
        return 1;
    if (d0 <= 0.0f && d1 <= 0.0f && d2 <= 0.0f)
        return 1;
    return 0;
}

/* The square root leaves the Vector Unit in Q, which only a general register can be moved out of,
   so the block hands the bits over in an integer and reinterprets them where a float return value
   has to be. Both variables are the compiler's to place; the initializer is what stops it warning
   about the one nothing in C ever writes. */
float DistVector(float *v0) {
    register float *p0 = v0;
    register int root;
    register float length = 0.0f;

    asm {
        lqc2     vf4, 0(p0)
        vmul.xyz vf4, vf4, vf4
        vmr32.xy vf5, vf4
        vmr32.x  vf6, vf5
        vadd.x   vf7, vf4, vf5
        vadd.x   vf5, vf6, vf7
        vsqrt    Q, vf5x
        vwaitq
        cfc2     root, $vi22
        mtc1     root, length
    }

    return length;
}

float DistVector(float *v0, float *v1) {
    register float *p0 = v0;
    register float *p1 = v1;
    register int root;
    register float length = 0.0f;

    asm {
        lqc2     vf2, 0(p0)
        lqc2     vf3, 0(p1)
        vsub.xyz vf4, vf3, vf2
        vmul.xyz vf4, vf4, vf4
        vmr32.xy vf5, vf4
        vmr32.x  vf6, vf5
        vadd.x   vf7, vf4, vf5
        vadd.x   vf5, vf6, vf7
        vsqrt    Q, vf5x
        vwaitq
        cfc2     root, $vi22
        mtc1     root, length
    }

    return length;
}

void MulMatrix(sceVu0FMATRIX m0, sceVu0FMATRIX m1, sceVu0FMATRIX m2) {
    register float *out = (float *) m0;
    register float *left = (float *) m1;
    register float *right = (float *) m2;

    asm {
        lqc2      vf1, 0(left)
        lqc2      vf2, 16(left)
        lqc2      vf3, 32(left)
        lqc2      vf4, 48(left)
        lqc2      vf5, 0(right)
        lqc2      vf6, 16(right)
        lqc2      vf7, 32(right)
        lqc2      vf8, 48(right)
        vmulax    ACC, vf1, vf5
        vmadday   ACC, vf2, vf5
        vmaddaz   ACC, vf3, vf5
        vmaddw    vf20, vf4, vf5
        vmulax    ACC, vf1, vf6
        vmadday   ACC, vf2, vf6
        vmaddaz   ACC, vf3, vf6
        vmaddw    vf21, vf4, vf6
        vmulax    ACC, vf1, vf7
        vmadday   ACC, vf2, vf7
        vmaddaz   ACC, vf3, vf7
        vmaddw    vf22, vf4, vf7
        vmulax    ACC, vf1, vf8
        vmadday   ACC, vf2, vf8
        vmaddaz   ACC, vf3, vf8
        vmaddw    vf23, vf4, vf8
        sqc2      vf20, 0(out)
        sqc2      vf21, 16(out)
        sqc2      vf22, 32(out)
        sqc2      vf23, 48(out)
    }
}

void RotMatrixY(sceVu0FMATRIX m0, float ry) {
    register float *out = (float *) m0;
    float angle = ry;

    /* vf0 is the constant (0, 0, 0, 1), so three rotations of it are the other three rows and the
       identity costs four stores instead of sixteen. */
    asm {
        vmr32   vf1, vf0
        vmr32   vf2, vf1
        vmr32   vf3, vf2
        sqc2    vf0, 48(out)
        sqc2    vf1, 32(out)
        sqc2    vf2, 16(out)
        sqc2    vf3, 0(out)
    }

    m0[2][2] = Cosf(angle);
    m0[0][0] = m0[2][2];
    m0[2][0] = Sinf(angle);
    m0[0][2] = -m0[2][0];
}

void LookAtMatrixZ(sceVu0FMATRIX m0, float *direction) {
    sceVu0FMATRIX pitch;
    sceVu0FMATRIX yaw;
    sceVu0FVECTOR unit;
    sceVu0FVECTOR flat;
    float ground;
    float cosine;
    float sine;

    sceVu0UnitMatrix(yaw);
    sceVu0CopyMatrix(pitch, yaw);
    sceVu0Normalize(unit, direction);
    sceVu0CopyVector(flat, unit);
    flat[1] = 0.0f;
    ground = DistVector(flat);
    /* The length is measured a second time and the answer thrown away; it is a call the function
       makes, like the truncation AngleLimit repeats below. */
    DistVector(flat);
    if (ground == 0.0f) {
        cosine = 0.0f;
        sine = 1.0f;
    } else {
        cosine = unit[0] / ground;
        sine = unit[2] / ground;
    }
    pitch[1][1] = ground;
    pitch[1][2] = -unit[1];
    pitch[2][1] = unit[1];
    pitch[2][2] = ground;
    yaw[0][0] = sine;
    yaw[0][2] = -cosine;
    yaw[2][0] = cosine;
    yaw[2][2] = sine;
    MulMatrix(m0, yaw, pitch);
}

void ApplyMatrixN(sceVu0FVECTOR *out, sceVu0FMATRIX matrix, sceVu0FVECTOR *in, int count) {
    register float *dst = (float *) out;
    register float *m = (float *) matrix;
    register float *src = (float *) in;
    register int left = count;

    // clang-format off
    /* Two blocks around a label, because the loop branches back into the middle of the sequence
       and a block can only be entered at its top. */
    asm {
        addi     left, left, -1
        lqc2     vf10, 0(m)
        lqc2     vf11, 16(m)
        lqc2     vf12, 32(m)
        lqc2     vf13, 48(m)
        lqc2     vf16, 0(src)
        vnop
        vnop
        vnop
    }
row:
    asm {
        vmulax   ACC, vf10, vf16
        vmadday  ACC, vf11, vf16
        vmaddaz  ACC, vf12, vf16
        vmaddw   vf17, vf13, vf16
        addi     left, left, -1
        addi     dst, dst, 16
        addi     src, src, 16
        sqc2     vf17, -16(dst)
        lqc2     vf16, 0(src)
        vnop
        bgez     left, row
        nop
    }
    // clang-format on
}

void VectorInterpolate(float *out, float *from, float *to, float step, int mode) {
    sceVu0FVECTOR gap;
    int i;
    float size;
    float d;

    sceVu0SubVector(gap, to, from);
    switch (mode) {
        case 0:
            for (i = 0; i < 3; i++) {
                /* The signed difference and its magnitude are carried as two variables, and each
                   arm writes back the one the other arm would have changed - so the second assignment
                   stores nothing on a value that already agrees. */
                d = gap[i];
                size = d;
                if (d < 0.0f)
                    size = -d;
                else
                    d = size;

                if (size < step) {
                    out[i] = to[i];
                } else if (d < 0.0f) {
                    out[i] = from[i] - step;
                } else {
                    out[i] = from[i] + step;
                }
            }
            break;
        case 1:
            for (i = 0; i < 3; i++)
                out[i] = from[i] + gap[i] / step;
            break;
    }
}

/* Every angle in the game is radians held in (-PI, PI], and each of these puts its result back in
   that range by adding or subtracting one whole turn — once is enough because both operands are
   already in range, so a difference cannot leave it by more than a turn. */

float AngleInterpolate(float from, float to, float step, int mode) {
    float d;
    float s;
    float r;

    d = to - from;
    if (d > PI)
        d -= PI * 2.0f;
    if (d <= -PI)
        d += PI * 2.0f;
    s = 0.0f;
    if (mode == 0 && (d < 0.0f ? -d : d) < step)
        return to;
    switch (mode) {
        case 0:
            if (d < 0.0f) {
                if (step < d)
                    return to;
                s -= step;
            }
            if (d >= 0.0f) {
                if (step > d)
                    return to;
                s += step;
            }
            break;
        case 1:
            s = d / step;
            break;
    }
    r = from + s;
    if (r > PI)
        r -= PI * 2.0f;
    if (r <= -PI)
        r += PI * 2.0f;
    return r;
}

int AngleCmp(float left, float right, float slack) {
    float d;

    d = left - right;
    if (d == 0.0f)
        return 0;
    if (d > PI)
        d -= PI * 2.0f;
    if (d < -PI)
        d += PI * 2.0f;
    if (d > slack)
        return 1;
    if (d < -slack)
        return -1;
    return 0;
}

float AngleLimit(float angle) {
    float turns;
    int whole;

    if (angle < PI && angle > -PI)
        return angle;
    turns = angle / (PI * 2.0f);
    /* The first truncation is a call whose result nothing reads, and it is kept because it is one
       the function makes: each conversion in the source is its own call. */
    whole = (int) turns;
    angle -= PI * 2.0f * (int) turns;
    if (angle > PI)
        angle -= PI * 2.0f;
    if (angle < -PI)
        angle += PI * 2.0f;
    return angle;
}

float rnd() {
    return (float) rand() / 2147483648.0f;
}

float nrnd() {
    return rnd() + rnd() + rnd() + rnd() + rnd() + rnd() + rnd() + rnd() + rnd() + rnd() + rnd() + rnd() - 6.0f;
}

void CreateSinTable() {
    int i;

    sin_table_num = 1024.0f;
    sin_table_unit_1 = 162.97466f;
    for (i = 0; i < 1024; i++)
        SinTable[i] = sinf(PI * (2.0f * (float) i) / sin_table_num);
}

float Sinf(float angle) {
    if (angle >= 0.0f)
        return SinTable[(int) (angle * sin_table_unit_1) % 1024];
    return -SinTable[(int) (-angle * sin_table_unit_1) % 1024];
}

float Cosf(float angle) {
    return Sinf(PI / 2.0f + angle);
}
