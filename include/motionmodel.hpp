#pragma once

#include "common.h"

class CMotionModel {
public:
    /* ?ret */ void LoadPack(unsigned int *, char *, CDataAlloc2_1_ *, CDataAlloc2_1_ *, MOTION_INFO *, int); // @ 0x1B6A30 (0x2A0 bytes) -- mangled: LoadPack__12CMotionModelFPUiPcP14CDataAlloc2_1_P14CDataAlloc2_1_P11MOTION_INFOi
    /* ?ret */ void Step(void); // @ 0x1B6CD0 (0x70 bytes) -- mangled: Step__12CMotionModelFv
    /* ?ret */ void Draw(void); // @ 0x1B6D40 (0x30 bytes) -- mangled: Draw__12CMotionModelFv
};
