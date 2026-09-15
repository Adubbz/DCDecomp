#pragma once

#include "common.h"

// Forward declarations for the types these declarations name. The skeleton
// headers are generated from the retail symbol table, which knows the type
// names but not where they live.
class CCamera;
class CUserStatus;

class CItemBombEffect {
private:
    u8 data[0xC0];

public:
    /**
     * Draws the bomb's blast and its shock wave.
     *
     * @mangled Draw__15CItemBombEffectFP7CCamera
     * @address 0x1D5B30
     * @size 0x374
     */
    void Draw(CCamera *);

    /**
     * Advances the bomb effect by a frame.
     *
     * @mangled Step__15CItemBombEffectFv
     * @address 0x1D5EB0
     * @size 0x1F0
     */
    void Step(void);

    /**
     * Places the bomb's five blast puffs around a position.
     *
     * @mangled SetBomb__15CItemBombEffectFPff
     * @address 0x1D60A0
     * @size 0xBC
     */
    void SetBomb(float *, float);

    /**
     * Reports whether the bomb effect is still running.
     *
     * @mangled CheckBomb__15CItemBombEffectFv
     * @address 0x1D6160
     * @size 0x48
     */
    void CheckBomb(void);

    /**
     * Clears the bomb effect.
     *
     * @mangled Initialize__15CItemBombEffectFv
     * @address 0x1D61B0
     * @size 0x30
     */
    void Initialize(void);
};

class CShockWave {
public:
    u8 unk_00[0x28];
    s32 unk_28;
    u8 unk_2C[0x4];

    /**
     * Draws the expanding shock-wave ring.
     *
     * @mangled Draw__10CShockWaveFP7CCamera
     * @address 0x1D61E0
     * @size 0x2F8
     */
    void Draw(CCamera *);

    /**
     * Expands and fades the shock-wave ring by a frame.
     *
     * @mangled Step__10CShockWaveFv
     * @address 0x1D64E0
     * @size 0xD8
     */
    void Step(void);
};

STATIC_ASSERT(sizeof(CShockWave) == 0x30);

/**
 * Spends one use of a running item.
 *
 * @mangled usedActiveItem__FP11CUserStatusi
 * @address 0x1D56F0
 * @size 0x248
 * @unknownret
 */
void usedActiveItem(CUserStatus *status, int item);

STATIC_ASSERT(sizeof(CItemBombEffect) == 0xC0);
