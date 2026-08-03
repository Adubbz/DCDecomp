#pragma once

#include "common.h"

// Forward declarations for the types these declarations name. The skeleton
// headers are generated from the retail symbol table, which knows the type
// names but not where they live.
class CCamera;
class CTexture;


class CFireOmni {
public:
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
