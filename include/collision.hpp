#pragma once

#include "common.h"

#include <libvu0.h>

struct MDT_HEADER;

/**
 * Holds the maximum and minimum corners of an axis-aligned bound.
 */
class CBoxVu0 {
public:
    sceVu0FVECTOR max; /**< Greater extent on each axis. */
    sceVu0FVECTOR min; /**< Lesser extent on each axis. */
};

/**
 * Stores the opaque metadata associated with a collision triangle.
 */
class CCPolyInfo {
public:
    float unk_00;
    float unk_04;
    float unk_08;
    float unk_0c;
};

/**
 * Stores a collision triangle, its plane normal, and its associated metadata.
 */
class CCPoly {
public:
    sceVu0FVECTOR vertex[3];
    sceVu0FVECTOR normal;

    union {
        CCPolyInfo info;

        struct {
            s16 ground_kind; /**< What the surface is made of. */
            s16 foot_sound;  /**< Sound the character's feet play on it. */
            s16 unk_44;      /**< Light or ambience the surface puts the character in. */
            u8 unk_46[10];
        } attr;
    };
} __attribute__((aligned(16)));

/**
 * Pairs a collision triangle with its axis-aligned bounding box.
 */
class CCPolyBox {
public:
    CCPoly poly;
    CBoxVu0 box;
};

/**
 * Provides the common query interface and bounds for collision geometry.
 */
class CCollision {
public:
    sceVu0FVECTOR max;
    sceVu0FVECTOR min;

    virtual int GetPolygon(int index, sceVu0FMATRIX v0, sceVu0FMATRIX v1, sceVu0FMATRIX v2);
    virtual int GetMaxY(float *position);
    virtual sceVu0FVECTOR *GetVertexAddress(int *count);
    virtual int Intersection(float *from, float *to, float *hit);
    virtual int PickUpNearPoly(CCPoly *poly, float *position, float radius);
    virtual int PickUpNearPoly(CCPoly *poly, const CBoxVu0 &box);
    virtual int PickUpNearPoly(CCPoly *poly);
    virtual void Initialize();

    void CreateBBox();
};

/**
 * Implements collision queries over geometry stored in an MDT resource.
 */
class CCollisionMDT : public CCollision {
public:
    /* The same three fields Initialize clears, cleared again here because construction cannot
       reach a virtual of its own class. */
    CCollisionMDT() {
        data = 0;
        mesh = 0;
        num = 0;
    }

    virtual int GetPolygon(int index, sceVu0FMATRIX v0, sceVu0FMATRIX v1, sceVu0FMATRIX v2);
    virtual int GetMaxY(float *position);
    virtual sceVu0FVECTOR *GetVertexAddress(int *count);
    virtual int Intersection(float *from, float *to, float *hit);
    virtual int PickUpNearPoly(CCPoly *poly, float *position, float radius);
    virtual int PickUpNearPoly(CCPoly *poly, const CBoxVu0 &box);
    virtual int PickUpNearPoly(CCPoly *poly);
    virtual void Initialize();

    MDT_HEADER *data;
    CCPolyBox *mesh; /**< Bounded polygons the collision tests against. */
    int num;
};

STATIC_ASSERT(sizeof(CCPoly) == 0x50);
STATIC_ASSERT(sizeof(CBoxVu0) == 0x20);

/**
 * Reports whether a ray meets any polygon of a set, and where.
 *
 * @mangled CheckHit__FP6CCPolyiPfPfPfii
 * @address 0x149D50
 * @size 0x324
 * @unknownret
 */
int CheckHit(CCPoly *polys, int count, float *from, float *to, float *hit, int mask, int flags);

/**
 * Finds the collision polygon under a point, and the one above it.
 *
 * @mangled GetFootPoly__FPffP6CCPolyPfP6CCPolyii
 * @address 0x14ABB0
 * @size 0x1DC
 * @unknownret
 */
int GetFootPoly(float *position, float height, CCPoly *polys, float *ground, CCPoly *found, int count, int flags);

