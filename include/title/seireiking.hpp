#pragma once

#include "common.h"

// Forward declarations for the types these declarations name. The skeleton
// headers are generated from the retail symbol table, which knows the type
// names but not where they live.
class CCamera;

class CSeireiKing {
public:
    /**
     * @mangled Draw__11CSeireiKingFPffi
     * @address 0x1DAE590
     * @size 0x820
     * @unknownret
     */
    void Draw(float *, float, int);

    /**
     * @mangled Draw2__11CSeireiKingFP7CCameraPfPf
     * @address 0x1DAEDB0
     * @size 0x380
     * @unknownret
     */
    void Draw2(CCamera *, float *, float *);

    /**
     * @mangled Step__11CSeireiKingFv
     * @address 0x1DAF130
     * @size 0x90
     * @unknownret
     */
    void Step(void);
};
