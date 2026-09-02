#pragma once

#include "common.h"

#include <libvu0.h>

#include "frame.hpp"
#include "framevu1.hpp"
#include "visualvu1.hpp"

struct RenderInfo;
struct sceVif1Packet;
template <int Kind>
class CDataAlloc2; /* disassembler's filesystem-safe spelling of CDataAlloc2<1> (dataalloc.hpp) */

/**
 * Draws the water surface of one map part.
 */
class CWater {
public:
    /**
     * Copies one surface over another, field by field.
     *
     * @mangled __as__6CWaterFR6CWater
     * @address 0x143260
     * @size 0xF4
     * @unknownret
     */
    CWater &operator=(CWater &);

    s32 unk_000;
    s32 unk_004;
    s32 unk_008;
    float unk_00C;
    float unk_010;
    sceVu0FVECTOR vertex[4]; /**< The four corners of the surface. */
    s32 unk_060;
    float unk_064;
    float unk_068;
    CVisualPolyVu1 visual; /**< Draws the polygons of the surface. */
    float unk_090;
    float unk_094;
    float unk_098;
    float unk_09C;
    float unk_0A0;
    s32 unk_0A4;
    CFrameVu1 frame; /**< Places and draws the water surface. */

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
    void SetSize(int, int, CDataAlloc2<1> *);

    /**
     * @mangled __ct__6CWaterFv
     * @address 0x1615C0
     * @size 0x90
     */
    CWater(void);
};

STATIC_ASSERT(sizeof(CWater) == 0x320);

/* Retail's name for CWater::DrawVu1 spells its last parameter with a CodeWarrior
 * back-reference that MWCC 2.3.3 does not emit, so the member function above
 * cannot carry it. Declared here as it stands instead, for the callers that
 * have to reach it. */
extern "C" void DrawVu1__6CWaterFP10RenderInfoP13sceVif1PacketP1(CWater *water, RenderInfo *render_info,
                                                                 sceVif1Packet *packet, void *unk);
