#pragma once

#include "common.h"

// Forward declarations for the types these declarations name. The skeleton
// headers are generated from the retail symbol table, which knows the type
// names but not where they live.
class CDataAlloc2_1_;
struct MOTION_INFO;


class CMotionModel {
public:
    /**
     * @mangled LoadPack__12CMotionModelFPUiPcP14CDataAlloc2_1_P14CDataAlloc2_1_P11MOTION_INFOi
     * @address 0x1B6A30
     * @size 0x2A0
     * @unknownret
     */
    void LoadPack(unsigned int *, char *, CDataAlloc2_1_ *, CDataAlloc2_1_ *, MOTION_INFO *, int);

    /**
     * @mangled Step__12CMotionModelFv
     * @address 0x1B6CD0
     * @size 0x70
     * @unknownret
     */
    void Step(void);

    /**
     * @mangled Draw__12CMotionModelFv
     * @address 0x1B6D40
     * @size 0x30
     * @unknownret
     */
    void Draw(void);
};
