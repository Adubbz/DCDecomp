#pragma helper_mask_gpr 0x30
#pragma helper_mask_fpr 0x1000
#pragma name_counter 15

#include "battle_globals.hpp"

#include <cstdio>
#include <cstdlib>

#include "dataread.hpp"
#include "gamepad.hpp"
#include "menu_draw.hpp"
#include "rect.hpp"
#include "runscript.hpp"
#include "savedata.hpp"
#include "texture.hpp"

/** State used while the player edits a party member's name. */
struct NAME_ENTRY_STATE {
    s16 character;      /**< Party member whose name is being edited. */
    s16 mode;           /**< Current name-entry screen mode. */
    s16 name_length;    /**< Number of entered characters. */
    s16 cursor;         /**< Selected keyboard character. */
    s16 unk_08;
    s16 keyboard_page;  /**< Active keyboard character page. */
    s32 transition;     /**< Name-entry transition state. */
    s32 enabled;        /**< Whether the name-entry interface accepts input. */
    s32 result;         /**< Result returned by the name-entry interface. */
    float window_x;     /**< Animated horizontal window position. */
    float window_y;     /**< Animated vertical window position. */
    s32 frame;          /**< Frames elapsed in the current state. */
    s16 language;       /**< Language used by the keyboard. */
    s16 texture_block;  /**< Texture block occupied by the interface. */
    s32 flags;
};

/** State used by the opening storybook sequence. */
struct OPENING_BOOK_STATE {
    s16 loaded;         /**< Whether the storybook resources are ready. */
    s16 texture_block;  /**< Texture block containing the book page. */
    s16 name_block;     /**< Texture block passed to name entry. */
    s16 page;           /**< Current story page. */
    s16 state;          /**< Storybook transition state. */
    s16 fade;           /**< Full-screen fade opacity. */
    s16 message_alpha;  /**< Story text opacity. */
};

extern "C" NAME_ENTRY_STATE NameSelect;
extern "C" OPENING_BOOK_STATE OpenBook;
extern "C" s16 *CharaName;
extern "C" CTexture *NameTemp;
extern "C" CTexture *HiraTex;
extern "C" CTexture *KataTex;
extern "C" CTexture *AlphaTex;

void setbilinear(int enabled);
void DrawFullSizePicture(CTexture *texture, int picture_no, int alpha, int blend_mode);

INCLUDE_RODATA("asm/nonmatchings/battle_globals", @348__4);
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
INCLUDE_RODATA("asm/nonmatchings/battle_globals", @1505);
INCLUDE_RODATA("asm/nonmatchings/battle_globals", @1511__4);
INCLUDE_RODATA("asm/nonmatchings/battle_globals", @1558__2);
INCLUDE_RODATA("asm/nonmatchings/battle_globals", @1559__3);

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
void InitNameRegist(int character, int texture_block, void *buffer) {
    StartReadBG();
    if (buffer == NULL) {
        buffer = read_buffer;
    }
    LoadFileBGMenuData("nameregi.pak", MenuCalcBufAlignment((u_long128 *) buffer));

    NameSelect.character = character;
    NameSelect.mode = 4;
    NameSelect.name_length = 0;
    NameSelect.cursor = 0;
    NameSelect.keyboard_page = GetMenuLangFlag() == 0 ? 0 : 2;
    NameSelect.transition = 0;
    NameSelect.enabled = 1;
    NameSelect.result = 0;
    NameSelect.window_x = 100.0f;
    NameSelect.window_y = 242.0f;
    NameSelect.frame = 0;
    NameSelect.language = GetMenuLangFlag();
    NameSelect.texture_block = texture_block;
    NameSelect.flags = 0;
    CharaName = SaveData->GetCharaName(character);
    NameDefaultSet(character);

    GamePad.MenuModeOn(0x78);
    GamePad.SetAutoRepeat(0xF000, 30, 9);
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
CTexture *GetNameTextureInfo(CTexture **textures, int character, int &texture_x,
                             int &texture_y) {
    CTexture *texture;
    int cell;
    if (character == 0) {
        cell = 230;
        texture = textures[0];
    } else if (character < 82) {
        cell = character - 1;
        texture = textures[1];
    } else if (character < 162) {
        cell = character - 82;
        texture = textures[2];
    } else {
        cell = character - 162;
        texture = textures[0];
    }
    texture_x = (cell % 10) * 22;
    texture_y = (cell / 10) * 22;
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
    CTexture *textures[3] = {AlphaTex, KataTex, HiraTex};
    s16 *name = SaveData->GetCharaName(character);
    for (int index = 0; index < 10; index++) {
        int texture_x;
        int texture_y;
        CTexture *texture = GetNameTextureInfo(textures, name[index], texture_x, texture_y);
        CRect_i_ destination(x + index * 22, y, 22, 22);
        CRect_i_ source(texture_x, texture_y, 22, 22);
        DrawMenu2DSprite(texture, destination, source, (u8) brightness,
                         (u8) brightness, (u8) brightness, blend_mode);
    }
}
/**
 * Draws the frame around the name being entered, bobbing it with a sine.
 *
 * @mangled DrawNameRegiWaku__Fiiiii
 * @address 0x238880
 * @size 0x1F0
 */
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
/**
 * Draws the name being entered above the keyboard.
 *
 * @mangled DrawCharaNameUp__Fiiii
 * @address 0x238A70
 * @size 0x628
 */
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
    DrawNameRegiWaku(x + 93 + NameSelect.name_length * 22, y + 28, 26,
                     brightness, blend_mode);
}
/**
 * Draws the character keyboard the name is entered from.
 *
 * @mangled DrawNameTemplete__Fiiii
 * @address 0x2390A0
 * @size 0x930
 */
void DrawNameTemplete(int x, int y, int brightness, int blend_mode) {
    CTexture *textures[3] = {AlphaTex, KataTex, HiraTex};
    int first_character = NameSelect.keyboard_page == 0 ? 1 : 82;
    for (int row = 0; row < 8; row++) {
        for (int column = 0; column < 10; column++) {
            int character = first_character + row * 10 + column;
            int texture_x;
            int texture_y;
            CTexture *texture =
                GetNameTextureInfo(textures, character, texture_x, texture_y);
            CRect_i_ destination(x + column * 24, y + row * 24, 22, 22);
            CRect_i_ source(texture_x, texture_y, 22, 22);
            DrawMenu2DSprite(texture, destination, source, (u8) brightness,
                             (u8) brightness, (u8) brightness, blend_mode);
        }
    }
    int cursor_x = x + (NameSelect.cursor % 10) * 24;
    int cursor_y = y + (NameSelect.cursor / 10) * 24;
    DrawNameRegiWaku(cursor_x - 2, cursor_y - 2, 26, brightness, blend_mode);
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
    int blank_characters = 0;
    for (int index = 0; index < 10; index++) {
        if (CharaName[index] == 0 || CharaName[index] == 230) {
            blank_characters++;
        }
    }
    if (blank_characters == 10) {
        return 2;
    }

    for (int character = NameSelect.character - 1; character >= 0; character--) {
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
void NameEnterDraw() {
    AllFadeForMenu(128);
    MenuTextureReload(NameSelect.texture_block);
    DrawCharaNameUp((int) NameSelect.window_x, (int) NameSelect.window_y, 128, 0);
    DrawNameTemplete(80, 160, 128, 0);
    NameSelect.frame++;
}
/**
 * Moves the cursor across the keyboard and enters the character it settles on.
 *
 * @mangled NameEnterKey__Fv
 * @address 0x23A840
 * @size 0x1F28
 */
void NameEnterKey() {
    if (GamePad.Down(0x1000)) {
        NameSelect.cursor = (NameSelect.cursor + 79) % 80;
    }
    if (GamePad.Down(0x4000)) {
        NameSelect.cursor = (NameSelect.cursor + 1) % 80;
    }
    if (GamePad.Down(0x8000)) {
        NameSelect.cursor = (NameSelect.cursor + 70) % 80;
    }
    if (GamePad.Down(0x2000)) {
        NameSelect.cursor = (NameSelect.cursor + 10) % 80;
    }
    if (GamePad.Down(0x40) && NameSelect.name_length < 10) {
        int base = NameSelect.keyboard_page == 0 ? 1 : 82;
        CharaName[NameSelect.name_length++] = base + NameSelect.cursor;
    }
    if (GamePad.Down(0x20) && NameSelect.name_length > 0) {
        CharaName[--NameSelect.name_length] = 0;
    }
    if (GamePad.Down(0x80)) {
        NameSelect.keyboard_page = NameSelect.keyboard_page == 0 ? 2 : 0;
    }
    NameSelect.result = CheckName();
}
/**
 * Gives one party member their default name for the chosen language.
 *
 * @mangled NameDefaultSet__Fi
 * @address 0x23C770
 * @size 0x110
 */
void NameDefaultSet(int chara_no) {
    static const s16 default_names[6][11] = {
        {20, 15, 1, 14, 0},
        {24, 9, 1, 15, 0},
        {7, 15, 18, 15, 0},
        {18, 21, 2, 25, 0},
        {21, 14, 7, 1, 7, 1, 0},
        {15, 19, 13, 15, 14, 4, 0},
    };
    if (chara_no < 0 || chara_no >= 6) {
        return;
    }

    s16 *name = SaveData->GetCharaName(chara_no);
    int length = 0;
    while (length < 10 && default_names[chara_no][length] != 0) {
        name[length] = default_names[chara_no][length];
        length++;
    }
    NameSelect.name_length = length;
    while (length < 32) {
        name[length++] = 0;
    }
}
/**
 * Gives the kerning between two name characters.
 *
 * @mangled GetFontLRTumeW__Fiii
 * @address 0x23C880
 * @size 0x78
 */
int GetFontLRTumeW(int index, int previous, int character) {
    (void) previous;
    if (character < 162 || character >= 256) {
        return 0;
    }
    // The alphabet sheet has narrow punctuation at either edge of each row.
    int cell = character - 162;
    int adjustment = (cell % 10 == 0 || cell % 10 == 9) ? 2 : 0;
    if (index > 0 && cell % 10 == 1) {
        adjustment++;
    }
    return adjustment;
}
/**
 * Draws a party member's name on the character-select page.
 *
 * @mangled CharaSelectNameDraw2__FiiPsPP8CTexturei
 * @address 0x23C900
 * @size 0x250
 */
void CharaSelectNameDraw2(int x, int y, short *name, CTexture **textures,
                          int blend_mode) {
    if (name == NULL) {
        return;
    }
    int length = 10;
    while (length > 0 && name[length - 1] == 0) {
        length--;
    }
    int draw_x = x + 68 + length * 10;
    for (int index = length - 1; index >= 0; index--) {
        int texture_x;
        int texture_y;
        CTexture *texture =
            GetNameTextureInfo(textures, name[index], texture_x, texture_y);
        CRect_i_ shadow(draw_x + 2, y + 2, 22, 21);
        CRect_i_ destination(draw_x, y, 22, 21);
        CRect_i_ source(texture_x, texture_y, 22, 23);
        DrawMenu2DSprite(texture, shadow, source, 10, 10, 10, blend_mode);
        DrawMenu2DSprite(texture, destination, source, blend_mode);
        draw_x -= 20 - GetFontLRTumeW(index, index > 0 ? name[index - 1] : 0,
                                      name[index]);
    }
}
/**
 * Draws a party member's name on the save board, in a gradient.
 *
 * @mangled DrawSaveBoardCharaName2__FiiPsPP8CTexture6spRGBA6spRGBA
 * @address 0x23CB50
 * @size 0x284
 */
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
void InitOpeningBook(void *buffer, int *blocks) {
    if (buffer == NULL) {
        buffer = read_buffer;
    }
    StartReadBG();
    LoadFileBGMenuData("openbook.pak", MenuCalcBufAlignment((u_long128 *) buffer));
    OpenBook.loaded = 0;
    OpenBook.texture_block = (s16) blocks[0];
    OpenBook.name_block = (s16) blocks[1];
    OpenBook.page = 0;
    OpenBook.state = 0;
    OpenBook.fade = 128;
    OpenBook.message_alpha = 0;
}
/**
 * Turns the storybook's pages with the pad.
 *
 * @mangled OpeningBookKey__Fv
 * @address 0x23CF10
 * @size 0x664
 */
int OpeningBookKey() {
    ReadBG();
    switch (OpenBook.state) {
    case 0:
        if (ReadBGSync() == 0) {
            OpenBook.loaded = 1;
            OpenBook.fade = 128;
        }
        if (OpenBook.loaded && OpenBook.fade > 0) {
            OpenBook.fade--;
        }
        if (OpenBook.loaded && OpenBook.fade == 0) {
            OpenBook.state = 1;
        }
        break;
    case 1:
        OpenBook.message_alpha += 2;
        if (OpenBook.message_alpha >= 128) {
            OpenBook.message_alpha = 128;
            OpenBook.state = 2;
        }
        break;
    case 2:
        if (GamePad.Down(0x40)) {
            OpenBook.state = OpenBook.page > 10 ? 4 : 3;
        }
        break;
    case 3:
        OpenBook.message_alpha -= 2;
        if (OpenBook.message_alpha <= 0) {
            OpenBook.message_alpha = 0;
            OpenBook.page++;
            OpenBook.state = 1;
        }
        break;
    case 4:
        if (OpenBook.message_alpha > 0) {
            OpenBook.message_alpha--;
        } else {
            InitNameRegist(0, OpenBook.name_block, NULL);
            OpenBook.state = 5;
        }
        break;
    case 5:
        NameEnterKey();
        return NameSelect.result;
    }
    return 0;
}
INCLUDE_RODATA("asm/nonmatchings/battle_globals", @1573);
/**
 * Draws the storybook page by page.
 *
 * @mangled OpeningBookDraw__Fv
 * @address 0x23D580
 * @size 0x134
 */
void OpeningBookDraw() {
    setbilinear(0);
    AllFadeForMenu(128);
    if (OpenBook.loaded == 0) {
        return;
    }

    MenuTextureReload(OpenBook.texture_block);
    CTexture *texture = TexManager.GetTexture("openbook", -1);
    DrawFullSizePicture(texture, 0, 0, 128);
    if (OpenBook.state <= 4) {
        AllFadeForMenu(OpenBook.fade);
    } else {
        NameEnterDraw();
    }
}
