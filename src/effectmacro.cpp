#include "effectmacro.hpp"

#include <libvu0.h>

#include <cstdlib>

#include "effect.hpp"
#include "effectgroup.hpp"
#include "frame.hpp"
#include "rect.hpp"
#include "texture.hpp"

#ifdef NON_MATCHING
/** Direction the wind blows the effects in. */
static sceVu0FVECTOR wind_dir;

/** Frames the effects have been running, which thins how often they spawn. */
static int effect_count;

/** Textures the three effects draw with, looked up once a frame. */
static CTexture *smoke_tex;
static CTexture *sibuki_tex;
static CTexture *hamon_tex;
#endif

#ifdef NON_MATCHING
void EffectMacroStep(float *wind) {
    sceVu0CopyVector(wind_dir, wind);
    effect_count++;
    smoke_tex = TexManager.GetTexture("smoke", -1);
    sibuki_tex = TexManager.GetTexture("shibuki", -1);
    hamon_tex = TexManager.GetTexture("hamon", -1);
}
#else
INCLUDE_ASM("asm/nonmatchings/effectmacro", EffectMacroStep__FPf);
#endif
INCLUDE_RODATA("asm/nonmatchings/effectmacro", @621__2);
INCLUDE_RODATA("asm/nonmatchings/effectmacro", @622);
INCLUDE_RODATA("asm/nonmatchings/effectmacro", @623);
#ifdef NON_MATCHING
void EffectSmoke(CEffectGroup *group, float *position, float size, int period) {
    CEffectParam effect;

    // One puff every `period` frames, so a caller can thin its own smoke.
    if (effect_count % period != 0) {
        return;
    }

    effect.texel = CRect_i_(0, 0, 0, 0);
    effect.Initialize();
    sceVu0CopyVector(effect.position, position);
    // Half the puffs drift, on a sine of their own in x and z.
    if (rand() % 2 != 0) {
        effect.position_oscillation_flags = 1;
        effect.position_oscillation_scale[0] = 0.3f * (float) rand() / 2.1474836e9f;
        effect.position_oscillation_rate[0] =
            3.1415927f / (30.0f + (float) (rand() * 20) / 2.1474836e9f);
        effect.position_oscillation_scale[2] = 0.3f * (float) rand() / 2.1474836e9f;
        effect.position_oscillation_rate[2] =
            3.1415927f / (30.0f + (float) (rand() * 20) / 2.1474836e9f);
    }
    effect.opacity_mode = 2;
    effect.render_flags = 1;
    effect.opacity = 0.1f;
    sceVu0ScaleVector(effect.velocity, effect.velocity, 0.4f);
    effect.velocity[1] += 0.2f + 0.2f * (float) rand() / 2.1474836e9f;
    effect.scale_velocity[0] = 0.02f;
    effect.scale_velocity[1] = 0.02f;
    effect.scale[0] = size;
    effect.scale[1] = size;
    effect.lifetime = 0x78;
    effect.texture = smoke_tex;
    // The four puff shapes are the quarters of the texture.
    switch (rand() % 4) {
        case 0:
            effect.texel = CRect_i_(0, 0, 0x40, 0x40);
            break;
        case 1:
            effect.texel = CRect_i_(0x40, 0, 0x40, 0x40);
            break;
        case 2:
            effect.texel = CRect_i_(0, 0x40, 0x40, 0x40);
            break;
        case 3:
            effect.texel = CRect_i_(0x40, 0x40, 0x40, 0x40);
            break;
    }
    effect.width = 10.0f;
    effect.height = 10.0f;
    group->EnterEffect(&effect);
}
#else
INCLUDE_ASM("asm/nonmatchings/effectmacro", EffectSmoke__FP12CEffectGroupPffi);
#endif
#ifdef NON_MATCHING
void EffectWaterSpray(CEffectGroup *group, float *position, float *extent, int period,
                      int phase) {
    CEffectParam effect;

    if ((effect_count + phase) % period != 0) {
        return;
    }

    effect.texel = CRect_i_(0, 0, 0, 0);
    effect.Initialize();
    sceVu0CopyVector(effect.position, position);
    effect.opacity_mode = 2;
    effect.render_flags = 1;
    effect.opacity = 0.5f;

    float spread_x = 0.2f * extent[0];
    float spread_z = 0.2f * extent[2];
    float height = extent[1];
    float rise = 0.1f * height * (1.0f + (float) rand() / 2.1474836e9f);
    float width_grown = rise + 0.5f * (extent[0] + extent[2]);
    float height_grown = height + rise;

    effect.velocity[0] = spread_x * (float) rand() / 2.1474836e9f - 0.5f * spread_x;
    effect.velocity[2] = (spread_x * (float) rand() / 2.1474836e9f - 0.5f * spread_z) - 0.5f;
    effect.velocity[1] = 1.0f + 0.5f * (float) rand() / 2.1474836e9f;
    effect.acceleration[1] = -0.03f;
    effect.scale_velocity[0] = width_grown / 30.0f;
    effect.scale_velocity[1] = height_grown / 30.0f;
    effect.scale[0] = 0.2f * width_grown;
    effect.scale[1] = 0.2f * height_grown;
    effect.lifetime = 0x28;
    effect.texture = sibuki_tex;
    effect.texel = CRect_i_(0, 0, 0x40, 0x40);
    effect.width = 10.0f;
    effect.height = 10.0f;
    group->EnterEffect(&effect);
}
#else
INCLUDE_ASM("asm/nonmatchings/effectmacro", EffectWaterSpray__FP12CEffectGroupPfPfii);
#endif
#ifdef NON_MATCHING
void EffectHamon(CEffectGroup *group, float *position, float size) {
    CEffectParam effect;

    effect.texel = CRect_i_(0, 0, 0, 0);
    effect.Initialize();
    sceVu0CopyVector(effect.position, position);
    effect.opacity_mode = 2;
    effect.render_flags = 1;
    effect.opacity = 1.0f;
    effect.draw_mode = 1;
    effect.lifetime = 0x28;
    // The ring starts at nothing and spreads for its whole life.
    effect.scale_velocity[0] = 0.025f;
    effect.scale_velocity[1] = 0.025f;
    effect.scale_velocity[2] = 0.025f;
    effect.scale[0] = 0.0f;
    effect.scale[1] = 0.0f;
    effect.scale[2] = 0.0f;
    effect.texture = hamon_tex;
    effect.texel = CRect_i_(0, 0, 0x20, 0x20);
    effect.width = size;
    effect.height = size;
    group->EnterEffect(&effect);
}
#else
INCLUDE_ASM("asm/nonmatchings/effectmacro", EffectHamon__FP12CEffectGroupPff);
#endif
INCLUDE_ASM("asm/nonmatchings/effectmacro", DepthOfField__FPfiii);
INCLUDE_RODATA("asm/nonmatchings/effectmacro", @766);
