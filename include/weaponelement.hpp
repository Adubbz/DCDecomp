#pragma once

#include "common.h"

class CWeaponElement {
public:
    /* ?ret */ void Initialize(void); // @ 0x1B7800 (0x40 bytes) -- mangled: Initialize__14CWeaponElementFv
    /* ?ret */ void Set(float (*)[4], float *, float, int, float); // @ 0x1B7840 (0x100 bytes) -- mangled: Set__14CWeaponElementFPA4_fPffif
    /* ?ret */ void Step(void); // @ 0x1B7940 (0xB0 bytes) -- mangled: Step__14CWeaponElementFv
    /* ?ret */ void Draw(void); // @ 0x1B79F0 (0xB0 bytes) -- mangled: Draw__14CWeaponElementFv
    /* ?ret */ void Init_Holy(float *); // @ 0x1B7AA0 (0x340 bytes) -- mangled: Init_Holy__14CWeaponElementFPf
    /* ?ret */ void Step_Holy(void); // @ 0x1B7DE0 (0x4B0 bytes) -- mangled: Step_Holy__14CWeaponElementFv
    /* ?ret */ void Draw_Holy(void); // @ 0x1B8290 (0x1F0 bytes) -- mangled: Draw_Holy__14CWeaponElementFv
    /* ?ret */ void Init_Cold(float *); // @ 0x1B8480 (0x340 bytes) -- mangled: Init_Cold__14CWeaponElementFPf
    /* ?ret */ void Step_Cold(void); // @ 0x1B87C0 (0x4E0 bytes) -- mangled: Step_Cold__14CWeaponElementFv
    /* ?ret */ void Draw_Cold(void); // @ 0x1B8CA0 (0x1F0 bytes) -- mangled: Draw_Cold__14CWeaponElementFv
    /* ?ret */ void Init_Wind(float *); // @ 0x1B8E90 (0x440 bytes) -- mangled: Init_Wind__14CWeaponElementFPf
    /* ?ret */ void Step_Wind(void); // @ 0x1B92D0 (0x5B0 bytes) -- mangled: Step_Wind__14CWeaponElementFv
    /* ?ret */ void Draw_Wind(void); // @ 0x1B9880 (0x240 bytes) -- mangled: Draw_Wind__14CWeaponElementFv
    /* ?ret */ void Init_Fire(float *); // @ 0x1B9AC0 (0x360 bytes) -- mangled: Init_Fire__14CWeaponElementFPf
    /* ?ret */ void Step_Fire(void); // @ 0x1B9E20 (0x4E0 bytes) -- mangled: Step_Fire__14CWeaponElementFv
    /* ?ret */ void Draw_Fire(void); // @ 0x1BA300 (0x1F0 bytes) -- mangled: Draw_Fire__14CWeaponElementFv
    /* ?ret */ void Init_Thunder(float *); // @ 0x1BA4F0 (0x530 bytes) -- mangled: Init_Thunder__14CWeaponElementFPf
    /* ?ret */ void Step_Thunder(void); // @ 0x1BAA20 (0x2E0 bytes) -- mangled: Step_Thunder__14CWeaponElementFv
    /* ?ret */ void Draw_Thunder(void); // @ 0x1BAD00 (0x360 bytes) -- mangled: Draw_Thunder__14CWeaponElementFv
};
