#include "effectmacro.hpp"

#include <libvu0.h>

#include <cstdlib>

#include "effect.hpp"
#include "effectgroup.hpp"
#include "frame.hpp"
#include "mglib.hpp"
#include "rect.hpp"
#include "texture.hpp"

sceVu0FVECTOR wind_dir = {0.0f, 0.0f, 0.0f, 0.0f};
int           effect_count;
CTexture     *smoke_tex;
CTexture     *sibuki_tex;
CTexture     *hamon_tex;

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
        effect.position_oscillation_rate[0] = 3.1415927f / (30.0f + (float) (rand() * 20) / 2.1474836e9f);
        effect.position_oscillation_scale[2] = 0.3f * (float) rand() / 2.1474836e9f;
        effect.position_oscillation_rate[2] = 3.1415927f / (30.0f + (float) (rand() * 20) / 2.1474836e9f);
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

void EffectWaterSpray(CEffectGroup *group, float *position, float *extent, int period, int phase) {
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

void DepthOfField(float *focus, int level, int alpha, int blur) {
    static float rd[21][15];
    sceGsTex0    frame;
    sceGsTex0    image;
    sceGsTest    test;
    sceGsZbuf    zbuffer;
    int          phase;
    int          i;
    int          j;
    int          k;

    MGGetFBuffTex(&frame);
    image = *(sceGsTex0 *) &TexManager.GetTexture("frame_image", -1)->tex0;
    frame.PSM = SCE_GS_PSMCT24;
    MGStretchMoveImage(&frame, CRect_i_(0, 0, 0x2800, (SCREEN_HALF_HEIGHT << 4)), &image, CRect_i_(0, 0, 0x1400, (SCREEN_HALF_HEIGHT << 4)));
    MGStretchMoveImage(&image, CRect_i_(0, 0, 0x1400, (SCREEN_HALF_HEIGHT << 4)), &image, CRect_i_(0x1400, 0, 0xA00, (SCREEN_HALF_HEIGHT << 4)));

    sceVu0FVECTOR depth_point[4] = {
        {0.0f, 0.0f, focus[0],         1.0f},
        {0.0f, 0.0f, focus[0] + 30.0f, 1.0f},
        {0.0f, 0.0f, focus[1],         1.0f},
        {0.0f, 0.0f, focus[1] + 20.0f, 1.0f},
    };
    int screen[4][4];
    for (i = 0; i < 4; i++) {
        sceVu0ApplyMatrix(depth_point[i], mgRenderInfo.screen, depth_point[i]);
        depth_point[i][2] /= depth_point[i][3];
        screen[i][2] = (int) depth_point[i][2];
    }

    sceVif1PkCnt(Vif1Packet, 0);
    sceVif1PkOpenDirectCode(Vif1Packet, 0);
    sceVif1PkOpenGifTag(Vif1Packet, *(u_long128 *) &GiftagAD);
    sceVif1PkAddGsAD(Vif1Packet, SCE_GS_TEXFLUSH, 0);
    sceVif1PkAddGsAD(Vif1Packet, SCE_GS_TEX1_1, 0x61);
    sceVif1PkAddGsAD(Vif1Packet, SCE_GS_TEX0_1, *(u_long *) &image);
    test = mgPixelTest;
    test.bits.ate = 0;
    test.bits.aref = 0;
    test.bits.atst = 1;
    test.bits.zte = 1;
    test.bits.ztst = 2;
    sceVif1PkAddGsAD(Vif1Packet, SCE_GS_TEST_1, *(u_long *) &test);
    zbuffer = mgZBuffer;
    zbuffer.bits.zmsk = 1;
    sceVif1PkAddGsAD(Vif1Packet, SCE_GS_ZBUF_1, *(u_long *) &zbuffer);
    sceVif1PkAddGsAD(Vif1Packet, SCE_GS_RGBAQ, SCE_GS_SET_RGBAQ(0x80, 0x80, 0x80, 0x80, 0));
    sceVif1PkCloseGifTag(Vif1Packet);
    sceVif1PkCloseDirectCode(Vif1Packet);

    for (phase = 0; phase < 1; phase++) {
        sceVif1PkCnt(Vif1Packet, 0);
        sceVif1PkOpenDirectCode(Vif1Packet, 0);
        sceVif1PkOpenGifTag(Vif1Packet, *(u_long128 *) &GiftagAD);
        for (k = 0; k < 8; k++) {
            sceVif1PkAddGsAD(Vif1Packet, SCE_GS_PRIM, 0x15C);
            for (j = 0; j < 41; j++) {
                int x = (j << 8) + 0x6C00;
                int v = k << 9;
                int y = v + GS_Y_OFFSET;
                int u = j << 7;
                sceVif1PkAddGsAD(Vif1Packet, SCE_GS_RGBAQ, SCE_GS_SET_RGBAQ(0x80, 0x80, 0x80, alpha, 0));
                sceVif1PkAddGsAD(Vif1Packet, SCE_GS_UV, SCE_GS_SET_UV(u, v));
                sceVif1PkAddGsAD(Vif1Packet, SCE_GS_XYZF2, SCE_GS_SET_XYZF2(x, y, screen[(j + phase) % 2][2], 0));
                sceVif1PkAddGsAD(Vif1Packet, SCE_GS_UV, SCE_GS_SET_UV(u, v + 0x200));
                sceVif1PkAddGsAD(Vif1Packet, SCE_GS_XYZF2, SCE_GS_SET_XYZF2(x, y + 0x200, screen[(j + phase) % 2][2], 0));
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
            for (i = 0; i < 21; i++) {
                for (j = 0; j < 15; j++) {
                    if (blur > 0) {
                        rd[i][j] += 0.2f * ((float) blur * ((float) rand() / 2147483648.0f - 0.5f));
                        if (rd[i][j] < 0.0f) {
                            rd[i][j] = 0.0f;
                        }
                        if (rd[i][j] > (float) blur) {
                            rd[i][j] = (float) blur;
                        }
                    } else {
                        rd[i][j] = 0.0f;
                    }
                }
            }
        }
        if (blur > 0) {
            alpha = 0x80;
        }
#ifdef PAL
        for (j = 0; j < 15; j++) {
#else
        for (j = 0; j < 14; j++) {
#endif
            sceVif1PkAddGsAD(Vif1Packet, SCE_GS_PRIM, 0x15C);
            sceVif1PkAddGsAD(Vif1Packet, SCE_GS_RGBAQ, SCE_GS_SET_RGBAQ(0x80, 0x80, 0x80, alpha, 0));
            for (i = 0; i < 21; i++) {
                int x = (i << 9) + 0x6C00;
                int v = j << 8;
                int y = v + GS_Y_OFFSET;
                int y_bottom = y + 0x100;
                int u = (i << 7) + 0x1400;
                int v_bottom = v + 0x100;
                if (blur > 0) {
                    sceVif1PkAddGsAD(Vif1Packet, SCE_GS_UV, SCE_GS_SET_UV(u, v));
                    sceVif1PkAddGsAD(Vif1Packet, SCE_GS_XYZF2, SCE_GS_SET_XYZF2(x - (int) rd[i][j], y, screen[2 + i % 2][2], 0));
                    sceVif1PkAddGsAD(Vif1Packet, SCE_GS_UV, SCE_GS_SET_UV(u, v_bottom));
                    sceVif1PkAddGsAD(Vif1Packet, SCE_GS_XYZF2, SCE_GS_SET_XYZF2(x - (int) rd[i][j + 1], y_bottom, screen[2 + i % 2][2], 0));
                } else {
                    sceVif1PkAddGsAD(Vif1Packet, SCE_GS_UV, SCE_GS_SET_UV(u, v));
                    sceVif1PkAddGsAD(Vif1Packet, SCE_GS_XYZF2, SCE_GS_SET_XYZF2(x, y, screen[2 + i % 2][2], 0));
                    sceVif1PkAddGsAD(Vif1Packet, SCE_GS_UV, SCE_GS_SET_UV(u, v_bottom));
                    sceVif1PkAddGsAD(Vif1Packet, SCE_GS_XYZF2, SCE_GS_SET_XYZF2(x, y_bottom, screen[2 + i % 2][2], 0));
                }
            }
        }
    }
    sceVif1PkAddGsAD(Vif1Packet, SCE_GS_TEXFLUSH, 0);
    sceVif1PkAddGsAD(Vif1Packet, SCE_GS_TEST_1, *(u_long *) &mgPixelTest);
    sceVif1PkAddGsAD(Vif1Packet, SCE_GS_ZBUF_1, *(u_long *) &mgZBuffer);
    sceVif1PkCloseGifTag(Vif1Packet);
    sceVif1PkCloseDirectCode(Vif1Packet);
}
