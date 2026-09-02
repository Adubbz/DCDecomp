#pragma once

#include "common.h"

#include <libvu0.h>

class CCamera;

/**
 * Animates the fire and dust billboards of a title-overlay explosion.
 */
class CBombEffect {
public:

    /**
     * Clears the effect. The compiler writes this one, for the members that
     * have constructors of their own; retail's copy stands in main.
     *
     * @mangled __ct__11CBombEffectFv
     * @address 0x143460
     * @size 0x30
     */
    CBombEffect();
    sceVu0FVECTOR positions[8]; /**< Shared-origin positions of the eight billboards. */
    s32 phases[8];              /**< Envelope phase currently run by each billboard. */
    s32 counters[8];            /**< Frames elapsed in each billboard's current phase. */
    float sizes[8];             /**< World-space billboard widths and heights. */
    float alphas[8];            /**< GS alpha values used to draw the billboards. */
    s32 active[8];              /**< One while the corresponding billboard is animated. */

    /**
     * Draws the active fire and dust billboards facing the camera.
     *
     * @mangled Draw__11CBombEffectFP7CCamerai
     * @address 0x1DAD610
     * @size 0x3AC
     */
    void Draw(CCamera *camera, int dust_only);

    /**
     * Advances every active billboard through its size and alpha envelope.
     *
     * @mangled Step__11CBombEffectFv
     * @address 0x1DAD9C0
     * @size 0x390
     */
    void Step(void);
};

STATIC_ASSERT(sizeof(CBombEffect) == 0x120);
