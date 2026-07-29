#pragma once

#include "common.h"

// Forward declarations for the types these declarations name. The skeleton
// headers are generated from the retail symbol table, which knows the type
// names but not where they live.
struct WEAPON_HAVE;


class MenuClsMes {
public:
    /* ?ret */ void InitMes(void); // @ 0x20B580 (0x20 bytes) -- mangled: InitMes__10MenuClsMesFv
    /* ?ret */ void InitData(void); // @ 0x20B5A0 (0x30 bytes) -- mangled: InitData__10MenuClsMesFv
    /* ?ret */ void SetBuffInfo(short *); // @ 0x20B5D0 (0x220 bytes) -- mangled: SetBuffInfo__10MenuClsMesFPs
    /* ?ret */ void NowWeaponStatus(WEAPON_HAVE *); // @ 0x20B7F0 (0x170 bytes) -- mangled: NowWeaponStatus__10MenuClsMesFP11WEAPON_HAVE
    /* ?ret */ void Step(void); // @ 0x20B960 (0x80 bytes) -- mangled: Step__10MenuClsMesFv
    /* ?ret */ void Draw1(int, int, int); // @ 0x20B9E0 (0x4E0 bytes) -- mangled: Draw1__10MenuClsMesFiii
};
