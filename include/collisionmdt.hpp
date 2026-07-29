#pragma once

#include "common.h"

// Forward declarations for the types these declarations name. The skeleton
// headers are generated from the retail symbol table, which knows the type
// names but not where they live.
class CBoxVu0;
class CCPoly;


class CCollisionMDT {
public:
    /* ?ret */ void GetPolygon(int, float (*)[4], float (*)[4], float (*)[4]); // @ 0x124EC0 (0x50 bytes) -- mangled: GetPolygon__13CCollisionMDTFiPA4_fPA4_fPA4_f
    /* ?ret */ void GetMaxY(float *); // @ 0x124F10 (0x210 bytes) -- mangled: GetMaxY__13CCollisionMDTFPf
    /* ?ret */ void Intersection(float *, float *, float *); // @ 0x125120 (0x3D0 bytes) -- mangled: Intersection__13CCollisionMDTFPfPfPf
    /* ?ret */ void GetVertexAddress(int *); // @ 0x1254F0 (0x50 bytes) -- mangled: GetVertexAddress__13CCollisionMDTFPi
    /* ?ret */ void PickUpNearPoly(CCPoly *, float *, float); // @ 0x125540 (0x180 bytes) -- mangled: PickUpNearPoly__13CCollisionMDTFP6CCPolyPff
    /* ?ret */ void PickUpNearPoly(CCPoly *, const CBoxVu0 &); // @ 0x1256C0 (0x1F0 bytes) -- mangled: PickUpNearPoly__13CCollisionMDTFP6CCPolyRC7CBoxVu0
    /* ?ret */ void PickUpNearPoly(CCPoly *); // @ 0x1258B0 (0xC0 bytes) -- mangled: PickUpNearPoly__13CCollisionMDTFP6CCPoly
};

class CCollision {
public:
    /* ?ret */ void CreateBBox(void); // @ 0x124D50 (0x160 bytes) -- mangled: CreateBBox__10CCollisionFv
};
