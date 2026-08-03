#pragma once

#include "common.h"

// Forward declarations for the types these declarations name. The skeleton
// headers are generated from the retail symbol table, which knows the type
// names but not where they live.
class CCharacter;
struct WEAPON_HAVE;


class CWeaponLevelUp {
public:
    /**
     * @mangled CMenuEffectDataLoad__14CWeaponLevelUpFP1i
     * @address 0x236000
     * @size 0x1F0
     * @unknownret
     */
    void CMenuEffectDataLoad(void /* CW back-ref target unresolved */ *, int);

    /**
     * @mangled Initialize__14CWeaponLevelUpFv
     * @address 0x2361F0
     * @size 0x90
     * @unknownret
     */
    void Initialize(void);

    /**
     * @mangled SetLevelUpValue__14CWeaponLevelUpFP11WEAPON_HAVEP10CCharacterP1i
     * @address 0x236280
     * @size 0x4F0
     * @unknownret
     */
    void SetLevelUpValue(WEAPON_HAVE *, CCharacter *, WEAPON_HAVE *, int);

    /**
     * @mangled SetLevelUpWeaponData__14CWeaponLevelUpFv
     * @address 0x236770
     * @size 0x160
     * @unknownret
     */
    void SetLevelUpWeaponData(void);

    /**
     * @mangled SetStatusBreak__14CWeaponLevelUpFP11WEAPON_HAVEP10CCharacterP1i
     * @address 0x2368D0
     * @size 0x360
     * @unknownret
     */
    void SetStatusBreak(WEAPON_HAVE *, CCharacter *, WEAPON_HAVE *, int);

    /**
     * @mangled SetBuildUp__14CWeaponLevelUpFP11WEAPON_HAVEP10CCharacterP1i
     * @address 0x236C30
     * @size 0xD0
     * @unknownret
     */
    void SetBuildUp(WEAPON_HAVE *, CCharacter *, WEAPON_HAVE *, int);

    /**
     * @mangled WepRecover__14CWeaponLevelUpFP11WEAPON_HAVEP10CCharacterP1i
     * @address 0x236D00
     * @size 0x90
     * @unknownret
     */
    void WepRecover(WEAPON_HAVE *, CCharacter *, WEAPON_HAVE *, int);

    /**
     * @mangled CureEffect__14CWeaponLevelUpFiiP1ii
     * @address 0x236D90
     * @size 0x100
     * @unknownret
     */
    void CureEffect(int, int, void /* CW back-ref target unresolved */ *, int, int);

    /**
     * @mangled InitSnd__14CWeaponLevelUpFv
     * @address 0x236E90
     * @size 0x20
     * @unknownret
     */
    void InitSnd(void);

    /**
     * @mangled SetSnd__14CWeaponLevelUpFiii
     * @address 0x236EB0
     * @size 0x40
     * @unknownret
     */
    void SetSnd(int, int, int);

    /**
     * @mangled StepSnd__14CWeaponLevelUpFv
     * @address 0x236EF0
     * @size 0xA0
     * @unknownret
     */
    void StepSnd(void);

    /**
     * @mangled CheckSnd__14CWeaponLevelUpFv
     * @address 0x236F90
     * @size 0x80
     * @unknownret
     */
    void CheckSnd(void);

    /**
     * @mangled Step__14CWeaponLevelUpFv
     * @address 0x237010
     * @size 0x70
     * @unknownret
     */
    void Step(void);

    /**
     * @mangled Draw__14CWeaponLevelUpFv
     * @address 0x237930
     * @size 0x148
     * @unknownret
     */
    void Draw(void);

    /**
     * @mangled DrawMes__14CWeaponLevelUpFv
     * @address 0x237CA0
     * @size 0x5C
     * @unknownret
     */
    void DrawMes(void);
};
