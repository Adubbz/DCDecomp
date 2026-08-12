#pragma once

#include "common.h"

// Forward declarations for the types these declarations name. The skeleton
// headers are generated from the retail symbol table, which knows the type
// names but not where they live.
class CCamera;
class CTexture;


/**
 * Draws a fire that gives off light in every direction, and the raster that it
 * casts on the floor.
 */
class CFireOmni {
public:
    s32 unk_00;
    s32 unk_04;
    s32 unk_08;
    float unk_0C;
    s32 unk_10;
    s32 unk_14;
    s16 unk_18;
    s16 unk_1A;
    s32 unk_1C;
    float pos[4]; /**< World position that the fire draws at. */
    s32 unk_30;
    s32 unk_34;
    s32 unk_38;
    s32 unk_3C;

    /**
     * @mangled __ct__9CFireOmniFv
     * @address 0x161650
     * @size 0xA0
     */
    CFireOmni(void);

    /**
     * @mangled FireStep__9CFireOmniFv
     * @address 0x1616F0
     * @size 0xD0
     * @unknownret
     */
    void FireStep(void);

    /**
     * @mangled FireCreate__9CFireOmniFv
     * @address 0x1617C0
     * @size 0x2E0
     * @unknownret
     */
    void FireCreate(void);

    /**
     * @mangled SetTexture__9CFireOmniFP8CTextureP8CTexture
     * @address 0x161AA0
     * @size 0x20
     * @unknownret
     */
    void SetTexture(CTexture *, CTexture *);

    /**
     * @mangled DrawFire__9CFireOmniFiiP7CCameraPffif
     * @address 0x161AC0
     * @size 0x7C0
     * @unknownret
     */
    void DrawFire(int, int, CCamera *, float *, float, int, float);

    /**
     * @mangled RasterStep__9CFireOmniFv
     * @address 0x162280
     * @size 0x90
     * @unknownret
     */
    void RasterStep(void);

    /**
     * @mangled DrawRaster__9CFireOmniFv
     * @address 0x162310
     * @size 0x270
     * @unknownret
     */
    void DrawRaster(void);
};

STATIC_ASSERT(sizeof(CFireOmni) == 0x40);
