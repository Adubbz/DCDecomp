#pragma once

#include "common.h"

#include "editloop.hpp"

/**
 * Holds the settings and records an interior's info script describes.
 */
struct EDIT_IN_INFO {
    u8 unk_000[0x4C0];
    float projection; /**< Distance of the interior's projection plane. */
    u8 unk_4c4[0xC];
    float ambient[4];            /**< Ambient light colour. */
    float light_direction[4][4]; /**< Normalized light directions, one light per column. */
    float light_colour[4][4];    /**< Colours of the four lights. */
    float background_colour[4];  /**< Colour the interior clears to. */
    EDIT_FOG_INFO fog;           /**< Fog distances and colour. */
    u8 unk_584[0x37AC];
    EDIT_MOTION_PARTS_INFO motion_parts[4]; /**< Named interior parts with scripted motion. */
    EDIT_WATER_INFO water_surfaces[8];      /**< Water surfaces the interior defines. */
};

STATIC_ASSERT(sizeof(EDIT_IN_INFO) == 0x44C0);

/** Settings of the interior being run. */
extern EDIT_IN_INFO *EdInInfo;

/**
 * Finds the map jump the player is standing on and facing.
 *
 * @mangled SearchMapJump__FPfPf
 * @address 0x19E1F0
 * @size 0xF4
 */
EPARTS_FUNC_DATA *SearchMapJump(float *position, float *rotation);
