#pragma once

#include "common.h"

class CWind {
public:
    /* ?ret */ void SetDir(float *); // @ 0x13B480 (0x30 bytes) -- mangled: SetDir__5CWindFPf
    /* ?ret */ void SetVelocity(float); // @ 0x13B4B0 (0x10 bytes) -- mangled: SetVelocity__5CWindFf
    /* ?ret */ void GetWind(float *); // @ 0x13B4C0 (0x30 bytes) -- mangled: GetWind__5CWindFPf
    /* ?ret */ void GetWindNoise(float *); // @ 0x13B4F0 (0x40 bytes) -- mangled: GetWindNoise__5CWindFPf
    /* ?ret */ void Step(void); // @ 0x13B530 (0xB0 bytes) -- mangled: Step__5CWindFv
    CWind(void); // @ 0x13B5E0 (0x60 bytes) -- mangled: __ct__5CWindFv
};
