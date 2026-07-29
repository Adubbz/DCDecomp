#pragma once

#include "common.h"

// Forward declarations for the types these declarations name. The skeleton
// headers are generated from the retail symbol table, which knows the type
// names but not where they live.
class CFrame;


class CWeaponEffect {
public:
    /* ?ret */ void InitSet(CFrame *, char *, char *); // @ 0x1D65C0 (0x80 bytes) -- mangled: InitSet__13CWeaponEffectFP6CFramePcPc
    /* ?ret */ void Set(int, float, float); // @ 0x1D6640 (0x120 bytes) -- mangled: Set__13CWeaponEffectFiff
    /* ?ret */ void Step(void); // @ 0x1D6760 (0x1E0 bytes) -- mangled: Step__13CWeaponEffectFv
    /* ?ret */ void Draw(void); // @ 0x1D6940 (0x2A0 bytes) -- mangled: Draw__13CWeaponEffectFv
};
