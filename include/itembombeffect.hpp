#pragma once

#include "common.h"

// Forward declarations for the types these declarations name. The skeleton
// headers are generated from the retail symbol table, which knows the type
// names but not where they live.
class CCamera;


class CItemBombEffect {
public:
    /* ?ret */ void Draw(CCamera *); // @ 0x1D5B30 (0x380 bytes) -- mangled: Draw__15CItemBombEffectFP7CCamera
    /* ?ret */ void Step(void); // @ 0x1D5EB0 (0x1F0 bytes) -- mangled: Step__15CItemBombEffectFv
    /* ?ret */ void SetBomb(float *, float); // @ 0x1D60A0 (0xC0 bytes) -- mangled: SetBomb__15CItemBombEffectFPff
    /* ?ret */ void CheckBomb(void); // @ 0x1D6160 (0x50 bytes) -- mangled: CheckBomb__15CItemBombEffectFv
    /* ?ret */ void Initialize(void); // @ 0x1D61B0 (0x30 bytes) -- mangled: Initialize__15CItemBombEffectFv
};

class CShockWave {
public:
    /* ?ret */ void Draw(CCamera *); // @ 0x1D61E0 (0x300 bytes) -- mangled: Draw__10CShockWaveFP7CCamera
    /* ?ret */ void Step(void); // @ 0x1D64E0 (0xE0 bytes) -- mangled: Step__10CShockWaveFv
};
