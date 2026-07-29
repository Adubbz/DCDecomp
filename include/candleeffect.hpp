#pragma once

#include "common.h"

// Forward declarations for the types these declarations name. The skeleton
// headers are generated from the retail symbol table, which knows the type
// names but not where they live.
class CTexture;


class CCandleEffect {
public:
    /* ?ret */ void Initialize(void); // @ 0x163A30 (0x30 bytes) -- mangled: Initialize__13CCandleEffectFv
    CCandleEffect(void); // @ 0x163A60 (0x30 bytes) -- mangled: __ct__13CCandleEffectFv
    /* ?ret */ void SetTexture(CTexture *); // @ 0x163A90 (0x10 bytes) -- mangled: SetTexture__13CCandleEffectFP8CTexture
    /* ?ret */ void SetScale(float, float); // @ 0x163AA0 (0x10 bytes) -- mangled: SetScale__13CCandleEffectFff
    /* ?ret */ void SetPosition(float *); // @ 0x163AB0 (0x30 bytes) -- mangled: SetPosition__13CCandleEffectFPf
    /* ?ret */ void Step(void); // @ 0x163AE0 (0x40 bytes) -- mangled: Step__13CCandleEffectFv
    /* ?ret */ void Draw(void); // @ 0x163B20 (0x200 bytes) -- mangled: Draw__13CCandleEffectFv
};
