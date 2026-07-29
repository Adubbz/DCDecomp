#pragma once

#include "common.h"
#include "vu1.hpp"

// Forward declarations for the types these declarations name. The skeleton
// headers are generated from the retail symbol table, which knows the type
// names but not where they live.
struct RenderInfo;
struct sceVif1Packet;


class CVisualMDTVu1 {
public:
    /* ?ret */ void SetMDTDataAddress(unsigned int *); // @ 0x134F50 (0x10 bytes) -- mangled: SetMDTDataAddress__13CVisualMDTVu1FPUi
    /* ?ret */ void GetMDTDataAddress(void); // @ 0x134F60 (0x10 bytes) -- mangled: GetMDTDataAddress__13CVisualMDTVu1Fv
    /* ?ret */ void Initialize(void); // @ 0x134F70 (0x40 bytes) -- mangled: Initialize__13CVisualMDTVu1Fv
    CVisualMDTVu1(void); // @ 0x134FB0 (0x50 bytes) -- mangled: __ct__13CVisualMDTVu1Fv
    /* ?ret */ void DrawVu1(unsigned int *, float (*)[4], RenderInfo *, VU1_PROGRAM, RenderInfo *, int, int); // @ 0x1360E0 (0x120 bytes) -- mangled: DrawVu1__13CVisualMDTVu1FPUiPA4_fP10RenderInfo11VU1_PROGRAMP1ii
    /* ?ret */ void DrawVu1(sceVif1Packet *, float (*)[4], RenderInfo *, VU1_PROGRAM, sceVif1Packet *, int, int); // @ 0x136200 (0x40 bytes) -- mangled: DrawVu1__13CVisualMDTVu1FP13sceVif1PacketPA4_fP10RenderInfo11VU1_PROGRAMP1ii
    /* ?ret */ void RemakeData(unsigned int *); // @ 0x136240 (0x50 bytes) -- mangled: RemakeData__13CVisualMDTVu1FPUi
};
