#pragma once

#include "common.h"

// Forward declarations for the types these declarations name. The skeleton
// headers are generated from the retail symbol table, which knows the type
// names but not where they live.
class CCamera;


class CItemBombEffect {
public:
    /**
     * @mangled Draw__15CItemBombEffectFP7CCamera
     * @address 0x1D5B30
     * @size 0x380
     * @unknownret
     */
    void Draw(CCamera *);

    /**
     * @mangled Step__15CItemBombEffectFv
     * @address 0x1D5EB0
     * @size 0x1F0
     * @unknownret
     */
    void Step(void);

    /**
     * @mangled SetBomb__15CItemBombEffectFPff
     * @address 0x1D60A0
     * @size 0xC0
     * @unknownret
     */
    void SetBomb(float *, float);

    /**
     * @mangled CheckBomb__15CItemBombEffectFv
     * @address 0x1D6160
     * @size 0x50
     * @unknownret
     */
    void CheckBomb(void);

    /**
     * @mangled Initialize__15CItemBombEffectFv
     * @address 0x1D61B0
     * @size 0x30
     * @unknownret
     */
    void Initialize(void);
};

class CShockWave {
public:
    /**
     * @mangled Draw__10CShockWaveFP7CCamera
     * @address 0x1D61E0
     * @size 0x300
     * @unknownret
     */
    void Draw(CCamera *);

    /**
     * @mangled Step__10CShockWaveFv
     * @address 0x1D64E0
     * @size 0xE0
     * @unknownret
     */
    void Step(void);
};
