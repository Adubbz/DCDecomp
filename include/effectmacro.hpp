#pragma once

#include "common.h"

class CEffectGroup;

/**
 * Advances the shared effect state for one frame at a world position.
 *
 * @mangled EffectMacroStep__FPf
 * @address 0x164B30
 * @size 0x98
 */
void EffectMacroStep(float *position);

/**
 * Adds a puff of smoke to an effect group.
 *
 * @mangled EffectSmoke__FP12CEffectGroupPffi
 * @address 0x164BD0
 * @size 0x350
 */
void EffectSmoke(CEffectGroup *group, float *position, float scale, int kind);

/**
 * Adds a spray of water to an effect group.
 *
 * @mangled EffectWaterSpray__FP12CEffectGroupPfPfii
 * @address 0x164F20
 * @size 0x29C
 */
void EffectWaterSpray(CEffectGroup *group, float *position, float *velocity, int count, int kind);

/**
 * Adds a spreading ripple to an effect group.
 *
 * @mangled EffectHamon__FP12CEffectGroupPff
 * @address 0x1651C0
 * @size 0xF4
 */
void EffectHamon(CEffectGroup *group, float *position, float scale);

/**
 * Blurs screen regions outside the two depth intervals surrounding the focus.
 *
 * @mangled DepthOfField__FPfiii
 * @address 0x1652C0
 * @size 0x9D0
 */
void DepthOfField(float *focus, int level, int alpha, int blur);
