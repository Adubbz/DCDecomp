#pragma once

#include "common.h"

class CVisualShadow {
public:
    /* ?ret */ void DrawVu1(unsigned int *, float (*)[4], RenderInfo *, VU1_PROGRAM, RenderInfo *, int, int); // @ 0x136290 (0x150 bytes) -- mangled: DrawVu1__13CVisualShadowFPUiPA4_fP10RenderInfo11VU1_PROGRAMP1ii
    /* ?ret */ void DrawVu1(sceVif1Packet *, float (*)[4], RenderInfo *, VU1_PROGRAM, sceVif1Packet *, int, int); // @ 0x1363E0 (0x150 bytes) -- mangled: DrawVu1__13CVisualShadowFP13sceVif1PacketPA4_fP10RenderInfo11VU1_PROGRAMP1ii
    /* ?ret */ void CreateVUdataShadow(unsigned int *, unsigned int *); // @ 0x136530 (0x310 bytes) -- mangled: CreateVUdataShadow__13CVisualShadowFPUiPUi
    /* ?ret */ void RemakeData(unsigned int *); // @ 0x136840 (0x50 bytes) -- mangled: RemakeData__13CVisualShadowFPUi
    /* ?ret */ void CreateVUdataShadowCLIP(unsigned int *, unsigned int *, RenderInfo *, float (*)[4]); // @ 0x136890 (0xB50 bytes) -- mangled: CreateVUdataShadowCLIP__13CVisualShadowFPUiPUiP10RenderInfoPA4_f
};
