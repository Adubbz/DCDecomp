#pragma once

#include "common.h"
#include "vu1.hpp"

// Forward declarations for the types these declarations name. The skeleton
// headers are generated from the retail symbol table, which knows the type
// names but not where they live.
struct RenderInfo;
class CDataAlloc2_1_;
struct MDT_HEADER;
struct sceVif1Packet;


class CCloth {
public:
    /* ?ret */ void Draw(void); // @ 0x13B640 (0x160 bytes) -- mangled: Draw__6CClothFv
    /* ?ret */ void Clear(void); // @ 0x13B7A0 (0x100 bytes) -- mangled: Clear__6CClothFv
    /* ?ret */ void Step(int); // @ 0x13B8A0 (0xBD0 bytes) -- mangled: Step__6CClothFi
    /* ?ret */ void DrawVu1(unsigned int *, float (*)[4], RenderInfo *, VU1_PROGRAM, RenderInfo *, int, int); // @ 0x13C470 (0xC0 bytes) -- mangled: DrawVu1__6CClothFPUiPA4_fP10RenderInfo11VU1_PROGRAMP1ii
    /* ?ret */ void DrawVu1(sceVif1Packet *, float (*)[4], RenderInfo *, VU1_PROGRAM, sceVif1Packet *, int, int); // @ 0x13C530 (0xC0 bytes) -- mangled: DrawVu1__6CClothFP13sceVif1PacketPA4_fP10RenderInfo11VU1_PROGRAMP1ii
    /* ?ret */ void CreateVUData(unsigned int *); // @ 0x13C5F0 (0x3C0 bytes) -- mangled: CreateVUData__6CClothFPUi
    /* ?ret */ void InitParam(void); // @ 0x13C9B0 (0x1C0 bytes) -- mangled: InitParam__6CClothFv
    CCloth(int, int, float); // @ 0x13CB70 (0x80 bytes) -- mangled: __ct__6CClothFiif
    /* ?ret */ void Initialize(CDataAlloc2_1_ *); // @ 0x13CBF0 (0x460 bytes) -- mangled: Initialize__6CClothFP14CDataAlloc2_1_
    /* ?ret */ void Initialize(MDT_HEADER *, CDataAlloc2_1_ *); // @ 0x13D050 (0x200 bytes) -- mangled: Initialize__6CClothFP10MDT_HEADERP14CDataAlloc2_1_
};
