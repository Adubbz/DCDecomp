#pragma helper_mask_gpr 0x30
#pragma helper_mask_fpr 0x1000
#pragma name_counter 15

#include "battle_globals.hpp"

#include <cmath>
#include <cstdio>
#include <cstdlib>

#include "clsmes.hpp"
#include "dataread.hpp"
#include "gamepad.hpp"
#include "memcard.hpp"
#include "menu_draw.hpp"
#include "menu_inventory.hpp"
#include "rect.hpp"
#include "runscript.hpp"
#include "savedata.hpp"
#include "texture.hpp"

/**
 * Holds the state of the name-entry screen.
 */
struct NAME_SELECT {
    s16 chara_no;      /**< The party member being named. */
    s16 area;          /**< The part of the screen the cursor is in. */
    s16 name_pos;      /**< The position in the name the next character goes to. */
    s16 side_row;      /**< The row of the voicing column the cursor is on, or 0 when it is on the keyboard. */
    s16 pushed_tab;    /**< The tab that was last pressed. */
    s16 input_mode;    /**< The keyboard being shown. */
    s32 cursor;        /**< The key or tab the cursor is on. */
    s16 state;         /**< What the screen is doing: fading, flashing a tab or leaving. */
    s32 state_count;   /**< How many frames the state has lasted. */
    float cursor_x;    /**< Where the hand cursor is drawn across the screen. */
    float cursor_y;    /**< Where the hand cursor is drawn down the screen. */
    s32 frame;         /**< How many frames the screen has been drawn, for the cursor's sway. */
    s16 language;      /**< The language the menus are in. */
    s16 texture_block; /**< The texture block the screen's textures are read into. */
    s16 loaded;        /**< Whether the screen's textures have been read. */
};

STATIC_ASSERT(sizeof(NAME_SELECT) == 0x2C);

/** The state of the name-entry screen. */
extern NAME_SELECT NameSelect;

/** The name-entry screen's frame, tabs and cursor. */
extern CTexture *NameTemp;

/** The hiragana keyboard's characters. */
extern CTexture *HiraTex;

/** The katakana keyboard's characters. */
extern CTexture *KataTex;

/** The alphabet and symbol keyboards' characters. */
extern CTexture *AlphaTex;

/** The packed texture files used by the name-entry screen. */
extern char NameEntryTextureFile[];

/** The frame image descriptor used by the name-entry background. */
extern char NameEntryImageDescriptor[];

/** The frame texture shown around the keyboard. */
extern char NameEntryFrameTexture[];

/** The texture name for the name-entry frame. */
extern char NameEntryTempTexture[];

/** The hiragana keyboard texture name. */
extern char NameEntryHiraganaTexture[];

/** The katakana keyboard texture name. */
extern char NameEntryKatakanaTexture[];

/** The alphabet keyboard texture name. */
extern char NameEntryAlphabetTexture[];

/** The party member face texture name. */
extern char NameEntryFaceTexture[];

/** The first name-entry message file. */
extern char NameEntryMessageFile[];

/** The second name-entry message file. */
extern char NameEntryMessageFile2[];

/** The face of the party member being named. */
extern CTexture *CharaFace;

/** How far the cursor moves across and down each keyboard, per key. */
extern s16 InputModeMovetbl[4][2];

/** How many keys each keyboard has in a row. */
extern s16 InputModeOrikaeshi[4];

#include "snd.hpp"

/** State of the storybook that plays before the game begins. */
extern OPENING_BOOK OpenBook;

/** The name currently being edited. */
extern "C" s16 *CharaName;

/**
 * Gives every party member their default name.
 *
 * @mangled GlobalNameInit__Fv
 * @address 0x238450
 * @size 0x48
 */
void GlobalNameInit(void) {
    for (int chara_no = 0; chara_no < 6; chara_no++) {
        NameDefaultSet(chara_no);
    }
}
/**
 * Opens the name-entry screen and reads its textures.
 *
 * @mangled InitNameRegist__FiiP1
 * @address 0x2384A0
 * @size 0x190
 */
void InitNameRegist(int character, int texture_block, u_long128 *buffer) {
    StartReadBG();
    if (buffer == NULL) {
        buffer = (u_long128 *) read_buffer;
    } else {
        buffer = (u_long128 *) buffer;
    }
    LoadFileBGMenuData("nameregi.pak", MenuCalcBufAlignment(buffer));
    NameSelect.language = GetMenuLangFlag();
    GamePad.MenuModeOn(0x78);
    GamePad.SetAutoRepeat(0xF000, 30, 9);

    NameSelect.chara_no = character;
    NameSelect.area = 4;
    NameSelect.cursor = 0;
    switch (NameSelect.language) {
        case 0:
            NameSelect.input_mode = 0;
            break;
        case 1:
        default:
            NameSelect.input_mode = 2;
            break;
    }
    NameSelect.side_row = 0;
    NameSelect.state = 1;
    NameSelect.state_count = 0;
    NameSelect.loaded = 0;
    NameSelect.texture_block = texture_block;
    NameSelect.cursor_x = 100.0f;
    NameSelect.cursor_y = 242.0f;
    NameSelect.frame = 0;
    CharaName = SaveData->GetCharaName(NameSelect.chara_no);
    NameDefaultSet(NameSelect.chara_no);
    NameSelect.name_pos = 0;
}

INCLUDE_RODATA("asm/nonmatchings/battle_globals", @481__2);
INCLUDE_RODATA("asm/nonmatchings/battle_globals", @663__2);
INCLUDE_RODATA("asm/nonmatchings/battle_globals", @781__3);
INCLUDE_RODATA("asm/nonmatchings/battle_globals", @782__3);
INCLUDE_RODATA("asm/nonmatchings/battle_globals", @783__5);
INCLUDE_RODATA("asm/nonmatchings/battle_globals", @784__3);
INCLUDE_RODATA("asm/nonmatchings/battle_globals", @785);
INCLUDE_RODATA("asm/nonmatchings/battle_globals", @786);
INCLUDE_RODATA("asm/nonmatchings/battle_globals", @787__2);
INCLUDE_RODATA("asm/nonmatchings/battle_globals", @788__2);
INCLUDE_RODATA("asm/nonmatchings/battle_globals", @789__4);
INCLUDE_RODATA("asm/nonmatchings/battle_globals", @1349__3);
INCLUDE_RODATA("asm/nonmatchings/battle_globals", @1350__5);
/**
 * Gives the name-entry screen's textures back and closes it.
 *
 * @mangled ExitNameEnterFunc__Fv
 * @address 0x238630
 * @size 0x68
 */
void ExitNameEnterFunc() {
    int texture_blocks[2] = {NameSelect.texture_block, -1};
    MenuTextureDelete(texture_blocks);
    TexManager.CleanUpTextureList();
    GamePad.AutoRepeatOff();
    GamePad.MenuModeOff();
}
/**
 * Gives the texture and cell one name character draws from.
 *
 * @mangled GetNameTextureInfo__FPP8CTextureiRiRi
 * @address 0x2386A0
 * @size 0xBC
 */
CTexture *GetNameTextureInfo(CTexture **textures, int code, int &cell_x, int &cell_y) {
    CTexture *texture;

    if (code == 0) {
        code = 0xE6;
        texture = textures[0];
    } else if (code < 0x52) {
        code -= 1;
        texture = textures[1];
    } else if (code < 0xA2) {
        code -= 0x52;
        texture = textures[2];
    } else {
        code -= 0xA2;
        texture = textures[0];
    }
    cell_x = (code % 10) * 0x16;
    cell_y = (code / 10) * 0x16;
    return texture;
}
/**
 * Draws a party member's name.
 *
 * @mangled DrawCharaName__Fiiiii
 * @address 0x238760
 * @size 0x118
 */
void DrawCharaName(int character, int x, int y, int brightness, int blend_mode) {
    int draw_x = x;
    CTexture *textures[3] = {AlphaTex, KataTex, HiraTex};

    for (int index = 0; index < 10; index++) {
        int texture_x;
        int texture_y;
        CTexture *texture = GetNameTextureInfo(textures, CharaName[index], texture_x, texture_y);
        DrawMenu2DSprite(texture, CRect_i_(draw_x, y, 22, 22), CRect_i_(texture_x, texture_y, 22, 22), brightness, brightness,
                         brightness, blend_mode);
        draw_x += 22;
    }
}
/**
 * Draws the frame around the name being entered, bobbing it with a sine.
 *
 * @mangled DrawNameRegiWaku__Fiiiii
 * @address 0x238880
 * @size 0x1F0
 */
#ifdef NON_MATCHING
void DrawNameRegiWaku(int x, int y, int size, int brightness, int blend_mode) {
    int inset = NameSelect.frame % 29;
    if (inset > 14) {
        inset = 28 - inset;
    }
    const int corner_x[4] = {x + inset, x + size - inset, x + inset, x + size - inset};
    const int corner_y[4] = {y + inset, y + inset, y + size - inset, y + size - inset};
    const int source_x[4] = {0, 16, 0, 16};
    const int source_y[4] = {0, 0, 16, 16};
    for (int corner = 0; corner < 4; corner++) {
        CRect_i_ destination(corner_x[corner], corner_y[corner], 12, 12);
        CRect_i_ source(source_x[corner], source_y[corner], 16, 16);
        DrawMenu2DSprite(NameTemp, destination, source, (u8) brightness,
                         (u8) brightness, (u8) brightness, blend_mode);
    }
}
#else
INCLUDE_ASM("asm/nonmatchings/battle_globals", DrawNameRegiWaku__Fiiiii);
#endif
/**
 * Draws the name being entered above the keyboard.
 *
 * @mangled DrawCharaNameUp__Fiiii
 * @address 0x238A70
 * @size 0x628
 */
#ifdef NON_MATCHING
void DrawCharaNameUp(int x, int y, int brightness, int blend_mode) {
    CTexture *textures[3] = {AlphaTex, KataTex, HiraTex};
    for (int index = 0; index < 10; index++) {
        int texture_x;
        int texture_y;
        CTexture *texture =
            GetNameTextureInfo(textures, CharaName[index], texture_x, texture_y);
        CRect_i_ destination(x + 95 + index * 22, y + 30, 22, 23);
        CRect_i_ source(texture_x, texture_y, 22, 23);
        DrawMenu2DSprite(texture, destination, source, (u8) brightness,
                         (u8) brightness, (u8) brightness, blend_mode);
    }
    DrawNameRegiWaku(x + 93 + NameSelect.name_pos * 22, y + 28, 26,
                     brightness, blend_mode);
}
#else
INCLUDE_ASM("asm/nonmatchings/battle_globals", DrawCharaNameUp__Fiiii);
#endif
/**
 * Draws the character keyboard the name is entered from.
 *
 * @mangled DrawNameTemplete__Fiiii
 * @address 0x2390A0
 * @size 0x930
 */
static void DrawNameTemplete(int x, int y, int color, int alpha) {
    int mode = NameSelect.input_mode;
    int tab = NameSelect.pushed_tab;
    int px;
    int py;
    int u;
    int v;
    int i;
    s16 key_count[4] = {89, 88, 62, 24};

    DrawMenu2DSprite(NameTemp, CRect_i_(x, y, 0x200, 0x100), CRect_i_(0, 0, 0x200, 0x100), color, color, color, alpha);

    int language = NameSelect.language;
    if (language > 0) {
        language = 1;
    }

    s16 tab_x[2][11] = {
        {40, 125, 209, 261, 311, 378, 40, 74, 111, 168, 223},
        {0, 0, 40, 223, 303, 384, 40, 74, 111, 168, 223},
    };
    s16 tab_width[2][11] = {
        {78, 78, 44, 44, 60, 52, 24, 24, 48, 48, 112},
        {0, 0, 176, 75, 74, 70, 24, 24, 48, 48, 112},
    };
    int height = 0x18;

    if (NameSelect.state == 6) {
        px = x + tab_x[language][tab];
        py = y + 6 + (tab / 6) * 27;

        u = 0;
        if (tab < 6) {
            i = 0;
            v = 0x148;
        } else {
            i = 6;
            v = 0x160;
        }
        for (; i < tab; i++) {
            u += tab_width[language][i];
        }
        if (tab == 5) {
            py += 4;
            height = 0x28;
        }
        DrawMenu2DSprite(NameTemp, CRect_i_(px, py, tab_width[language][tab], height), CRect_i_(u, v, tab_width[language][tab], height), color, color, color, alpha);
    }

    px = x + tab_x[language][mode];
    py = y + 6;

    for (i = 0, u = 0; i < mode; i++) {
        u += tab_width[language][i];
    }
    DrawMenu2DSprite(NameTemp, CRect_i_(px, py, tab_width[language][mode], 0x18), CRect_i_(u, 0x148, tab_width[language][mode], 0x18), color, color, color, alpha);

    int base_x = x + 0x38;
    int base_y = y + 0x54;
    CTexture *texture;

    py = base_y;
    if (mode == 0) {
        texture = KataTex;
    }
    if (mode == 1) {
        texture = HiraTex;
    }

    switch (mode) {
        case 0:
        case 1:
            px = base_x - 8;
            for (int key = 0; key < key_count[mode]; key++) {
                u = (key % 10) * 22;
                v = (key / 10) * 22;

                CRect_i_ texel(u, v, 22, 23);

                DrawMenu2DSprite(texture, CRect_i_(px + 1, py + 1, 22, 22), texel, 0, 0, 0, (alpha * 0x50) >> 7);
                DrawMenu2DSprite(texture, CRect_i_(px, py, 22, 22), texel, color, color, color, alpha);
                if (key < 0x23 && key != 0x1D) {
                    px += 0x26;
                    if (key % 5 == 4) {
                        px -= 0xBE;
                        py += 0x1A;
                    }
                } else if (key >= 0x50) {
                    py += 0x1A;
                } else {
                    switch (key) {
                        case 0x1D:
                            px = base_x + 0xCA;
                            py = base_y;
                            break;
                        case 0x23:
                        case 0x24:
                        case 0x2B:
                        case 0x2C:
                            px += 0x4C;
                            break;
                        case 0x31:
                            px -= 0x72;
                            py += 0x1A;
                            break;
                        case 0x25:
                        case 0x2A:
                        case 0x2D:
                            px -= 0x98;
                            py += 0x1A;
                            break;
                        case 0x36:
                            py = base_y;
                            if (mode == 0) {
                                key = 0x50;
                            }
                            if (mode == 1) {
                                key = 0x4F;
                            }
                        default:
                            px += 0x26;
                            break;
                    }
                }
            }
            break;
        case 2:
            px = base_x - 0xE;
            for (int key = 0; key < key_count[2]; key++) {
                u = (key % 10) * 22;
                v = (key / 10) * 22;
                if (key > 0x33) {
                    u = (key - 0x34) * 22;
                    v = 0xB0;
                }
                CRect_i_ texel(u, v, 22, 23);

                DrawMenu2DSprite(AlphaTex, CRect_i_(px + 1, py + 1, 22, 22), texel, 0, 0, 0, (alpha * 0x50) >> 7);
                DrawMenu2DSprite(AlphaTex, CRect_i_(px, py, 22, 22), texel, color, color, color, alpha);
                px += 0x22;
                if (key < 0x1A) {
                    if (key % 13 == 12) {
                        py += 0x1A;
                        px -= 0x1BA;
                    }
                    if (key == 0x19) {
                        px = base_x - 0xE;
                    }
                } else if (key < 0x34) {
                    int lower = key - 0x1A;

                    if (lower % 13 == 12) {
                        px -= 0x1BA;
                        py += 0x1E;
                    }
                    if (lower == 0x19) {
                        px = base_x - 0xE;
                    }
                }
            }
            break;
        case 3:
            px = base_x;
            for (int key = 0; key < key_count[3]; key++) {
                int cell = key + 2;
                int row = key / 10;

                if (key >= 0xC && key < 0xF) {
                    cell += 1;
                }
                if (key >= 0xF && key < 0x14) {
                    cell += 2;
                }
                if (key >= 0x14) {
                    cell = key + 0x17;
                }
                u = (cell % 10) * 22;
                v = (cell / 10) * 22 + 0x6E;
                DrawMenu2DSprite(AlphaTex, CRect_i_(px, py, 22, 22), CRect_i_(u, v, 22, 23), color, color, color, alpha);
                px += 0x26;
                if (key % 10 == 9) {
                    px -= 0x17C;
                    py += 0x1A;
                }
            }
            break;
    }
}
/**
 * Reports whether two names are the same.
 *
 * @mangled NameCompare__FPsPs
 * @address 0x2399D0
 * @size 0x6C
 */
static int NameCompare(short *first, short *second) {
    int same = 0;

    for (int i = 0; i < 10; i++) {
        if (first[i] == second[i]) {
            same++;
        }
    }
    // Every character has to agree before the names count as one.
    if (same >= 10) {
        return 0;
    }
    return 1;
}
/**
 * Reports whether the entered name may be used.
 *
 * @mangled CheckName__Fv
 * @address 0x239A40
 * @size 0x160
 */
int CheckName() {
    s16 blank_names[2][10] = {
        {0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
        {230, 230, 230, 230, 230, 230, 230, 230, 230, 230},
    };
    int blank_characters = 0;

    for (int index = 0; index < 10; index++) {
        if (CharaName[index] == 0 || CharaName[index] == 230) {
            blank_characters++;
        }
    }
    if (blank_characters >= 10) {
        return 2;
    }
    for (int blank = 0; blank < 2; blank++) {
        if (NameCompare(CharaName, blank_names[blank]) == 0) {
            return 0;
        }
    }
    for (int character = NameSelect.chara_no - 1; 0 <= character; character--) {
        if (NameCompare(CharaName, SaveData->GetCharaName(character)) == 0) {
            return 0;
        }
    }
    return 1;
}
/**
 * Draws the name-entry screen.
 *
 * @mangled NameEnterDraw__Fv
 * @address 0x239BA0
 * @size 0xC9C
 */
void NameEnterDraw(void) {
    int language;
    int chara_no;
    int fade;
    int color;
    float cursor_x;
    float cursor_y;

    setbilinear(0);
    if (NameSelect.chara_no != 0) {
        AllFadeForMenu(0x80);
    }

    if (NameSelect.loaded == 0) {
        ReadBG();
        if (ReadBGSync() == 0) {
            LOADTEXTURE_INFO2 info[3] = {{NameEntryImageDescriptor, 0, 0}, {NULL, 0, 0}, {NULL, 0, 0}};

            info[0].block_no = NameSelect.texture_block;
            info[1].block_no = NameSelect.texture_block;

            BG_READ_INFO *read = GetReadBGFile(0);
            info[1].name = (char *) GetPackFile((u_int *) read->buffer, NameEntryTextureFile, NULL);
            TexManager.DeleteTextureBlock(NameSelect.texture_block);
            TexManager.LoadTextureBlockEX(-1, info);
            NameTemp = TexManager.GetTexture(NameEntryTempTexture, -1);
            HiraTex = TexManager.GetTexture(NameEntryHiraganaTexture, -1);
            KataTex = TexManager.GetTexture(NameEntryKatakanaTexture, -1);
            AlphaTex = TexManager.GetTexture(NameEntryAlphabetTexture, -1);
            CharaFace = TexManager.GetTexture(NameEntryFaceTexture, -1);
            NameSelect.loaded = 1;

            short *mes = (short *) GetPackFile((u_int *) read->buffer, NameEntryMessageFile, NULL);
            short *mes2 = (short *) GetPackFile((u_int *) read->buffer, NameEntryMessageFile2, NULL);
            InitMenuMesSet(3, mes);
            CommonMenuMes2.SetBuff(mes2);

            s8 char_size[7][2] = {{18, 22}, {11, 20}, {11, 20}, {11, 20}, {11, 20}, {11, 20}, {11, 20}};
            CommonMenuMes2.char_width = char_size[NameSelect.language][0];
            CommonMenuMes2.char_height = char_size[NameSelect.language][1];
            CommonMenuMes2.stay_frame = 0;
            CommonMenuMes3.stay_frame = 0;
            AtoraNameMes.mes_no[0] = NameSelect.chara_no + 0x3C;
            AtoraNameMes.MakeMesWin(0x1E);
        }
        if (NameSelect.chara_no == 0) {
            return;
        }
    }

    language = NameSelect.language;
    MenuTextureReload(NameSelect.texture_block);
    chara_no = NameSelect.chara_no;
    color = fade = 0x80;
    switch (NameSelect.state) {
        case 1:
            fade = NameSelect.state_count * 5;
            if (fade > 0x80) {
                fade = 0x80;
                NameSelect.state = 0;
            }
            break;
    }
    if (NameSelect.area >= 6) {
        color = 0x38;
    }

    CTexture *frame = TexManager.GetTexture(NameEntryFrameTexture, -1);
    if ((chara_no != 0 || NameSelect.loaded == 0) && frame != NULL) {
        FrameImageDraw(0x80, 0x80);
    }

    if (NameSelect.loaded != 0) {
        MenuTextureReload(NameSelect.texture_block);
        DrawMenu2DSprite(NameTemp, CRect_i_(0x30, 0x21, 0x3C, 0x27), CRect_i_(0x1C0, 0x100, 0x3C, 0x28), fade);
        DrawMenu2DSprite(NameTemp, CRect_i_(0x6E, 0x24, 0xAE, 0x1F), CRect_i_(0xC0, 0x178, 0xAE, 0x20), fade);

        int name_color = color;
        if (NameSelect.area >= 6) {
            name_color = 0x80;
        }
        DrawCharaNameUp(0x3E, 0x36, name_color, fade);
        DrawNameTemplete(0x42, 0x9E, color, fade);

        switch (NameSelect.area) {
            case 5:
                switch (language) {
                    case 0: {
                        s16 tab_x[11] = {88, 160, 252, 310, 358, 420, 88, 114, 154, 216, 268};
                        cursor_x = tab_x[NameSelect.cursor];
                        break;
                    }
                    default:
                    case 1: {
                        s16 tab_x[11] = {88, 88, 88, 256, 350, 436, 88, 114, 154, 216, 268};
                        cursor_x = tab_x[NameSelect.cursor];
                        break;
                    }
                }
                if (NameSelect.cursor < 6) {
                    cursor_y = 164.0f;
                    if (NameSelect.cursor == 5) {
                        cursor_y += 4.0f;
                    }
                } else {
                    cursor_y = 188.0f;
                }
                break;
            case 4: {
                int wrap = InputModeOrikaeshi[NameSelect.input_mode];
                int step_x = InputModeMovetbl[NameSelect.input_mode][0];
                int step_y = InputModeMovetbl[NameSelect.input_mode][1];
                int cursor = NameSelect.cursor;
                int column = cursor % wrap;

                cursor_x = step_x * column + 0x62;
                cursor_y = step_y * (cursor / wrap) + 0xEE;
                if (NameSelect.input_mode < 2) {
                    cursor_x -= 8.0f;
                    if (column > 4) {
                        cursor_x += 20.0f;
                    }
                    if (NameSelect.side_row > 0) {
                        cursor_x = step_x * wrap + 0x6E;
                        cursor_y = step_y * (NameSelect.side_row - 1) + 0xEE;
                    }
                }
                if (NameSelect.input_mode == 2) {
                    cursor_x -= 14.0f;
                }
                break;
            }
        }

        if (NameSelect.area < 6) {
            if (abs((int) (cursor_x - NameSelect.cursor_x)) < 0x144) {
                NameSelect.cursor_x += (cursor_x - NameSelect.cursor_x) / 4.0f;
                NameSelect.cursor_y += (cursor_y - NameSelect.cursor_y) / 4.0f;
            } else {
                NameSelect.cursor_x = cursor_x;
            }
        }

        switch (NameSelect.state) {
            case 1:
            case 2:
                break;
            default: {
                if (NameSelect.area == 4 && 234.0f <= NameSelect.cursor_y) {
                    DrawNameRegiWaku((int) (16.0f + cursor_x), (int) (cursor_y - 6.0f), 0x1C, color, fade);
                }

                cursor_x = NameSelect.cursor_x + 5.0f * cosf(0.07853981852531433f * (float) NameSelect.frame);
                cursor_y = NameSelect.cursor_y + 3.0f * sinf(0.13089969754219055f * (float) NameSelect.frame);
                if (NameSelect.area < 8) {
                    CRect_i_ hand(0x1C0, 0x128, 0x20, 0x20);

                    DrawMenu2DSprite(NameTemp, CRect_i_((int) (2.0f + cursor_x), (int) (2.0f + cursor_y), 0x20, 0x20), hand, 0, 0, 0, (fade * 0x50) >> 7);
                    DrawMenu2DSprite(NameTemp, CRect_i_((int) cursor_x, (int) cursor_y, 0x20, 0x20), hand, color, color, color, fade);
                }
                break;
            }
        }

        NameSelect.frame++;
        if (NameSelect.frame > 500000) {
            NameSelect.frame = 0;
        }

        CommonMenuMes3.text_x = 0x1B6;
        CommonMenuMes3.text_y = 0x58;
        DrawMenu2DSprite(NameTemp, CRect_i_(0x1A3, 0x46, 0xB8, 0x51), CRect_i_(0, 0x178, 0xC0, 0x61), 0x64, 0x64, 0x64, fade);
        if (NameSelect.area >= 6) {
            int win_x = 0xAE;
            int win_y = 0xAA;
            int win_width = 0x12C;

            switch (NameSelect.area) {
                case 7:
                    win_x = 0xD8;
                    win_y = 0xB8;
                    win_width = 0xDA;
                    break;
                case 8:
                    win_x = 0xBA;
                    win_y = 0xB8;
                    win_width = 0x116;
                    break;
            }
            DrawMenu2DSprite(NameTemp, CRect_i_(win_x, win_y, win_width, 0x60), CRect_i_(0, 0x178, 0xC0, 0x61), 0x64, 0x64, 0x64, fade);
            CommonMenuMes2.text_x = win_x + 0x10;
            CommonMenuMes2.text_y = win_y + 0xE;
        }

        MenuTextureReload(CommonMenuMes2.tex_block);
        CommonMenuMes3.edge_alpha = fade;
        CommonMenuMes3.Step();
        CommonMenuMes3.DrawMesWin();
        switch (NameSelect.area) {
            case 6:
            case 7:
            case 8:
                CommonMenuMes2.edge_alpha = fade;
                CommonMenuMes2.Step();
                CommonMenuMes2.DrawMesWin();
                break;
        }

        setbilinear(0);
        switch (NameSelect.state) {
            case 1:
                fade = 0x80 - NameSelect.state_count * 6;
                if (fade < 0) {
                    fade = 0;
                }
                if (NameSelect.chara_no != 0) {
                    FrameImageDraw(0x80, fade);
                }
                break;
            case 3:
                ExitNameEnterFunc();
            case 2:
                fade = NameSelect.state_count * 3;
                if (fade > 0x80) {
                    fade = 0x80;
                }
                AllFadeForMenu(fade);
                break;
        }
        if (NameSelect.state != 0) {
            NameSelect.state_count++;
        }
        setbilinear(1);
    }
}
/**
 * Moves the cursor across the keyboard and enters the character it settles on.
 *
 * @mangled NameEnterKey__Fv
 * @address 0x23A840
 * @size 0x1F28
 */
#ifdef NON_MATCHING
int NameEnterKey() {
    if (GamePad.Down(0x1000)) {
        NameSelect.side_row = (NameSelect.side_row + 79) % 80;
    }
    if (GamePad.Down(0x4000)) {
        NameSelect.side_row = (NameSelect.side_row + 1) % 80;
    }
    if (GamePad.Down(0x8000)) {
        NameSelect.side_row = (NameSelect.side_row + 70) % 80;
    }
    if (GamePad.Down(0x2000)) {
        NameSelect.side_row = (NameSelect.side_row + 10) % 80;
    }
    if (GamePad.Down(0x40) && NameSelect.name_pos < 10) {
        int base = NameSelect.input_mode == 0 ? 1 : 82;
        CharaName[NameSelect.name_pos++] = base + NameSelect.side_row;
    }
    if (GamePad.Down(0x20) && NameSelect.name_pos > 0) {
        CharaName[--NameSelect.name_pos] = 0;
    }
    if (GamePad.Down(0x80)) {
        NameSelect.input_mode = NameSelect.input_mode == 0 ? 2 : 0;
    }
    NameSelect.state_count = CheckName();
    return NameSelect.state_count;
}
#else
INCLUDE_ASM("asm/nonmatchings/battle_globals", NameEnterKey__Fv);
#endif
/**
 * Gives one party member their default name for the chosen language.
 *
 * @mangled NameDefaultSet__Fi
 * @address 0x23C770
 * @size 0x110
 */
void NameDefaultSet(int chara_no) {
    int language = GetMenuLangFlag();
    s16 default_names[7][6][11] = {
        {{20, 1, 46}, {12, 47, 5}, {60, 43, 222}, {41, 77, 222}, {3, 46, 56, 56}, {5, 63, 35, 46, 70}},
        {{181, 202, 188, 201}, {185, 196, 188, 202}, {168, 202, 205, 202}, {179, 208, 189, 212}, {182, 201, 194, 188, 194, 188}, {176, 206, 200, 202, 201, 191}},
        {{181, 202, 188, 201}, {185, 196, 188, 202}, {168, 202, 205, 202}, {179, 208, 189, 212}, {182, 201, 194, 188, 194, 188}, {176, 206, 200, 202, 201, 191}},
        {{181, 202, 188, 201}, {185, 196, 188, 202}, {168, 202, 205, 202}, {179, 208, 189, 212}, {182, 201, 194, 188, 194, 188}, {176, 206, 200, 202, 201, 191}},
        {{181, 202, 188, 201}, {185, 196, 188, 202}, {168, 202, 205, 202}, {179, 208, 189, 212}, {182, 201, 194, 188, 194, 188}, {176, 206, 200, 202, 201, 191}},
        {{181, 202, 188, 201}, {185, 196, 188, 202}, {168, 202, 205, 202}, {179, 208, 189, 212}, {182, 201, 194, 188, 194, 188}, {176, 206, 200, 202, 201, 191}},
        {{181, 202, 188, 201}, {185, 196, 188, 202}, {168, 202, 205, 202}, {179, 208, 189, 212}, {182, 201, 194, 188, 194, 188}, {176, 206, 200, 202, 201, 191}},
    };
    s16 *name = SaveData->GetCharaName(chara_no);
    int length;

    for (length = 0; default_names[language][chara_no][length] != 0 && length < 10; length++) {
        name[length] = default_names[language][chara_no][length];
    }
    NameSelect.name_pos = length;
    for (; length < 32; length++) {
        name[length] = 0;
    }
}
/**
 * Gives the kerning between two name characters.
 *
 * @mangled GetFontLRTumeW__Fiii
 * @address 0x23C880
 * @size 0x78
 */
static int GetFontLRTumeW(int index, int left_code, int code) {
    extern s8 AlphabetEtcOffset[][2];

    int tume = 0;

    if (code >= 0xA2 && code < 0x100) {
        tume += AlphabetEtcOffset[code - 0xA2][0];
    }
    if (index - 1 >= 0 && code >= 0xA2 && code < 0x100) {
        tume += AlphabetEtcOffset[code - 0xA2][1];
    }
    return tume;
}
/**
 * Draws a party member's name on the character-select page.
 *
 * @mangled CharaSelectNameDraw2__FiiPsPP8CTexturei
 * @address 0x23C900
 * @size 0x250
 */
void CharaSelectNameDraw2(int x, int y, short *name, CTexture **textures, int sort) {
    if (name == NULL) {
        return;
    }

    int narrow;
    int put_x;
    int last;

    last = 9;
    while (name[last] == 0 && last > 0) {
        last--;
    }

    narrow = 0;
    int width = (last + 1) * 0x16;
    if (width >= 0xB0) {
        narrow = 1;
    }

    int tume = 0;
    for (int i = last; i >= 0; i--) {
        tume += GetFontLRTumeW(i, name[i - 1], name[i]);
    }
    if (narrow) {
        width -= tume;
    }

    put_x = x + 0x44 + (width >> 1) - ((width / (last + 1)) >> 1);

    for (; last >= 0; last--) {
        int cell_x;
        int cell_y;
        CTexture *texture = GetNameTextureInfo(textures, name[last], cell_x, cell_y);
        CRect_i_ cell(cell_x, cell_y, 0x16, 0x17);

        DrawMenu2DSprite(texture, CRect_i_(put_x + 2, y + 2, 0x16, 0x15), cell, 10, 10, 10, sort);
        DrawMenu2DSprite(texture, CRect_i_(put_x, y, 0x16, 0x15), cell, sort);

        int step = 0;
        if (last >= 0 && narrow == 1) {
            step = GetFontLRTumeW(last, name[last - 1], name[last]);
        }
        put_x -= 0x14 - step;
    }
}
/**
 * Draws a party member's name on the save board, in a gradient.
 *
 * @mangled DrawSaveBoardCharaName2__FiiPsPP8CTexture6spRGBA6spRGBA
 * @address 0x23CB50
 * @size 0x284
 */
#ifdef NON_MATCHING
void DrawSaveBoardCharaName2(int x, int y, short *name, CTexture **textures,
                             spRGBA top, spRGBA bottom) {
    int length = 10;
    while (length > 0 && name[length - 1] == 0) {
        length--;
    }
    int draw_x = x + 54 + length * 10;
    spRGBA shadow_top = {0, 0, 0, top.a};
    spRGBA shadow_bottom = {0, 0, 0, bottom.a};
    for (int index = length - 1; index >= 0; index--) {
        int texture_x;
        int texture_y;
        CTexture *texture =
            GetNameTextureInfo(textures, name[index], texture_x, texture_y);
        CRect_i_ source(texture_x, texture_y, 22, 23);
        CRect_i_ shadow(draw_x + 2, y + 2, 22, 21);
        CRect_i_ destination(draw_x, y, 22, 21);
        DrawMenu2DSprite(texture, shadow, source, &shadow_top, &shadow_top,
                         &shadow_bottom, &shadow_bottom);
        DrawMenu2DSprite(texture, destination, source, &top, &top, &bottom, &bottom);
        draw_x -= 20 - GetFontLRTumeW(index, index > 0 ? name[index - 1] : 0,
                                      name[index]);
    }
}
#else
INCLUDE_ASM("asm/nonmatchings/battle_globals", DrawSaveBoardCharaName2__FiiPsPP8CTexture6spRGBA6spRGBA);
#endif
/**
 * Gives how wide a party member's name draws.
 *
 * @mangled GetMsgLengthCharaName__Fi
 * @address 0x23CDE0
 * @size 0x78
 */
int GetMsgLengthCharaName(int chara_no) {
    if (chara_no < 0 || chara_no > 5) {
        return 0;
    }

    s16 *name = SaveData->GetCharaName(chara_no);
    int length = 0;

    while (*name != 0 && length < 10) {
        name++;
        length++;
    }
    return length;
}
/**
 * Opens the storybook that begins the game.
 *
 * @mangled InitOpeningBook__FP1Pi
 * @address 0x23CE60
 * @size 0xB0
 */
void InitOpeningBook(u_long128 *buffer, int *blocks) {
    u_long128 *load_buffer = buffer;
    if (load_buffer == NULL) {
        load_buffer = (u_long128 *) read_buffer;
    }
    load_buffer = MenuCalcBufAlignment(load_buffer);
    StartReadBG();
    LoadFileBGMenuData("openbook.pak", load_buffer);
    OpenBook.tex_block = blocks[0];
    OpenBook.unk_004 = blocks[1];
    OpenBook.open = 0;
    OpenBook.step = 0;
    OpenBook.unk_006 = 0;
    OpenBook.fade = 128;
    OpenBook.unk_00C = 0;
}

INCLUDE_RODATA("asm/nonmatchings/battle_globals", @1511__4);
INCLUDE_RODATA("asm/nonmatchings/battle_globals", @1558__2);
INCLUDE_RODATA("asm/nonmatchings/battle_globals", @1559__3);
/**
 * Turns the storybook's pages with the pad.
 *
 * @mangled OpeningBookKey__Fv
 * @address 0x23CF10
 * @size 0x664
 */
#ifdef NON_MATCHING
int OpeningBookKey() {
    ReadBG();
    switch (OpenBook.step) {
        case 0:
            if (ReadBGSync() == 0) {
                OpenBook.open = 1;
                OpenBook.fade = 128;
            }
            if (OpenBook.open && OpenBook.fade > 0) {
                OpenBook.fade--;
            }
            if (OpenBook.open && OpenBook.fade == 0) {
                OpenBook.step = 1;
            }
            break;
        case 1:
            OpenBook.unk_00C += 2;
            if (OpenBook.unk_00C >= 128) {
                OpenBook.unk_00C = 128;
                OpenBook.step = 2;
            }
            break;
        case 2:
            if (GamePad.Down(0x40)) {
                OpenBook.step = OpenBook.unk_006 > 10 ? 4 : 3;
            }
            break;
        case 3:
            OpenBook.unk_00C -= 2;
            if (OpenBook.unk_00C <= 0) {
                OpenBook.unk_00C = 0;
                OpenBook.unk_006++;
                OpenBook.step = 1;
            }
            break;
        case 4:
            if (OpenBook.unk_00C > 0) {
                OpenBook.unk_00C--;
            } else {
                InitNameRegist(0, OpenBook.unk_004, NULL);
                OpenBook.step = 5;
            }
            break;
        case 5:
            NameEnterKey();
            return NameSelect.state_count;
    }
    return 0;
}
#else
INCLUDE_ASM("asm/nonmatchings/battle_globals", OpeningBookKey__Fv);
#endif
/**
 * Draws the storybook page by page.
 *
 * @mangled OpeningBookDraw__Fv
 * @address 0x23D580
 * @size 0x134
 */
void OpeningBookDraw(void) {
    setbilinear(0);
    AllFadeForMenu(0x80);
    if (OpenBook.open == 0) {
        return;
    }

    MenuTextureReload(OpenBook.tex_block);
    DrawFullSizePicture(TexManager.GetTexture("openbook", -1), 0, 0, 0x80);

    switch (OpenBook.step) {
        case 0:
        case 1:
        case 2:
        case 3:
        case 4:
            MenuTextureReload(CommonMenuMes2.tex_block);
            CommonMenuMes2.edge_alpha = OpenBook.unk_00C;
            GetMenuCommonPutXY(&CommonMenuMes2, 0x14C - CommonMenuMes2.char_width);
            CommonMenuMes2.Step();
            CommonMenuMes2.DrawMesWin();
            AllFadeForMenu(OpenBook.fade);
            break;
        case 5:
        case 6:
            NameEnterDraw();
            break;
    }
}
