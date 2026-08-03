#pragma once

#include "common.h"

class CWeaponElement {
public:
    /**
     * @mangled Initialize__14CWeaponElementFv
     * @address 0x1B7800
     * @size 0x40
     * @unknownret
     */
    void Initialize(void);

    /**
     * @mangled Set__14CWeaponElementFPA4_fPffif
     * @address 0x1B7840
     * @size 0x100
     * @unknownret
     */
    void Set(float (*)[4], float *, float, int, float);

    /**
     * @mangled Step__14CWeaponElementFv
     * @address 0x1B7940
     * @size 0xB0
     * @unknownret
     */
    void Step(void);

    /**
     * @mangled Draw__14CWeaponElementFv
     * @address 0x1B79F0
     * @size 0xB0
     * @unknownret
     */
    void Draw(void);

    /**
     * @mangled Init_Holy__14CWeaponElementFPf
     * @address 0x1B7AA0
     * @size 0x340
     * @unknownret
     */
    void Init_Holy(float *);

    /**
     * @mangled Step_Holy__14CWeaponElementFv
     * @address 0x1B7DE0
     * @size 0x4B0
     * @unknownret
     */
    void Step_Holy(void);

    /**
     * @mangled Draw_Holy__14CWeaponElementFv
     * @address 0x1B8290
     * @size 0x1F0
     * @unknownret
     */
    void Draw_Holy(void);

    /**
     * @mangled Init_Cold__14CWeaponElementFPf
     * @address 0x1B8480
     * @size 0x340
     * @unknownret
     */
    void Init_Cold(float *);

    /**
     * @mangled Step_Cold__14CWeaponElementFv
     * @address 0x1B87C0
     * @size 0x4E0
     * @unknownret
     */
    void Step_Cold(void);

    /**
     * @mangled Draw_Cold__14CWeaponElementFv
     * @address 0x1B8CA0
     * @size 0x1F0
     * @unknownret
     */
    void Draw_Cold(void);

    /**
     * @mangled Init_Wind__14CWeaponElementFPf
     * @address 0x1B8E90
     * @size 0x440
     * @unknownret
     */
    void Init_Wind(float *);

    /**
     * @mangled Step_Wind__14CWeaponElementFv
     * @address 0x1B92D0
     * @size 0x5B0
     * @unknownret
     */
    void Step_Wind(void);

    /**
     * @mangled Draw_Wind__14CWeaponElementFv
     * @address 0x1B9880
     * @size 0x240
     * @unknownret
     */
    void Draw_Wind(void);

    /**
     * @mangled Init_Fire__14CWeaponElementFPf
     * @address 0x1B9AC0
     * @size 0x360
     * @unknownret
     */
    void Init_Fire(float *);

    /**
     * @mangled Step_Fire__14CWeaponElementFv
     * @address 0x1B9E20
     * @size 0x4E0
     * @unknownret
     */
    void Step_Fire(void);

    /**
     * @mangled Draw_Fire__14CWeaponElementFv
     * @address 0x1BA300
     * @size 0x1F0
     * @unknownret
     */
    void Draw_Fire(void);

    /**
     * @mangled Init_Thunder__14CWeaponElementFPf
     * @address 0x1BA4F0
     * @size 0x530
     * @unknownret
     */
    void Init_Thunder(float *);

    /**
     * @mangled Step_Thunder__14CWeaponElementFv
     * @address 0x1BAA20
     * @size 0x2E0
     * @unknownret
     */
    void Step_Thunder(void);

    /**
     * @mangled Draw_Thunder__14CWeaponElementFv
     * @address 0x1BAD00
     * @size 0x360
     * @unknownret
     */
    void Draw_Thunder(void);
};
