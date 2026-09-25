#include "runeffect.hpp"

#include <libgraph.h>
#include <libpkt.h>

#include <cmath>

#include "mglib.hpp"
#include "snd.hpp"
#include "texture.hpp"

extern float waveAnimeCnt[32];
extern int sw;

#ifdef NON_MATCHING
static void addBlendSprite(sceVif1Packet *packet, u_long tex0,
                           const CRect_i_ &destination, const CRect_i_ &source,
                           u_long primitive, u8 alpha, int depth) {
    sceVif1PkAddGsAD(packet, SCE_GS_PRIM, primitive);
    sceVif1PkAddGsAD(packet, SCE_GS_RGBAQ,
                     ((u_long) 0x3F800000 << 32) | ((u_long) alpha << 24) | 0x808080);
    sceVif1PkAddGsAD(packet, SCE_GS_TEX0_1, tex0);
    sceVif1PkAddGsAD(packet, SCE_GS_UV,
                     (u_long) (source.x << 4) | ((u_long) (source.y << 4) << 16));
    sceVif1PkAddGsAD(packet, SCE_GS_XYZF2,
                     (u_long) (destination.x * 16 + 0x6C00) |
                         ((u_long) (destination.y * 16 + 0x7900) << 16) |
                         ((u_long) depth << 32));
    sceVif1PkAddGsAD(packet, SCE_GS_UV,
                     (u_long) ((source.x + source.width) << 4) |
                         ((u_long) ((source.y + source.height) << 4) << 16));
    sceVif1PkAddGsAD(packet, SCE_GS_XYZF2,
                     (u_long) ((destination.x + destination.width) * 16 + 0x6C00) |
                         ((u_long) ((destination.y + destination.height) * 16 + 0x7900) << 16) |
                         ((u_long) depth << 32));
}
#endif

#ifdef NON_MATCHING
/**
 * Draws two textures blended over one another.
 *
 * @mangled blendTextuer__FP13sceVif1PacketiiiP8CTextureRC8CRect_i_RC8CRect_i_P8CTextureRC8CRect_i_RC8CRect_i_
 * @address 0x162580
 * @size 0x73C
 */
void blendTextuer(sceVif1Packet *packet, int destination, int width, int format,
                  CTexture *first_texture, const CRect_i_ &first_destination,
                  const CRect_i_ &first_source, CTexture *second_texture,
                  const CRect_i_ &second_destination, const CRect_i_ &second_source) {
    sceGsTex0 frame;
    sceGsTest test = mgPixelTest;
    sceGsZbuf zbuffer = mgZBuffer;
    sceGsAlpha alpha = mgAlpha;
    MGGetFBuffTex(&frame);
    test.bits.ate = 0;
    test.bits.zte = 1;
    test.bits.ztst = 1;
    zbuffer.bits.zmsk = 1;
    alpha.bits.a = 1;
    alpha.bits.b = 2;
    alpha.bits.c = 0;
    alpha.bits.d = 0;

    sceVif1PkCnt(packet, 0);
    sceVif1PkOpenDirectCode(packet, 0);
    sceVif1PkOpenGifTag(packet, *(u_long128 *) &GiftagAD);
    sceVif1PkAddGsAD(packet, SCE_GS_TEX1_1, 0x61);
    sceVif1PkAddGsAD(packet, SCE_GS_TEXFLUSH, 0);
    sceVif1PkAddGsAD(packet, SCE_GS_TEX0_1, *(u_long *) &frame);
    sceVif1PkAddGsAD(packet, SCE_GS_FRAME_1,
                     SCE_GS_SET_FRAME(destination >> 5, width, format, 0));
    sceVif1PkAddGsAD(packet, SCE_GS_TEST_1, *(u_long *) &test);
    sceVif1PkAddGsAD(packet, SCE_GS_ZBUF_1, *(u_long *) &zbuffer);
    addBlendSprite(packet, first_texture->tex0, first_destination, first_source, 0x106, 0x80, 0);
    addBlendSprite(packet, first_texture->tex0, first_destination, first_source, 0x156, 0x80, 0);
    sceVif1PkAddGsAD(packet, SCE_GS_TEXFLUSH, 0);
    sceVif1PkAddGsAD(packet, SCE_GS_ALPHA_1, *(u_long *) &alpha);
    addBlendSprite(packet, second_texture->tex0, second_destination, second_source, 0x156, 0x80,
                   0);
    sceVif1PkAddGsAD(packet, SCE_GS_FRAME_1,
                     SCE_GS_SET_FRAME(frame.TBP0 >> 5, frame.TBW, frame.PSM, 0));
    sceVif1PkAddGsAD(packet, SCE_GS_TEST_1, *(u_long *) &mgPixelTest);
    sceVif1PkAddGsAD(packet, SCE_GS_ZBUF_1, *(u_long *) &mgZBuffer);
    sceVif1PkAddGsAD(packet, SCE_GS_ALPHA_1, *(u_long *) &mgAlpha);
    sceVif1PkCloseGifTag(packet);
    sceVif1PkCloseDirectCode(packet);
}
#else
INCLUDE_ASM("asm/nonmatchings/runeffect", blendTextuer__FP13sceVif1PacketiiiP8CTextureRC8CRect_i_RC8CRect_i_P8CTextureRC8CRect_i_RC8CRect_i_);
#endif
/**
 * Fills the blend table with one period of a sine.
 *
 * @mangled initBlendCnt__Fif
 * @address 0x162CC0
 * @size 0xB4
 */
void initBlendCnt(int count, float scale) {
    for (int i = 0; i < count; i++) {
        float degrees = (360.0f / (float) count) * (float) i;
        float wave = sinf(3.1415927f * degrees / 180.0f);
        waveAnimeCnt[i] = wave * scale;
    }
}
#ifdef NON_MATCHING
/**
 * Draws a blended texture clipped to a rectangle, at a given strength.
 *
 * @mangled blendTextuerTest__FP13sceVif1PacketiiiRC8CRect_i_P8CTextureRC8CRect_i_RC8CRect_i_ff
 * @address 0x162D80
 * @size 0x6E4
 */
void blendTextuerTest(sceVif1Packet *packet, int destination, int width, int format,
                      const CRect_i_ &destination_rect, CTexture *texture,
                      const CRect_i_ &texture_rect, const CRect_i_ &source_rect, float depth,
                      float phase) {
    sceGsTex0 frame;
    sceGsTest test = mgPixelTest;
    sceGsZbuf zbuffer = mgZBuffer;
    sceGsAlpha alpha = mgAlpha;
    MGGetFBuffTex(&frame);
    test.bits.ate = 0;
    test.bits.zte = 1;
    test.bits.ztst = 1;
    zbuffer.bits.zmsk = 1;
    alpha.bits.a = 1;
    alpha.bits.b = 2;
    alpha.bits.c = 0;
    alpha.bits.d = 0;

    sceVif1PkCnt(packet, 0);
    sceVif1PkOpenDirectCode(packet, 0);
    sceVif1PkOpenGifTag(packet, *(u_long128 *) &GiftagAD);
    sceVif1PkAddGsAD(packet, SCE_GS_TEXFLUSH, 0);
    sceVif1PkAddGsAD(packet, SCE_GS_TEX0_1, *(u_long *) &frame);
    sceVif1PkAddGsAD(packet, SCE_GS_TEX1_1, 0x61);
    sceVif1PkAddGsAD(packet, SCE_GS_FRAME_1,
                     SCE_GS_SET_FRAME(destination >> 5, width, format, 0));
    sceVif1PkAddGsAD(packet, SCE_GS_TEST_1, *(u_long *) &test);
    sceVif1PkAddGsAD(packet, SCE_GS_ZBUF_1, *(u_long *) &zbuffer);

    int wave = (int) phase;
    for (int y = 0; y < destination_rect.height; y += 2) {
        int sample = (wave + y / 2) & 31;
        int offset = (int) (16.0f * (depth / 10000.0f) * waveAnimeCnt[sample]);
        CRect_i_ strip_destination(0, y, destination_rect.width, 2);
        CRect_i_ strip_source(destination_rect.x + (offset >> 4),
                              destination_rect.y + y, destination_rect.width, 2);
        addBlendSprite(packet, *(u_long *) &frame, strip_destination, strip_source, 0x116, 0x80,
                       0);
    }

    sceVif1PkAddGsAD(packet, SCE_GS_TEXFLUSH, 0);
    sceVif1PkAddGsAD(packet, SCE_GS_ALPHA_1, *(u_long *) &alpha);
    addBlendSprite(packet, texture->tex0, texture_rect, source_rect, 0x156, 0x80, (int) depth);
    sceVif1PkAddGsAD(packet, SCE_GS_FRAME_1,
                     SCE_GS_SET_FRAME(frame.TBP0 >> 5, frame.TBW, frame.PSM, 0));
    sceVif1PkAddGsAD(packet, SCE_GS_TEST_1, *(u_long *) &mgPixelTest);
    sceVif1PkAddGsAD(packet, SCE_GS_ZBUF_1, *(u_long *) &mgZBuffer);
    sceVif1PkAddGsAD(packet, SCE_GS_ALPHA_1, *(u_long *) &mgAlpha);
    sceVif1PkAddGsAD(packet, SCE_GS_TEXFLUSH, 0);
    sceVif1PkCloseGifTag(packet);
    sceVif1PkCloseDirectCode(packet);
}
#else
INCLUDE_ASM("asm/nonmatchings/runeffect", blendTextuerTest__FP13sceVif1PacketiiiRC8CRect_i_P8CTextureRC8CRect_i_RC8CRect_i_ff);
#endif
/**
 * Sets whether the running effect takes light.
 *
 * @mangled Lighting__10CRunEffectFi
 * @address 0x163470
 * @size 0xC
 */
void CRunEffect::Lighting(int enabled) {
    lighting = enabled;
}
/**
 * Draws the dust the player's run leaves behind.
 *
 * @mangled Draw__10CRunEffectFv
 * @address 0x163480
 * @size 0x46C
 */
void CRunEffect::Draw(void) {
    int top_left[4];
    int bottom_right[4];
    int top_right[4];
    int bottom_left[4];
    sceVu0FVECTOR light;

    CTexture *first = TexManager.GetTexture("fx_foot", -1);
    CTexture *second = TexManager.GetTexture("fx_foot2", -1);
    if (first == NULL || second == NULL) {
        return;
    }

    sceVu0FVECTOR normal = {0.0f, 1.0f, 0.0f, 0.0f};
    MGCalcColor(light, normal);
    light[0] += 80.0f;
    light[1] += 60.0f;
    light[2] += 40.0f;
    if (!(light[0] <= 255.0f)) {
        light[0] = 255.0f;
    }
    if (!(light[1] <= 255.0f)) {
        light[1] = 255.0f;
    }
    if (!(light[2] <= 255.0f)) {
        light[2] = 255.0f;
    }

    spRGBA colour;
    if (lighting != 0) {
        colour.r = (int) light[0];
        colour.g = (int) light[1];
        colour.b = (int) light[2];
        colour.a = 0x80;
    } else {
        colour.r = 0x80;
        colour.g = 0x80;
        colour.b = 0x80;
        colour.a = 0x80;
    }
    sw ^= 1;

    sceGsZbuf zbuffer = mgZBuffer;
    zbuffer.bits.zmsk = 1;
    sceVif1Packet *packet = Vif1Packet;
    sceVif1PkCnt(packet, 0);
    sceVif1PkOpenDirectCode(packet, 0);
    sceVif1PkOpenGifTag(packet, *(u_long128 *) &GiftagAD);
    sceVif1PkAddGsAD(packet, SCE_GS_ZBUF_1, *(u_long *) &zbuffer);
    sceVif1PkCloseGifTag(packet);
    sceVif1PkCloseDirectCode(packet);

    for (int i = 0; i < 8; i++) {
        if (life[i] == 0) {
            continue;
        }
        if (MGRotTransPers3DSprite(top_left, bottom_right, position[i], 12.0f - 0.5f * life[i],
                                   5.5f - 0.25f * life[i], 0) != 1) {
            continue;
        }
        top_right[0] = bottom_right[0];
        top_right[1] = top_left[1];
        top_right[2] = top_left[2];
        top_right[3] = top_left[3];
        bottom_left[0] = top_left[0];
        bottom_left[1] = bottom_right[1];
        bottom_left[2] = bottom_right[2];
        bottom_left[3] = bottom_right[3];
        colour.a = life[i] * 10;
        if (sw != 0) {
            set3DSprite(Vif1Packet, first, CRect_i_(0, 0, 0x20, 0x20), top_left, top_right,
                        bottom_left, bottom_right, &colour);
        } else {
            set3DSprite(Vif1Packet, second, CRect_i_(0, 0, 0x20, 0x20), top_left, top_right,
                        bottom_left, bottom_right, &colour);
        }
    }

    sceVif1PkCnt(packet, 0);
    sceVif1PkOpenDirectCode(packet, 0);
    sceVif1PkOpenGifTag(packet, *(u_long128 *) &GiftagAD);
    sceVif1PkAddGsAD(packet, SCE_GS_ZBUF_1, *(u_long *) &mgZBuffer);
    sceVif1PkCloseGifTag(packet);
    sceVif1PkCloseDirectCode(packet);
}
/**
 * Starts one puff of run dust at a position.
 *
 * @mangled Set__10CRunEffectFPf
 * @address 0x1638F0
 * @size 0x8C
 */
void CRunEffect::Set(float *origin) {
    int slot = -1;
    for (int i = 0; i < 8; i++) {
        if (life[i] == 0) {
            slot = i;
        }
    }
    if (slot != -1) {
        position[slot][0] = origin[0];
        position[slot][1] = origin[1];
        position[slot][2] = origin[2];
        position[slot][3] = 1.0f;
        velocity_y[slot] = 0.3f;
        life[slot] = 16;
    }
}
/**
 * Advances the run dust by a frame.
 *
 * @mangled Step__10CRunEffectFv
 * @address 0x163980
 * @size 0x70
 */
void CRunEffect::Step(void) {
    for (int i = 0; i < 8; i++) {
        if (life[i] != 0) {
            life[i]--;
            velocity_y[i] -= 0.03f;
            position[i][1] += velocity_y[i];
        }
    }
}
/**
 * Constructs the run effect with no dust standing.
 *
 * @mangled __ct__10CRunEffectFv
 * @address 0x1639F0
 * @size 0x3C
 */
CRunEffect::CRunEffect(void) {
    for (int i = 0; i < 8; i++) {
        velocity_y[i] = 0.0f;
        life[i] = 0;
    }
    lighting = 0;
}
