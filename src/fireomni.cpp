#include "fireomni.hpp"

#include <cstdlib>

#include "camera.hpp"
#include "mglib.hpp"
#include "rect.hpp"
#include "runeffect.hpp"
#include "snd.hpp"
#include "texture.hpp"

CFireOmni::CFireOmni(void) {
    raster_phase = 0.0f;
    flame_phase = 0.0f;
    cell_phase = 15.0f;
    flicker_width = 0.0f;
    flicker_height = 0.0f;
    // Starting the count somewhere in the cycle keeps two fires out of step.
    flicker_count = (int) (4.0f * (float) rand() / 2.1474836e9f);
    flicker_seed = 0;
    unk_00 = 0;
    glow = NULL;
    core = NULL;
    texture_set = 0;
}

void CFireOmni::FireStep(void) {
    cell_phase -= 0.4f;
    if (cell_phase <= 0.0f) {
        cell_phase = 14.8f;
    }
    flame_phase += 1.0f;
    if (!(flame_phase < 128.0f)) {
        flame_phase = 0.0f;
    }
    flicker_seed = (int) (60000.0f * (float) rand() / 2.1474836e9f);
}

void CFireOmni::FireCreate(void) {
    CTexture *texture = TexManager.GetTexture("d01e02", -1);
    if (texture == NULL) {
        return;
    }

    if (texture->bpp == 1) {
        int cell = (int) cell_phase;
        int column = cell % 4;
        int row = cell / 4;
        sceGsTex0 blend =
            *reinterpret_cast<sceGsTex0 *>(&TexManager.GetTexture("blender", -1)->tex0);
        blendTextuer(Vif1Packet, blend.TBP0, blend.TBW, blend.PSM,
                     TexManager.GetTexture("d01e03", -1), CRect_i_(0, 0, 128, 128),
                     CRect_i_(0, (int) flame_phase, 128, 64), TexManager.GetTexture("d01e02", -1),
                     CRect_i_(0, 0, 128, 128), CRect_i_(column * 64, row * 64, 64, 64));
    } else {
        sceGsTex0 blend =
            *reinterpret_cast<sceGsTex0 *>(&TexManager.GetTexture("blender", -1)->tex0);
        blendTextuer(Vif1Packet, blend.TBP0, blend.TBW, blend.PSM,
                     TexManager.GetTexture("d01e03", -1), CRect_i_(0, 0, 128, 128),
                     CRect_i_(0, (int) flame_phase, 128, 64), TexManager.GetTexture("d01e02", -1),
                     CRect_i_(0, 0, 128, 128), CRect_i_(0, (int) cell_phase * 64, 64, 64));
    }
}

void CFireOmni::SetTexture(CTexture *core_texture, CTexture *glow_texture) {
    this->core = core_texture;
    this->glow = glow_texture;
    this->texture_set = 1;
}

void CFireOmni::DrawFire(int unused0, int unused1, CCamera *camera, float *colour, float scale,
                         int layers, float camera_offset) {
    sceVu0FVECTOR camera_direction;
    sceVu0FVECTOR camera_ref;
    int near_top_left[4];
    int near_bottom_right[4];
    sceVu0FVECTOR world;
    int top_left[4];
    int bottom_right[4];
    int top_right[4];
    int bottom_left[4];
    sceGsTest test;
    sceGsZbuf zbuffer;
    sceGsAlpha alpha;

    if (texture_set == 0) {
        if (core == NULL) {
            core = TexManager.GetTexture("lightling", -1);
        }
        if (glow == NULL) {
            glow = TexManager.GetTexture("blender", -1);
        }
    }

    camera->GetPos(camera_direction);
    camera->GetRef(camera_ref);
    sceVu0SubVector(camera_direction, camera_direction, camera_ref);
    sceVu0Normalize(camera_direction, camera_direction);
    sceVu0ScaleVector(camera_direction, camera_direction, camera_offset);
    spRGBA white = {0x80, 0x80, 0x80, 0x80};

    if (layers & 1) {
        sceVif1PkCnt(Vif1Packet, 0);
        sceVif1PkOpenDirectCode(Vif1Packet, 0);
        sceVif1PkOpenGifTag(Vif1Packet, *(u_long128 *) &GiftagAD);
        sceVif1PkAddGsAD(Vif1Packet, SCE_GS_TEX1_1, 0x61);
        test = mgPixelTest;
        test.bits.ate = 0;
        test.bits.zte = 1;
        sceVif1PkAddGsAD(Vif1Packet, SCE_GS_TEST_1, *(u_long *) &test);
        zbuffer = mgZBuffer;
        zbuffer.bits.zmsk = 1;
        sceVif1PkAddGsAD(Vif1Packet, SCE_GS_ZBUF_1, *(u_long *) &zbuffer);
        alpha = mgAlpha;
        alpha.bits.a = 0;
        alpha.bits.b = 2;
        alpha.bits.c = 0;
        alpha.bits.d = 1;
        sceVif1PkAddGsAD(Vif1Packet, SCE_GS_ALPHA_1, *(u_long *) &alpha);
        sceVif1PkCloseGifTag(Vif1Packet);
        sceVif1PkCloseDirectCode(Vif1Packet);

        world[0] = pos[0];
        world[1] = pos[1] + 4.6f;
        world[2] = pos[2];
        world[3] = 1.0f;
        if (MGRotTransPers3DSprite(top_left, bottom_right, world, 18.0f * scale, 9.0f * scale, 1) == 1) {
            set3DSpriteFog(Vif1Packet, core, CRect_i_(0, 0, 64, 64), top_left, bottom_right, &white);
            set3DSpriteFog(Vif1Packet, glow, CRect_i_(2, 2, 124, 124), top_left, bottom_right, &white);
        }
    }

    if (layers & 2) {
        sceVif1PkCnt(Vif1Packet, 0);
        sceVif1PkOpenDirectCode(Vif1Packet, 0);
        sceVif1PkOpenGifTag(Vif1Packet, *(u_long128 *) &GiftagAD);
        sceVif1PkAddGsAD(Vif1Packet, SCE_GS_TEX1_1, 0x61);
        test = mgPixelTest;
        test.bits.ate = 0;
        test.bits.zte = 1;
        sceVif1PkAddGsAD(Vif1Packet, SCE_GS_TEST_1, *(u_long *) &test);
        zbuffer = mgZBuffer;
        zbuffer.bits.zmsk = 1;
        sceVif1PkAddGsAD(Vif1Packet, SCE_GS_ZBUF_1, *(u_long *) &zbuffer);
        alpha = mgAlpha;
        alpha.bits.a = 0;
        alpha.bits.b = 2;
        alpha.bits.c = 0;
        alpha.bits.d = 1;
        sceVif1PkAddGsAD(Vif1Packet, SCE_GS_ALPHA_1, *(u_long *) &alpha);
        sceVif1PkCloseGifTag(Vif1Packet);
        sceVif1PkCloseDirectCode(Vif1Packet);

        flicker_count++;
        srand(flicker_seed);
        if (flicker_count >= 5) {
            flicker_height = flicker_width = 1.0f + 0.1f * rand() / 2147483648.0f;
            flicker_count = 0;
        }

        world[0] = pos[0];
        world[1] = pos[1] + 4.6f;
        world[2] = pos[2];
        world[3] = 1.0f;
        if (MGRotTransPers3DSprite(top_left, bottom_right, world, 45.0f * flicker_width * scale,
                                   45.0f * flicker_height * scale / 2.0f, 1) == 1) {
            top_right[0] = bottom_right[0];
            top_right[1] = top_left[1];
            top_right[2] = top_left[2];
            top_right[3] = top_left[3];
            bottom_left[0] = top_left[0];
            bottom_left[1] = bottom_right[1];
            bottom_left[2] = bottom_right[2];
            bottom_left[3] = bottom_right[3];
            world[0] += camera_direction[0];
            world[1] += camera_direction[1];
            world[2] += camera_direction[2];
            if (MGRotTransPers3DSprite(near_top_left, near_bottom_right, world,
                                       45.0f * scale + flicker_width,
                                       (45.0f * scale + flicker_height) / 2.0f, 0) == 1) {
                top_right[2] = top_left[2] = bottom_left[2] = bottom_right[2] = near_top_left[2];
            }
            set3DSpriteFog(Vif1Packet, core, CRect_i_(0, 0, 64, 64), top_left, top_right,
                           bottom_left, bottom_right, 0x80);
        }
    }

    sceVif1PkCnt(Vif1Packet, 0);
    sceVif1PkOpenDirectCode(Vif1Packet, 0);
    sceVif1PkOpenGifTag(Vif1Packet, *(u_long128 *) &GiftagAD);
    sceVif1PkAddGsAD(Vif1Packet, SCE_GS_TEX1_1, 0x61);
    sceVif1PkAddGsAD(Vif1Packet, SCE_GS_TEST_1, *(u_long *) &mgPixelTest);
    sceVif1PkAddGsAD(Vif1Packet, SCE_GS_ZBUF_1, *(u_long *) &mgZBuffer);
    sceVif1PkAddGsAD(Vif1Packet, SCE_GS_ALPHA_1, *(u_long *) &mgAlpha);
    sceVif1PkCloseGifTag(Vif1Packet);
    sceVif1PkCloseDirectCode(Vif1Packet);
}

void CFireOmni::RasterStep(void) {
    float phase = this->raster_phase + ((2.0f * (float) rand()) / 2.1474836e9f);
    this->raster_phase = phase;
    if (!(phase < 8.0f)) {
        this->raster_phase = 0.0f;
    }
}

#ifdef PAL
INCLUDE_RODATA("asm/pal/nonmatchings/fireomni", @328__2);
INCLUDE_ASM("asm/pal/nonmatchings/fireomni", DrawRaster__9CFireOmniFv);
#pragma name_counter 147
#else
void CFireOmni::DrawRaster(void) {
    sceVu0FVECTOR world;
    int top_left[4];
    int bottom_right[4];

    world[0] = pos[0];
    world[1] = pos[1] + 3.0f;
    world[2] = pos[2];
    world[3] = 1.0f;
    if (MGRotTransPers3DSprite(top_left, bottom_right, world, 15.0f, 16.0f, 0) != 1) {
        return;
    }

    int x = (top_left[0] - 0x6C00) >> 4;
    int y = (top_left[1] - 0x7900) >> 3;
    int width = (bottom_right[0] - top_left[0]) >> 4;
    int height = (bottom_right[1] - top_left[1]) >> 4;
    height >>= 1;
    if (x + width > 639 && x < 640) {
        width = 639 - x;
    }
    if (x < 0 && x + width > 0) {
        width = x + width;
        x = 0;
    }
    if (y < 1) {
        height += y >> 1;
        y = 0;
    }

    sceGsTex0 blend = *reinterpret_cast<sceGsTex0 *>(&TexManager.GetTexture("blender", -1)->tex0);
    blendTextuerTest(Vif1Packet, blend.TBP0, blend.TBW, blend.PSM, CRect_i_(x, y >> 1, width, height),
                     TexManager.GetTexture("alpha01", -1), CRect_i_(0, 0, width, height),
                     CRect_i_(0, 0, 64, 64), top_left[2] >> 4, raster_phase);
    set2DSprite(Vif1Packet, TexManager.GetTexture("blender", -1), CRect_i_(x, y, width, height * 2),
                CRect_i_(1, 1, width - 2, height - 2));
}
#endif
