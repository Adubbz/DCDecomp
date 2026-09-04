#pragma once

#include "common.h"

class CFrame;

// Forward declarations for the types these declarations name. The skeleton
// headers are generated from the retail symbol table, which knows the type
// names but not where they live.
template <int Kind>
class CDataAlloc2;
struct MOTION_INFO;

class CMotionModel {
public:
    CFrame *frame; /**< Frame that draws the model. */
    u8 unk_04[0x9C];

    /**
     * @mangled LoadPack__12CMotionModelFPUiPcP14CDataAlloc2_1_P14CDataAlloc2_1_P11MOTION_INFOi
     * @address 0x1B6A30
     * @size 0x2A0
     * @unknownret
     */
    void LoadPack(unsigned int *, char *, CDataAlloc2<1> *, CDataAlloc2<1> *, MOTION_INFO *, int);

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

STATIC_ASSERT(sizeof(CMotionModel) == 0xA0);

/**
 * Gives the attribute that one weapon element hits with.
 *
 * @mangled GetWeaponElementAttr__Fi
 * @address 0x1B69F0
 * @size 0x34
 */
int GetWeaponElementAttr(int element);
