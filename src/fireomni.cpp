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
#ifdef NON_MATCHING
void CFireOmni::FireCreate(void) {
    CTexture *destination = TexManager.GetTexture((char *) "d01e02", -1);
    if (destination == NULL) {
        return;
    }

    CTexture *blend_target = TexManager.GetTexture((char *) "blender", -1);
    CTexture *flame_texture = TexManager.GetTexture((char *) "d01e03", -1);
    CRect_i_ blend_source(0, (int) flame_phase, 128, 64);
    CRect_i_ full_source(0, 0, 128, 128);
    CRect_i_ full_destination(0, 0, 128, 128);
    CRect_i_ cell_source;

    if (destination->bpp == 1) {
        int cell = (int) cell_phase;
        int column = cell % 4;
        if (column < 0) {
            column -= 4;
        }
        cell_source = CRect_i_(column * 64, (cell / 4) * 64, 64, 64);
    } else {
        cell_source = CRect_i_(0, (int) cell_phase * 64, 64, 64);
    }

    int destination_address = blend_target->tex0 & 0x3FFF;
    int destination_width = (blend_target->tex0 & 0xFFFFF) >> 14;
    int destination_format = ((blend_target->tex0 >> 16) & 0x3FF) >> 4;
    blendTextuer(Vif1Packet, destination_address, destination_width, destination_format,
                 flame_texture, full_destination, blend_source, destination, full_source,
                 cell_source);
}
#else
INCLUDE_ASM("asm/nonmatchings/fireomni", FireCreate__9CFireOmniFv);
#endif
INCLUDE_RODATA("asm/nonmatchings/fireomni", @259__2);
INCLUDE_RODATA("asm/nonmatchings/fireomni", @260__2);
INCLUDE_RODATA("asm/nonmatchings/fireomni", @261__2);
void CFireOmni::SetTexture(CTexture *core_texture, CTexture *glow_texture) {
    this->core = core_texture;
    this->glow = glow_texture;
    this->texture_set = 1;
}
#ifdef NON_MATCHING
void CFireOmni::DrawFire(int unused0, int unused1, CCamera *camera, float *colour, float scale,
                         int layers, float camera_offset) {
    (void) unused0;
    (void) unused1;
    (void) colour;

    if (texture_set == 0) {
        if (core == NULL) {
            core = TexManager.GetTexture((char *) "lightling", -1);
        }
        if (glow == NULL) {
            glow = TexManager.GetTexture((char *) "blender", -1);
        }
    }

    sceVu0FVECTOR camera_direction;
    sceVu0FVECTOR camera_ref;
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
        u_long test = *(u_long *) &mgPixelTest;
        u_long zbuffer = *(u_long *) &mgZBuffer;
        u_long alpha = *(u_long *) &mgAlpha;
        sceVif1PkAddGsAD(Vif1Packet, SCE_GS_TEST_1, (test & ~0x10001ULL) | 0x10000ULL);
        sceVif1PkAddGsAD(Vif1Packet, SCE_GS_ZBUF_1,
                         (zbuffer & ~0x100000000ULL) | 0x100000000ULL);
        sceVif1PkAddGsAD(Vif1Packet, SCE_GS_ALPHA_1, (alpha & ~0xFFULL) | 0x48);
        sceVif1PkCloseGifTag(Vif1Packet);
        sceVif1PkCloseDirectCode(Vif1Packet);

        sceVu0FVECTOR world = {pos[0], pos[1] + 25.0f, pos[2], 1.0f};
        int top_left[4];
        int bottom_right[4];
        if (MGRotTransPers3DSprite(top_left, bottom_right, world, scale * 18.0f, scale * 9.0f,
                                   1) == 1) {
            CRect_i_ core_source(0, 0, 64, 64);
            CRect_i_ glow_source(2, 2, 124, 124);
            set3DSpriteFog(Vif1Packet, core, core_source, top_left, bottom_right, &white);
            set3DSpriteFog(Vif1Packet, glow, glow_source, top_left, bottom_right, &white);
        }
    }

    if (layers & 2) {
        sceVif1PkCnt(Vif1Packet, 0);
        sceVif1PkOpenDirectCode(Vif1Packet, 0);
        sceVif1PkOpenGifTag(Vif1Packet, *(u_long128 *) &GiftagAD);
        sceVif1PkAddGsAD(Vif1Packet, SCE_GS_TEX1_1, 0x61);
        u_long test = *(u_long *) &mgPixelTest;
        u_long zbuffer = *(u_long *) &mgZBuffer;
        u_long alpha = *(u_long *) &mgAlpha;
        sceVif1PkAddGsAD(Vif1Packet, SCE_GS_TEST_1, (test & ~0x10001ULL) | 0x10000ULL);
        sceVif1PkAddGsAD(Vif1Packet, SCE_GS_ZBUF_1,
                         (zbuffer & ~0x100000000ULL) | 0x100000000ULL);
        sceVif1PkAddGsAD(Vif1Packet, SCE_GS_ALPHA_1, (alpha & ~0xFFULL) | 0x48);
        sceVif1PkCloseGifTag(Vif1Packet);
        sceVif1PkCloseDirectCode(Vif1Packet);

        flicker_count++;
        srand(flicker_seed);
        if (flicker_count > 4) {
            flicker_width = 1.0f + 0.1f * (float) rand() / 2.1474836e9f;
            flicker_height = flicker_width;
            flicker_count = 0;
        }

        sceVu0FVECTOR world = {pos[0], pos[1] + 25.0f, pos[2], 1.0f};
        int far_top_left[4];
        int far_bottom_right[4];
        if (MGRotTransPers3DSprite(far_top_left, far_bottom_right, world,
                                   flicker_width * 45.0f * scale,
                                   flicker_height * 45.0f * scale / 2.0f, 1) == 1) {
            int near_top_left[4] = {far_top_left[0], far_top_left[1], far_top_left[2],
                                    far_top_left[3]};
            int near_bottom_right[4] = {far_bottom_right[0], far_bottom_right[1],
                                        far_bottom_right[2], far_bottom_right[3]};
            world[0] += camera_direction[0];
            world[1] += camera_direction[1];
            world[2] += camera_direction[2];
            if (MGRotTransPers3DSprite(near_top_left, near_bottom_right, world,
                                       scale * 45.0f + flicker_width,
                                       (scale * 45.0f + flicker_height) / 2.0f, 0) == 1) {
                far_top_left[2] = near_top_left[2];
                near_top_left[2] = near_bottom_right[2];
                far_bottom_right[2] = near_top_left[2];
                near_bottom_right[2] = near_top_left[2];
            }
            CRect_i_ source(0, 0, 64, 64);
            set3DSpriteFog(Vif1Packet, core, source, far_top_left, near_top_left,
                           near_bottom_right, far_bottom_right, 0x80);
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
#else
INCLUDE_ASM("asm/nonmatchings/fireomni", DrawFire__9CFireOmniFiiP7CCameraPffif);
#endif
INCLUDE_RODATA("asm/nonmatchings/fireomni", @298__3);

void CFireOmni::RasterStep(void) {
    float phase = this->raster_phase + ((2.0f * (float) rand()) / 2.1474836e9f);
    this->raster_phase = phase;
    if (!(phase < 8.0f)) {
        this->raster_phase = 0.0f;
    }
}

#ifdef NON_MATCHING
void CFireOmni::DrawRaster(void) {
    sceVu0FVECTOR world = {pos[0], pos[1] + 3.0f, pos[2], 1.0f};
    int top_left[4];
    int bottom_right[4];
    if (MGRotTransPers3DSprite(top_left, bottom_right, world, 15.0f, 16.0f, 0) != 1) {
        return;
    }

    int x = (top_left[0] - 0x6C00) >> 4;
    int y = (top_left[1] - 0x7900) >> 3;
    int width = (bottom_right[0] - top_left[0]) >> 4;
    int height = (bottom_right[1] - top_left[1]) >> 5;
    if (x + width > 639 && x < 640) {
        width = 639 - x;
    }
    if (x < 0 && x + width > 0) {
        width += x;
        x = 0;
    }
    if (y < 1) {
        height += (top_left[1] - 0x7900) >> 4;
        y = 0;
    }

    CTexture *blend_target = TexManager.GetTexture((char *) "blender", -1);
    CTexture *raster_texture = TexManager.GetTexture((char *) "alpha01", -1);
    CRect_i_ destination(x, y >> 1, width, height);
    CRect_i_ texture_rect(0, 0, width, height);
    CRect_i_ source_rect(0, 0, 64, 64);
    int destination_address = blend_target->tex0 & 0x3FFF;
    int destination_width = (blend_target->tex0 & 0xFFFFF) >> 14;
    int destination_format = ((blend_target->tex0 >> 16) & 0x3FF) >> 4;
    blendTextuerTest(Vif1Packet, destination_address, destination_width, destination_format,
                     destination, raster_texture, texture_rect, source_rect,
                     (float) (top_left[2] >> 4), raster_phase);

    CRect_i_ screen(x, y, width, height * 2);
    CRect_i_ clip(1, 1, width - 2, height - 2);
    set2DSprite(Vif1Packet, blend_target, screen, clip);
}
#else
INCLUDE_ASM("asm/nonmatchings/fireomni", DrawRaster__9CFireOmniFv);
#endif
INCLUDE_RODATA("asm/nonmatchings/fireomni", @328__2);
