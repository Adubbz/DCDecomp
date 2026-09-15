#include "candleeffect.hpp"

#include <libvu0.h>

#include "mglib.hpp"
#include "rect.hpp"
#include "snd.hpp"
#include "texture.hpp"

#ifdef NON_MATCHING
void CCandleEffect::Initialize(void) {
    this->enabled = 1;
    this->animation_frame = 0.0f;
    this->half_height = 1.0f;
    this->half_width = 1.0f;
    this->texture = NULL;
}
#else
INCLUDE_ASM("asm/nonmatchings/candleeffect", Initialize__13CCandleEffectFv);
#endif

#ifdef NON_MATCHING
CCandleEffect::CCandleEffect(void) {
    Initialize();
}
#else
INCLUDE_ASM("asm/nonmatchings/candleeffect", __ct__13CCandleEffectFv);
#endif

#ifdef NON_MATCHING
void CCandleEffect::SetTexture(CTexture *flame_texture) {
    this->texture = flame_texture;
}
#else
INCLUDE_ASM("asm/nonmatchings/candleeffect", SetTexture__13CCandleEffectFP8CTexture);
#endif

#ifdef NON_MATCHING
void CCandleEffect::SetScale(float half_width, float half_height) {
    this->half_width = half_width;
    this->half_height = half_height;
}
#else
INCLUDE_ASM("asm/nonmatchings/candleeffect", SetScale__13CCandleEffectFff);
#endif

#ifdef NON_MATCHING
void CCandleEffect::SetPosition(float *world) {
    sceVu0CopyVector(this->position, (float *) world);
}
#else
INCLUDE_ASM("asm/nonmatchings/candleeffect", SetPosition__13CCandleEffectFPf);
#endif

#ifdef NON_MATCHING
void CCandleEffect::Step(void) {
    this->animation_frame += 0.3f;
    // The atlas holds eight frames, so the cycle restarts past the last of them.
    if (this->animation_frame > 8.0f) {
        this->animation_frame = 0.0f;
    }
}
#else
INCLUDE_ASM("asm/nonmatchings/candleeffect", Step__13CCandleEffectFv);
#endif
#ifdef NON_MATCHING
void CCandleEffect::Draw(void) {
    if (texture == NULL || enabled == 0) {
        return;
    }

    float world[4];
    int top_left[4];
    int bottom_right[4];
    sceGsAlpha alpha;
    sceGsZbuf zbuf;

    world[0] = position[0];
    world[1] = position[1];
    world[2] = position[2];
    world[3] = 1.0f;
    if (MGRotTransPers3DSprite(top_left, bottom_right, world, half_width, half_height, 0) == 0) {
        return;
    }

    bottom_right[1] = top_left[1] + ((bottom_right[1] - top_left[1]) >> 1);

    alpha = mgAlpha;
    alpha.bits.a = 0;
    alpha.bits.b = 2;
    alpha.bits.c = 0;
    alpha.bits.d = 1;
    MGSetGsALPHA(&alpha);

    zbuf = mgZBuffer;
    zbuf.bits.zmsk = 1;
    MGSetGsZBUF(&zbuf);

    int frame = 7 - (int) animation_frame;
    CRect_i_ source((frame % 4) * 32, (frame / 4) * 32, 32, 32);
    spRGBA color = {128, 128, 128, 128};
    set3DSprite(GetVif1Packet(), texture, source, top_left, bottom_right, &color);

    MGSetGsALPHA(&mgAlpha);
    MGSetGsZBUF(&mgZBuffer);
}
#else
INCLUDE_ASM("asm/nonmatchings/candleeffect", Draw__13CCandleEffectFv);
#endif
