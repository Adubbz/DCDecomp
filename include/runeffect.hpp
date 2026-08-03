#pragma once

#include "common.h"

class CRunEffect {
public:
    /**
     * @mangled Lighting__10CRunEffectFi
     * @address 0x163470
     * @size 0x10
     * @unknownret
     */
    void Lighting(int);

    /**
     * @mangled Draw__10CRunEffectFv
     * @address 0x163480
     * @size 0x470
     * @unknownret
     */
    void Draw(void);

    /**
     * @mangled Set__10CRunEffectFPf
     * @address 0x1638F0
     * @size 0x90
     * @unknownret
     */
    void Set(float *);

    /**
     * @mangled Step__10CRunEffectFv
     * @address 0x163980
     * @size 0x70
     * @unknownret
     */
    void Step(void);

    /**
     * @mangled __ct__10CRunEffectFv
     * @address 0x1639F0
     * @size 0x40
     */
    CRunEffect(void);
};
