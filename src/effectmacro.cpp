#include "effectmacro.hpp"

#include <libvu0.h>

#include <cstdlib>

#include "effect.hpp"
#include "effectgroup.hpp"
#include "frame.hpp"
#include "mglib.hpp"
#include "rect.hpp"
#include "texture.hpp"

/** Direction the wind blows the effects in. */
extern sceVu0FVECTOR wind_dir;

/** Frames the effects have been running, which thins how often they spawn. */
extern int effect_count;

/** Texture the smoke effect draws with, looked up once a frame. */
extern CTexture *smoke_tex;

/** Texture the water-spray effect draws with, looked up once a frame. */
extern CTexture *sibuki_tex;

/** Texture the ripple effect draws with, looked up once a frame. */
extern CTexture *hamon_tex;

void EffectMacroStep(float *wind) {
    sceVu0CopyVector(wind_dir, wind);
    effect_count++;
    smoke_tex = TexManager.GetTexture("smoke", -1);
    sibuki_tex = TexManager.GetTexture("shibuki", -1);
    hamon_tex = TexManager.GetTexture("hamon", -1);
}
void EffectSmoke(CEffectGroup *group, float *position, float size, int period) {
    CEffectParam effect;

    // One puff every `period` frames, so a caller can thin its own smoke.
    if (effect_count % period != 0) {
        return;
    }

    effect.texel.x = effect.texel.y = effect.texel.width = effect.texel.height = 0;
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
void EffectWaterSpray(CEffectGroup *group, float *position, float *extent, int period,
                      int phase) {
    CEffectParam effect;

    if ((effect_count + phase) % period != 0) {
        return;
    }

    effect.texel.x = effect.texel.y = effect.texel.width = effect.texel.height = 0;
    effect.Initialize();
    sceVu0CopyVector(effect.position, position);
    effect.opacity_mode = 2;
    effect.render_flags = 1;
    effect.opacity = 0.5f;

    float spread_x = 0.2f * extent[0];
    float spread_z = 0.2f * extent[2];
    float rise = 0.1f * extent[1] * (1.0f + (float) rand() / 2.1474836e9f);
    float width_grown = rise + 0.5f * (extent[0] + extent[2]);
    float height_grown = extent[1] + rise;

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
void EffectHamon(CEffectGroup *group, float *position, float size) {
    CEffectParam effect;

    effect.texel.x = effect.texel.y = effect.texel.width = effect.texel.height = 0;
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
#ifdef NON_MATCHING
void DepthOfField(float *focus, int level, int alpha, int blur) {
    static float displacement[21][15];
    sceGsTex0 frame_texture;
    sceGsTex0 blur_texture;
    sceGsTest test;
    sceGsZbuf zbuffer;
    sceVu0FVECTOR focus_vertices[4] = {
        {0.0f, 0.0f, 0.0f, 1.0f},
        {0.0f, 0.0f, 0.0f, 1.0f},
        {0.0f, 0.0f, 0.0f, 1.0f},
        {0.0f, 0.0f, 0.0f, 1.0f},
    };
    int screen_depth[4];
    int strip;
    int column;
    int row;

    MGGetFBuffTex(&frame_texture);
    blur_texture = *(sceGsTex0 *) &TexManager.GetTexture("frame_image", -1)->tex0;
    blur_texture.TBW = 16;

    // Downsample the frame horizontally and then vertically into the blur texture.
    MGStretchMoveImage(&frame_texture, CRect_i_(0, 0, 0x2800, 0xE00), &blur_texture,
                       CRect_i_(0, 0, 0x1400, 0xE00));
    MGStretchMoveImage(&blur_texture, CRect_i_(0, 0, 0x1400, 0xE00), &blur_texture,
                       CRect_i_(0x1400, 0, 0xA00, 0xE00));

    focus_vertices[0][2] = focus[0];
    focus_vertices[1][2] = focus[0] + 30.0f;
    focus_vertices[2][2] = focus[1];
    focus_vertices[3][2] = focus[1] + 20.0f;
    for (column = 0; column < 4; column++) {
        sceVu0ApplyMatrix(focus_vertices[column], mgRenderInfo.screen, focus_vertices[column]);
        focus_vertices[column][2] /= focus_vertices[column][3];
        screen_depth[column] = (int) focus_vertices[column][2];
    }

    test = mgPixelTest;
    test.bits.ate = 0;
    test.bits.aref = 0;
    test.bits.atst = 2;
    test.bits.zte = 1;
    test.bits.ztst = 2;
    zbuffer = mgZBuffer;
    zbuffer.bits.zmsk = 1;

    sceVif1PkCnt(Vif1Packet, 0);
    sceVif1PkOpenDirectCode(Vif1Packet, 0);
    sceVif1PkOpenGifTag(Vif1Packet, *(u_long128 *) &GiftagAD);
    sceVif1PkAddGsAD(Vif1Packet, SCE_GS_TEXFLUSH, 0);
    sceVif1PkAddGsAD(Vif1Packet, SCE_GS_TEX1_1, 0x61);
    sceVif1PkAddGsAD(Vif1Packet, SCE_GS_TEX0_1, *(u_long *) &blur_texture);
    sceVif1PkAddGsAD(Vif1Packet, SCE_GS_TEST_1, *(u_long *) &test);
    sceVif1PkAddGsAD(Vif1Packet, SCE_GS_ZBUF_1, *(u_long *) &zbuffer);
    sceVif1PkAddGsAD(Vif1Packet, SCE_GS_RGBAQ, 0x80808080);
    sceVif1PkCloseGifTag(Vif1Packet);
    sceVif1PkCloseDirectCode(Vif1Packet);

    // Draw the coarse texture above and below the focused depth range.
    for (strip = 0; strip < 1; strip++) {
        sceVif1PkCnt(Vif1Packet, 0);
        sceVif1PkOpenDirectCode(Vif1Packet, 0);
        sceVif1PkOpenGifTag(Vif1Packet, *(u_long128 *) &GiftagAD);
        for (row = 0; row < 8; row++) {
            int y = row * 0x200;
            sceVif1PkAddGsAD(Vif1Packet, SCE_GS_PRIM, 0x15C);
            for (column = 0; column < 41; column++) {
                int x = column * 0x100 + 0x6C00;
                int u = column * 0x80;
                int depth = screen_depth[(column + strip) & 1];
                sceVif1PkAddGsAD(Vif1Packet, SCE_GS_RGBAQ,
                                 ((u_long) alpha << 24) | 0x808080);
                sceVif1PkAddGsAD(Vif1Packet, SCE_GS_UV,
                                 (u_long) u | ((u_long) y << 16));
                sceVif1PkAddGsAD(Vif1Packet, SCE_GS_XYZF2,
                                 (u_long) x | ((u_long) (y + 0x7900) << 16) |
                                     ((u_long) depth << 32));
                sceVif1PkAddGsAD(Vif1Packet, SCE_GS_UV,
                                 (u_long) u | ((u_long) (y + 0x200) << 16));
                sceVif1PkAddGsAD(Vif1Packet, SCE_GS_XYZF2,
                                 (u_long) x | ((u_long) (y + 0x7B00) << 16) |
                                     ((u_long) depth << 32));
            }
        }
        sceVif1PkCloseGifTag(Vif1Packet);
        sceVif1PkCloseDirectCode(Vif1Packet);
    }

    sceVif1PkCnt(Vif1Packet, 0);
    sceVif1PkOpenDirectCode(Vif1Packet, 0);
    sceVif1PkOpenGifTag(Vif1Packet, *(u_long128 *) &GiftagAD);
    if (level >= 2) {
        if (blur > 0) {
            for (column = 0; column < 21; column++) {
                for (row = 0; row < 15; row++) {
                    float &offset = displacement[column][row];
                    offset += 0.2f * (float) blur *
                              ((float) rand() / 2.1474836e9f - 0.5f);
                    if (offset < 0.0f) {
                        offset = 0.0f;
                    }
                    if (offset > (float) blur) {
                        offset = (float) blur;
                    }
                }
            }
            alpha = 0x80;
        }

        for (row = 0; row < 14; row++) {
            int y = row * 0x100;
            sceVif1PkAddGsAD(Vif1Packet, SCE_GS_PRIM, 0x15C);
            sceVif1PkAddGsAD(Vif1Packet, SCE_GS_RGBAQ,
                             ((u_long) alpha << 24) | 0x808080);
            for (column = 0; column < 21; column++) {
                int x = column * 0x200 + 0x6C00;
                int u = column * 0x80 + 0x1400;
                int depth = screen_depth[2 + (column & 1)];
                int upper_x = x;
                int lower_x = x;
                if (blur > 0) {
                    upper_x -= (int) displacement[column][row];
                    lower_x -= (int) displacement[column][row + 1];
                }
                sceVif1PkAddGsAD(Vif1Packet, SCE_GS_UV,
                                 (u_long) u | ((u_long) y << 16));
                sceVif1PkAddGsAD(Vif1Packet, SCE_GS_XYZF2,
                                 (u_long) upper_x | ((u_long) (y + 0x7900) << 16) |
                                     ((u_long) depth << 32));
                sceVif1PkAddGsAD(Vif1Packet, SCE_GS_UV,
                                 (u_long) u | ((u_long) (y + 0x100) << 16));
                sceVif1PkAddGsAD(Vif1Packet, SCE_GS_XYZF2,
                                 (u_long) lower_x | ((u_long) (y + 0x7A00) << 16) |
                                     ((u_long) depth << 32));
            }
        }
    }
    sceVif1PkAddGsAD(Vif1Packet, SCE_GS_TEXFLUSH, 0);
    sceVif1PkAddGsAD(Vif1Packet, SCE_GS_TEST_1, *(u_long *) &mgPixelTest);
    sceVif1PkAddGsAD(Vif1Packet, SCE_GS_ZBUF_1, *(u_long *) &mgZBuffer);
    sceVif1PkCloseGifTag(Vif1Packet);
    sceVif1PkCloseDirectCode(Vif1Packet);
}
#else
INCLUDE_ASM("asm/nonmatchings/effectmacro", DepthOfField__FPfiii);
#endif
INCLUDE_RODATA("asm/nonmatchings/effectmacro", @766);
