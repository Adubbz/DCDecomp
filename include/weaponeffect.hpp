#pragma once

#include "common.h"

// Forward declarations for the types these declarations name. The skeleton
// headers are generated from the retail symbol table, which knows the type
// names but not where they live.
class CFrame;


class CWeaponEffect {
public:
    /**
     * @mangled InitSet__13CWeaponEffectFP6CFramePcPc
     * @address 0x1D65C0
     * @size 0x80
     * @unknownret
     */
    void InitSet(CFrame *, char *, char *);

    /**
     * @mangled Set__13CWeaponEffectFiff
     * @address 0x1D6640
     * @size 0x120
     * @unknownret
     */
    void Set(int, float, float);

    /**
     * @mangled Step__13CWeaponEffectFv
     * @address 0x1D6760
     * @size 0x1E0
     * @unknownret
     */
    void Step(void);

    /**
     * @mangled Draw__13CWeaponEffectFv
     * @address 0x1D6940
     * @size 0x2A0
     * @unknownret
     */
    void Draw(void);
};
