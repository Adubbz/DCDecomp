#pragma helper_mask_gpr 0x30
#pragma helper_mask_fpr 0x1000
#pragma name_counter 548

#include "frame.hpp"

#include <libgraph.h>
#include <libpkt.h>
#include <libvu0.h>

#include <cstring>

#include "collision.hpp"
#include "framevu1.hpp"
#include "mathutil.hpp"
#include "mglib.hpp"
#include "renderinfo.hpp"
#include "visualvu1.hpp"

INCLUDE_ASM("asm/nonmatchings/frame", __nw__FUiP1);
INCLUDE_ASM("asm/nonmatchings/frame", __nwa__FUiP1);
INCLUDE_ASM("asm/nonmatchings/frame", DevInit__Fv);

/* The two matrix operations the frame does often enough to spell out. Both exist in the vector
   library as calls; done inline the arithmetic costs less than the call around it would, and the
   unit's accumulator does a whole row of a multiply in one pass. The pointers are register
   variables because that is how an assembly block reaches a value the compiler is holding. */
static inline void MulFrameMatrix(sceVu0FMATRIX m0, sceVu0FMATRIX m1, sceVu0FMATRIX m2) {
    register float *out = &m0[0][0];
    register float *left = &m1[0][0];
    register float *right = &m2[0][0];

    asm {
        lqc2    vf5, 0(right)
        lqc2    vf1, 0(left)
        lqc2    vf2, 16(left)
        lqc2    vf3, 32(left)
        lqc2    vf4, 48(left)
        vmulax  ACC, vf1, vf5
        vmadday ACC, vf2, vf5
        vmaddaz ACC, vf3, vf5
        vmaddw  vf20, vf4, vf5
        lqc2    vf6, 16(right)
        lqc2    vf7, 32(right)
        lqc2    vf8, 48(right)
        vmulax  ACC, vf1, vf6
        vmadday ACC, vf2, vf6
        vmaddaz ACC, vf3, vf6
        vmaddw  vf21, vf4, vf6
        vmulax  ACC, vf1, vf7
        vmadday ACC, vf2, vf7
        vmaddaz ACC, vf3, vf7
        vmaddw  vf22, vf4, vf7
        vmulax  ACC, vf1, vf8
        vmadday ACC, vf2, vf8
        vmaddaz ACC, vf3, vf8
        vmaddw  vf23, vf4, vf8
        sqc2    vf20, 0(out)
        sqc2    vf21, 16(out)
        sqc2    vf22, 32(out)
        sqc2    vf23, 48(out)
    }
}

/* vf0's w is the constant one, which is what lets the row that carries the translation go through
   the same multiply as the three the scale applies to. */
static inline void ScaleMatrix(sceVu0FMATRIX m0, sceVu0FMATRIX m1, sceVu0FVECTOR scale) {
    register float *out = &m0[0][0];
    register float *in = &m1[0][0];
    register float *by = &scale[0];

    asm {
        lqc2    vf10, 0(by)
        lqc2    vf1, 0(in)
        lqc2    vf2, 16(in)
        lqc2    vf3, 32(in)
        lqc2    vf4, 48(in)
        vmulx   vf1, vf1, vf10
        vmuly   vf2, vf2, vf10
        vmulz   vf3, vf3, vf10
        vmulw   vf4, vf4, vf0
        sqc2    vf1, 0(out)
        sqc2    vf2, 16(out)
        sqc2    vf3, 32(out)
        sqc2    vf4, 48(out)
    }
}

/* A whole matrix in four quadwords, held in four registers so that none of the loads waits on a
   store. Written out because the same copy spelled in C costs a fresh address for every row: the
   compiler pairs each load with its store and recomputes the source, which is three instructions
   more and no faster. */
static inline void CopyMatrix(sceVu0FMATRIX m0, sceVu0FMATRIX m1) {
    register float *in = &m1[0][0];
    register float *out = &m0[0][0];

    asm {
        lq      $6, 0(in)
        lq      $7, 16(in)
        lq      $8, 32(in)
        lq      $9, 48(in)
        sq      $6, 0(out)
        sq      $7, 16(out)
        sq      $8, 32(out)
        sq      $9, 48(out)
    }
}

/* vf15 minus itself is the zero the unit already has, so wiping a matrix costs one arithmetic
   instruction and four stores rather than a constant to load. */
static inline void ZeroMatrix(sceVu0FMATRIX m0) {
    register float *out = &m0[0][0];

    asm {
        vsub    vf15, vf15, vf15
        sqc2    vf15, 0(out)
        sqc2    vf15, 16(out)
        sqc2    vf15, 32(out)
        sqc2    vf15, 48(out)
    }
}

/* The screen extent of eight already-transformed corners. Each is divided through by the magnitude
   of its own depth, so a corner behind the camera folds onto the side it came from instead of
   changing sign, and the eight results are reduced to one pair of extremes. It is written as one
   block because the divider is what costs: every division is issued a whole quadword of work
   before its result is waited on, which is what the interleaving here is for. */
static inline void ScreenBound(sceVu0FVECTOR *screen, sceVu0FVECTOR max, sceVu0FVECTOR min) {
    register float *in = &screen[0][0];
    register float *hi = &max[0];
    register float *lo = &min[0];

    asm {
        lqc2    vf10, 0(in)
        lqc2    vf11, 16(in)
        lqc2    vf12, 32(in)
        lqc2    vf13, 48(in)
        vabs.z  vf20, vf10
        vabs.z  vf21, vf11
        vabs.z  vf22, vf12
        vabs.z  vf23, vf13
        vdiv    Q, vf0w, vf20z
        lqc2    vf14, 64(in)
        lqc2    vf15, 80(in)
        lqc2    vf16, 96(in)
        lqc2    vf17, 112(in)
        vwaitq
        vmulq.xy vf10, vf10, Q
        vdiv    Q, vf0w, vf21z
        vabs.z  vf24, vf14
        vabs.z  vf25, vf15
        vabs.z  vf26, vf16
        vabs.z  vf27, vf17
        vwaitq
        vmulq.xy vf11, vf11, Q
        vdiv    Q, vf0w, vf22z
        vwaitq
        vmulq.xy vf12, vf12, Q
        vdiv    Q, vf0w, vf23z
        vmax    vf30, vf10, vf11
        vmini   vf31, vf10, vf11
        vwaitq
        vmulq.xy vf13, vf13, Q
        vmax    vf30, vf30, vf12
        vmini   vf31, vf31, vf12
        vdiv    Q, vf0w, vf24z
        vwaitq
        vmulq.xy vf14, vf14, Q
        vdiv    Q, vf0w, vf25z
        vmax    vf30, vf30, vf13
        vmini   vf31, vf31, vf13
        vwaitq
        vmulq.xy vf15, vf15, Q
        vdiv    Q, vf0w, vf26z
        vmax    vf30, vf30, vf14
        vmini   vf31, vf31, vf14
        vwaitq
        vmulq.xy vf16, vf16, Q
        vdiv    Q, vf0w, vf27z
        vmax    vf30, vf30, vf15
        vmini   vf31, vf31, vf15
        vmax    vf30, vf30, vf16
        vmini   vf31, vf31, vf16
        vwaitq
        vmulq.xy vf17, vf17, Q
        vnop
        vnop
        vmax    vf30, vf30, vf17
        vmini   vf31, vf31, vf17
        sqc2    vf30, 0(hi)
        sqc2    vf31, 0(lo)
    }
}

/* The rotation a frame carries is stored as a quaternion whose scalar part comes first, so the
   caller's four floats are w, x, y, z in that order. */
static void QuatToMat(float *quaternion, sceVu0FMATRIX matrix) {
    float wx;
    float wy;
    float wz;
    float xx;
    float yy;
    float yz;
    float xy;
    float xz;
    float zz;
    float x2;
    float y2;
    float z2;

    x2 = quaternion[1] + quaternion[1];
    y2 = quaternion[2] + quaternion[2];
    z2 = quaternion[3] + quaternion[3];

    xx = quaternion[1] * x2;
    xy = quaternion[1] * y2;
    xz = quaternion[1] * z2;
    yy = quaternion[2] * y2;
    yz = quaternion[2] * z2;
    zz = quaternion[3] * z2;
    wx = quaternion[0] * x2;
    wy = quaternion[0] * y2;
    wz = quaternion[0] * z2;

    matrix[0][0] = 1.0f - (yy + zz);
    matrix[1][0] = xy - wz;
    matrix[2][0] = xz + wy;
    matrix[3][0] = 0.0f;

    matrix[0][1] = xy + wz;
    matrix[1][1] = 1.0f - (xx + zz);
    matrix[2][1] = yz - wx;
    matrix[3][1] = 0.0f;

    matrix[0][2] = xz - wy;
    matrix[1][2] = yz + wx;
    matrix[2][2] = 1.0f - (xx + yy);
    matrix[3][2] = 0.0f;

    matrix[0][3] = 0.0f;
    matrix[1][3] = 0.0f;
    matrix[2][3] = 0.0f;
    matrix[3][3] = 1.0f;
}

void CFrameAttr::Initialize() {
    unk_04 = 0.0f;
    unk_0D = unk_0B = unk_08 = unk_0A = unk_09 = unk_0C = 0;
    unk_10 = 0.0f;
    unk_14 = 0;
    color[0] = color[1] = color[2] = color[3] = 128.0f;
    unk_50 = -1;
    draw_on = 1;
    unk_54 = 1;
    unk_55 = 0;
    unk_56 = 0;
    unk_58 = 0;
    unk_52 = 0;
    unk_30 = 1;
    unk_31 = 0;
    unk_40[0] = unk_40[2] = unk_40[3] = 0.0f;
    unk_40[1] = 1.0f;
}

CFrameAttr::CFrameAttr() {
    Initialize();
}

void CFrame::Initialize() {
    int i;

    world_valid = 0;
    no_rotation = 1;

    parent = child = brother = elder = 0;

    scale[0] = scale[1] = scale[2] = scale[3] = 1.0f;
    position[0] = position[1] = position[2] = position[3] = 0.0f;
    rotation[0] = rotation[1] = rotation[2] = rotation[3] = 0.0f;

    max[0] = max[1] = max[2] = 0.0f;
    min[0] = min[1] = min[2] = 0.0f;

    sceVu0UnitMatrix(world);
    sceVu0UnitMatrix(inverse);
    sceVu0UnitMatrix(local);

    for (i = 0; i < 8; i++) {
        corner[i][0] = 0.0f;
        corner[i][1] = 0.0f;
        corner[i][2] = 0.0f;
        corner[i][3] = 1.0f;
    }

    attr.Initialize();

    flags = 1;
    collision = 0;
    name[0] = '\0';
    rot_type = 0;
    srt = 0;
    reference = 0;
}

void CFrame::SetPosition(float x, float y, float z) {
    srt = 1;

    if (position[0] == x && position[1] == y && position[2] == z) {
        return;
    }

    position[0] = x;
    position[1] = y;
    position[2] = z;
    world_valid = 0;
}

void CFrame::SetPosition(float *position) {
    srt = 1;

    if (this->position[0] == position[0] && this->position[1] == position[1] && this->position[2] == position[2]) {
        return;
    }

    this->position[0] = position[0];
    this->position[1] = position[1];
    this->position[2] = position[2];
    world_valid = 0;
}

void CFrame::SetScale(float x, float y, float z) {
    if (scale[0] == x && scale[1] == y && scale[2] == z) {
        return;
    }

    scale[0] = x;
    scale[1] = y;
    scale[2] = z;
    world_valid = 0;
}

void CFrame::SetScale(float *scale) {
    if (this->scale[0] == scale[0] && this->scale[1] == scale[1] && this->scale[2] == scale[2]) {
        return;
    }

    this->scale[0] = scale[0];
    this->scale[1] = scale[1];
    this->scale[2] = scale[2];
    world_valid = 0;
}

int CFrame::GetFrameNum() {
    int num;
    CFrame *frame;

    num = 1;

    for (frame = child; frame != 0; frame = frame->brother) {
        num += frame->GetFrameNum();
    }

    return num;
}

void CFrame::SetParent(CFrame *parent) {
    if (this->parent != 0) {
        return;
    }

    this->parent = parent;

    if (parent == 0) {
        return;
    }

    parent->SetChild(this);
}

void CFrame::SetBrother(CFrame *brother) {
    if (brother == 0) {
        return;
    }

    if (this->brother != 0) {
        this->brother->SetBrother(brother);
        return;
    }

    this->brother = brother;
    this->brother->elder = this;
}

void CFrame::SetChild(CFrame *child) {
    if (child == 0) {
        this->child = 0;
        return;
    }

    if (this->child != 0) {
        this->child->SetBrother(child);
        return;
    }

    this->child = child;
    this->child->parent = this;
}

void CFrame::SetReference(CFrame *reference) {
    if (reference == 0) {
        return;
    }

    parent = reference;
    this->reference = 1;
}

void CFrame::DeleteReference() {
    parent = 0;
    reference = 0;
}

/* The frame's world matrix, rebuilt unless the cache and every cache above it in the chain are
   still current. Rebuilding one invalidates the caches of the frame's children, since their
   world matrices were composed with the matrix that just changed. */
void CFrame::GetLWMatrix(sceVu0FMATRIX matrix) {
    sceVu0FMATRIX parent_world;
    sceVu0FMATRIX local;
    sceVu0FVECTOR translation;
    CFrame *frame;
    CFrame *child;

    /* A referenced frame follows a frame that is not its parent, so nothing on that frame's side
       clears this cache when it moves and it can never be trusted. */
    if (reference) {
        world_valid = 0;
    }

    if (world_valid) {
        if (!parent) {
            sceVu0CopyMatrix(matrix, world);
            return;
        }
        frame = parent;
        while (frame) {
            if (!frame->world_valid) {
                break;
            }
            frame = frame->parent;
            if (!frame) {
                sceVu0CopyMatrix(matrix, world);
                return;
            }
        }
    }

    if (this->child) {
        this->child->world_valid = 0;
        child = this->child;
        if (child->brother) {
            while (child->brother) {
                child->brother->world_valid = 0;
                child = child->brother;
            }
        }
    }

    if (srt) {
        ScaleMatrix(local, this->local, scale);

        /* Rotation type 2 turns about the frame's own origin rather than the parent's, so the
           translation is taken out before the rotation and added back after it. */
        if (rot_type & 2) {
            sceVu0CopyVector(translation, local[3]);
            local[3][0] = local[3][1] = local[3][2] = 0.0f;
        }
        if (rot_type & 1) {
            if (rotation[0] != 0.0f) {
                sceVu0RotMatrixX(local, local, rotation[0]);
            }
            if (rotation[1] != 0.0f) {
                sceVu0RotMatrixY(local, local, rotation[1]);
            }
            if (rotation[2] != 0.0f) {
                sceVu0RotMatrixZ(local, local, rotation[2]);
            }
        }
        if (rot_type & 2) {
            sceVu0AddVector(local[3], translation, position);
        } else {
            sceVu0AddVector(local[3], local[3], position);
        }
    } else {
        sceVu0CopyMatrix(local, this->local);
    }

    frame = parent;
    if (!frame) {
        sceVu0CopyMatrix(world, local);
        sceVu0CopyMatrix(matrix, world);
        world_valid = 1;
        return;
    }

    if (frame->attr.unk_58) {
        sceVu0CopyMatrix(parent_world, frame->world);
    } else {
        frame->GetLWMatrix(parent_world);
    }
    MulFrameMatrix(world, parent_world, local);
    sceVu0CopyMatrix(matrix, world);
    world_valid = 1;
}

float (*CFrame::GetInverseMatrix())[4] {
    sceVu0FMATRIX world;

    GetLWMatrix(world);
    sceVu0InversMatrix(inverse, world);

    return inverse;
}

void CFrame::SetTransMatrix(sceVu0FMATRIX matrix) {
    sceVu0CopyMatrix(local, matrix);
    world_valid = 0;
}

/* A quaternion says nothing about where the frame is, so the translation row of the local matrix
   has to survive being overwritten by the rotation it produces. */
void CFrame::SetTransMatrix(float *quaternion) {
    sceVu0FVECTOR translation;

    world_valid = 0;
    *(u_long128 *) translation = *(u_long128 *) local[3];
    QuatToMat(quaternion, local);
    *(u_long128 *) local[3] = *(u_long128 *) translation;
}

/* Only the stem before a "__" identifies a frame, so both sides are measured to it first and a
   difference in stem length settles the answer without comparing a character. */
static int StrCmp(char *left, char *right) {
    char *l;
    char *r;
    char c;
    int nl;
    int nr;
    int i;

    l = left;
    r = right;
    nl = 0;
    nr = 0;

    while ((c = *l) != '\0') {
        if (c == '_' && l[1] == '_') {
            break;
        }
        nl++;
        l++;
    }

    while ((c = *r) != '\0') {
        if (c == '_' && r[1] == '_') {
            break;
        }
        nr++;
        r++;
    }

    if (nl != nr) {
        return 0;
    }

    for (i = 0; i < nl; i++) {
        if (*left != *right) {
            return 0;
        }
        left++;
        right++;
    }

    return 1;
}

int FrameNameComp(char *left, char *right) {
    return StrCmp(left, right);
}

CFrame *CFrame::SearchFrame(char *name) {
    CFrame *frame;
    CFrame *found;

    if (StrCmp(this->name, name)) {
        return this;
    }

    for (frame = child; frame != 0; frame = frame->brother) {
        found = frame->SearchFrame(name);
        if (found != 0) {
            return found;
        }
    }

    return 0;
}

/* Without a parent the frame's own extent is already in the space the caller wants; with one it is
   the eight corners run through the local transform, which is why the corners are kept at all. */
void CFrame::GetBoundBox(CBoxVu0 *box, int children) {
    sceVu0FVECTOR low;
    sceVu0FVECTOR high;
    sceVu0FVECTOR point;
    CBoxVu0 child_box;
    CFrame *frame;
    int i;

    low[0] = min[0];
    low[1] = min[1];
    low[2] = min[2];
    low[3] = 1.0f;

    high[0] = max[0];
    high[1] = max[1];
    high[2] = max[2];
    high[3] = 1.0f;

    if (parent == 0) {
        sceVu0CopyVector(box->min, low);
        sceVu0CopyVector(box->max, high);
    } else {
        sceVu0ApplyMatrix(box->max, local, corner[0]);
        sceVu0CopyVector(box->min, box->max);

        for (i = 1; i < 8; i++) {
            sceVu0ApplyMatrix(point, local, corner[i]);
            VectorMaxMin(box->max, box->min, point, box->max, box->min);
        }
    }

    if (children == 0) {
        return;
    }

    for (frame = child; frame != 0; frame = frame->brother) {
        frame->GetBoundBox(&child_box, 1);
        VectorMaxMin(box->max, box->min, box->max, box->min, child_box.max, child_box.min);
    }
}

/* Scaling about the centre rather than the origin, so a bound stays where the frame is. */
void CFrame::ScaleBoundBox(float *scale) {
    sceVu0FVECTOR center;
    sceVu0FVECTOR dmax;
    sceVu0FVECTOR dmin;
    sceVu0FVECTOR max;
    sceVu0FVECTOR min;
    float *corner[2];
    int i;

    max[0] = this->max[0];
    max[1] = this->max[1];
    max[2] = this->max[2];

    min[0] = this->min[0];
    min[1] = this->min[1];
    min[2] = this->min[2];

    sceVu0AddVector(center, max, min);
    sceVu0ScaleVector(center, center, 0.5f);
    sceVu0SubVector(dmax, max, center);
    sceVu0SubVector(dmin, min, center);

    dmax[0] *= scale[0];
    dmax[1] *= scale[1];
    dmax[2] *= scale[2];

    dmin[0] *= scale[0];
    dmin[1] *= scale[1];
    dmin[2] *= scale[2];

    sceVu0AddVector(max, dmax, center);
    sceVu0AddVector(min, dmin, center);

    this->max[0] = max[0];
    this->max[1] = max[1];
    this->max[2] = max[2];

    this->min[0] = min[0];
    this->min[1] = min[1];
    this->min[2] = min[2];

    corner[0] = this->min;
    corner[1] = this->max;

    for (i = 0; i < 8; i++) {
        this->corner[i][3] = 1.0f;
        this->corner[i][0] = corner[(i & 1) != 0][0];
        this->corner[i][1] = corner[(i & 2) != 0][1];
        this->corner[i][2] = corner[(i & 4) != 0][2];
    }
}

void CFrame::SetAttr(CFrameAttr &attr, int children, int mask) {
    CFrame *frame;

    if (mask == 0) {
        this->attr = attr;
    } else {
        if (mask & 0x1) {
            this->attr.draw_on = attr.draw_on;
        }
        if (mask & 0x2) {
            this->attr.unk_04 = attr.unk_04;
        }
        if (mask & 0x4) {
            this->attr.unk_08 = attr.unk_08;
        }
        if (mask & 0x8) {
            this->attr.unk_09 = attr.unk_09;
        }
        if (mask & 0x10) {
            this->attr.unk_0A = attr.unk_0A;
        }
        if (mask & 0x20) {
            this->attr.unk_0B = attr.unk_0B;
        }
        if (mask & 0x40) {
            this->attr.unk_0C = attr.unk_0C;
        }
        if (mask & 0x80) {
            this->attr.unk_0D = attr.unk_0D;
        }
        if (mask & 0x100) {
            this->attr.unk_10 = attr.unk_10;
        }
        if (mask & 0x200) {
            this->attr.unk_14 = attr.unk_14;
        }
        if (mask & 0x400) {
            *(u_long128 *) this->attr.color = *(u_long128 *) attr.color;
        }
        if (mask & 0x800) {
            this->attr.unk_50 = attr.unk_50;
        }
        if (mask & 0x1000) {
            this->attr.unk_54 = attr.unk_54;
        }
        if (mask & 0x2000) {
            this->attr.unk_56 = attr.unk_56;
        }
        if (mask & 0x4000) {
            this->attr.unk_58 = attr.unk_58;
        }
        if (mask & 0x8000) {
            this->attr.unk_52 = attr.unk_52;
        }
        if (mask & 0x10000) {
            this->attr.unk_55 = attr.unk_55;
        }
    }

    if (children == 0) {
        return;
    }

    for (frame = child; frame != 0; frame = frame->brother) {
        frame->SetAttr(attr, 1, mask);
    }
}

void CFrame::GetWorldPosition(float *world, float *local) {
    sceVu0FMATRIX matrix;

    local[3] = 1.0f;
    GetLWMatrix(matrix);
    sceVu0ApplyMatrix(world, matrix, local);
}

void CFrame::SetRotation(float x, float y, float z) {
    srt = 1;
    no_rotation = 0;
    rotation[3] = 0.0f;

    if (rotation[0] == x && rotation[1] == y && rotation[2] == z) {
        return;
    }

    world_valid = 0;
    rot_type |= 1;
    rotation[0] = x;
    rotation[1] = y;
    rotation[2] = z;
}

void CFrame::GetRotation(float *rotation) {
    if (no_rotation != 0) {
        rotation[0] = rotation[1] = rotation[2] = rotation[3] = 0.0f;
        return;
    }

    sceVu0CopyVector(rotation, this->rotation);
}

void CFrame::SetRotType(int type) {
    rot_type = type;

    if (type & 0x2) {
        rot_type |= 1;
    }
}

/* A copied frame is a frame of its own: it keeps the transform and the attributes and none of the
   place in the hierarchy the original held. */
CFrame &CFrame::operator=(CFrame &other) {
    memcpy(this, &other, sizeof(CFrame));

    parent = child = brother = 0;
    world_valid = 0;
    no_rotation = 0;

    return *this;
}

/* The shadow the frame casts is a plane projection, and the plane is carried as a point and a
   normal rather than as four coefficients. Both are turned into one vector d with x.d == 1 over the
   plane, which is what lets the projection be written without a division per point. A plane through
   the origin has no such vector, so a point that lands there is pushed a tenth of a unit back along
   the normal instead of failing. */
static void ShadowMatrix(sceVu0FMATRIX matrix, sceVu0FMATRIX light, float *point, float *normal) {
    sceVu0FVECTOR direction;
    sceVu0FVECTOR plane;
    sceVu0FVECTOR axis;
    float dx;
    float dy;
    float dz;
    float nx;
    float ny;
    float nz;
    float depth;
    float scale;
    float t;

    direction[0] = light[0][0];
    direction[1] = light[1][0];
    direction[2] = light[2][0];
    direction[3] = 0.0f;

    sceVu0CopyVector(plane, point);
    sceVu0CopyVector(axis, normal);

    t = sceVu0InnerProduct(axis, plane);

    if (t == 0.0f) {
        plane[0] -= 0.1f * axis[0];
        plane[1] -= 0.1f * axis[1];
        plane[2] -= 0.1f * axis[2];
        t = sceVu0InnerProduct(axis, plane);
    }

    t = 1.0f / t;
    dx = axis[0] * t;
    dy = axis[1] * t;
    dz = axis[2] * t;

    sceVu0Normalize(direction, direction);

    nx = direction[0];
    ny = direction[1];
    nz = direction[2];

    depth = dx * nx + dy * ny + dz * nz;
    scale = -1.0f / depth;

    matrix[0][0] = scale * (dx * nx - depth);
    matrix[1][0] = scale * (dy * nx);
    matrix[2][0] = scale * (dz * nx);
    matrix[3][0] = scale * -nx;
    matrix[0][1] = scale * (dx * ny);
    matrix[1][1] = scale * (dy * ny - depth);
    matrix[2][1] = scale * (dz * ny);
    matrix[3][1] = scale * -ny;
    matrix[0][2] = scale * (dx * nz);
    matrix[1][2] = scale * (dy * nz);
    matrix[2][2] = scale * (dz * nz - depth);
    matrix[3][2] = scale * -nz;
    matrix[0][3] = 0.0f;
    matrix[1][3] = 0.0f;
    matrix[2][3] = 0.0f;
    matrix[3][3] = scale * -depth;
}

/* The shadow doubles the volume a frame has to be clipped against: what is drawn is the box that
   holds both the frame's own corners and the same corners flattened onto the plane, so the two
   sets are reduced to one bound and that bound's own corners go to the screen. */
static void ShadowClipBox(sceVu0FVECTOR *screen, sceVu0FVECTOR *corner, sceVu0FMATRIX matrix,
                          RenderInfo *info) {
    sceVu0FMATRIX shadow;
    sceVu0FVECTOR flat[8];
    sceVu0FVECTOR world[8];
    /* Only two of these are ever filled. The frame reserves 64 bytes for the array, which is
       what rules two out, and nothing addresses the pair beyond. */
    sceVu0FVECTOR extent[4];
    sceVu0FVECTOR max[4];
    sceVu0FVECTOR min[4];
    int i;

    ApplyMatrixN(world, matrix, corner, 8);
    MulFrameMatrix(shadow, info->shadow, matrix);
    ApplyMatrixN(flat, shadow, corner, 8);

    VectorMaxMin(max[0], min[0], world[0], world[1], world[2], world[3]);
    VectorMaxMin(max[1], min[1], world[4], world[5], world[6], world[7]);
    VectorMaxMin(max[2], min[2], flat[0], flat[1], flat[2], flat[3]);
    VectorMaxMin(max[3], min[3], flat[4], flat[5], flat[6], flat[7]);
    VectorMax(extent[0], max[0], max[1], max[2], max[3]);
    VectorMin(extent[1], min[0], min[1], min[2], min[3]);

    for (i = 0; i < 8; i++) {
        world[i][3] = 1.0f;
        world[i][0] = extent[(i & 1) != 0][0];
        world[i][1] = extent[(i & 2) != 0][1];
        world[i][2] = extent[(i & 4) != 0][2];
    }

    ApplyMatrixN(screen, info->view_scaled, world, 8);
}

/* The three registers a frame is drawn under, written straight into a word cursor the caller
   already holds rather than through a packet: one counted DMA tag, a DIRECT code, and a GIF tag of
   three A+D pairs. The answer is the number of words written, not quadwords. */
static int SetGsReg3(u_int *p, u_long *test, u_long *zbuf, u_long *alpha) {
    p[0] = 0x10000005;
    p[1] = 0;
    p[2] = 0;
    p[3] = 0;
    p[4] = 0;
    p[5] = 0;
    p[6] = 0;
    p[7] = 0x50000004;
    p[8] = 0x00008001;
    p[9] = 0x30000000;
    p[10] = 0x00000eee;
    p[11] = 0;
    *(u_long *) (p + 12) = *test;
    p[14] = SCE_GS_TEST_1;
    p[15] = 0;
    *(u_long *) (p + 16) = *zbuf;
    p[18] = SCE_GS_ZBUF_1;
    p[19] = 0;
    *(u_long *) (p + 20) = *alpha;
    p[22] = SCE_GS_ALPHA_1;
    p[23] = 0;

    return 24;
}

/* A frame draws its own visual and then its children's, into a cursor the caller owns rather than
   into a packet, and answers how many words it spent - which is what lets a whole hierarchy go into
   one packet without anybody counting for it.

   Four things happen in order. The world matrix is either asked for or, for a frame the attributes
   turn towards the camera, built here from the camera's position and the axis lengths of the one
   the hierarchy would have given. The bound's eight corners go to the screen and decide whether
   anything is drawn at all. The GS registers the attributes ask for go down the packet and are put
   back after. And the light the frame supplies itself, where it does, replaces the scene's for the
   length of its own draw and no longer.

   A frame turned towards the camera cannot take its transform from the hierarchy, so it writes its
   own into the cache and invalidates its children's - which is the one place a draw moves anything.
   Its children then take the cached matrix as it stands, because the attribute that turns the
   frame is also what GetLWMatrix reads on a parent to mean exactly that. */
int CFrameVu1::DrawVu1(unsigned int *packet, RenderInfo *info) {
    u_int *start = packet;
    sceVu0FMATRIX matrix;
    sceVu0FMATRIX screen_matrix;
    sceVu0FMATRIX turn;
    sceVu0FMATRIX light;
    sceVu0FVECTOR ambient;
    sceVu0FVECTOR direction;
    sceVu0FVECTOR position;
    sceVu0FVECTOR origin = {0.0f, 0.0f, 0.0f, 1.0f};
    sceVu0FVECTOR corner[8];
    sceVu0FMATRIX world;
    sceVu0FVECTOR max;
    sceVu0FVECTOR min;
    sceVu0FVECTOR color;
    int near_clip = 0;
    int far_clip = 0;
    int visible = 1;
    sceGsTest test = mgPixelTest;
    sceGsZbuf zbuf = mgZBuffer;
    sceGsAlpha alpha;
    CFrame *child;
    CFrame *frame;
    float height;
    float x;
    float y;
    float z;
    float scale;
    float flat;
    float half_width;
    float half_height;
    float near_z;
    float far_z;
    float depth;
    int done;

    if (attr.unk_58) {
        world_valid = 0;
        GetWorldPosition(position, origin);
        GetLWMatrix(world);
        x = DistVector(world[0]);
        y = DistVector(world[1]);
        z = DistVector(world[2]);

        if ((attr.unk_58 & 2) && !(attr.unk_58 & 1)) {
            sceVu0CopyMatrix(matrix, mgUnitMatrix);
            sceVu0SubVector(matrix[2], info->view_position, position);
            matrix[2][1] = 0.0f;
            matrix[2][3] = 0.0f;
            sceVu0Normalize(matrix[2], matrix[2]);
            matrix[0][0] = matrix[2][2];
            matrix[0][2] = -matrix[2][0];
        }

        if ((attr.unk_58 & 2) && (attr.unk_58 & 1)) {
            sceVu0UnitMatrix(turn);
            sceVu0SubVector(direction, info->view_position, position);
            sceVu0Normalize(direction, direction);
            height = direction[1];
            direction[1] = 0.0f;
            direction[3] = 0.0f;
            flat = DistVector(direction);
            turn[1][1] = flat;
            turn[1][2] = -height;
            turn[2][1] = height;
            turn[2][2] = flat;

            sceVu0CopyMatrix(matrix, mgUnitMatrix);
            sceVu0SubVector(matrix[2], info->view_position, position);
            matrix[2][1] = 0.0f;
            matrix[2][3] = 0.0f;
            sceVu0Normalize(matrix[2], matrix[2]);
            matrix[0][0] = matrix[2][2];
            matrix[0][2] = -matrix[2][0];

            MulFrameMatrix(matrix, matrix, turn);
        }

        sceVu0ScaleVector(matrix[0], matrix[0], x);
        sceVu0ScaleVector(matrix[1], matrix[1], y);
        sceVu0ScaleVector(matrix[2], matrix[2], z);
        matrix[3][0] = position[0];
        matrix[3][1] = position[1];
        matrix[3][2] = position[2];
        CopyMatrix(this->world, matrix);

        if (this->child) {
            this->child->world_valid = 0;
            child = this->child;
            if (child->brother) {
                while (child->brother) {
                    child->brother->world_valid = 0;
                    child = child->brother;
                }
            }
        }
        world_valid = 1;
    } else {
        GetLWMatrix(matrix);
    }

    if (!(attr.draw_on & 1) && (attr.draw_on & 2)) {
        return 0;
    }

    if (info->unk_320) {
        ShadowMatrix(info->shadow, info->light_direction, info->shadow_point,
                     info->shadow_normal);
    }

    if (visual && attr.draw_on && attr.unk_30) {
        MulFrameMatrix(screen_matrix, info->view_scaled, matrix);
        scale = 1.0f / info->scale[0];
        done = 0;

        if (info->unk_320) {
            ShadowClipBox(corner, this->corner, matrix, info);
            ScreenBound(corner, max, min);
        } else {
            ApplyMatrixN(corner, screen_matrix, this->corner, 8);
            ScreenBound(corner, max, min);
        }

        near_z = info->near[2];
        far_z = info->unk_31C;

        while (done == 0) {
            visible = 0;

            if (attr.unk_0A) {
                half_width = 2.0f * (320.0f * scale);
                half_height = 2.0f * (112.0f * scale);
            } else {
                half_width = 320.0f * scale;
                half_height = 112.0f * scale;
            }

            if (min[0] > half_width) {
                break;
            }
            if (max[0] < -half_width) {
                break;
            }
            if (min[1] > half_height) {
                break;
            }
            if (max[1] < -half_height) {
                break;
            }
            if (max[2] < near_z) {
                break;
            }
            if (min[2] < far_z) {
                near_clip = 8;
            }

            depth = 0.96f * (2048.0f * scale);

            if (min[2] > near_z && max[0] < depth && min[0] > -depth && max[1] < depth && min[1] > -depth) {
                far_clip = 8;
            }

            visible = 1;
            break;
        }
    }

    info->unk_31C = attr.unk_04;
    info->unk_314 = (near_clip && far_clip < 8) && (attr.unk_08 || info->scissoring);
    info->unk_324 = attr.unk_0C;
    info->unk_33C = attr.unk_56;
    info->unk_310 = 0;

    if (far_clip < 8 || attr.unk_0A) {
        info->unk_310 |= 1;
    }
    if (attr.unk_0A) {
        visible = 1;
    }
    if (info->unk_314) {
        info->unk_310 |= 2;
    }
    if (attr.unk_0B) {
        info->unk_310 |= 4;
    }

    if (visual && visible && attr.draw_on) {
        if (!info->unk_320) {
            if (attr.unk_50 >= 0) {
                test.bits.aref = attr.unk_50;
            }
            if (attr.unk_55) {
                test.bits.zte = 1;
                test.bits.ztst = 1;
            }

            zbuf.bits.zmsk = !attr.unk_54;

            alpha = mgAlpha;

            if (attr.unk_52 != 0) {
                if (attr.unk_52 > 0) {
                    alpha.bits.a = 0;
                    alpha.bits.b = 2;
                    alpha.bits.c = 0;
                    alpha.bits.d = 1;
                }
                if (attr.unk_52 < 0) {
                    alpha.bits.a = 2;
                    alpha.bits.b = 0;
                    alpha.bits.c = 0;
                    alpha.bits.d = 1;
                }
            }

            packet += SetGsReg3(packet, (u_long *) &test, (u_long *) &zbuf, (u_long *) &alpha);
        }

        if (attr.unk_14 || attr.unk_31) {
            if (attr.unk_31) {
                color[0] = info->light_color[0][0];
                color[1] = info->light_color[0][1];
                color[2] = info->light_color[0][2];
                sceVu0CopyMatrix(light, info->light_direction);
                ZeroMatrix(info->light_direction);
                *(u_long128 *) ambient = *(u_long128 *) info->ambient;
                info->ambient[0] += 0.3f * color[0];
                info->ambient[1] += 0.3f * color[1];
                info->ambient[2] += 0.3f * color[2];
            } else {
                sceVu0CopyMatrix(light, info->light_direction);
                ZeroMatrix(info->light_direction);
                *(u_long128 *) ambient = *(u_long128 *) info->ambient;
                info->ambient[0] = attr.color[0];
                info->ambient[1] = attr.color[1];
                info->ambient[2] = attr.color[2];
            }
        }

        if (attr.unk_0A) {
            visual->RemakeData(0);
        }
        attr.unk_0A = 0;

        packet += visual->DrawVu1(packet, matrix, info, VU1_PROGRAM_UNKNOWN6, 0, 0, 0);

        if (attr.unk_14 || attr.unk_31) {
            sceVu0CopyMatrix(info->light_direction, light);
            *(u_long128 *) info->ambient = *(u_long128 *) ambient;
        }

        if (!info->unk_320) {
            packet += SetGsReg3(packet, (u_long *) &mgPixelTest, (u_long *) &mgZBuffer,
                                (u_long *) &mgAlpha);
        }
    }

    if (!(attr.draw_on & 2)) {
        for (frame = this->child; frame; frame = frame->brother) {
            if (frame->attr.draw_on & 4) {
                continue;
            }
            packet += frame->DrawVu1(packet, info);
        }
    }

    return packet - start;
}

/* The same draw against a packet the SDK is tracking rather than a bare cursor: the packet is
   closed so that its current word is a legal place to write, the draw is handed that word, and the
   packet is told afterwards how much of it went.

   The word buffer is reserved and never reached, and the cursor is what reserves it: a local
   whose address nothing takes costs no stack at all. */
int CFrameVu1::DrawVu1(sceVif1Packet *packet, RenderInfo *info) {
    int count;
    u_int work[128];
    u_int *current = work;

    sceVif1PkTerminate(packet);
    count = DrawVu1(packet->pCurrent, info);
    sceVif1PkReserve(packet, count);

    return count;
}

void CFrame::SetCollision(CCollision *collision) {
    this->collision = collision;
}

int CFrame::DrawVu1(unsigned int *packet, RenderInfo *info) {
    return 0;
}

int CFrame::DrawVu1(sceVif1Packet *packet, RenderInfo *info) {
    return 0;
}

CFrame::CFrame() {
    CFrame::Initialize();
}

void CFrameVu1::SetVisual(CVisualVu1 *visual) {
    this->visual = visual;
}

CVisualVu1 *CFrameVu1::GetVisual() {
    return visual;
}

void CFrameVu1::Initialize() {
    CFrame::Initialize();
    visual = 0;
}

CFrameVu1::CFrameVu1() {
    CFrameVu1::Initialize();
}

/* Exactly what the compiler would have generated, and declared all the same - which is what makes
   assigning one of these a call at every use instead of the base call and one word copied in
   line. */
CFrameVu1 &CFrameVu1::operator=(CFrameVu1 &other) {
    CFrame::operator=(other);
    visual = other.visual;

    return *this;
}

/* The matrix every polygon of one pick-up is transformed by, parked in the unit's registers once
   instead of being reloaded per triangle. */
static void pre_trance_normal(sceVu0FMATRIX matrix) {
    register float *m = &matrix[0][0];

    asm {
        lqc2    vf10, 0(m)
        lqc2    vf11, 16(m)
        lqc2    vf12, 32(m)
        lqc2    vf13, 48(m)
    }
}

/* A triangle through that matrix, and its plane normal rebuilt afterwards rather than transformed:
   the collision answers in its own space and a normal does not survive a transform the way a point
   does. */
static void trance_normal(float *p0, float *p1, float *p2, float *plane) {
    register float *a = p0;
    register float *b = p1;
    register float *c = p2;
    register float *normal = plane;

    asm {
        lqc2    vf16, 0(a)
        lqc2    vf17, 16(a)
        lqc2    vf18, 32(a)
        vmulax  ACC, vf10, vf16
        vmadday ACC, vf11, vf16
        vmaddaz ACC, vf12, vf16
        vmaddw  vf16, vf13, vf16
        vmulax  ACC, vf10, vf17
        vmadday ACC, vf11, vf17
        vmaddaz ACC, vf12, vf17
        vmaddw  vf17, vf13, vf17
        vmulax  ACC, vf10, vf18
        vmadday ACC, vf11, vf18
        vmaddaz ACC, vf12, vf18
        vmaddw  vf18, vf13, vf18
        vsub    vf20, vf17, vf16
        vsub    vf21, vf18, vf16
        sqc2    vf16, 0(a)
        sqc2    vf17, 0(b)
        sqc2    vf18, 0(c)
        vnop
        vopmula ACC, vf20, vf21
        vopmsub vf22, vf21, vf20
        sqc2    vf22, 0(normal)
    }
}

/* The polygons of this frame's collision, and of every frame under it, that reach into a bound the
   caller gives in world space. The bound is carried the other way instead of the geometry: it is
   eight corners through the inverse of this frame's transform and then their extent, so the
   collision is searched in its own space and only what comes back is transformed. */
int CFrame::PickUpNearPoly(CCPoly *poly, const CBoxVu0 &box) {
    sceVu0FVECTOR corner[8];
    sceVu0FVECTOR local[8];
    sceVu0FVECTOR max0;
    sceVu0FVECTOR min0;
    sceVu0FVECTOR max1;
    sceVu0FVECTOR min1;
    sceVu0FVECTOR extent[2];
    sceVu0FMATRIX world;
    CBoxVu0 bound;
    CCPoly *found;
    float (*inverse)[4];
    int num;
    CFrame *frame;
    int i;

    found = poly;
    num = 0;

    if (flags == 4) {
        return 0;
    }

    if (collision != 0 && (flags & 1)) {
        GetLWMatrix(world);
        inverse = GetInverseMatrix();

        *(u_long128 *) extent[0] = *(u_long128 *) box.min;
        *(u_long128 *) extent[1] = *(u_long128 *) box.max;

        for (i = 0; i < 8; i++) {
            corner[i][3] = 1.0f;
            corner[i][0] = extent[(i & 1) != 0][0];
            corner[i][1] = extent[(i & 2) != 0][1];
            corner[i][2] = extent[(i & 4) != 0][2];
        }

        ApplyMatrixN(local, inverse, corner, 8);
        VectorMaxMin(max0, min0, local[0], local[1], local[2], local[3]);
        VectorMaxMin(max1, min1, local[4], local[5], local[6], local[7]);
        VectorMaxMin(bound.max, bound.min, max0, max1, min0, min1);

        num = collision->PickUpNearPoly(poly, bound);

        found = poly;
        pre_trance_normal(world);

        for (i = 0; i < num; i++, found++) {
            trance_normal(found->vertex[0], found->vertex[1], found->vertex[2],
                          found->normal);
        }
    }

    if ((flags & 2) == 0) {
        for (frame = child; frame != 0; frame = frame->brother) {
            if (flags & 4) {
                continue;
            }
            num += frame->PickUpNearPoly(found, box);
            found = poly + num;
        }
    }

    return num;
}
