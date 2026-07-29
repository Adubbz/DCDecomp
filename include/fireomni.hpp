#pragma once

#include "common.h"

// Forward declarations for the types these declarations name. The skeleton
// headers are generated from the retail symbol table, which knows the type
// names but not where they live.
class CCamera;
class CTexture;


class CFireOmni {
public:
    CFireOmni(void); // @ 0x161650 (0xA0 bytes) -- mangled: __ct__9CFireOmniFv
    /* ?ret */ void FireStep(void); // @ 0x1616F0 (0xD0 bytes) -- mangled: FireStep__9CFireOmniFv
    /* ?ret */ void FireCreate(void); // @ 0x1617C0 (0x2E0 bytes) -- mangled: FireCreate__9CFireOmniFv
    /* ?ret */ void SetTexture(CTexture *, CTexture *); // @ 0x161AA0 (0x20 bytes) -- mangled: SetTexture__9CFireOmniFP8CTextureP8CTexture
    /* ?ret */ void DrawFire(int, int, CCamera *, float *, float, int, float); // @ 0x161AC0 (0x7C0 bytes) -- mangled: DrawFire__9CFireOmniFiiP7CCameraPffif
    /* ?ret */ void RasterStep(void); // @ 0x162280 (0x90 bytes) -- mangled: RasterStep__9CFireOmniFv
    /* ?ret */ void DrawRaster(void); // @ 0x162310 (0x270 bytes) -- mangled: DrawRaster__9CFireOmniFv
};
