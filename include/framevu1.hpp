#pragma once

#include "common.h"

class CFrameVu1 {
public:
    /* ?ret */ void DrawVu1(unsigned int *, RenderInfo *); // @ 0x129400 (0xD10 bytes) -- mangled: DrawVu1__9CFrameVu1FPUiP10RenderInfo
    /* ?ret */ void DrawVu1(sceVif1Packet *, RenderInfo *); // @ 0x12A110 (0x80 bytes) -- mangled: DrawVu1__9CFrameVu1FP13sceVif1PacketP10RenderInfo
    /* ?ret */ void SetVisual(CVisualVu1 *); // @ 0x12A210 (0x10 bytes) -- mangled: SetVisual__9CFrameVu1FP10CVisualVu1
    /* ?ret */ void GetVisual(void); // @ 0x12A220 (0x10 bytes) -- mangled: GetVisual__9CFrameVu1Fv
    /* ?ret */ void Initialize(void); // @ 0x12A230 (0x30 bytes) -- mangled: Initialize__9CFrameVu1Fv
    CFrameVu1(void); // @ 0x12A260 (0x50 bytes) -- mangled: __ct__9CFrameVu1Fv
    /* ?ret */ void __as(CFrameVu1 &); // @ 0x12A2B0 (0x50 bytes) -- mangled: __as__9CFrameVu1FR9CFrameVu1
};
