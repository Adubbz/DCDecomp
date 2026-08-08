#pragma once

#include "common.h"

// Forward declarations for the types these declarations name. The skeleton
// headers are generated from the retail symbol table, which knows the type
// names but not where they live.
class CCamera;

class CMajinBeem {
public:
    /**
     * @mangled Draw__10CMajinBeemFP7CCamera
     * @address 0x1DADD50
     * @size 0x250
     * @unknownret
     */
    void Draw(CCamera *);

    /**
     * @mangled Draw2__10CMajinBeemFP7CCameraPfPf
     * @address 0x1DADFA0
     * @size 0x3A0
     * @unknownret
     */
    void Draw2(CCamera *, float *, float *);

    /**
     * @mangled Step__10CMajinBeemFv
     * @address 0x1DAE340
     * @size 0x250
     * @unknownret
     */
    void Step(void);
};
