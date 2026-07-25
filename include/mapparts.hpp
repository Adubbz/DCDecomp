#pragma once

#include "common.h"

class CMapParts {
public:
    /* ?ret */ void GetPosition(float *); // @ 0x19A7B0 (0x30 bytes) -- mangled: GetPosition__9CMapPartsFPf
    /* ?ret */ void SetPosition(float *); // @ 0x19A7E0 (0x30 bytes) -- mangled: SetPosition__9CMapPartsFPf
    /* ?ret */ void SetPosition(float, float, float); // @ 0x19A810 (0x20 bytes) -- mangled: SetPosition__9CMapPartsFfff
    /* ?ret */ void SetRotation(float, float, float); // @ 0x19A830 (0x20 bytes) -- mangled: SetRotation__9CMapPartsFfff
    /* ?ret */ void SetRotY(int); // @ 0x19A850 (0x60 bytes) -- mangled: SetRotY__9CMapPartsFi
    /* ?ret */ void GetRotY(void); // @ 0x19A8B0 (0x10 bytes) -- mangled: GetRotY__9CMapPartsFv
    /* ?ret */ void Initialize(void); // @ 0x19A8C0 (0xA0 bytes) -- mangled: Initialize__9CMapPartsFv
    CMapParts(void); // @ 0x19A960 (0x50 bytes) -- mangled: __ct__9CMapPartsFv
    /* ?ret */ void FrameObjectOnOff(char *, int); // @ 0x19A9B0 (0x70 bytes) -- mangled: FrameObjectOnOff__9CMapPartsFPci
    /* ?ret */ void GetWidth(void); // @ 0x19AA20 (0x60 bytes) -- mangled: GetWidth__9CMapPartsFv
    /* ?ret */ void GetHeight(void); // @ 0x19AA80 (0x60 bytes) -- mangled: GetHeight__9CMapPartsFv
    /* ?ret */ void GetInfoData(int, int); // @ 0x19AAE0 (0x160 bytes) -- mangled: GetInfoData__9CMapPartsFii
    /* ?ret */ void ChangeAltData(void); // @ 0x19AC40 (0xA0 bytes) -- mangled: ChangeAltData__9CMapPartsFv
    /* ?ret */ void ChangeDigData(void); // @ 0x19ACE0 (0xA0 bytes) -- mangled: ChangeDigData__9CMapPartsFv
    /* ?ret */ void CheckBox(CBoxVu0 *); // @ 0x19AD80 (0x140 bytes) -- mangled: CheckBox__9CMapPartsFP7CBoxVu0
    /* ?ret */ void CheckBox2(CBoxVu0 *); // @ 0x19AEC0 (0x1E0 bytes) -- mangled: CheckBox2__9CMapPartsFP7CBoxVu0
    /* ?ret */ void DrawLOD(float *, int, int, int *); // @ 0x19B0A0 (0x1C0 bytes) -- mangled: DrawLOD__9CMapPartsFPfiiPi
    /* ?ret */ void DrawParts(float, float *, int, int, int *); // @ 0x19B260 (0x2F0 bytes) -- mangled: DrawParts__9CMapPartsFfPfiiPi
    /* ?ret */ void DrawEffect(CCamera *, float, CEffectGroup *); // @ 0x19B550 (0x130 bytes) -- mangled: DrawEffect__9CMapPartsFP7CCamerafP12CEffectGroup
};
