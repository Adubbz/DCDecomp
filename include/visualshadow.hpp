#pragma once

#include "common.h"
#include "vu1.hpp"

// Forward declarations for the types these declarations name. The skeleton
// headers are generated from the retail symbol table, which knows the type
// names but not where they live.
struct RenderInfo;
struct sceVif1Packet;


class CVisualShadow {
public:
    /**
     * @mangled DrawVu1__13CVisualShadowFPUiPA4_fP10RenderInfo11VU1_PROGRAMP1ii
     * @address 0x136290
     * @size 0x150
     * @unknownret
     */
    void DrawVu1(unsigned int *, float (*)[4], RenderInfo *, VU1_PROGRAM, RenderInfo *, int, int);

    /**
     * @mangled DrawVu1__13CVisualShadowFP13sceVif1PacketPA4_fP10RenderInfo11VU1_PROGRAMP1ii
     * @address 0x1363E0
     * @size 0x150
     * @unknownret
     */
    void DrawVu1(sceVif1Packet *, float (*)[4], RenderInfo *, VU1_PROGRAM, sceVif1Packet *, int, int);

    /**
     * @mangled CreateVUdataShadow__13CVisualShadowFPUiPUi
     * @address 0x136530
     * @size 0x310
     * @unknownret
     */
    void CreateVUdataShadow(unsigned int *, unsigned int *);

    /**
     * @mangled RemakeData__13CVisualShadowFPUi
     * @address 0x136840
     * @size 0x50
     * @unknownret
     */
    void RemakeData(unsigned int *);

    /**
     * @mangled CreateVUdataShadowCLIP__13CVisualShadowFPUiPUiP10RenderInfoPA4_f
     * @address 0x136890
     * @size 0xB50
     * @unknownret
     */
    void CreateVUdataShadowCLIP(unsigned int *, unsigned int *, RenderInfo *, float (*)[4]);
};
