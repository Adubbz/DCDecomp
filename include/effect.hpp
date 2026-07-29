#pragma once

#include "common.h"

// Forward declarations for the types these declarations name.
class CEffectParam;

class CEffect {
public:
    /* ?ret */ void SetEffect(CEffectParam *); // @ 0x163EE0 (0x1E0 bytes) -- mangled: SetEffect__7CEffectFP12CEffectParam
    /* ?ret */ void Step(int); // @ 0x1640C0 (0x280 bytes) -- mangled: Step__7CEffectFi
    /* ?ret */ void Draw(void); // @ 0x164340 (0x430 bytes) -- mangled: Draw__7CEffectFv
    /* ?ret */ void Initialize(void); // @ 0x164870 (0x110 bytes) -- mangled: Initialize__7CEffectFv
};

class C3DSprite {
public:
    /* ?ret */ void Draw(void); // @ 0x163D20 (0x170 bytes) -- mangled: Draw__9C3DSpriteFv
    /* ?ret */ void Initialize(void); // @ 0x163E90 (0x50 bytes) -- mangled: Initialize__9C3DSpriteFv
};

class CEffectParam {
public:
    /* ?ret */ void Initialize(void); // @ 0x164770 (0x100 bytes) -- mangled: Initialize__12CEffectParamFv
};
