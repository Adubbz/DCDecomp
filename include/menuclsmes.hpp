#pragma once

#include "common.h"

// Forward declarations for the types these declarations name. The skeleton
// headers are generated from the retail symbol table, which knows the type
// names but not where they live.
struct WEAPON_HAVE;


class MenuClsMes {
public:
    /**
     * @mangled InitMes__10MenuClsMesFv
     * @address 0x20B580
     * @size 0x20
     * @unknownret
     */
    void InitMes(void);

    /**
     * @mangled InitData__10MenuClsMesFv
     * @address 0x20B5A0
     * @size 0x30
     * @unknownret
     */
    void InitData(void);

    /**
     * @mangled SetBuffInfo__10MenuClsMesFPs
     * @address 0x20B5D0
     * @size 0x220
     * @unknownret
     */
    void SetBuffInfo(short *);

    /**
     * @mangled NowWeaponStatus__10MenuClsMesFP11WEAPON_HAVE
     * @address 0x20B7F0
     * @size 0x170
     * @unknownret
     */
    void NowWeaponStatus(WEAPON_HAVE *);

    /**
     * @mangled Step__10MenuClsMesFv
     * @address 0x20B960
     * @size 0x80
     * @unknownret
     */
    void Step(void);

    /**
     * @mangled Draw1__10MenuClsMesFiii
     * @address 0x20B9E0
     * @size 0x4E0
     * @unknownret
     */
    void Draw1(int, int, int);
};
