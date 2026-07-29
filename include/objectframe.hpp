#pragma once

#include "common.h"

// Forward declarations for the types these declarations name. The skeleton
// headers are generated from the retail symbol table, which knows the type
// names but not where they live.
class CFrameVu1;


class CObjectFrame {
public:
    /* ?ret */ void SetFrame(CFrameVu1 *, int); // @ 0x1570C0 (0x30 bytes) -- mangled: SetFrame__12CObjectFrameFP9CFrameVu1i
    /* ?ret */ void FrameObjectOnOff(char *, int); // @ 0x1570F0 (0xA0 bytes) -- mangled: FrameObjectOnOff__12CObjectFrameFPci
    /* ?ret */ void Draw(void); // @ 0x157190 (0x90 bytes) -- mangled: Draw__12CObjectFrameFv
    /* ?ret */ void DrawLOD(float *, int, int, int *); // @ 0x157220 (0x240 bytes) -- mangled: DrawLOD__12CObjectFrameFPfiiPi
    /* ?ret */ void Initialize(CFrameVu1 *); // @ 0x157460 (0x90 bytes) -- mangled: Initialize__12CObjectFrameFP9CFrameVu1
};
