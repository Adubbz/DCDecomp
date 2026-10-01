#include "runeffect.hpp"

#include <libgraph.h>
#include <libpkt.h>

#include <cmath>
#include <cstdlib>

#include "mglib.hpp"
#include "rect.hpp"
#include "snd.hpp"
#include "texture.hpp"

float waveAnimeCnt[32];
int   sw;

/**
 * Draws two textures blended over one another.
 *
 * @mangled blendTextuer__FP13sceVif1PacketiiiP8CTextureRC8CRect_i_RC8CRect_i_P8CTextureRC8CRect_i_RC8CRect_i_
 * @address 0x162580
 * @size 0x73C
 */
void blendTextuer(sceVif1Packet *packet, int destination, int width, int format, CTexture *first_texture, const CRect_i_ &first_destination, const CRect_i_ &first_source, CTexture *second_texture, const CRect_i_ &second_destination, const CRect_i_ &second_source) {
    sceGsTex0  frame;
    sceGsTest  test;
    sceGsZbuf  zbuffer;
    sceGsAlpha alpha;
    float      q = 1.0f;

    MGGetFBuffTex(&frame);
    sceVif1PkCnt(packet, 0);
    sceVif1PkOpenDirectCode(packet, 0);
    sceVif1PkOpenGifTag(packet, *(u_long128 *) &GiftagAD);
    sceVif1PkAddGsAD(packet, SCE_GS_TEX1_1, 0x61);
    sceVif1PkAddGsAD(packet, SCE_GS_TEXFLUSH, 0);
    sceVif1PkAddGsAD(packet, SCE_GS_TEX0_1, *(u_long *) &frame);
    sceVif1PkAddGsAD(packet, SCE_GS_FRAME_1, SCE_GS_SET_FRAME(destination >> 5, width, format, 0));
    test = mgPixelTest;
    test.bits.ate = 0;
    test.bits.zte = 1;
    test.bits.ztst = 1;
    sceVif1PkAddGsAD(packet, SCE_GS_TEST_1, *(u_long *) &test);
    zbuffer = mgZBuffer;
    zbuffer.bits.zmsk = 1;
    sceVif1PkAddGsAD(packet, SCE_GS_ZBUF_1, *(u_long *) &zbuffer);

    sceVif1PkAddGsAD(packet, SCE_GS_PRIM, 0x106);
    sceVif1PkAddGsAD(packet, SCE_GS_RGBAQ, SCE_GS_SET_RGBAQ(0x80, 0x80, 0x80, 0x80, *(u_int *) &q));
    sceVif1PkAddGsAD(packet, SCE_GS_TEX0_1, first_texture->tex0);
    sceVif1PkAddGsAD(packet, SCE_GS_UV, SCE_GS_SET_UV(first_source.x << 4, first_source.y << 4));
    sceVif1PkAddGsAD(packet, SCE_GS_XYZF2, SCE_GS_SET_XYZF2((first_destination.x << 4) + 0x6C00, (first_destination.y << 4) + GS_Y_OFFSET, 0, 0));
    // This pass takes the bottom texel row from x rather than y.
    sceVif1PkAddGsAD(packet, SCE_GS_UV, SCE_GS_SET_UV((first_source.x + first_source.width) << 4, (first_source.x + first_source.height) << 4));
    sceVif1PkAddGsAD(packet, SCE_GS_XYZF2, SCE_GS_SET_XYZF2(((first_destination.x + first_destination.width) << 4) + 0x6C00, ((first_destination.y + first_destination.height) << 4) + GS_Y_OFFSET, 0, 0));

    sceVif1PkAddGsAD(packet, SCE_GS_PRIM, 0x156);
    sceVif1PkAddGsAD(packet, SCE_GS_RGBAQ, SCE_GS_SET_RGBAQ(0x80, 0x80, 0x80, 0x80, *(u_int *) &q));
    sceVif1PkAddGsAD(packet, SCE_GS_TEX0_1, first_texture->tex0);
    sceVif1PkAddGsAD(packet, SCE_GS_UV, SCE_GS_SET_UV(first_source.x << 4, first_source.y << 4));
    sceVif1PkAddGsAD(packet, SCE_GS_XYZF2, SCE_GS_SET_XYZF2((first_destination.x << 4) + 0x6C00, (first_destination.y << 4) + GS_Y_OFFSET, 0, 0));
    sceVif1PkAddGsAD(packet, SCE_GS_UV, SCE_GS_SET_UV((first_source.x + first_source.width) << 4, (first_source.y + first_source.height) << 4));
    sceVif1PkAddGsAD(packet, SCE_GS_XYZF2, SCE_GS_SET_XYZF2(((first_destination.x + first_destination.width) << 4) + 0x6C00, ((first_destination.y + first_destination.height) << 4) + GS_Y_OFFSET, 0, 0));
    sceVif1PkAddGsAD(packet, SCE_GS_TEXFLUSH, 0);

    zbuffer = mgZBuffer;
    zbuffer.bits.zmsk = 1;
    sceVif1PkAddGsAD(packet, SCE_GS_ZBUF_1, *(u_long *) &zbuffer);
    alpha = mgAlpha;
    alpha.bits.a = 1;
    alpha.bits.b = 2;
    alpha.bits.c = 0;
    alpha.bits.d = 0;
    sceVif1PkAddGsAD(packet, SCE_GS_ALPHA_1, *(u_long *) &alpha);

    sceVif1PkAddGsAD(packet, SCE_GS_PRIM, 0x156);
    sceVif1PkAddGsAD(packet, SCE_GS_RGBAQ, SCE_GS_SET_RGBAQ(0x80, 0x80, 0x80, 0x80, *(u_int *) &q));
    sceVif1PkAddGsAD(packet, SCE_GS_TEX0_1, second_texture->tex0);
    sceVif1PkAddGsAD(packet, SCE_GS_UV, SCE_GS_SET_UV(second_source.x << 4, second_source.y << 4));
    sceVif1PkAddGsAD(packet, SCE_GS_XYZF2, SCE_GS_SET_XYZF2((second_destination.x << 4) + 0x6C00, (second_destination.y << 4) + GS_Y_OFFSET, 0, 0));
    sceVif1PkAddGsAD(packet, SCE_GS_UV, SCE_GS_SET_UV((second_source.x + second_source.width) << 4, (second_source.y + second_source.height) << 4));
    sceVif1PkAddGsAD(packet, SCE_GS_XYZF2, SCE_GS_SET_XYZF2(((second_destination.x + second_destination.width) << 4) + 0x6C00, ((second_destination.y + second_destination.height) << 4) + GS_Y_OFFSET, 0, 0));

    sceVif1PkAddGsAD(packet, SCE_GS_FRAME_1, SCE_GS_SET_FRAME(frame.TBP0 >> 5, frame.TBW, frame.PSM, 0));
    sceVif1PkAddGsAD(packet, SCE_GS_TEST_1, *(u_long *) &mgPixelTest);
    sceVif1PkAddGsAD(packet, SCE_GS_ZBUF_1, *(u_long *) &mgZBuffer);
    sceVif1PkAddGsAD(packet, SCE_GS_ALPHA_1, *(u_long *) &mgAlpha);
    sceVif1PkCloseGifTag(packet);
    sceVif1PkCloseDirectCode(packet);
}

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
        float wave = sinf(PI * degrees / 180.0f);
        waveAnimeCnt[i] = wave * scale;
    }
}

/**
 * Copies a frame-buffer region into a work texture in two-line strips that
 * sway sideways by a depth-scaled wave, then blends a texture over the copy.
 *
 * @mangled blendTextuerTest__FP13sceVif1PacketiiiRC8CRect_i_P8CTextureRC8CRect_i_RC8CRect_i_ff
 * @address 0x162D80
 * @size 0x6E4
 */
void blendTextuerTest(sceVif1Packet *packet, int destination, int width, int format, const CRect_i_ &source, CTexture *texture, const CRect_i_ &texture_destination, const CRect_i_ &texture_source, float depth, float phase) {
    sceGsTex0  frame;
    sceGsTest  test;
    sceGsZbuf  zbuffer;
    sceGsAlpha alpha;
    float      q = 1.0f;

    MGGetFBuffTex(&frame);
    depth /= 10000;
    sceVif1PkCnt(packet, 0);
    sceVif1PkOpenDirectCode(packet, 0);
    sceVif1PkOpenGifTag(packet, *(u_long128 *) &GiftagAD);
    sceVif1PkAddGsAD(packet, SCE_GS_TEXFLUSH, 0);
    sceVif1PkAddGsAD(packet, SCE_GS_TEX0_1, *(u_long *) &frame);
    sceVif1PkAddGsAD(packet, SCE_GS_TEX1_1, 0x61);
    sceVif1PkAddGsAD(packet, SCE_GS_FRAME_1, SCE_GS_SET_FRAME(destination >> 5, width, format, 0));
    test = mgPixelTest;
    test.bits.ate = 0;
    test.bits.zte = 1;
    test.bits.ztst = 1;
    sceVif1PkAddGsAD(packet, SCE_GS_TEST_1, *(u_long *) &test);
    zbuffer = mgZBuffer;
    zbuffer.bits.zmsk = 1;
    sceVif1PkAddGsAD(packet, SCE_GS_ZBUF_1, *(u_long *) &zbuffer);

    int   y;
    int   top = 0;
    int   bottom = 0;
    int   count = 0;
    float amplitude = 0.0f;

    for (y = 0; y < source.height; y += 2) {
        int index = count + (int) phase;

        if (index >= 8) {
            index -= 8;
        }

        int offset = (int) (16.0f * (depth * (amplitude * waveAnimeCnt[index])));
        bottom += 2;
        int left = (source.x << 4) + offset;

        if (left < 0) {
            left = 0;
        }

        int right = offset + ((source.x + source.width) << 4);

        if (right > 0x27F0) {
            right = 0x27F0;
        }

        sceVif1PkAddGsAD(packet, SCE_GS_TEX0_1, *(u_long *) &frame);
        sceVif1PkAddGsAD(packet, SCE_GS_PRIM, 0x116);
        sceVif1PkAddGsAD(packet, SCE_GS_RGBAQ, SCE_GS_SET_RGBAQ(0x80, 0x80, 0x80, 0x80, *(u_int *) &q));
        sceVif1PkAddGsAD(packet, SCE_GS_UV, SCE_GS_SET_UV(left, (source.y + top) << 4));
        sceVif1PkAddGsAD(packet, SCE_GS_XYZF2, SCE_GS_SET_XYZF2(0x6C00, (y << 4) + GS_Y_OFFSET, 0, 0));
        sceVif1PkAddGsAD(packet, SCE_GS_UV, SCE_GS_SET_UV(right, (source.y + bottom) << 4));
        sceVif1PkAddGsAD(packet, SCE_GS_XYZF2, SCE_GS_SET_XYZF2((source.width << 4) + 0x6C00, ((y + 2) << 4) + GS_Y_OFFSET, 0, 0));
        top = bottom;
        count++;

        if (count >= 8) {
            amplitude = 1.3f * rand() / 2147483648.0f;
        }

        if (count >= 8) {
            count = 0;
        }
    }

    sceVif1PkAddGsAD(packet, SCE_GS_TEXFLUSH, 0);
    alpha = mgAlpha;
    alpha.bits.a = 2;
    alpha.bits.b = 2;
    alpha.bits.c = 2;
    alpha.bits.d = 1;
    sceVif1PkAddGsAD(packet, SCE_GS_ALPHA_1, *(u_long *) &alpha);

    sceVif1PkAddGsAD(packet, SCE_GS_PRIM, 0x156);
    sceVif1PkAddGsAD(packet, SCE_GS_RGBAQ, SCE_GS_SET_RGBAQ(0x80, 0x80, 0x80, 0x80, *(u_int *) &q));
    sceVif1PkAddGsAD(packet, SCE_GS_TEX0_1, texture->tex0);
    sceVif1PkAddGsAD(packet, SCE_GS_UV, SCE_GS_SET_UV(texture_source.x << 4, texture_source.y << 4));
    sceVif1PkAddGsAD(packet, SCE_GS_XYZF2, SCE_GS_SET_XYZF2((texture_destination.x << 4) + 0x6C00, (texture_destination.y << 4) + GS_Y_OFFSET, 0, 0));
    sceVif1PkAddGsAD(packet, SCE_GS_UV, SCE_GS_SET_UV((texture_source.x + texture_source.width) << 4, (texture_source.y + texture_source.height) << 4));
    sceVif1PkAddGsAD(packet, SCE_GS_XYZF2, SCE_GS_SET_XYZF2(((texture_destination.x + texture_destination.width) << 4) + 0x6C00, ((texture_destination.y + texture_destination.height) << 4) + GS_Y_OFFSET, 0, 0));

    sceVif1PkAddGsAD(packet, SCE_GS_FRAME_1, SCE_GS_SET_FRAME(frame.TBP0 >> 5, frame.TBW, frame.PSM, 0));
    sceVif1PkAddGsAD(packet, SCE_GS_TEST_1, *(u_long *) &mgPixelTest);
    sceVif1PkAddGsAD(packet, SCE_GS_ZBUF_1, *(u_long *) &mgZBuffer);
    sceVif1PkAddGsAD(packet, SCE_GS_ALPHA_1, *(u_long *) &mgAlpha);
    sceVif1PkAddGsAD(packet, SCE_GS_TEXFLUSH, 0);
    sceVif1PkCloseGifTag(packet);
    sceVif1PkCloseDirectCode(packet);
}

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
void CRunEffect::Draw() {
    int           top_left[4];
    int           bottom_right[4];
    int           top_right[4];
    int           bottom_left[4];
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

        if (MGRotTransPers3DSprite(top_left, bottom_right, position[i], 12.0f - 0.5f * life[i], 5.5f - 0.25f * life[i], 0) != 1) {
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
            set3DSprite(Vif1Packet, first, CRect_i_(0, 0, 0x20, 0x20), top_left, top_right, bottom_left, bottom_right, &colour);
        } else {
            set3DSprite(Vif1Packet, second, CRect_i_(0, 0, 0x20, 0x20), top_left, top_right, bottom_left, bottom_right, &colour);
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
void CRunEffect::Step() {
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
CRunEffect::CRunEffect() {
    for (int i = 0; i < 8; i++) {
        velocity_y[i] = 0.0f;
        life[i] = 0;
    }

    lighting = false;
}
