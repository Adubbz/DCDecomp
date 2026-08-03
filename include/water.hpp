#pragma once

#include "common.h"

struct RenderInfo;
struct sceVif1Packet;
class CDataAlloc2_1_; /* disassembler's filesystem-safe spelling of CDataAlloc2<1> (dataalloc.hpp) */

class CWater {
public:
    /**
     * @mangled SetParam__6CWaterFffff
     * @address 0x1607A0
     * @size 0x20
     * @unknownret
     */
    void SetParam(float, float, float, float);

    /**
     * @mangled SetColor__6CWaterFUcUcUcUc
     * @address 0x1607C0
     * @size 0x20
     * @unknownret
     */
    void SetColor(unsigned char, unsigned char, unsigned char, unsigned char);

    /**
     * @mangled CreateVUData__6CWaterFPUiP10RenderInfo
     * @address 0x1607E0
     * @size 0x740
     * @unknownret
     */
    void CreateVUData(unsigned int *, RenderInfo *);

    /**
     * @mangled DrawVu1__6CWaterFP10RenderInfoP13sceVif1PacketP1
     * @address 0x160F20
     * @size 0x1E0
     * @unknownret
     */
    void DrawVu1(RenderInfo *, sceVif1Packet *, RenderInfo *);

    /**
     * @mangled CheckClip__6CWaterFv
     * @address 0x161100
     * @size 0xD0
     * @unknownret
     */
    void CheckClip(void);

    /**
     * @mangled Hamon__6CWaterFv
     * @address 0x1611D0
     * @size 0x110
     * @unknownret
     */
    void Hamon(void);

    /**
     * @mangled SetVertex__6CWaterFPfPfPfPf
     * @address 0x1612E0
     * @size 0x90
     * @unknownret
     */
    void SetVertex(float *, float *, float *, float *);

    /**
     * @mangled Shake__6CWaterFiif
     * @address 0x161370
     * @size 0xA0
     * @unknownret
     */
    void Shake(int, int, float);

    /**
     * @mangled SetSize__6CWaterFiiP14CDataAlloc2_1_
     * @address 0x161410
     * @size 0x1B0
     * @unknownret
     */
    void SetSize(int, int, CDataAlloc2_1_ *);

    /**
     * @mangled __ct__6CWaterFv
     * @address 0x1615C0
     * @size 0x90
     */
    CWater(void);
};
