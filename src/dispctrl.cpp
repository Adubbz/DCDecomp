#include "dispctrl.hpp"

#include "mglib.hpp"
#include "rect.hpp"

INCLUDE_RODATA("asm/nonmatchings/dispctrl", LIT_230);

INCLUDE_ASM("asm/nonmatchings/dispctrl", Sizeof__6CBoundFv);
INCLUDE_ASM("asm/nonmatchings/dispctrl", openGiftag__FP13sceVif1Packet);
INCLUDE_ASM("asm/nonmatchings/dispctrl", closeGiftag__FP13sceVif1Packet);
INCLUDE_ASM("asm/nonmatchings/dispctrl", Draw__10CDebugFontFv);
INCLUDE_ASM("asm/nonmatchings/dispctrl", SearchPTS__FPUiPc);
INCLUDE_ASM("asm/nonmatchings/dispctrl", SearchPTS__FPUii);

void CDispCtrl::FadeOutStart(float speed)
{
    this->speed = speed;
    rate = 0.0f;
    mode = 1;
}

void CDispCtrl::FadeInStart(float speed)
{
    this->speed = speed;
    rate = 128.0f;
    mode = 2;
}

void CDispCtrl::FadeInit(float rate)
{
    this->rate = rate;
    mode = -1;
}

float CDispCtrl::GetRate(void)
{
    return rate;
}

float CDispCtrl::FadeOut(sceVif1Packet *packet)
{
    if (mode != 1) {
        return rate;
    }
    if (rate == 0.0f && speed == 0.0f) {
        return rate;
    }

    rate += speed;
    if (rate > 128.0f) {
        rate = 128.0f;
    }

    for (s32 x = 0; x < 640; x += 64) {
        for (s32 y = 0; y < 224; y += 32) {
            CRect_i_ rect;
            rect.x = x * 16;
            rect.y = y * 16;
            rect.width = 1024;
            rect.height = 512;
            MGFillBox(rect, 0, 0, 0, static_cast<u8>(rate));
        }
    }

    if (rate >= 128.0f) {
        rate = 128.0f;
        speed = 0.0f;
    }
    return rate;
}

float CDispCtrl::FadeIn(sceVif1Packet *packet)
{
    if (mode != 2) {
        return rate;
    }
    if (rate == 0.0f && speed == 0.0f) {
        return rate;
    }

    rate -= speed;
    if (rate < 0.0f) {
        rate = 0.0f;
    }

    for (s32 x = 0; x < 640; x += 64) {
        for (s32 y = 0; y < 224; y += 32) {
            CRect_i_ rect;
            rect.x = x * 16;
            rect.y = y * 16;
            rect.width = 1024;
            rect.height = 512;
            MGFillBox(rect, 0, 0, 0, static_cast<u8>(rate));
        }
    }

    if (rate <= 0.0f) {
        rate = 0.0f;
        speed = 0.0f;
    }
    return rate;
}
