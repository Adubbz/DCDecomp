#pragma once

#include "common.h"
#include "rect.hpp"

// Forward declarations for the types these declarations name.
class CEffectParam;
class CTexture;

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

/**
 * Draws a textured rectangle positioned in three-dimensional world space.
 */
class C3DSprite {
public:
    float position[4];   /**< Homogeneous world-space centre of the sprite. */
    float half_width;    /**< Half of the sprite's world-space width. */
    float half_height;   /**< Half of the sprite's world-space height. */
    CTexture *texture;   /**< Texture drawn by the sprite. */
    u32 unk_1c;
    CRect_i_ texel;      /**< Rectangle sampled from the texture. */
    spRGBA colour;       /**< Colour and opacity applied to the sprite. */
    int alpha_blend;     /**< Whether the sprite temporarily enables alpha blending. */
    int disable_z_write; /**< Whether the sprite temporarily disables depth writes. */
    u32 unk_3c;

    /**
     * Initializes a three-dimensional sprite with no texture or source rectangle.
     *
     * @mangled __ct__9C3DSpriteFv
     * @address 0x183760
     * @size 0x40
     */
    C3DSprite();

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

STATIC_ASSERT(sizeof(C3DSprite) == 0x40);

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
