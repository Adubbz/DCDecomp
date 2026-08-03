#pragma once

#include "common.h"

// Forward declarations for the types these declarations name. The skeleton
// headers are generated from the retail symbol table, which knows the type
// names but not where they live.
class CBoxVu0;
class CCPoly;


class CCollisionMDT {
public:
    /**
     * @mangled GetPolygon__13CCollisionMDTFiPA4_fPA4_fPA4_f
     * @address 0x124EC0
     * @size 0x50
     * @unknownret
     */
    void GetPolygon(int, float (*)[4], float (*)[4], float (*)[4]);

    /**
     * @mangled GetMaxY__13CCollisionMDTFPf
     * @address 0x124F10
     * @size 0x210
     * @unknownret
     */
    void GetMaxY(float *);

    /**
     * @mangled Intersection__13CCollisionMDTFPfPfPf
     * @address 0x125120
     * @size 0x3D0
     * @unknownret
     */
    void Intersection(float *, float *, float *);

    /**
     * @mangled GetVertexAddress__13CCollisionMDTFPi
     * @address 0x1254F0
     * @size 0x50
     * @unknownret
     */
    void GetVertexAddress(int *);

    /**
     * @mangled PickUpNearPoly__13CCollisionMDTFP6CCPolyPff
     * @address 0x125540
     * @size 0x180
     * @unknownret
     */
    void PickUpNearPoly(CCPoly *, float *, float);

    /**
     * @mangled PickUpNearPoly__13CCollisionMDTFP6CCPolyRC7CBoxVu0
     * @address 0x1256C0
     * @size 0x1F0
     * @unknownret
     */
    void PickUpNearPoly(CCPoly *, const CBoxVu0 &);

    /**
     * @mangled PickUpNearPoly__13CCollisionMDTFP6CCPoly
     * @address 0x1258B0
     * @size 0xC0
     * @unknownret
     */
    void PickUpNearPoly(CCPoly *);
};

class CCollision {
public:
    /**
     * @mangled CreateBBox__10CCollisionFv
     * @address 0x124D50
     * @size 0x160
     * @unknownret
     */
    void CreateBBox(void);
};
