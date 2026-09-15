#include "fireomni.hpp"

#include <cstdlib>

INCLUDE_ASM("asm/nonmatchings/fireomni", __ct__9CFireOmniFv);
INCLUDE_ASM("asm/nonmatchings/fireomni", FireStep__9CFireOmniFv);
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
