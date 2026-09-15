#pragma helper_mask_gpr 0x30
#pragma helper_mask_fpr 0x1000
#pragma name_counter 604

#include "shot_utils.hpp"

#include "mglib.hpp"
#include "rect.hpp"
#include "snd.hpp"
#include "texture.hpp"

INCLUDE_ASM("asm/nonmatchings/shot_utils", checkCollision__FPfPfPfif);
#ifdef NON_MATCHING
void set3DCellModel(float *world, char *texture_name, float size, s32 x, s32 y, s32 width,
                    s32 height, u8 blend) {
    int top_left[3];
    int top_right[3];
    int bottom_left[3];
    int bottom_right[3];
    CRect_i_ cell;
    CTexture *texture = TexManager.GetTexture(texture_name, -1);

    world[3] = 1.0f;
    // The sprite stands twice as wide as it is tall.
    if (MGRotTransPers3DSprite(top_left, bottom_right, world, size, size / 2.0f, 0) == 1) {
        top_right[0] = bottom_right[0];
        top_right[1] = top_left[1];
        top_right[2] = top_left[2];
        bottom_left[0] = top_left[0];
        bottom_left[1] = bottom_right[1];
        bottom_left[2] = bottom_right[2];
        cell.x = x;
        cell.y = y;
        cell.width = width;
        cell.height = height;
        set3DSprite(Vif1Packet, texture, cell, top_left, top_right, bottom_left, bottom_right,
                    blend);
    }
}
#else
INCLUDE_ASM("asm/nonmatchings/shot_utils", set3DCellModel__FPfPcfiiiiUc);
#endif
