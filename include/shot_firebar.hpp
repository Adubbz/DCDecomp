#pragma once

#include "common.h"

class CSHOT_FIREBAR {
public:
    /**
     * @mangled Init__13CSHOT_FIREBARFPfPfii
     * @address 0x1AEB20
     * @size 0x220
     * @unknownret
     */
    void Init(float *, float *, int, int);

    /**
     * @mangled Set__13CSHOT_FIREBARFPfPfii
     * @address 0x1AED40
     * @size 0x220
     * @unknownret
     */
    void Set(float *, float *, int, int);

    /**
     * @mangled Rset__13CSHOT_FIREBARFv
     * @address 0x1AEF60
     * @size 0x40
     * @unknownret
     */
    void Rset(void);

    /**
     * @mangled Step__13CSHOT_FIREBARFv
     * @address 0x1AEFA0
     * @size 0x240
     * @unknownret
     */
    void Step(void);

    /**
     * @mangled Draw__13CSHOT_FIREBARFv
     * @address 0x1AF1E0
     * @size 0x180
     * @unknownret
     */
    void Draw(void);
};
