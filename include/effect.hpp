#pragma once

#include "common.h"

// Forward declarations for the types these declarations name.
class CEffectParam;

class CEffect {
public:
    /**
     * @mangled SetEffect__7CEffectFP12CEffectParam
     * @address 0x163EE0
     * @size 0x1E0
     * @unknownret
     */
    void SetEffect(CEffectParam *);

    /**
     * @mangled Step__7CEffectFi
     * @address 0x1640C0
     * @size 0x280
     * @unknownret
     */
    void Step(int);

    /**
     * @mangled Draw__7CEffectFv
     * @address 0x164340
     * @size 0x430
     * @unknownret
     */
    void Draw(void);

    /**
     * @mangled Initialize__7CEffectFv
     * @address 0x164870
     * @size 0x110
     * @unknownret
     */
    void Initialize(void);
};

class C3DSprite {
public:
    /**
     * @mangled Draw__9C3DSpriteFv
     * @address 0x163D20
     * @size 0x170
     * @unknownret
     */
    void Draw(void);

    /**
     * @mangled Initialize__9C3DSpriteFv
     * @address 0x163E90
     * @size 0x50
     * @unknownret
     */
    void Initialize(void);
};

class CEffectParam {
public:
    /**
     * @mangled Initialize__12CEffectParamFv
     * @address 0x164770
     * @size 0x100
     * @unknownret
     */
    void Initialize(void);
};
