#pragma once

#include "common.h"

// Forward declarations for the types these declarations name. The skeleton
// headers are generated from the retail symbol table, which knows the type
// names but not where they live.
class CFrameVu1;


class CStealItem {
public:
    /* ?ret */ void Initialize(CFrameVu1 *); // @ 0x1D74E0 (0x40 bytes) -- mangled: Initialize__10CStealItemFP9CFrameVu1
    /* ?ret */ void Set(float *, int); // @ 0x1D7520 (0xE0 bytes) -- mangled: Set__10CStealItemFPfi
    /* ?ret */ void Step(void); // @ 0x1D7600 (0x340 bytes) -- mangled: Step__10CStealItemFv
    /* ?ret */ void Draw(void); // @ 0x1D7940 (0xA0 bytes) -- mangled: Draw__10CStealItemFv
    /* ?ret */ void checkEvent(void); // @ 0x1D79E0 (0x60 bytes) -- mangled: checkEvent__10CStealItemFv
};
