#pragma once

#include "common.h"
#include "vu1.hpp"

// Forward declarations for the types these declarations name. The skeleton
// headers are generated from the retail symbol table, which knows the type
// names but not where they live.
struct RenderInfo;
struct sceVif1Packet;


class CVisualVu1 {
public:
    /* ?ret */ void RemakeData(unsigned int *); // @ 0x134BB0 (0x10 bytes) -- mangled: RemakeData__10CVisualVu1FPUi
    /* ?ret */ void DrawVu1(sceVif1Packet *, float (*)[4], RenderInfo *, VU1_PROGRAM, sceVif1Packet *, int, int); // @ 0x134BC0 (0xD0 bytes) -- mangled: DrawVu1__10CVisualVu1FP13sceVif1PacketPA4_fP10RenderInfo11VU1_PROGRAMP1ii
    /* ?ret */ void Initialize(void); // @ 0x134EC0 (0x40 bytes) -- mangled: Initialize__10CVisualVu1Fv
    CVisualVu1(void); // @ 0x134F00 (0x50 bytes) -- mangled: __ct__10CVisualVu1Fv
    /* ?ret */ void DrawVu1(unsigned int *, float (*)[4], RenderInfo *, VU1_PROGRAM, RenderInfo *, int, int); // @ 0x135000 (0x970 bytes) -- mangled: DrawVu1__10CVisualVu1FPUiPA4_fP10RenderInfo11VU1_PROGRAMP1ii
    /* ?ret */ void CreateVUdataFromMDT(unsigned int *, unsigned int *, int, int); // @ 0x135AA0 (0x3B0 bytes) -- mangled: CreateVUdataFromMDT__10CVisualVu1FPUiPUiii
    /* ?ret */ void CreateVUdataFromMDTRemake(unsigned int *, unsigned int *, int); // @ 0x135E50 (0x290 bytes) -- mangled: CreateVUdataFromMDTRemake__10CVisualVu1FPUiPUii
};

class CVisual {
public:
    /* ?ret */ void Initialize(void); // @ 0x134B50 (0x10 bytes) -- mangled: Initialize__7CVisualFv
    CVisual(void); // @ 0x134B60 (0x50 bytes) -- mangled: __ct__7CVisualFv
};
