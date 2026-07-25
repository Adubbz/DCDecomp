#pragma once

#include "common.h"

class CMapObject {
public:
    /* ?ret */ void GetCollisionFrame(void); // @ 0x1574F0 (0xA0 bytes) -- mangled: GetCollisionFrame__10CMapObjectFv
    /* ?ret */ void FrameObjectOnOff(char *, int); // @ 0x157590 (0x130 bytes) -- mangled: FrameObjectOnOff__10CMapObjectFPci
    /* ?ret */ void Draw(void); // @ 0x1576C0 (0x40 bytes) -- mangled: Draw__10CMapObjectFv
    /* ?ret */ void DrawLOD(float *, int, int, int *); // @ 0x157700 (0x60 bytes) -- mangled: DrawLOD__10CMapObjectFPfiiPi
    /* ?ret */ void DrawShadow(int); // @ 0x157760 (0x110 bytes) -- mangled: DrawShadow__10CMapObjectFi
    /* ?ret */ void DrawShade(void); // @ 0x157870 (0xA0 bytes) -- mangled: DrawShade__10CMapObjectFv
    /* ?ret */ void Initialize(void); // @ 0x157910 (0x60 bytes) -- mangled: Initialize__10CMapObjectFv
    CMapObject(void); // @ 0x157970 (0x70 bytes) -- mangled: __ct__10CMapObjectFv
};
