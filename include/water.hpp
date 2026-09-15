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

    s32 rows;      /**< Grid rows the surface is divided into. */
    s32 columns;   /**< Grid columns the surface is divided into. */
    float *height; /**< Wave heights the surface currently draws from. */
    float *height_a; /**< First of the two wave-height buffers. */
    float *height_b; /**< Second of the two wave-height buffers. */
    sceVu0FVECTOR vertex[4]; /**< The four corners of the surface. */
    s32 unk_060;
    float unk_064;
    float unk_068;
    CVisualPolyVu1 visual; /**< Draws the polygons of the surface. */
    u8 color[4];           /**< Red, green, blue and alpha channels of the surface. */
    float wave_speed; /**< Speed the ripples travel across the grid at. */
    float damping;    /**< Rate the ripples lose height at. */
    float unk_09C;
    float unk_0A0;
    s32 unk_0A4;
    CFrameVu1 frame; /**< Places and draws the water surface. */

    /**
     * Stores the four parameters the ripple simulation runs on.
     *
     * @mangled SetParam__6CWaterFffff
     * @address 0x1607A0
     * @size 0x18
     */
    void SetParam(float wave_speed, float damping, float unknown0, float unknown1);

    /**
     * Sets the red, green, blue and alpha channels of the surface.
     *
     * @mangled SetColor__6CWaterFUcUcUcUc
     * @address 0x1607C0
     * @size 0x18
     */
    void SetColor(unsigned char red, unsigned char green, unsigned char blue, unsigned char alpha);

    /**
     * Builds the vector-unit packet that draws the surface, one quad per grid
     * cell.
     *
     * @mangled CreateVUData__6CWaterFPUiP10RenderInfo
     * @address 0x1607E0
     * @size 0x740
     */
    void CreateVUData(unsigned int *packet, RenderInfo *info);

    /**
     * Draws the surface through the vector unit.
     *
     * @mangled DrawVu1__6CWaterFP10RenderInfoP13sceVif1PacketP1
     * @address 0x160F20
     * @size 0x1DC
     */
    void DrawVu1(RenderInfo *info, sceVif1Packet *packet, RenderInfo *parent_info);

    /**
     * Clips the surface against the view using the world-space box its four
     * corners span.
     *
     * @mangled CheckClip__6CWaterFv
     * @address 0x161100
     * @size 0xC4
     */
    void CheckClip(void);

    /**
     * Advances the ripples one step, writing into whichever of the two height
     * buffers is not being drawn.
     *
     * @mangled Hamon__6CWaterFv
     * @address 0x1611D0
     * @size 0x108
     */
    void Hamon(void);

    /**
     * Copies four corner positions into the water surface.
     *
     * @mangled SetVertex__6CWaterFPfPfPfPf
     * @address 0x1612E0
     * @size 0x84
     */
    void SetVertex(float *corner0, float *corner1, float *corner2, float *corner3);

    /**
     * Raises one interior grid cell, starting a ripple from it.
     *
     * @mangled Shake__6CWaterFiif
     * @address 0x161370
     * @size 0x9C
     */
    void Shake(int row, int column, float height_change);

    /**
     * Gives the surface its grid size and takes the two height buffers out of
     * an arena.
     *
     * @mangled SetSize__6CWaterFiiP14CDataAlloc2_1_
     * @address 0x161410
     * @size 0x1A4
     */
    void SetSize(int rows, int columns, CDataAlloc2<1> *arena);

    /**
     * Clears the grid, gives the surface a half-bright white and sets the
     * ripple constants.
     *
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
