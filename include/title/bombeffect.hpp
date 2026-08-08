#pragma once

#include "common.h"

// Forward declarations for the types these declarations name. The skeleton
// headers are generated from the retail symbol table, which knows the type
// names but not where they live.
class CCamera;

class CBombEffect {
public:
    /**
     * @mangled Draw__11CBombEffectFP7CCamerai
     * @address 0x1DAD610
     * @size 0x3B0
     * @unknownret
     */
    void Draw(CCamera *, int);

    /**
     * @mangled Step__11CBombEffectFv
     * @address 0x1DAD9C0
     * @size 0x390
     * @unknownret
     */
    void Step(void);
};
