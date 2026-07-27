#pragma once

#include "common.h"

struct RenderInfo;
struct sceVif1Packet;
class CDataAlloc2_1_; /* disassembler's filesystem-safe spelling of CDataAlloc2<1> (dataalloc.hpp) */

class CWater {
public:
    /* ?ret */ void SetParam(float, float, float, float); // @ 0x1607A0 (0x20 bytes) -- mangled: SetParam__6CWaterFffff
    /* ?ret */ void SetColor(unsigned char, unsigned char, unsigned char, unsigned char); // @ 0x1607C0 (0x20 bytes) -- mangled: SetColor__6CWaterFUcUcUcUc
    /* ?ret */ void CreateVUData(unsigned int *, RenderInfo *); // @ 0x1607E0 (0x740 bytes) -- mangled: CreateVUData__6CWaterFPUiP10RenderInfo
    /* ?ret */ void DrawVu1(RenderInfo *, sceVif1Packet *, RenderInfo *); // @ 0x160F20 (0x1E0 bytes) -- mangled: DrawVu1__6CWaterFP10RenderInfoP13sceVif1PacketP1
    /* ?ret */ void CheckClip(void); // @ 0x161100 (0xD0 bytes) -- mangled: CheckClip__6CWaterFv
    /* ?ret */ void Hamon(void); // @ 0x1611D0 (0x110 bytes) -- mangled: Hamon__6CWaterFv
    /* ?ret */ void SetVertex(float *, float *, float *, float *); // @ 0x1612E0 (0x90 bytes) -- mangled: SetVertex__6CWaterFPfPfPfPf
    /* ?ret */ void Shake(int, int, float); // @ 0x161370 (0xA0 bytes) -- mangled: Shake__6CWaterFiif
    /* ?ret */ void SetSize(int, int, CDataAlloc2_1_ *); // @ 0x161410 (0x1B0 bytes) -- mangled: SetSize__6CWaterFiiP14CDataAlloc2_1_
    CWater(void); // @ 0x1615C0 (0x90 bytes) -- mangled: __ct__6CWaterFv
};
