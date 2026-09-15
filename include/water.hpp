#pragma once

#include "common.h"

#include "dataalloc_fwd.hpp"

#include <libvu0.h>

#include "frame.hpp"
#include "framevu1.hpp"
#include "visualvu1.hpp"

struct RenderInfo;
struct sceVif1Packet;

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
    u8 color[4];           /**< Red, green, blue and alpha channels of the surface. */
    float unk_094;
    float unk_098;
    float unk_09C;
    float unk_0A0;
    s32 unk_0A4;
    CFrameVu1 frame; /**< Places and draws the water surface. */

    /**
     * @mangled SetParam__6CWaterFffff
     * @address 0x1607A0
     * @size 0x18
     * Stores the four parameters used by the water simulation.
     */
    void SetParam(float, float, float, float);

    /**
     * @mangled SetColor__6CWaterFUcUcUcUc
     * @address 0x1607C0
     * @size 0x18
     * Sets the red, green, blue and alpha channels of the surface.
     */
    void SetColor(unsigned char red, unsigned char green, unsigned char blue, unsigned char alpha);

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
     * @size 0x1DC
     * @unknownret
     */
    void DrawVu1(RenderInfo *, sceVif1Packet *, RenderInfo *);

    /**
     * @mangled CheckClip__6CWaterFv
     * @address 0x161100
     * @size 0xC4
     * @unknownret
     */
    void CheckClip(void);

    /**
     * @mangled Hamon__6CWaterFv
     * @address 0x1611D0
     * @size 0x108
     * @unknownret
     */
    void Hamon(void);

    /**
     * Copies four corner positions into the water surface.
     *
     * @mangled SetVertex__6CWaterFPfPfPfPf
     * @address 0x1612E0
     * @size 0x84
     */
    void SetVertex(float *, float *, float *, float *);

    /**
     * @mangled Shake__6CWaterFiif
     * @address 0x161370
     * @size 0x9C
     * @unknownret
     */
    void Shake(int, int, float);

    /**
     * @mangled SetSize__6CWaterFiiP14CDataAlloc2_1_
     * @address 0x161410
     * @size 0x1A4
     * @unknownret
     */
    void SetSize(int, int, CDataAlloc2<1> *);

    /**
     * @mangled __ct__6CWaterFv
     * @address 0x1615C0
     * @size 0x8C
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
