#include "langset.hpp"

#include <libpkt.h>

#include "fader.hpp"
#include "dataalloc.hpp"
#include "dataread.hpp"
#include "dataset.hpp"
#include "gamepad.hpp"
#include "mainselect.hpp"
#include "mglib.hpp"
#include "rect.hpp"
#include "snd.hpp"
#include "texture.hpp"

#ifdef NON_MATCHING
/** The vector-unit program the language screen draws its plate with. */
extern char Vu_prog0f[];

/** Fade the language screen opens and closes with. */
static Fader Fade;

/** Language the cursor stands on, counted from zero. */
static int Cursor;

/** What the screen is doing: fading in, taking the choice, or fading out. */
static int Proc;

/** Opacity of each language entry. */
static int Alpha[5];
#endif

INCLUDE_RODATA("asm/nonmatchings/langset", @355__4);
INCLUDE_RODATA("asm/nonmatchings/langset", @356__3);
INCLUDE_RODATA("asm/nonmatchings/langset", @357__3);
INCLUDE_RODATA("asm/nonmatchings/langset", @358__3);
INCLUDE_RODATA("asm/nonmatchings/langset", @359__2);
#ifdef NON_MATCHING
void LangsetInit(void) {
    LOADTEXTURE_INFO textures[] = {
        {"#frame_image_mes#640#448#4", 26, 0},
        {"#fukidashibase#640#224#4", 26, 0},
        {"#fontbase#512#256#1", 26, 0},
        {"titledat/lang_set.img", 0, 0},
        {NULL, 0, 0},
    };

    InitializeDataBuffer();
    SetDataBuffer(&VisualData, 200000);
    SetDataBuffer(&MotionData, 500000);
    SetDataBuffer(&TextureData, 300000);
    SetPacketReadBuffer(40000, 300000);
    MGSetBGColor(0.0f, 0.0f, 0.0f, 128.0f);
    TexManager.Initialize(0x3FE0);
    TexManager.LoadTextureBlock(-1, textures, read_buffer);
    GamePad.SetAutoRepeat(0x5000, 30, 9);
    GamePad.MenuModeOn(120);
    Fade = 0;
    Cursor = 0;
    Proc = 0;
}
#else
INCLUDE_ASM("asm/nonmatchings/langset", LangsetInit__Fv);
#endif
#ifdef NON_MATCHING
int LangsetLoop(void) {
    sceVif1PkCall(Vif1Packet, (u_long128 *) Vu_prog0f, 0);
    sceVif1PkTerminate(Vif1Packet);
    switch (Proc) {
        case 0:
            if (Fade.In() != 0) {
                Proc = 1;
            }
            break;
        case 1:
            if (LangsetProc() != 0) {
                Proc = 2;
            }
            break;
        case 2:
            if (Fade.Out() != 0) {
                // The first two codes are not offered here, so the cursor
                // counts from the third.
                LanguageCode = Cursor + 2;
                return 1;
            }
            break;
    }
    LangsetDraw();
    return 0;
}
#else
INCLUDE_ASM("asm/nonmatchings/langset", LangsetLoop__Fv);
#endif
#ifdef NON_MATCHING
int LangsetProc(void) {
    if (GamePad.Down(0x1000) != 0) {
        Cursor--;
    }
    if (GamePad.Down(0x4000) != 0) {
        Cursor++;
    }
    if (Cursor < 0) {
        Cursor = 4;
    }
    if (Cursor >= 5) {
        Cursor = 0;
    }
    if (GamePad.Down(0x800) != 0 || GamePad.Down(0x40) != 0) {
        return 1;
    }
    return 0;
}
#else
INCLUDE_ASM("asm/nonmatchings/langset", LangsetProc__Fv);
#endif
#ifdef NON_MATCHING
void LangsetDraw(void) {
    setbilinear(1);
    for (int language = 0; language < 5; language++) {
        Alpha[language] = 0x40;
    }
    Alpha[Cursor] = 0x80;

    TexManager.ReloadTexture(GetVif1Packet(), 0);
    CTexture *texture = TexManager.GetTexture("lang_set", -1);
    RECT rect = {0x9E, 0, 0x144, 0x5A};
    set2DSprite(GetVif1Packet(), texture, &rect, &rect, Fade.Get(0x80));
    for (int language = 0; language < 5; language++) {
        rect.y = 0x5F + language * 0x3D;
        rect.height = 0x3C;
        set2DSprite(GetVif1Packet(), texture, &rect, &rect, Fade.Get(Alpha[language]));
    }
}
#else
INCLUDE_ASM("asm/nonmatchings/langset", LangsetDraw__Fv);
#endif
INCLUDE_RODATA("asm/nonmatchings/langset", @395__3);
