#include "fireomni.hpp"

#include <cstdlib>

#ifdef NON_MATCHING
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
#else
INCLUDE_ASM("asm/nonmatchings/fireomni", __ct__9CFireOmniFv);
#endif
#ifdef NON_MATCHING
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
#else
INCLUDE_ASM("asm/nonmatchings/fireomni", FireStep__9CFireOmniFv);
#endif
INCLUDE_ASM("asm/nonmatchings/fireomni", FireCreate__9CFireOmniFv);
INCLUDE_RODATA("asm/nonmatchings/fireomni", @259__2);
INCLUDE_RODATA("asm/nonmatchings/fireomni", @260__2);
INCLUDE_RODATA("asm/nonmatchings/fireomni", @261__2);
#ifdef NON_MATCHING
void CFireOmni::SetTexture(CTexture *core_texture, CTexture *glow_texture) {
    this->core = core_texture;
    this->glow = glow_texture;
    this->texture_set = 1;
}
#else
INCLUDE_ASM("asm/nonmatchings/fireomni", SetTexture__9CFireOmniFP8CTextureP8CTexture);
#endif
INCLUDE_ASM("asm/nonmatchings/fireomni", DrawFire__9CFireOmniFiiP7CCameraPffif);
INCLUDE_RODATA("asm/nonmatchings/fireomni", @298__3);

void CFireOmni::RasterStep(void) {
    float phase = this->raster_phase + ((2.0f * (float) rand()) / 2.1474836e9f);
    this->raster_phase = phase;
    if (!(phase < 8.0f)) {
        this->raster_phase = 0.0f;
    }
}

INCLUDE_ASM("asm/nonmatchings/fireomni", DrawRaster__9CFireOmniFv);
INCLUDE_RODATA("asm/nonmatchings/fireomni", @328__2);
