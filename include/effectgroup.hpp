#pragma once

#include "common.h"

// Forward declarations for the types these declarations name. The skeleton
// headers are generated from the retail symbol table, which knows the type
// names but not where they live.
class CEffect;
class CEffectParam;


class CEffectGroup {
public:
    /* ?ret */ void EnterEffect(CEffectParam *); // @ 0x164980 (0x70 bytes) -- mangled: EnterEffect__12CEffectGroupFP12CEffectParam
    /* ?ret */ void Step(int); // @ 0x1649F0 (0x70 bytes) -- mangled: Step__12CEffectGroupFi
    /* ?ret */ void Draw(void); // @ 0x164A60 (0x60 bytes) -- mangled: Draw__12CEffectGroupFv
    /* ?ret */ void Clear(void); // @ 0x164AC0 (0x60 bytes) -- mangled: Clear__12CEffectGroupFv
    /* ?ret */ void Initialize(CEffect *, int); // @ 0x164B20 (0x10 bytes) -- mangled: Initialize__12CEffectGroupFP7CEffecti
};
