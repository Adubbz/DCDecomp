#pragma once

#include "common.h"

#include <libvu0.h>

#include "dataalloc.hpp"
#include "mdt.hpp"
#include "visualvu1.hpp"

class CBound;
class CFrame;

/**
 * Simulates and draws a fixed-capacity grid of cloth vertices.
 */
class CCloth : public CVisualVu1 {
public:
    int visual_unk_10;
    int visual_unk_14;
    u_int *visual_vu_data;
    u_int visual_vu_size;
    int unk_20;
    u_int *vu_block[2]; /**< VU packet data for each display buffer. */
    int num_i;          /**< Number of active grid rows. */
    int num_j;          /**< Number of active grid columns. */
    float pitch;        /**< Rest spacing between adjacent vertices. */
    int stop;
    CFrame *frame; /**< Frame from which the cloth hangs. */
    int unk_30;
    CBound *bound;
    int floor_on;
    float floor_y;
    void *wind;
    float wind_effect;
    float normal_scale;
    MDT_MATERIAL material;
    sceVu0FVECTOR gravity;
    sceVu0FVECTOR follow;
    sceVu0FVECTOR stiffness;
    sceVu0FVECTOR last_position;
    sceVu0FVECTOR position;
    sceVu0FVECTOR home[16][16];
    sceVu0FVECTOR point[16][16];
    sceVu0FVECTOR last[16][16];
    sceVu0FVECTOR rest[16][16];
    sceVu0FVECTOR speed[16][16];
    sceVu0FVECTOR normal_grid[16][16];
    sceVu0FVECTOR texture_coord[16][16];
    int polygon_divide[16];
    int mask[16][16];
    sceVu0FVECTOR world_home[16][16];

    /**
     * Draws the simulated cloth through a temporary world-space frame.
     *
     * @mangled Draw__6CClothFv
     * @address 0x13B640
     * @size 0x160
     */
    void Draw();

    void Clear();
    void Step(int step);
    int CreateVUData(u_int *packet);
    void InitParam();

    /**
     * Constructs a cloth grid with the requested dimensions and spacing.
     *
     * @mangled __ct__6CClothFiif
     * @address 0x13CB70
     * @size 0x80
     */
    CCloth(int num_i = 16, int num_j = 16, float pitch = 1.0f);

    virtual void Initialize(CDataAlloc2<1> *alloc);
    virtual void Initialize(MDT_HEADER *header, CDataAlloc2<1> *alloc);
    virtual int DrawVu1(u_int *packet, float (*matrix)[4], RenderInfo *info,
                        VU1_PROGRAM program, RenderInfo *unknown, int arg1, int arg2);
    virtual int DrawVu1(sceVif1Packet *packet, float (*matrix)[4], RenderInfo *info,
                        VU1_PROGRAM program, sceVif1Packet *unknown, int arg1, int arg2);
};
