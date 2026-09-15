#pragma once

#include "common.h"

#include "vu1.hpp"

// Forward declarations for the types these declarations name. The skeleton
// headers are generated from the retail symbol table, which knows the type
// names but not where they live.
struct RenderInfo;
struct sceVif1Packet;

/**
 * Draws a model's shadow volume, standing in for the model's own visual on the
 * shadow pass.
 */
class CVisualShadow {
public:
    /**
     * Draws the model, building and lending it a clipped shadow packet on the
     * shadow pass.
     *
     * @mangled DrawVu1__13CVisualShadowFPUiPA4_fP10RenderInfo11VU1_PROGRAMP1ii
     * @address 0x136290
     * @size 0x14C
     */
    int DrawVu1(unsigned int *packet, float (*matrix)[4], RenderInfo *info, VU1_PROGRAM program,
                RenderInfo *parent_info, int first, int count);

    /**
     * Draws the model into a VIF packet, building and lending it a clipped
     * shadow packet on the shadow pass.
     *
     * @mangled DrawVu1__13CVisualShadowFP13sceVif1PacketPA4_fP10RenderInfo11VU1_PROGRAMP1ii
     * @address 0x1363E0
     * @size 0x144
     */
    int DrawVu1(sceVif1Packet *packet, float (*matrix)[4], RenderInfo *info, VU1_PROGRAM program,
                sceVif1Packet *parent_packet, int first, int count);

    /**
     * Writes the shadow geometry of one model into a packet and gives back its
     * size in quadwords.
     *
     * @mangled CreateVUdataShadow__13CVisualShadowFPUiPUi
     * @address 0x136530
     * @size 0x304
     */
    int CreateVUdataShadow(unsigned int *packet, unsigned int *model);

    /**
     * Rebuilds shadow VU data and returns its size in quadwords, or zero if no MDT model is retained.
     *
     * @mangled RemakeData__13CVisualShadowFPUi
     * @address 0x136840
     * @size 0x48
     */
    int RemakeData(unsigned int *packet);

    /**
     * Writes the shadow geometry of one model into a packet, dropping what the
     * view does not reach, and gives back its size in quadwords.
     *
     * @mangled CreateVUdataShadowCLIP__13CVisualShadowFPUiPUiP10RenderInfoPA4_f
     * @address 0x136890
     * @size 0xB48
     */
    int CreateVUdataShadowCLIP(unsigned int *packet, unsigned int *model, RenderInfo *info,
                               float (*matrix)[4]);
};
