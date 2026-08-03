#pragma once

#include "common.h"

// Forward declarations for the types these declarations name. The skeleton
// headers are generated from the retail symbol table, which knows the type
// names but not where they live.
class CFrameVu1;


class CStealItem {
public:
    /**
     * @mangled Initialize__10CStealItemFP9CFrameVu1
     * @address 0x1D74E0
     * @size 0x40
     * @unknownret
     */
    void Initialize(CFrameVu1 *);

    /**
     * @mangled Set__10CStealItemFPfi
     * @address 0x1D7520
     * @size 0xE0
     * @unknownret
     */
    void Set(float *, int);

    /**
     * @mangled Step__10CStealItemFv
     * @address 0x1D7600
     * @size 0x340
     * @unknownret
     */
    void Step(void);

    /**
     * @mangled Draw__10CStealItemFv
     * @address 0x1D7940
     * @size 0xA0
     * @unknownret
     */
    void Draw(void);

    /**
     * @mangled checkEvent__10CStealItemFv
     * @address 0x1D79E0
     * @size 0x60
     * @unknownret
     */
    void checkEvent(void);
};
