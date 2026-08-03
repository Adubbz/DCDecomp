#pragma once

#include "common.h"

class CWind {
public:
    /**
     * @mangled SetDir__5CWindFPf
     * @address 0x13B480
     * @size 0x30
     * @unknownret
     */
    void SetDir(float *);

    /**
     * @mangled SetVelocity__5CWindFf
     * @address 0x13B4B0
     * @size 0x10
     * @unknownret
     */
    void SetVelocity(float);

    /**
     * @mangled GetWind__5CWindFPf
     * @address 0x13B4C0
     * @size 0x30
     * @unknownret
     */
    void GetWind(float *);

    /**
     * @mangled GetWindNoise__5CWindFPf
     * @address 0x13B4F0
     * @size 0x40
     * @unknownret
     */
    void GetWindNoise(float *);

    /**
     * @mangled Step__5CWindFv
     * @address 0x13B530
     * @size 0xB0
     * @unknownret
     */
    void Step(void);

    /**
     * @mangled __ct__5CWindFv
     * @address 0x13B5E0
     * @size 0x60
     */
    CWind(void);
};
