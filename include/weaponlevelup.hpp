#pragma once

#include "common.h"

// Forward declarations for the types these declarations name. The skeleton
// headers are generated from the retail symbol table, which knows the type
// names but not where they live.
class CCharacter;
struct WEAPON_HAVE;


class CWeaponLevelUp {
public:
    /* ?ret */ void CMenuEffectDataLoad(void /* CW back-ref target unresolved */ *, int); // @ 0x236000 (0x1F0 bytes) -- mangled: CMenuEffectDataLoad__14CWeaponLevelUpFP1i
    /* ?ret */ void Initialize(void); // @ 0x2361F0 (0x90 bytes) -- mangled: Initialize__14CWeaponLevelUpFv
    /* ?ret */ void SetLevelUpValue(WEAPON_HAVE *, CCharacter *, WEAPON_HAVE *, int); // @ 0x236280 (0x4F0 bytes) -- mangled: SetLevelUpValue__14CWeaponLevelUpFP11WEAPON_HAVEP10CCharacterP1i
    /* ?ret */ void SetLevelUpWeaponData(void); // @ 0x236770 (0x160 bytes) -- mangled: SetLevelUpWeaponData__14CWeaponLevelUpFv
    /* ?ret */ void SetStatusBreak(WEAPON_HAVE *, CCharacter *, WEAPON_HAVE *, int); // @ 0x2368D0 (0x360 bytes) -- mangled: SetStatusBreak__14CWeaponLevelUpFP11WEAPON_HAVEP10CCharacterP1i
    /* ?ret */ void SetBuildUp(WEAPON_HAVE *, CCharacter *, WEAPON_HAVE *, int); // @ 0x236C30 (0xD0 bytes) -- mangled: SetBuildUp__14CWeaponLevelUpFP11WEAPON_HAVEP10CCharacterP1i
    /* ?ret */ void WepRecover(WEAPON_HAVE *, CCharacter *, WEAPON_HAVE *, int); // @ 0x236D00 (0x90 bytes) -- mangled: WepRecover__14CWeaponLevelUpFP11WEAPON_HAVEP10CCharacterP1i
    /* ?ret */ void CureEffect(int, int, void /* CW back-ref target unresolved */ *, int, int); // @ 0x236D90 (0x100 bytes) -- mangled: CureEffect__14CWeaponLevelUpFiiP1ii
    /* ?ret */ void InitSnd(void); // @ 0x236E90 (0x20 bytes) -- mangled: InitSnd__14CWeaponLevelUpFv
    /* ?ret */ void SetSnd(int, int, int); // @ 0x236EB0 (0x40 bytes) -- mangled: SetSnd__14CWeaponLevelUpFiii
    /* ?ret */ void StepSnd(void); // @ 0x236EF0 (0xA0 bytes) -- mangled: StepSnd__14CWeaponLevelUpFv
    /* ?ret */ void CheckSnd(void); // @ 0x236F90 (0x80 bytes) -- mangled: CheckSnd__14CWeaponLevelUpFv
    /* ?ret */ void Step(void); // @ 0x237010 (0x70 bytes) -- mangled: Step__14CWeaponLevelUpFv
    /* ?ret */ void Draw(void); // @ 0x237930 (0x148 bytes) -- mangled: Draw__14CWeaponLevelUpFv
    /* ?ret */ void DrawMes(void); // @ 0x237CA0 (0x5C bytes) -- mangled: DrawMes__14CWeaponLevelUpFv
};
