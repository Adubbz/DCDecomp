#pragma once

#include "common.h"

/**
 * @file
 * Declares the light that stands in for a point light.
 */

/**
 * Lights the world about one point.
 */
class CFakePointLight {
public:
    u8 unk_00[16];
    float unk_10[4];
    float unk_20;
    float unk_24;
    s32 unk_28;
    u8 unk_2c[4];

    /**
     * Makes a light that is white, and that reaches from ten units away to
     * seventy.
     *
     * @mangled __ct__15CFakePointLightFv
     * @address 0x156B60
     * @size 0x34
     */
    CFakePointLight();
};

STATIC_ASSERT(sizeof(CFakePointLight) == 0x30);
