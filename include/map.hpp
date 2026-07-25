#pragma once

#include "common.h"

class CMap {
public:
    /* ?ret */ void SetObject(int, CFrameVu1 *, int, int); // @ 0x143870 (0x80 bytes) -- mangled: SetObject__4CMapFiP9CFrameVu1ii
    /* ?ret */ void SetObject(CFrameVu1 *, int, int); // @ 0x1438F0 (0x90 bytes) -- mangled: SetObject__4CMapFP9CFrameVu1ii
    /* ?ret */ void GetObject(int); // @ 0x143980 (0x40 bytes) -- mangled: GetObject__4CMapFi
    /* ?ret */ void Draw(void); // @ 0x1439C0 (0xE0 bytes) -- mangled: Draw__4CMapFv
    /* ?ret */ void Initialize(void); // @ 0x143AA0 (0xB0 bytes) -- mangled: Initialize__4CMapFv
};
