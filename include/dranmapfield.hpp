#pragma once

#include "common.h"

class CDranMapField {
public:
    /* ?ret */ void LoadModel(unsigned int *, CDataAlloc2_1_ *); // @ 0x1CD3C0 (0x150 bytes) -- mangled: LoadModel__13CDranMapFieldFPUiP14CDataAlloc2_1_
    /* ?ret */ void AddCollision(CCPoly *, int, CBoxVu0); // @ 0x1CD510 (0x100 bytes) -- mangled: AddCollision__13CDranMapFieldFP6CCPolyi7CBoxVu0
    /* ?ret */ void LoadCollision(unsigned int *, CDataAlloc2_1_ *); // @ 0x1CD610 (0x110 bytes) -- mangled: LoadCollision__13CDranMapFieldFPUiP14CDataAlloc2_1_
    /* ?ret */ void Draw(void); // @ 0x1CD720 (0xB0 bytes) -- mangled: Draw__13CDranMapFieldFv
    /* ?ret */ void Step(void); // @ 0x1CD7D0 (0x140 bytes) -- mangled: Step__13CDranMapFieldFv
};
