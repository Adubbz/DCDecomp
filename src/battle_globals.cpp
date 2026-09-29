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
NAME_SELECT NameSelect;

/** The name currently being edited. */
extern "C" {
s16 *CharaName;
}

/** The face of the party member being named. */
CTexture *CharaFace;

/** The name-entry screen's frame, tabs and cursor. */
CTexture *NameTemp;

/** The hiragana keyboard's characters. */
CTexture *HiraTex;

/** The katakana keyboard's characters. */
CTexture *KataTex;

/** The alphabet and symbol keyboards' characters. */
CTexture *AlphaTex;

/** How far the cursor moves across and down each keyboard, per key. */
s16 InputModeMovetbl[4][2] = {{0x26, 0x1A}, {0x26, 0x1A}, {0x22, 0x1E}, {0x26, 0x1A}};

/** How many keys each keyboard has in a row. */
s16 InputModeOrikaeshi[4] = {10, 10, 13, 10};

#include "gameutil.hpp"
#include "snd.hpp"

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
void InitNameRegist(int chara_no, int texture_block, u_long128 *buffer) {
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

    NameSelect.chara_no = chara_no;
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
CTexture *GetNameTextureInfo(CTexture **textures, int char_code, int &cell_x, int &cell_y) {
    CTexture *texture;

    if (char_code == 0) {
        char_code = 0xE6;
        texture = textures[0];
    } else if (char_code < 0x52) {
        char_code -= 1;
        texture = textures[1];
    } else if (char_code < 0xA2) {
        char_code -= 0x52;
        texture = textures[2];
    } else {
        char_code -= 0xA2;
        texture = textures[0];
    }
    cell_x = (char_code % 10) * 0x16;
    cell_y = (char_code / 10) * 0x16;
    return texture;
}

/**
 * Draws a party member's name.
 *
 * @mangled DrawCharaName__Fiiiii
 * @address 0x238760
 * @size 0x118
 */
void DrawCharaName(int chara_no, int x, int y, int brightness, int blend_mode) {
    int draw_x = x;
    CTexture *textures[3] = {AlphaTex, KataTex, HiraTex};

    for (int slot = 0; slot < 10; slot++) {
        int cell_x;
        int cell_y;
        CTexture *texture = GetNameTextureInfo(textures, CharaName[slot], cell_x, cell_y);
        DrawMenu2DSprite(texture, CRect_i_(draw_x, y, 22, 22), CRect_i_(cell_x, cell_y, 22, 22), brightness, brightness,
                         brightness, blend_mode);
        draw_x += 22;
    }
}

/**
 * Draws the four corners of the frame around the name being entered, pulling them inward as the frame counter cycles.
 *
 * @mangled DrawNameRegiWaku__Fiiiii
 * @address 0x238880
 * @size 0x1F0
 */
void DrawNameRegiWaku(int x, int y, int size, int brightness, int blend_mode) {
    float inset = 0.1f * (NameSelect.frame % 29);
    int edge[4];

    edge[0] = x + inset;
    edge[1] = y + inset;
    edge[2] = x + size - inset;
    edge[3] = y + size - inset;
    s16 corner[4][2] = {{edge[0], edge[1]}, {edge[2], edge[1]}, {edge[0], edge[3]}, {edge[2], edge[3]}};
    s16 cell[4][2] = {{480, 296}, {496, 296}, {480, 312}, {496, 312}};
    for (int corner_no = 0; corner_no < 4; corner_no++) {
        DrawMenu2DSprite(NameTemp, CRect_i_(corner[corner_no][0], corner[corner_no][1], 12, 12),
                         CRect_i_(cell[corner_no][0], cell[corner_no][1], 16, 16), (u8) brightness, (u8) brightness,
                         (u8) brightness, blend_mode);
    }
}

/**
 * Draws the top of the name-entry screen: the party member's face and title, the name being entered and the cursor over it.
 *
 * @mangled DrawCharaNameUp__Fiiii
 * @address 0x238A70
 * @size 0x628
 */
void DrawCharaNameUp(int x, int y, int brightness, int blend_mode) {
    int left;
    int top;
    int chara_no = NameSelect.chara_no;
    left = x - 2;
    top = y + 14;
    int face_x = 0;
    int face_y = chara_no * 106;
    int name_length;

    if (chara_no > 2) {
        face_x = 106;
        face_y = (chara_no - 3) * 106;
    }
    DrawMenu2DSprite(CharaFace, CRect_i_(left, top, 88, 88), CRect_i_(face_x, face_y, 106, 106), blend_mode);
    DrawMenuHelpWindow(TexManager.GetTexture("window", -1), -1, left + 102, top + 16, 8.6f, 1.0f, blend_mode);
    DrawMenu2DSprite(NameTemp, CRect_i_(left + 97, top + 16, 26, 23), CRect_i_(0, 256, 26, 24), (u8) brightness,
                     (u8) brightness, (u8) brightness, blend_mode);
    DrawMenu2DSprite(NameTemp, CRect_i_(left + 123, top + 16, 210, 23), CRect_i_(26, 256, 172, 24), (u8) brightness,
                     (u8) brightness, (u8) brightness, blend_mode);
    DrawMenu2DSprite(NameTemp, CRect_i_(left + 333, top + 16, 26, 23), CRect_i_(198, 256, 26, 24), (u8) brightness,
                     (u8) brightness, (u8) brightness, blend_mode);

    MenuTextureReload(AtoraNameMes.tex_block);
    int message_length = AtoraNameMes.GetMesLen_system(chara_no - 1220);
    float char_width[7] = {18.0f, 12.0f, 12.0f, 12.0f, 12.0f, 12.0f, 12.0f};
    float title_char_width = char_width[NameSelect.language];
    AtoraNameMes.line_pos[0].x = 290.0f - title_char_width * (message_length / 2.0f);
    AtoraNameMes.line_pos[0].y = 82;
    AtoraNameMes.edge_alpha = blend_mode;
    AtoraNameMes.Step();
    AtoraNameMes.DrawMesWin();
    MenuTextureReload(NameSelect.texture_block);

    if (NameSelect.area < 6) {
        CRect_i_ destination(left + 89, top + 25, 24, 24);
        CRect_i_ source(24, 472, 24, 24);
        DrawMenu2DSprite(NameTemp, destination, source, blend_mode);
        source.x += 25;
        destination.x = left + 331;
        DrawMenu2DSprite(NameTemp, destination, source, blend_mode);
    }

    left = x + 120;
    top = y + 58;
    DrawCharaName(chara_no, left, top, brightness, blend_mode);

    left = x + 122;
    top = y + 82;
    if (NameSelect.area == 7) {
        for (name_length = 10; name_length > 0; name_length--) {
            if (CharaName[name_length - 1] != 0 && CharaName[name_length - 1] != 0xE6) {
                break;
            }
        }
    }
    for (int slot = 0; slot < 10; slot++) {
        int underline_brightness = brightness;
        if (NameSelect.area == 7 && name_length <= slot) {
            underline_brightness = 0x38;
        }
        DrawMenu2DSprite(NameTemp, CRect_i_(left, top, 18, 2), CRect_i_(470, 328, 18, 2), (u8) underline_brightness, (u8) underline_brightness,
                         (u8) underline_brightness, blend_mode);
        left += 22;
    }

    int cursor_slot = NameSelect.name_pos;
    if (cursor_slot >= 10) {
        cursor_slot = 9;
    }
    left = x + 110 + cursor_slot * 22;
    top = y + 48;
    switch (NameSelect.state) {
        case 1:
        case 2:
            break;
        default:
            if (NameSelect.area < 6) {
                DrawNameRegiWaku(left, top, 30, brightness, blend_mode);
                int bob_frame = NameSelect.frame - 15;
                if (NameSelect.area >= 6) {
                    bob_frame = 0;
                }
                top = (top - 20) + 4.0f * sinf(0.20943952f * (bob_frame % 31));
                DrawMenu2DSprite(NameTemp, CRect_i_(left + 20, top, 24, 24), CRect_i_(488, 328, 24, 24), (u8) brightness,
                                 (u8) brightness, (u8) brightness, blend_mode);
            }
            break;
    }
}

char NameEntryImageDescriptor[] __attribute__((section(".rodata"))) = "#frame_image_name#640#448#4";
char NameEntryTextureFile[] __attribute__((section(".rodata"))) = "nameregi.img";
char NameEntryTempTexture[] __attribute__((section(".rodata"))) = "nametemp";
char NameEntryHiraganaTexture[] __attribute__((section(".rodata"))) = "hira";
char NameEntryKatakanaTexture[] __attribute__((section(".rodata"))) = "kata";
char NameEntryAlphabetTexture[] __attribute__((section(".rodata"))) = "alphabet";
char NameEntryFaceTexture[] __attribute__((section(".rodata"))) = "charaface";
char NameEntryMessageFile[] __attribute__((section(".rodata"))) = "nameregi.bin";
char NameEntryMessageFile2[] __attribute__((section(".rodata"))) = "nameregi2.bin";
char NameEntryFrameTexture[] __attribute__((section(".rodata"))) = "frame_image";

/**
 * Draws the character keyboard the name is entered from.
 *
 * @mangled DrawNameTemplete__Fiiii
 * @address 0x2390A0
 * @size 0x930
 */
static void DrawNameTemplete(int x, int y, int brightness, int blend_mode) {
    int input_mode = NameSelect.input_mode;
    int pushed_tab = NameSelect.pushed_tab;
    int draw_x;
    int draw_y;
    int tex_u;
    int tex_v;
    int i;
    s16 key_count[4] = {89, 88, 62, 24};

    DrawMenu2DSprite(NameTemp, CRect_i_(x, y, 0x200, 0x100), CRect_i_(0, 0, 0x200, 0x100), brightness, brightness, brightness, blend_mode);

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
    int tab_height = 0x18;

    if (NameSelect.state == 6) {
        draw_x = x + tab_x[language][pushed_tab];
        draw_y = y + 6 + (pushed_tab / 6) * 27;

        tex_u = 0;
        if (pushed_tab < 6) {
            i = 0;
            tex_v = 0x148;
        } else {
            i = 6;
            tex_v = 0x160;
        }
        for (; i < pushed_tab; i++) {
            tex_u += tab_width[language][i];
        }
        if (pushed_tab == 5) {
            draw_y += 4;
            tab_height = 0x28;
        }
        DrawMenu2DSprite(NameTemp, CRect_i_(draw_x, draw_y, tab_width[language][pushed_tab], tab_height), CRect_i_(tex_u, tex_v, tab_width[language][pushed_tab], tab_height), brightness, brightness, brightness, blend_mode);
    }

    draw_x = x + tab_x[language][input_mode];
    draw_y = y + 6;

    for (i = 0, tex_u = 0; i < input_mode; i++) {
        tex_u += tab_width[language][i];
    }
    DrawMenu2DSprite(NameTemp, CRect_i_(draw_x, draw_y, tab_width[language][input_mode], 0x18), CRect_i_(tex_u, 0x148, tab_width[language][input_mode], 0x18), brightness, brightness, brightness, blend_mode);

    int base_x = x + 0x38;
    int base_y = y + 0x54;
    CTexture *texture;

    draw_y = base_y;
    if (input_mode == 0) {
        texture = KataTex;
    }
    if (input_mode == 1) {
        texture = HiraTex;
    }

    switch (input_mode) {
        case 0:
        case 1:
            draw_x = base_x - 8;
            for (int key = 0; key < key_count[input_mode]; key++) {
                tex_u = (key % 10) * 22;
                tex_v = (key / 10) * 22;

                CRect_i_ tex_rect(tex_u, tex_v, 22, 23);

                DrawMenu2DSprite(texture, CRect_i_(draw_x + 1, draw_y + 1, 22, 22), tex_rect, 0, 0, 0, (blend_mode * 0x50) >> 7);
                DrawMenu2DSprite(texture, CRect_i_(draw_x, draw_y, 22, 22), tex_rect, brightness, brightness, brightness, blend_mode);
                if (key < 0x23 && key != 0x1D) {
                    draw_x += 0x26;
                    if (key % 5 == 4) {
                        draw_x -= 0xBE;
                        draw_y += 0x1A;
                    }
                } else if (key >= 0x50) {
                    draw_y += 0x1A;
                } else {
                    switch (key) {
                        case 0x1D:
                            draw_x = base_x + 0xCA;
                            draw_y = base_y;
                            break;
                        case 0x23:
                        case 0x24:
                        case 0x2B:
                        case 0x2C:
                            draw_x += 0x4C;
                            break;
                        case 0x31:
                            draw_x -= 0x72;
                            draw_y += 0x1A;
                            break;
                        case 0x25:
                        case 0x2A:
                        case 0x2D:
                            draw_x -= 0x98;
                            draw_y += 0x1A;
                            break;
                        case 0x36:
                            draw_y = base_y;
                            if (input_mode == 0) {
                                key = 0x50;
                            }
                            if (input_mode == 1) {
                                key = 0x4F;
                            }
                        default:
                            draw_x += 0x26;
                            break;
                    }
                }
            }
            break;
        case 2:
            draw_x = base_x - 0xE;
            for (int key = 0; key < key_count[2]; key++) {
                tex_u = (key % 10) * 22;
                tex_v = (key / 10) * 22;
                if (key > 0x33) {
                    tex_u = (key - 0x34) * 22;
                    tex_v = 0xB0;
                }
                CRect_i_ tex_rect(tex_u, tex_v, 22, 23);

                DrawMenu2DSprite(AlphaTex, CRect_i_(draw_x + 1, draw_y + 1, 22, 22), tex_rect, 0, 0, 0, (blend_mode * 0x50) >> 7);
                DrawMenu2DSprite(AlphaTex, CRect_i_(draw_x, draw_y, 22, 22), tex_rect, brightness, brightness, brightness, blend_mode);
                draw_x += 0x22;
                if (key < 0x1A) {
                    if (key % 13 == 12) {
                        draw_y += 0x1A;
                        draw_x -= 0x1BA;
                    }
                    if (key == 0x19) {
                        draw_x = base_x - 0xE;
                    }
                } else if (key < 0x34) {
                    int lower_key = key - 0x1A;

                    if (lower_key % 13 == 12) {
                        draw_x -= 0x1BA;
                        draw_y += 0x1E;
                    }
                    if (lower_key == 0x19) {
                        draw_x = base_x - 0xE;
                    }
                }
            }
            break;
        case 3:
            draw_x = base_x;
            for (int key = 0; key < key_count[3]; key++) {
                int cell_no = key + 2;
                int row = key / 10;

                if (key >= 0xC && key < 0xF) {
                    cell_no += 1;
                }
                if (key >= 0xF && key < 0x14) {
                    cell_no += 2;
                }
                if (key >= 0x14) {
                    cell_no = key + 0x17;
                }
                tex_u = (cell_no % 10) * 22;
                tex_v = (cell_no / 10) * 22 + 0x6E;
                DrawMenu2DSprite(AlphaTex, CRect_i_(draw_x, draw_y, 22, 22), CRect_i_(tex_u, tex_v, 22, 23), brightness, brightness, brightness, blend_mode);
                draw_x += 0x26;
                if (key % 10 == 9) {
                    draw_x -= 0x17C;
                    draw_y += 0x1A;
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
    int matching = 0;

    for (int i = 0; i < 10; i++) {
        if (first[i] == second[i]) {
            matching++;
        }
    }
    // Every character has to agree before the names count as one.
    if (matching >= 10) {
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
    int blank_count = 0;

    for (int slot = 0; slot < 10; slot++) {
        if (CharaName[slot] == 0 || CharaName[slot] == 230) {
            blank_count++;
        }
    }
    if (blank_count >= 10) {
        return 2;
    }
    for (int blank_no = 0; blank_no < 2; blank_no++) {
        if (NameCompare(CharaName, blank_names[blank_no]) == 0) {
            return 0;
        }
    }
    for (int other_chara_no = NameSelect.chara_no - 1; 0 <= other_chara_no; other_chara_no--) {
        if (NameCompare(CharaName, SaveData->GetCharaName(other_chara_no)) == 0) {
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
    int brightness;
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

            BG_READ_INFO *read_file = GetReadBGFile(0);
            info[1].name = (char *) GetPackFile((u_int *) read_file->buffer, NameEntryTextureFile, NULL);
            TexManager.DeleteTextureBlock(NameSelect.texture_block);
            TexManager.LoadTextureBlockEX(-1, info);
            NameTemp = TexManager.GetTexture(NameEntryTempTexture, -1);
            HiraTex = TexManager.GetTexture(NameEntryHiraganaTexture, -1);
            KataTex = TexManager.GetTexture(NameEntryKatakanaTexture, -1);
            AlphaTex = TexManager.GetTexture(NameEntryAlphabetTexture, -1);
            CharaFace = TexManager.GetTexture(NameEntryFaceTexture, -1);
            NameSelect.loaded = 1;

            short *messages = (short *) GetPackFile((u_int *) read_file->buffer, NameEntryMessageFile, NULL);
            short *messages2 = (short *) GetPackFile((u_int *) read_file->buffer, NameEntryMessageFile2, NULL);
            InitMenuMesSet(3, messages);
            CommonMenuMes2.SetBuff(messages2);

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
    brightness = fade = 0x80;
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
        brightness = 0x38;
    }

    CTexture *frame_texture = TexManager.GetTexture(NameEntryFrameTexture, -1);
    if ((chara_no != 0 || NameSelect.loaded == 0) && frame_texture != NULL) {
        FrameImageDraw(0x80, 0x80);
    }

    if (NameSelect.loaded != 0) {
        MenuTextureReload(NameSelect.texture_block);
        DrawMenu2DSprite(NameTemp, CRect_i_(0x30, 0x21, 0x3C, 0x27), CRect_i_(0x1C0, 0x100, 0x3C, 0x28), fade);
        DrawMenu2DSprite(NameTemp, CRect_i_(0x6E, 0x24, 0xAE, 0x1F), CRect_i_(0xC0, 0x178, 0xAE, 0x20), fade);

        int name_color = brightness;
        if (NameSelect.area >= 6) {
            name_color = 0x80;
        }
        DrawCharaNameUp(0x3E, 0x36, name_color, fade);
        DrawNameTemplete(0x42, 0x9E, brightness, fade);

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
                int keys_per_row = InputModeOrikaeshi[NameSelect.input_mode];
                int step_x = InputModeMovetbl[NameSelect.input_mode][0];
                int step_y = InputModeMovetbl[NameSelect.input_mode][1];
                int cursor_key = NameSelect.cursor;
                int column = cursor_key % keys_per_row;

                cursor_x = step_x * column + 0x62;
                cursor_y = step_y * (cursor_key / keys_per_row) + 0xEE;
                if (NameSelect.input_mode < 2) {
                    cursor_x -= 8.0f;
                    if (column > 4) {
                        cursor_x += 20.0f;
                    }
                    if (NameSelect.side_row > 0) {
                        cursor_x = step_x * keys_per_row + 0x6E;
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
                    DrawNameRegiWaku((int) (16.0f + cursor_x), (int) (cursor_y - 6.0f), 0x1C, brightness, fade);
                }

                cursor_x = NameSelect.cursor_x + 5.0f * cosf(0.07853981852531433f * (float) NameSelect.frame);
                cursor_y = NameSelect.cursor_y + 3.0f * sinf(0.13089969754219055f * (float) NameSelect.frame);
                if (NameSelect.area < 8) {
                    CRect_i_ hand_rect(0x1C0, 0x128, 0x20, 0x20);

                    DrawMenu2DSprite(NameTemp, CRect_i_((int) (2.0f + cursor_x), (int) (2.0f + cursor_y), 0x20, 0x20), hand_rect, 0, 0, 0, (fade * 0x50) >> 7);
                    DrawMenu2DSprite(NameTemp, CRect_i_((int) cursor_x, (int) cursor_y, 0x20, 0x20), hand_rect, brightness, brightness, brightness, fade);
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
s32 NameEnterKey(void) {
    int language;
    int chara_no;
    int cursor;
    int side_row;
    int name_pos;
    int action;
    int mes_no;
    int input_mode;
    int sound;

    if (NameSelect.loaded == 0) {
        return 0;
    }
    language = NameSelect.language;
    chara_no = NameSelect.chara_no;
    switch (NameSelect.state) {
        case 2:
            if (NameSelect.state_count >= 84) {
                GamePad.AutoRepeatOff();
                GamePad.MenuModeOff();
                NameSelect.state = 3;
                return 1;
            }
            return 0;
        case 6:
            if (NameSelect.state_count > 8) {
                NameSelect.state = 0;
            }
            break;
    }

    cursor = NameSelect.cursor;
    side_row = NameSelect.side_row;
    name_pos = NameSelect.name_pos;
    action = -1;
    mes_no = -1;
    switch (NameSelect.area) {
        case 6:
            mes_no = chara_no + 100;
            if (GamePad.Down(0x40) || GamePad.Down(0x20)) {
                NameSelect.area = 5;
                NameSelect.state = 0;
            }
            break;
        case 7:
        case 8:
            if (NameSelect.area == 7) {
                mes_no = 91;
            }
            if (NameSelect.area == 8) {
                mes_no = 95;
            }
            if (GamePad.Down(0x40)) {
                NameSelect.state = 0;
                action = 50;
            } else if (GamePad.Down(0x20)) {
                NameSelect.area = 4;
                NameSelect.state = 0;
            }
            break;
        case 4:
            if (NameSelect.input_mode > 1) {
                NameSelect.side_row = 0;
            }
            switch (NameSelect.side_row) {
                case 0: {
                    int keys_per_row = InputModeOrikaeshi[NameSelect.input_mode];

                    if (GamePad.Down(0x4000)) {
                        int rows = 5;

                        switch (NameSelect.input_mode) {
                            case 3:
                                rows -= 2;
                            case 2:
                                rows -= 1;
                                break;
                        }
                        if (NameSelect.cursor / keys_per_row < rows) {
                            NameSelect.cursor += keys_per_row;
                        }
                    } else if (GamePad.Down(0x8000)) {
                        if (NameSelect.cursor % keys_per_row != 0) {
                            NameSelect.cursor--;
                        } else if (NameSelect.input_mode > 1) {
                            NameSelect.cursor += keys_per_row - 1;
                        } else {
                            NameSelect.side_row = NameSelect.cursor / keys_per_row + 1;
                        }
                    } else if (GamePad.Down(0x2000)) {
                        if (keys_per_row - 1 != NameSelect.cursor % keys_per_row) {
                            NameSelect.cursor++;
                        } else if (NameSelect.input_mode > 1) {
                            NameSelect.cursor -= keys_per_row - 1;
                        } else {
                            NameSelect.side_row = NameSelect.cursor / keys_per_row + 1;
                        }
                    } else if (GamePad.Down(0x1000)) {
                        int row = NameSelect.cursor / keys_per_row;

                        if (0 < row) {
                            NameSelect.cursor -= keys_per_row;
                        } else if (row <= 0) {
                            NameSelect.area = 5;
                            if (NameSelect.cursor < 4) {
                                NameSelect.cursor += 6;
                            } else if (NameSelect.cursor >= 4 && NameSelect.cursor < 7) {
                                NameSelect.cursor = 10;
                            } else {
                                NameSelect.cursor = 5;
                            }
                        }
                    }
                    break;
                }
                default: {
                    int column = -1;

                    if (GamePad.Down(0x1000)) {
                        if (NameSelect.side_row == 1) {
                            NameSelect.side_row = 0;
                            NameSelect.area = 5;
                            NameSelect.cursor = 5;
                        } else {
                            NameSelect.side_row--;
                        }
                    } else if (GamePad.Down(0x4000)) {
                        if (NameSelect.side_row < 6) {
                            NameSelect.side_row++;
                        }
                    } else if (GamePad.Down(0x8000)) {
                        column = 1;
                    } else if (GamePad.Down(0x2000)) {
                        column = 0;
                    }
                    if (column != -1) {
                        NameSelect.cursor = (NameSelect.side_row - 1) * 10 + column * 9;
                        NameSelect.side_row = 0;
                    }
                    break;
                }
            }
            if (GamePad.Down(0x40)) {
                action = 100;
            } else if (GamePad.Down(0x20)) {
                action = 250;
            }
            break;
        case 5: {
            int tab_first_key[3] = {0, 2, 2};

            if (GamePad.Down(0x1000)) {
                switch (language) {
                    case 0:
                        if (NameSelect.cursor >= 6) {
                            if (NameSelect.cursor < 8) {
                                NameSelect.cursor = 0;
                            } else if (NameSelect.cursor < 10) {
                                NameSelect.cursor = 1;
                            } else if (NameSelect.cursor == 10) {
                                NameSelect.cursor = 2;
                            }
                        }
                        break;
                    case 1:
                    default:
                        if (NameSelect.cursor >= 6) {
                            if (NameSelect.cursor < 10) {
                                NameSelect.cursor = 2;
                            } else if (NameSelect.cursor < 11) {
                                NameSelect.cursor = 3;
                            } else if (NameSelect.cursor == 10) {
                                NameSelect.cursor = 4;
                            }
                        }
                        break;
                }
            } else if (GamePad.Down(0x4000)) {
                if (NameSelect.cursor >= 6) {
                    NameSelect.area = 4;
                    switch (NameSelect.cursor) {
                        case 6:
                        case 7:
                            NameSelect.cursor = 0;
                            break;
                        case 8:
                            NameSelect.cursor = 1;
                            break;
                        case 9:
                            NameSelect.cursor = 3;
                            break;
                        case 10:
                            NameSelect.cursor = 4;
                            break;
                    }
                } else if (NameSelect.cursor < 6) {
                    switch (language) {
                        case 0:
                            switch (NameSelect.cursor) {
                                case 0:
                                    NameSelect.cursor = 6;
                                    break;
                                case 1:
                                    NameSelect.cursor = 8;
                                    break;
                                case 5:
                                    NameSelect.cursor = 8;
                                    NameSelect.area = 4;
                                    break;
                                default:
                                    NameSelect.cursor = 10;
                                    break;
                            }
                            break;
                        case 1:
                        default:
                            switch (NameSelect.cursor) {
                                case 2:
                                    NameSelect.cursor = 6;
                                    break;
                                case 3:
                                    NameSelect.cursor = 10;
                                    break;
                                case 5:
                                    NameSelect.cursor = 8;
                                    NameSelect.area = 4;
                                    break;
                                default:
                                    NameSelect.cursor = 10;
                                    break;
                            }
                            break;
                    }
                }
            }
            static s8 up_or_down = 0;
            if (GamePad.Down(0x8000)) {
                switch (language) {
                    case 0:
                        switch (NameSelect.cursor) {
                            case 0:
                            case 6:
                                NameSelect.cursor = 5;
                                break;
                            case 5:
                                if (up_or_down != 0) {
                                    NameSelect.cursor = 4;
                                } else {
                                    NameSelect.cursor = 10;
                                }
                                break;
                            default:
                                NameSelect.cursor--;
                                break;
                        }
                        break;
                    case 1:
                    default:
                        switch (NameSelect.cursor) {
                            case 2:
                            case 6:
                                NameSelect.cursor = 5;
                                break;
                            case 5:
                                if (up_or_down != 0) {
                                    NameSelect.cursor = 4;
                                } else {
                                    NameSelect.cursor = 10;
                                }
                                break;
                            default:
                                NameSelect.cursor--;
                                break;
                        }
                        break;
                }
            } else if (GamePad.Down(0x2000)) {
                switch (language) {
                    case 0:
                        switch (NameSelect.cursor) {
                            case 5:
                                if (up_or_down == 0) {
                                    NameSelect.cursor = 0;
                                } else {
                                    NameSelect.cursor = 6;
                                }
                                break;
                            case 10:
                                NameSelect.cursor = 5;
                                break;
                            default:
                                NameSelect.cursor++;
                                break;
                        }
                        break;
                    case 1:
                    default:
                        switch (NameSelect.cursor) {
                            case 5:
                                if (up_or_down == 0) {
                                    NameSelect.cursor = 2;
                                } else {
                                    NameSelect.cursor = 6;
                                }
                                break;
                            case 10:
                                NameSelect.cursor = 5;
                                break;
                            default:
                                NameSelect.cursor++;
                                break;
                        }
                        break;
                }
            }
            if (GamePad.Down(0x20)) {
                action = 250;
            } else if (GamePad.Down(0x40)) {
                NameSelect.pushed_tab = NameSelect.cursor;
                if (NameSelect.cursor < 4) {
                    if (NameSelect.input_mode != NameSelect.cursor) {
                        NameSelect.input_mode = NameSelect.cursor;
                    }
                } else {
                    NameSelect.state = 6;
                    NameSelect.state_count = 0;
                    int tab_action[7] = {700, 49, 500, 600, 200, 300, 800};
                    action = tab_action[NameSelect.cursor - 4];
                }
            }
            break;
        }
    }

    if (GamePad.Down(0x800) && NameSelect.area < 6) {
        action = 49;
    }
    GamePad.Down(0x10);
    if (GamePad.Down(0x4)) {
        action = 500;
    }
    if (GamePad.Down(0x8)) {
        action = 600;
    }
    if (NameSelect.area < 6) {
        if (GamePad.Down(0x2)) {
            action = 400;
        }
        if (GamePad.Down(0x1)) {
            action = 450;
        }
    }

    input_mode = NameSelect.input_mode;
    switch (action) {
        case -1:
            break;
        case 100: {
            int slot;
            int code_base;
            int key;
            int raw_key;

            key = NameSelect.cursor;
            slot = NameSelect.name_pos;

            switch (input_mode) {
                case 1:
                case 0:
                    if (input_mode == 1) {
                        code_base = 82;
                    } else {
                        code_base = 1;
                    }
                    if (NameSelect.side_row == 0) {
                        int column = key % 10;

                        if (column < 5) {
                            key = column + (key / 10) * 5;
                        } else {
                            key = column + 25 + (key / 10) * 5;
                        }
                        if (key < 36) {
                            raw_key = key;
                        } else {
                            if (key >= 40 && key < 46) {
                                key -= 2;
                            } else if (key >= 50 && key < 54) {
                                key -= 4;
                            } else if (key >= 55 && key < 60) {
                                key -= 5;
                            } else {
                                switch (key) {
                                    case 49:
                                        key--;
                                    case 47:
                                        key--;
                                    case 45:
                                    case 39:
                                        key--;
                                    case 37:
                                        key--;
                                        break;
                                    default:
                                        key = 230 - code_base;
                                        break;
                                }
                            }
                        }
                        if (slot >= 10) {
                            slot--;
                        }
                        CharaName[slot] = key + code_base;
                        if (NameSelect.name_pos < 10) {
                            NameSelect.name_pos++;
                        }
                    } else {
                        switch (NameSelect.side_row) {
                            case 1:
                                if (0 < slot) {
                                    int previous_code = CharaName[slot - 1];

                                    if ((previous_code >= 6 && previous_code < 21) || (previous_code >= 26 && previous_code < 31) || (previous_code >= 87 && previous_code < 102) ||
                                        (previous_code >= 107 && previous_code < 112)) {
                                        CharaName[slot - 1] += 50;
                                    } else if (previous_code == 3) {
                                        CharaName[slot - 1] = 81;
                                    }
                                }
                                break;
                            case 2:
                                if (0 < slot) {
                                    int previous_code = CharaName[slot - 1];

                                    if ((previous_code >= 26 && previous_code < 31) || (previous_code >= 107 && previous_code < 112)) {
                                        CharaName[slot - 1] += 45;
                                    }
                                }
                                break;
                            case 3:
                                key = 222 - code_base;
                                if (slot >= 10) {
                                    slot--;
                                }
                                CharaName[slot] = key + code_base;
                                if (NameSelect.name_pos < 10) {
                                    NameSelect.name_pos++;
                                }
                                break;
                            default:
                                CharaName[slot] = 230;
                                break;
                        }
                    }
                    break;
                case 2:
                    key = (key < 52) ? key : ((key < 62) ? key + 28 : 68);
                    if (slot >= 10) {
                        slot--;
                    }
                    CharaName[slot] = key + 162;
                    if (NameSelect.name_pos < 10) {
                        NameSelect.name_pos++;
                    }
                    break;
                case 3:
                    if (key < 12) {
                        raw_key = key;
                    } else {
                        if (key > 11 && key < 15) {
                            key += 1;
                        } else if (key >= 15 && key < 20) {
                            key += 2;
                        } else if (key >= 20 && key < 25) {
                            key += 21;
                        } else {
                            key = 16;
                        }
                    }
                    if (slot >= 10) {
                        slot--;
                    }
                    CharaName[slot] = key + 214;
                    if (NameSelect.name_pos < 10) {
                        NameSelect.name_pos++;
                    }
                    printf("now Input CHaraID = %d\n", CharaName[slot]);
                    break;
            }
            break;
        }
        case 900: {
            int slot = NameSelect.name_pos;
            int old_code;

            if (slot <= 0) {
                slot = 0;
            }
            old_code = CharaName[slot];
            if ((old_code >= 36 && old_code < 39) || (old_code >= 117 && old_code < 120)) {
                CharaName[slot] += 11;
            } else if ((old_code >= 47 && old_code < 50) || (old_code >= 128 && old_code < 131)) {
                CharaName[slot] -= 11;
            }
            if (old_code == 18) {
                CharaName[slot] = 50;
            } else if (old_code == 50) {
                CharaName[slot] = 68;
            } else if (old_code == 68) {
                CharaName[slot] = 18;
            } else if ((old_code >= 6 && old_code < 21) || (old_code >= 26 && old_code < 31) || (old_code >= 87 && old_code < 102) ||
                       (old_code >= 107 && old_code < 112)) {
                CharaName[slot] += 50;
            } else if ((old_code >= 56 && old_code < 71) || (old_code >= 76 && old_code < 81) || (old_code >= 137 && old_code < 152) ||
                       (old_code >= 157 && old_code < 162)) {
                CharaName[slot] -= 50;
            }
            if (old_code >= 162 && old_code < 188) {
                CharaName[slot] += 26;
            } else if (old_code >= 188 && old_code < 214) {
                CharaName[slot] -= 26;
            }
            break;
        }
        case 200:
            for (int i = NameSelect.name_pos + 1; i <= 11; i++) {
                CharaName[i - 1] = CharaName[i];
            }
            break;
        case 250:
            if (NameSelect.name_pos >= 10) {
                NameSelect.name_pos--;
                CharaName[NameSelect.name_pos] = 230;
            } else if (0 < NameSelect.name_pos) {
                CharaName[NameSelect.name_pos] = 230;
                NameSelect.name_pos--;
            } else {
                CharaName[0] = 230;
            }
            break;
        case 300: {
            int slot = NameSelect.name_pos;
            int i;

            for (i = 9; i >= slot; i--) {
                CharaName[i + 1] = CharaName[i];
            }
            CharaName[i + 1] = 230;
            for (i = 10; i < 32; i++) {
                CharaName[i] = 230;
            }
            break;
        }
        case 400:
            switch (language) {
                case 0:
                    if (input_mode < 3) {
                        NameSelect.input_mode = input_mode + 1;
                    } else {
                        NameSelect.input_mode = 0;
                    }
                    break;
                case 1:
                default:
                    if (input_mode < 3) {
                        NameSelect.input_mode++;
                    } else {
                        NameSelect.input_mode = 2;
                    }
                    break;
            }
            break;
        case 450:
            switch (language) {
                case 0:
                    if (0 < input_mode) {
                        NameSelect.input_mode = input_mode - 1;
                    } else {
                        NameSelect.input_mode = 3;
                    }
                    break;
                case 1:
                default:
                    if (input_mode > 2) {
                        NameSelect.input_mode--;
                    } else {
                        NameSelect.input_mode = 3;
                    }
                    break;
            }
            break;
        case 500:
            if (0 < NameSelect.name_pos) {
                if (NameSelect.name_pos >= 10) {
                    NameSelect.name_pos--;
                }
                NameSelect.name_pos--;
            }
            break;
        case 600:
            if (NameSelect.name_pos < 10) {
                NameSelect.name_pos++;
            }
            break;
        case 800:
            NameSelect.area = 6;
            NameSelect.state = 8;
            break;
        case 700:
            NameDefaultSet(NameSelect.chara_no);
            break;
        case 49:
            switch (CheckName()) {
                case 1: {
                    int length;
                    int i;

                    NameSelect.area = 7;
                    for (length = 10; length > 0; length--) {
                        if (CharaName[length - 1] != 0 && CharaName[length - 1] != 230) {
                            break;
                        }
                    }
                    for (i = 0; i < length; i++) {
                        if (CharaName[i] == 0) {
                            CharaName[i] = 230;
                        }
                    }
                    for (; length < 32; length++) {
                        CharaName[length] = 0;
                    }
                    break;
                }
                case 0:
                    for (int i = 0; i < 10; i++) {
                        CharaName[i] = 0;
                    }
                    NameSelect.name_pos = 0;
                    break;
                case 2:
                    NameDefaultSet(NameSelect.chara_no);
                    mes_no = 95;
                    NameSelect.area = 8;
                    break;
            }
            break;
        case 50:
            for (int i = 0; i < 10; i++) {
                printf("CharaName[%d][%d] = %d\n", chara_no, i, CharaName[i]);
            }
            GamePad.AutoRepeatOff();
            GamePad.MenuModeOff();
            NameSelect.area = 4;
            NameSelect.state = 2;
            NameSelect.state_count = 0;
            break;
    }

    if (input_mode != NameSelect.input_mode && NameSelect.area != 5) {
        int old_cursor;
        int row;
        int column;

        switch (NameSelect.input_mode) {
            case 1:
            case 3:
                if (input_mode == 2) {
                    old_cursor = NameSelect.cursor;
                    row = old_cursor / 13;
                    column = old_cursor % 13;

                    if (NameSelect.input_mode == 1 && column == 12) {
                        NameSelect.side_row = row + 1;
                    } else {
                        if (column >= 5) {
                            column--;
                        }
                        if (NameSelect.input_mode == 3) {
                            while (column >= 10) {
                                column--;
                            }
                            if (NameSelect.language > 0) {
                                while (row >= 3) {
                                    row--;
                                }
                            }
                        }
                        NameSelect.cursor = column + row * 10;
                    }
                }
                break;
            case 2: {
                old_cursor = NameSelect.cursor;
                row = old_cursor / 10;
                column = old_cursor % 10;

                if (NameSelect.side_row > 0) {
                    NameSelect.cursor = NameSelect.side_row * 13 - 1;
                } else {
                    if (column >= 5) {
                        column++;
                    }
                    if (row >= 4) {
                        row = 4;
                    }
                    NameSelect.cursor = column + row * 13;
                }
                break;
            }
        }
    }
    if (NameSelect.input_mode == 3) {
        while (NameSelect.cursor >= 40) {
            NameSelect.cursor -= 10;
        }
    }
    if (NameSelect.input_mode == 2) {
        while (NameSelect.cursor >= 66) {
            NameSelect.cursor -= 13;
        }
    }

    sound = -1;
    if (cursor != NameSelect.cursor || side_row != NameSelect.side_row) {
        sound = 0;
    }
    if (name_pos != NameSelect.name_pos || input_mode != NameSelect.input_mode) {
        sound = 1;
    }
    if (GamePad.Down(0x40)) {
        sound = 1;
    }
    if (GamePad.Down(0x20) || action == 200 || action == 250) {
        sound = 2;
    }
    if (CommonMenuMes3.mes_made != 0) {
        CommonMenuMes3.MakeMesWin(0);
    }
    if (CommonMenuMes2.mes_made != mes_no) {
        CommonMenuMes2.MakeMesWin(mes_no);
    }
    ComMenuSePlay(sound);
    return 0;
}

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

// clang-format off
/** The extra spacing to the left and right of each character from code 0xA2 upwards. */
s8 AlphabetEtcOffset[97][2] = {
    {1, 0}, {0, 1}, {1, 1}, {0, 1}, {1, 0}, {2, 2}, {0, 1}, {1, 2},
    {2, 4}, {4, 4}, {2, 2}, {0, 2}, {0, 1}, {0, 2}, {2, 2}, {1, 1},
    {0, 0}, {1, 1}, {1, 1}, {0, 0}, {2, 1}, {0, 2}, {0, 0}, {0, 2},
    {2, 2}, {1, 2}, {2, 1}, {1, 2}, {1, 1}, {2, 1}, {2, 2}, {2, 2},
    {1, 1}, {1, 3}, {3, 3}, {4, 2}, {1, 3}, {2, 4}, {0, 0}, {1, 1},
    {2, 1}, {1, 2}, {2, 1}, {1, 3}, {1, 2}, {1, 1}, {1, 1}, {1, 1},
    {1, 1}, {1, 2}, {1, 2}, {1, 1}, {0, 8}, {1, 1}, {-1, 4}, {3, 4},
    {2, 2}, {1, 0}, {0, 1}, {1, 0}, {1, 1}, {1, 2}, {0, 1}, {0, 0},
    {0, 1}, {6, 0}, {-4, 7}, {0, 0}, {0, 0}, {1, 1}, {1, 0}, {0, 1},
    {3, 2}, {2, 3}, {4, 3}, {3, 3}, {3, 3}, {3, 3}, {4, 3}, {3, 4},
    {1, 2}, {4, 6}, {1, 2}, {2, 2}, {1, 2}, {2, 1}, {2, 2}, {3, 1},
    {1, 1}, {1, 2}, {4, 6}, {2, 8}, {2, 8}, {2, 2}, {1, 3}, {1, 4},
    {1, 2},
};
// clang-format on

/**
 * Gives the kerning between two name characters.
 *
 * @mangled GetFontLRTumeW__Fiii
 * @address 0x23C880
 * @size 0x78
 */
static int GetFontLRTumeW(int position, int left_code, int char_code) {
    int kerning = 0;

    if (char_code >= 0xA2 && char_code < 0x100) {
        kerning += AlphabetEtcOffset[char_code - 0xA2][0];
    }
    if (position - 1 >= 0 && char_code >= 0xA2 && char_code < 0x100) {
        kerning += AlphabetEtcOffset[char_code - 0xA2][1];
    }
    return kerning;
}

/**
 * Draws a party member's name on the character-select page.
 *
 * @mangled CharaSelectNameDraw2__FiiPsPP8CTexturei
 * @address 0x23C900
 * @size 0x250
 */
void CharaSelectNameDraw2(int x, int y, short *name, CTexture **textures, int blend_mode) {
    if (name == NULL) {
        return;
    }

    int condensed;
    int draw_x;
    int last;

    last = 9;
    while (name[last] == 0 && last > 0) {
        last--;
    }

    condensed = 0;
    int width = (last + 1) * 0x16;
    if (width >= 0xB0) {
        condensed = 1;
    }

    int kerning = 0;
    for (int slot = last; slot >= 0; slot--) {
        kerning += GetFontLRTumeW(slot, name[slot - 1], name[slot]);
    }
    if (condensed) {
        width -= kerning;
    }

    draw_x = x + 0x44 + (width >> 1) - ((width / (last + 1)) >> 1);

    for (; last >= 0; last--) {
        int cell_x;
        int cell_y;
        CTexture *texture = GetNameTextureInfo(textures, name[last], cell_x, cell_y);
        CRect_i_ cell_rect(cell_x, cell_y, 0x16, 0x17);

        DrawMenu2DSprite(texture, CRect_i_(draw_x + 2, y + 2, 0x16, 0x15), cell_rect, 10, 10, 10, blend_mode);
        DrawMenu2DSprite(texture, CRect_i_(draw_x, y, 0x16, 0x15), cell_rect, blend_mode);

        int kerning_step = 0;
        if (last >= 0 && condensed == 1) {
            kerning_step = GetFontLRTumeW(last, name[last - 1], name[last]);
        }
        draw_x -= 0x14 - kerning_step;
    }
}

/**
 * Draws a party member's name centred on the save board, with a shadow and a top-to-bottom gradient.
 *
 * @mangled DrawSaveBoardCharaName2__FiiPsPP8CTexture6spRGBA6spRGBA
 * @address 0x23CB50
 * @size 0x284
 */
void DrawSaveBoardCharaName2(int x, int y, s16 *name, CTexture **textures, spRGBA top_color, spRGBA bottom_color) {
    spRGBA shadow_top = {10, 10, 10, top_color.a};
    spRGBA shadow_bottom = {10, 10, 10, bottom_color.a};
    int condensed;
    int draw_x;
    CTexture *texture;
    int last;

    last = 9;
    while (name[last] == 0 && last > 0) {
        last--;
    }

    condensed = 0;
    int width = (last + 1) * 0x16;
    if (width >= 0xB0) {
        condensed = 1;
    }

    int kerning = 0;
    for (int slot = last; slot >= 0; slot--) {
        kerning += GetFontLRTumeW(slot, name[slot - 1], name[slot]);
    }
    if (condensed == 1) {
        width -= kerning;
    }

    draw_x = x + 0x36 + (width >> 1) - ((width / (last + 1)) >> 1);

    for (; last >= 0; last--) {
        int cell_x;
        int cell_y;
        texture = GetNameTextureInfo(textures, name[last], cell_x, cell_y);
        CRect_i_ cell_rect(cell_x, cell_y, 0x16, 0x17);

        DrawMenu2DSprite(texture, CRect_i_(draw_x + 2, y + 2, 0x16, 0x15), cell_rect, &shadow_top, &shadow_top,
                         &shadow_bottom, &shadow_bottom);
        DrawMenu2DSprite(texture, CRect_i_(draw_x, y, 0x16, 0x15), cell_rect, &top_color, &top_color, &bottom_color, &bottom_color);

        int kerning_step = 0;
        if (last >= 0 && condensed == 1) {
            kerning_step = GetFontLRTumeW(last, name[last - 1], name[last]);
        }
        draw_x -= 0x14 - kerning_step;
    }
}

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

/** State of the storybook that plays before the game begins. */
OPENING_BOOK OpenBook;

/** The work area the storybook hands to the name-entry screen once its pages are read. */
u_long128 *OpeningReadBuf;

/**
 * Opens the storybook that begins the game.
 *
 * @mangled InitOpeningBook__FP1Pi
 * @address 0x23CE60
 * @size 0xB0
 */
void InitOpeningBook(u_long128 *buffer, int *tex_blocks) {
    u_long128 *load_buffer = buffer;
    if (load_buffer == NULL) {
        load_buffer = (u_long128 *) read_buffer;
    }
    load_buffer = MenuCalcBufAlignment(load_buffer);
    StartReadBG();
    LoadFileBGMenuData("openbook.pak", load_buffer);
    OpenBook.tex_block = tex_blocks[0];
    OpenBook.name_tex_block = tex_blocks[1];
    OpenBook.open = 0;
    OpenBook.step = 0;
    OpenBook.page = 0;
    OpenBook.fade = 128;
    OpenBook.text_alpha = 0;
}

/**
 * Steps the storybook that plays before the game begins: reads its pages, fades them in and out on the pad, then hands over to naming the hero.
 *
 * @mangled OpeningBookKey__Fv
 * @address 0x23CF10
 * @size 0x664
 */
int OpeningBookKey() {
    int result;

    ReadBG();
    result = 0;
    switch (OpenBook.step) {
        case 0:
            if (OpenBook.open == 0 && ReadBGSync() == 0) {
                LOADTEXTURE_INFO2 info[3] = {{"#frame_image#640#448#4", 0, 0}, {NULL, 0, 0}, {NULL, 0, 0}};

                info[0].block_no = OpenBook.tex_block;
                info[1].block_no = OpenBook.tex_block;
                BG_READ_INFO *read_file = GetReadBGFile(0);
                info[1].name = (char *) GetPackFile((u_int *) read_file->buffer, "opentex.img", NULL);
                TexManager.DeleteTextureBlock(OpenBook.tex_block);
                TexManager.CleanUpTextureList();
                TexManager.LoadTextureBlockEX(-1, info);
                OpeningReadBuf = read_file->buffer + (read_file->size >> 4) + 1;
                OpeningReadBuf = MenuCalcBufAlignment(OpeningReadBuf);
                short *messages = (short *) GetPackFile((u_int *) read_file->buffer, "opmes.bin", NULL);

                CommonMenuMes2.text_columns = 0x46;
                CommonMenuMes2.text_rows = 10;
                CommonMenuMes2.text_len = 0;
                CommonMenuMes2.text_width = 0;
                CommonMenuMes2.text_height = 0;
                CommonMenuMes2.fade = 0.0f;
                CommonMenuMes2.fade_in = 1;
                CommonMenuMes2.text_rate = CommonMenuMes2.text_rate_set;
                CommonMenuMes2.waiting = 0;
                CommonMenuMes2.text_at = 0.0f;
                CommonMenuMes2.text_no = 0;
                CommonMenuMes2.text_from = 0;
                CommonMenuMes2.page_from = 0;
                CommonMenuMes2.InitMesWinTbl();
                CommonMenuMes2.clut_now = CommonMenuMes2.clut_default;
                CommonMenuMes2.wait = 0;
                CommonMenuMes2.blink = 0;
                CommonMenuMes2.auto_page_wait = 0;
                CommonMenuMes2.mes_made = -1;
                CommonMenuMes2.edge_alpha = 0x80;
                for (int i = 0; i < 10; i++) {
                    CommonMenuMes2.mes_no[i] = -1;
                }
                for (int i = 0; i < 8; i++) {
                    CommonMenuMes2.values[i] = 0;
                }
                CommonMenuMes2.value = 0;
                CommonMenuMes2.value_signed = 0;
                CommonMenuMes2.value_show = 1;
                CommonMenuMes2.value_narrow = 0;
                CommonMenuMes2.space_width = -1;
                CommonMenuMes2.space_area = -1;
                CommonMenuMes2.cursor_row = -1;
                CommonMenuMes2.cursor_y = 0;
                CommonMenuMes2.cursor_lit = 0;
                for (int i = 0; i < 10; i++) {
                    CommonMenuMes2.line_pos[i].x = -1;
                    CommonMenuMes2.line_pos[i].y = -1;
                }
                CommonMenuMes2.SetMesFukidashi(4);
                CommonMenuMes2.text_rate = 0.0f;
                CommonMenuMes2.text_rate_set = 0.0f;
                CommonMenuMes2.page_arrow = 1;
                CommonMenuMes2.centre_rows = 1;
                CommonMenuMes2.columns = 40;
                CommonMenuMes2.rows = 3;
                int language = GetMenuLangFlag();
                if (language > 0) {
                    CommonMenuMes2.char_width--;
                }
                CommonMenuMes2.tex_block = 0x1A;
                CommonMenuMes2.tex_buff = MesWinTexBuff_02;
                CommonMenuMes2.SetBuff(messages);
                CommonMenuMes2.edge_alpha = OpenBook.text_alpha;
                OpenBook.open = 1;
                OpenBook.fade = 0x80;
                s8 page_text_y[7] = {20, 16, 16, 16, 16, 16, 16};
                CommonMenuMes2.text_y = page_text_y[language] + 300;
                CommonMenuMes2.mes_made = -1;
                CommonMenuMes2.MakeMesWin(100);
            }
            if (OpenBook.open != 0) {
                OpenBook.fade--;
                if (OpenBook.fade <= 0) {
                    OpenBook.fade = 0;
                }
            }
            if (OpenBook.fade <= 0) {
                OpenBook.step = 1;
                OpenBook.text_alpha = 0;
            }
            break;
        case 1:
            OpenBook.text_alpha += 2;
            if (OpenBook.text_alpha >= 0x80) {
                OpenBook.text_alpha = 0x80;
                OpenBook.step = 2;
                OpenBook.fade = 0;
            }
            break;
        case 3:
            OpenBook.text_alpha -= 2;
            if (OpenBook.text_alpha <= 0) {
                OpenBook.text_alpha = 0;
                OpenBook.page++;
                CommonMenuMes2.MakeMesWin(OpenBook.page + 100);
                OpenBook.step = 1;
            }
            break;
        case 2:
            if (GamePad.Down(0x40)) {
                OpenBook.step = 3;
                if (OpenBook.page >= 11) {
                    OpenBook.step = 4;
                }
            }
            break;
        case 4:
            OpenBook.text_alpha--;
            if (OpenBook.text_alpha <= 0 && OpenBook.step == 4 && OpenBook.text_alpha <= 0) {
                CommonMenuMes2.page_arrow = 0;
                InitNameRegist(0, OpenBook.name_tex_block, OpeningReadBuf);
                OpenBook.step = 5;
            }
            break;
        case 5:
            result = NameEnterKey();
            break;
    }
    return result;
}

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
            CommonMenuMes2.edge_alpha = OpenBook.text_alpha;
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
