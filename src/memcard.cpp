#include "memcard.hpp"

#include <cmath>
#include <cstdio>

#include "battle_globals.hpp"
#include "clsmes.hpp"
#include "dataread.hpp"
#include "eastking.hpp"
#include "editatra.hpp"
#include "editpartsinfo.hpp"
#include "gamepad.hpp"
#include "mainselect.hpp"
#include "memorycardaccess.hpp"
#include "menu_draw.hpp"
#include "menu_save.hpp"
#include "mglib.hpp"
#include "rect.hpp"
#include "savedata.hpp"
#include "snd.hpp"
#include "sound.hpp"
#include "texture.hpp"

/**
 * Holds the state of the option screen.
 */
struct OPTION_MENU_STATE {
    u8 unk_00[0x10];
    s32 step; /**< Stage that the screen is at, 2 once it has begun to close. */
    u8 unk_14[0x10];
    s32 flag[12];      /**< Setting of each option row. */
    s32 prev_flag[12]; /**< Setting of each option row when the screen opened. */
    s16 unk_84;
    s16 unk_86;
};

STATIC_ASSERT(sizeof(OPTION_MENU_STATE) == 0x88);

/** The state of the option screen. */
extern OPTION_MENU_STATE OptionMenu;

/** The chip that the georama board's cursor has picked up. */
extern ATORA_TIP_HAVE *NowTipHavePt;

/** The rank that the board's sort gives each chip group, by group. */
extern int tip_table[3];

/** The chip group that the board's sort ranks first. */
extern int tip_sort_type;

/** The texture block the georama board screen loads for its own textures. */
extern int AtoraTextureReadBlock;

/** The texture block that holds the board's town tags and names. */
extern int AtoraTextureBaseBlock;

/** Whether the board screen's texture block has finished loading. */
extern int AtoraTextureEnterFlag;

// The chip attachment record is opaque to every unit; only the unit's own
// functions take a pointer to it.
struct EDIT_CHIP_ATTACH_DATA;

/**
 * Returns the record of the n-th valid part in the georama's part list, or NULL
 * when there are fewer.
 *
 * @mangled SearchAtoraInfo__Fi
 * @address 0x218470
 * @size 0x8C
 */
static EDITPARTS_INFO *SearchAtoraInfo(int);

/**
 * Returns whether every chip of a georama part has been acquired.
 *
 * @mangled AtoraAllTipGet__Fi
 * @address 0x218500
 * @size 0x9C
 */
static int AtoraAllTipGet(int);

/**
 * Returns whether the player has already spoken to a georama resident.
 *
 * @mangled AlreadyPeopleTalk__Fii
 * @address 0x2185A0
 * @size 0x64
 */
static int AlreadyPeopleTalk(int, int);

/**
 * Returns one when a georama part is fully built, its residents have all been
 * spoken to, and its completion event has not been flagged yet.
 *
 * @mangled AtoraCompOrEvent__FP14EDITPARTS_INFO
 * @address 0x218610
 * @size 0x164
 */
static int AtoraCompOrEvent(EDITPARTS_INFO *);

/**
 * Returns how many parts a georama ground defines, or zero for an invalid
 * ground.
 *
 * @mangled AtraBoardMaxNum__Fi
 * @address 0x218780
 * @size 0x88
 */
static int AtraBoardMaxNum(int);

/**
 * Returns the link code of a chip slot: -1 when empty, 0 without a pending
 * link, otherwise 1 or 2 by link kind plus 10 for each unplaced chip above it.
 *
 * @mangled AtoraTipStatusSearch__FP14EDITPARTS_INFOi
 * @address 0x218810
 * @size 0xC8
 */
static int AtoraTipStatusSearch(EDITPARTS_INFO *, int);

/**
 * Returns whether a chip attachment may be shown on the board.
 *
 * @mangled AtraTipCanDisplay__FP21EDIT_CHIP_ATTACH_DATA
 * @address 0x2188E0
 * @size 0x74
 */
static int AtraTipCanDisplay(EDIT_CHIP_ATTACH_DATA *);

/**
 * Draws the arrow from a chip slot to the chip it hangs off, covering the slot
 * while that chip is missing, as the slot's link code directs.
 *
 * @mangled AtoraTipRelationDraw__FiiP14EDITPARTS_INFOiii
 * @address 0x218960
 * @size 0x1F4
 */
static void AtoraTipRelationDraw(int, int, EDITPARTS_INFO *, int, int, int);

/**
 * Marks which of the six chip slots of a georama part can be selected.
 *
 * @mangled AtoraBoardEnableMovePos__FiPi
 * @address 0x218B60
 * @size 0x10C
 */
static void AtoraBoardEnableMovePos(int, int *);

/**
 * Returns the first index at or below a start whose entry in a slot table is
 * set, or the lower bound when none is.
 *
 * @mangled AtoraBoardGoToPos__FPiii
 * @address 0x218C70
 * @size 0x44
 */
static int AtoraBoardGoToPos(int *, int, int);

/**
 * Returns the message number that the board shows for a georama part or one of
 * its chip slots, or -1 when the part has no record.
 *
 * @mangled AtoraMsgNoGet__Fiii
 * @address 0x218DA0
 * @size 0x1F4
 */
static int AtoraMsgNoGet(int, int, int);

/**
 * Returns the message number of a chip from its attribute record alone, or -1
 * when it has none.
 *
 * @mangled AtoraTipOnlyMsgNoGet__Fii
 * @address 0x218FA0
 * @size 0x58
 */
static int AtoraTipOnlyMsgNoGet(int, int);

/**
 * Draws a chip's icon as either the object or the resident it stands for.
 *
 * @mangled AtoraTipObjectOrPerson__Fiiiii
 * @address 0x2190E0
 * @size 0xDC
 */
static void AtoraTipObjectOrPerson(int, int, int, int, int);

/**
 * Returns the gold socket texture when its flag is set and the grey one
 * otherwise, and writes the colour to draw it with.
 *
 * @mangled AtoraTipHoleTexInfoGet__FiPUc
 * @address 0x2191C0
 * @size 0x4C
 */
static CTexture *AtoraTipHoleTexInfoGet(int, unsigned char *);

/**
 * Draws the placement gauge of a georama part, filled in proportion to what has
 * been placed, with the placed-over-total count beside it.
 *
 * @mangled AtoraPlateDrawHaichiBar__FP14EDITPARTS_INFOiii
 * @address 0x219210
 * @size 0xE0
 */
static void AtoraPlateDrawHaichiBar(EDITPARTS_INFO *, int, int, int);

/**
 * Draws an empty plate of the georama board with a caption in its centre.
 *
 * @mangled DrawAtoraNothing__Fiii
 * @address 0x219CC0
 * @size 0x2F4
 */
static void DrawAtoraNothing(int, int, int);

/**
 * Shows message 200 in a message window at a position.
 *
 * @mangled DrawMsgAtraWarning__FP6ClsMesii
 * @address 0x219FC0
 * @size 0xA0
 */
static void DrawMsgAtraWarning(ClsMes *, int, int);

/**
 * Clears the georama chip selection.
 *
 * @mangled AtoraTipInfoInit__Fv
 * @address 0x21A060
 * @size 0x2C
 */
static void AtoraTipInfoInit();

/**
 * Records whether the georama menu is running an event.
 *
 * @mangled SetMenuAtraEventFlag__Fi
 * @address 0x21A0A0
 * @size 0x10
 */
static void SetMenuAtraEventFlag(int);

/**
 * Opens the board's message window on the message of the selected part.
 *
 * @mangled MenuAtoraAfterFadeIn__Fv
 * @address 0x21A0B0
 * @size 0x7C
 */
static void MenuAtoraAfterFadeIn();

/**
 * Stores the board cursor in the save data when cursor memory is on and gives
 * back the message windows that the board screen took over.
 *
 * @mangled ExitAtoraSelect__Fv
 * @address 0x21A890
 * @size 0xC8
 */
static void ExitAtoraSelect();

/**
 * Looks up the textures the georama board draws from.
 *
 * @mangled AtoraTexInfoGet__Fv
 * @address 0x21A960
 * @size 0x118
 */
static void AtoraTexInfoGet();

/**
 * Draws the georama board screen's board, panels and cursor.
 *
 * @mangled DrawAtoraSelect__Fi
 * @address 0x21AE80
 * @size 0xFEC
 */
static void DrawAtoraSelect(int);

/**
 * Loads the georama board screen's texture block.
 *
 * @mangled AtoraTextureEnter__Fv
 * @address 0x21BE70
 * @size 0x1A4
 */
static int AtoraTextureEnter();

/**
 * Returns which of the three chip groups a chip number belongs to.
 *
 * @mangled GetTipKind__Fi
 * @address 0x21C020
 * @size 0x64
 */
static int GetTipKind(int);

/**
 * Compares two chips for the board's sort by group, with empty slots last, and
 * then by number.
 *
 * @mangled CompTip__Fii
 * @address 0x21C090
 * @size 0xCC
 */
static int CompTip(int, int);

/**
 * Sorts the chip list with the current group first and empty slots last, and
 * returns whether any chip moved.
 *
 * @mangled SeitonAtoraTipBoardSub__Fv
 * @address 0x21C160
 * @size 0x108
 */
static int SeitonAtoraTipBoardSub();

/**
 * Sorts the chip list, switching which chip group comes first whenever the list
 * is already in order, up to three times.
 *
 * @mangled SeitonAtoraTipBoard__Fv
 * @address 0x21C270
 * @size 0x70
 */
static void SeitonAtoraTipBoard();

/**
 * Moves the board cursor and handles its buttons, returning 10 when a part is
 * picked for placing, 100 when the screen is to close and zero otherwise.
 *
 * @mangled AtoraBoardKey__Fv
 * @address 0x21CA90
 * @size 0xA30
 */
static int AtoraBoardKey();

/**
 * Moves the chip cursor and swaps, sorts or puts back chips, returning 100 when
 * the screen is to close and zero otherwise.
 *
 * @mangled AtoraTipKey__Fv
 * @address 0x21D4C0
 * @size 0x2F4
 */
static int AtoraTipKey();

/**
 * Puts the chip that the cursor holds back where it was picked up.
 *
 * @mangled AtoraMenuTipCancel__Fv
 * @address 0x21D7C0
 * @size 0xC8
 */
static void AtoraMenuTipCancel();

/**
 * Draws the board's edge fade.
 *
 * @mangled AtoraBoardFadeEffect__Fv
 * @address 0x21D890
 * @size 0x3C8
 */
static void AtoraBoardFadeEffect();

/**
 * Draws the twelve option rows, each label with its current setting, as two
 * pages from the given position.
 *
 * @mangled OptionMenuDraw__Fiiiii
 * @address 0x21E020
 * @size 0x42C
 */
static void OptionMenuDraw(int, int, int, int, int);

/**
 * Draws the arrow that points to the other option page.
 *
 * @mangled DrawOptionLRCur__Fii
 * @address 0x21E450
 * @size 0x80
 */
static void DrawOptionLRCur(int, int);

/**
 * Writes the option rows back to the configuration and the menu cursor, sets
 * the stereo mode from them and restores the pad's menu repeat.
 *
 * @mangled ExitMenuOption__Fv
 * @address 0x21E780
 * @size 0x18C
 */
static void ExitMenuOption();

/**
 * Resets the option rows to their defaults.
 *
 * @mangled InitOptionFlag__Fv
 * @address 0x21E910
 * @size 0x44
 */
static void InitOptionFlag();

/**
 * Restores the option rows to the values they had when the screen opened.
 *
 * @mangled PrevOptionSetFunc__Fv
 * @address 0x21E960
 * @size 0x48
 */
static void PrevOptionSetFunc();

/**
 * Closes the save screen's message window and restores the pad, and after a
 * load sets the stereo mode from the loaded configuration.
 *
 * @mangled ExitSaveSelect__Fv
 * @address 0x21FD80
 * @size 0x144
 */
static void ExitSaveSelect();

/**
 * Waits out the save screen's fade-in and then moves on to the save file
 * choice.
 *
 * @mangled SaveMenuKeyFadeIn__Fv
 * @address 0x220D90
 * @size 0x34
 */
static int SaveMenuKeyFadeIn();

/**
 * Waits out the save screen's fade-out, then closes the screen and records the
 * result that MenuSaveKey returns.
 *
 * @mangled SaveMenuKeyFadeOut__Fv
 * @address 0x220DD0
 * @size 0x68
 */
static int SaveMenuKeyFadeOut();

/**
 * Lets the player choose between saving and loading, then moves on to the slot
 * choice or closes the screen.
 *
 * @mangled SaveMenuKeyModeSelect__Fv
 * @address 0x220E40
 * @size 0x12C
 */
static int SaveMenuKeyModeSelect();

/**
 * Lets the player pick memory card slot 1 or 2, then starts the card type check
 * on it or backs out.
 *
 * @mangled SaveMenuKeyMcSelect__Fv
 * @address 0x220F70
 * @size 0x228
 */
static int SaveMenuKeyMcSelect();

/**
 * Moves on to reading the save directory when the chosen slot holds a
 * PlayStation 2 card, and to an alert otherwise.
 *
 * @mangled SaveMenuKeyCheckMcType__Fv
 * @address 0x2211A0
 * @size 0xC0
 */
static int SaveMenuKeyCheckMcType();

/**
 * Checks the chosen card again and starts reading its configuration for a load
 * or its save files for a save, returning zero when the card is gone.
 *
 * @mangled SaveMenuKeyCheckMc__Fv
 * @address 0x221260
 * @size 0x248
 */
static int SaveMenuKeyCheckMc();

/**
 * Starts reading the save files of the card and moves on to the file choice,
 * with the cursor on the last file that the configuration records.
 *
 * @mangled SaveMenuKeyLoadConfig__Fv
 * @address 0x2214B0
 * @size 0x74
 */
static int SaveMenuKeyLoadConfig();

/**
 * Lets the player pick one of the twelve save files for the save check or the
 * load confirmation, or go back to the slot choice.
 *
 * @mangled SaveMenuKeyFileSelect__Fv
 * @address 0x221530
 * @size 0x1FC
 */
static int SaveMenuKeyFileSelect();

int McCheckMCPs2(MC_CARD_INFO *card) {
    if (!card->present || card->type != 2) {
        return 0;
    }
    return 1;
}
void DrawObjectVibe(int x, int y, CTexture *texture, CRect_i_ src_rect, unsigned char alpha, int flag) {
    float dest_x = (float) x + 7.0f * cosf(0.08055365830659866f * (float) CursorVibeCnt);
    float dest_y = (float) y + 5.0f * sinf(0.1163552850484848f * (float) CursorVibeCnt);
    CRect_i_ dest_rect((s32) dest_x, (s32) dest_y, src_rect.width, src_rect.height);
    DrawMenu2DSprite(texture, dest_rect, src_rect, alpha, alpha, alpha, flag);
}
void DrawObjectVibe(int x, int y, CTexture *texture, RECT src_rect, unsigned char alpha, int flag) {
    CRect_i_ src(src_rect.x, src_rect.y, src_rect.width, src_rect.height);
    DrawObjectVibe(x, y, texture, src, alpha, flag);
}
INCLUDE_ASM("asm/nonmatchings/memcard", DrawMenuObjectVibe__Fiiii);

void DrawMenuHelpWindow(CTexture *texture, int style, int x, int y, float width, float height, int alpha) {
    int corner_u;
    float middle_width;
    float middle_height;
    int middle_y;
    int bottom_y;

    if (style == 0) {
        corner_u = 24;
    } else if (style == 1) {
        corner_u = 0;
    } else {
        corner_u = 48;
    }
    middle_width = 24.0f * width;
    middle_height = 24.0f * height;
    middle_y = y + 24;
    bottom_y = middle_y + middle_height;
    if (texture == NULL) {
        return;
    }
    DrawMenu2DSprite(texture, CRect_i_(x, y, 24, 24), CRect_i_(corner_u, 0, 24, 24), alpha);
    DrawMenu2DSprite(texture, CRect_i_(x, middle_y, 24, middle_height), CRect_i_(24, 24, 24, 24), alpha);
    DrawMenu2DSprite(texture, CRect_i_(x, bottom_y, 24, 24), CRect_i_(24, 48, 24, 24), alpha);
    x += 24;
    DrawMenu2DSprite(texture, CRect_i_(x, y, middle_width, 24), CRect_i_(48, 0, 24, 24), alpha);
    DrawMenu2DSprite(texture, CRect_i_(x, middle_y, middle_width, middle_height), CRect_i_(48, 24, 24, 24), alpha);
    DrawMenu2DSprite(texture, CRect_i_(x, bottom_y, middle_width, 24), CRect_i_(48, 48, 24, 24), alpha);
    x += middle_width;
    DrawMenu2DSprite(texture, CRect_i_(x, y, 24, 24), CRect_i_(72, 0, 24, 24), alpha);
    DrawMenu2DSprite(texture, CRect_i_(x, middle_y, 24, middle_height), CRect_i_(72, 24, 24, 24), alpha);
    DrawMenu2DSprite(texture, CRect_i_(x, bottom_y, 24, 24), CRect_i_(72, 48, 24, 24), alpha);
}

void MenuHelpWinDraw(int x, int y, float width, float height, int alpha, int u, int v, CTexture *texture) {
    int middle_width;
    int middle_height;
    int middle_y;
    int bottom_y;

    middle_width = width * 16.0f;
    middle_height = height * 22.0f;
    middle_y = y + 22;
    bottom_y = middle_y + middle_height;
    if (texture == NULL) {
        return;
    }
    DrawMenu2DSprite(texture, CRect_i_(x, y, 24, 22), CRect_i_(u, v, 24, 22), (alpha * 100) >> 7);
    DrawMenu2DSprite(texture, CRect_i_(x, middle_y, 24, middle_height), CRect_i_(u, v + 22, 24, 20), (alpha * 100) >> 7);
    DrawMenu2DSprite(texture, CRect_i_(x, bottom_y, 24, 22), CRect_i_(u, v + 42, 24, 22), (alpha * 100) >> 7);
    x += 24;
    DrawMenu2DSprite(texture, CRect_i_(x, y, middle_width, 22), CRect_i_(u + 22, v, 16, 22), (alpha * 100) >> 7);
    DrawMenu2DSprite(texture, CRect_i_(x, middle_y, middle_width, middle_height), CRect_i_(u + 22, v + 22, 16, 20),
                     (alpha * 100) >> 7);
    DrawMenu2DSprite(texture, CRect_i_(x, bottom_y, middle_width, 22), CRect_i_(u + 22, v + 42, 16, 22), (alpha * 100) >> 7);
    x += middle_width;
    DrawMenu2DSprite(texture, CRect_i_(x, y, 24, 22), CRect_i_(u + 38, v, 24, 22), (alpha * 100) >> 7);
    DrawMenu2DSprite(texture, CRect_i_(x, middle_y, 24, middle_height), CRect_i_(u + 38, v + 22, 24, 20), (alpha * 100) >> 7);
    DrawMenu2DSprite(texture, CRect_i_(x, bottom_y, 24, 22), CRect_i_(u + 38, v + 42, 24, 22), (alpha * 100) >> 7);
}

void MenuHelpWinDraw2(int x, int y, float width, float height, int alpha, int u, int v, CTexture *texture) {
    int middle_width;
    int middle_height;
    int middle_y;
    int bottom_y;

    middle_width = width;
    middle_height = height;
    middle_y = y + 22;
    bottom_y = middle_y + middle_height;
    if (texture == NULL) {
        return;
    }
    DrawMenu2DSprite(texture, CRect_i_(x, y, 24, 22), CRect_i_(u, v, 24, 22), (alpha * 100) >> 7);
    DrawMenu2DSprite(texture, CRect_i_(x, middle_y, 24, middle_height), CRect_i_(u, v + 22, 24, 20), (alpha * 100) >> 7);
    DrawMenu2DSprite(texture, CRect_i_(x, bottom_y, 24, 22), CRect_i_(u, v + 42, 24, 22), (alpha * 100) >> 7);
    x += 24;
    DrawMenu2DSprite(texture, CRect_i_(x, y, middle_width, 22), CRect_i_(u + 22, v, 16, 22), (alpha * 100) >> 7);
    DrawMenu2DSprite(texture, CRect_i_(x, middle_y, middle_width, middle_height), CRect_i_(u + 22, v + 22, 16, 20),
                     (alpha * 100) >> 7);
    DrawMenu2DSprite(texture, CRect_i_(x, bottom_y, middle_width, 22), CRect_i_(u + 22, v + 42, 16, 22), (alpha * 100) >> 7);
    x += middle_width;
    DrawMenu2DSprite(texture, CRect_i_(x, y, 24, 22), CRect_i_(u + 38, v, 24, 22), (alpha * 100) >> 7);
    DrawMenu2DSprite(texture, CRect_i_(x, middle_y, 24, middle_height), CRect_i_(u + 38, v + 22, 24, 20), (alpha * 100) >> 7);
    DrawMenu2DSprite(texture, CRect_i_(x, bottom_y, 24, 22), CRect_i_(u + 38, v + 42, 24, 22), (alpha * 100) >> 7);
}
INCLUDE_ASM("asm/nonmatchings/memcard", MenuHelpWinDraw__Fiiffi);
INCLUDE_ASM("asm/nonmatchings/memcard", DrawMenuWaku__FffiiiP8CTexturei);

int DrawMenuNumber(int number, int x, int y, CTexture *texture, RECT rect, int overlap, int flag) {
    return DrawMenuNumber(number, x, y, rect, texture, overlap, 0, 0x1C0, flag);
}

int DrawMenuNumber(int number, int x, int y, RECT rect, CTexture *texture, int overlap, unsigned char r,
                   unsigned char g, unsigned char b, int flag) {
    int digits;
    int digit;
    int width;
    int src_x;
    int dest_y;
    int dest_height;
    int clip_y;
    int src_y;
    int height;

    if (texture == NULL) {
        return 0;
    }
    for (digits = GetNumberKeta(number); 0 < digits; digits--) {
        clip_y = y;
        digit = number % 10;
        width = rect.width;
        x -= width - overlap;
        src_x = rect.x + width * digit;
        src_y = rect.y;
        height = rect.height;
        MenuTextureClip(clip_y, src_y, height, 0, 0x1C0);
        CRect_i_ dest;
        CRect_i_ src(src_x, src_y, width, height);
        dest_height = height - 1;
        dest_y = clip_y;
        dest.x = x;
        dest.y = dest_y;
        dest.width = width;
        dest.height = dest_height;
        DrawMenu2DSprite(texture, dest, src, r, g, b, flag);
        number /= 10;
    }
    return x;
}

int DrawMenuNumber(int number, int x, int y, RECT rect, CTexture *texture, int overlap, int top, int bottom,
                   int flag) {
    int digits;
    int digit;
    int width;
    int src_x;
    int dest_y;
    int dest_height;
    int clip_y;
    int src_y;
    int height;

    if (texture == NULL) {
        return 0;
    }
    for (digits = GetNumberKeta(number); 0 < digits; digits--) {
        clip_y = y;
        digit = number % 10;
        width = rect.width;
        x -= width - overlap;
        src_x = rect.x + width * digit;
        src_y = rect.y;
        height = rect.height;
        MenuTextureClip(clip_y, src_y, height, top, bottom);
        CRect_i_ dest;
        CRect_i_ src(src_x, src_y, width, height);
        dest_height = height - 1;
        dest_y = clip_y;
        dest.x = x;
        dest.y = dest_y;
        dest.width = width;
        dest.height = dest_height;
        DrawMenu2DSprite(texture, dest, src, flag);
        number /= 10;
    }
    return x;
}

INCLUDE_ASM("asm/nonmatchings/memcard", GetMsgLengthMenu__FP6ClsMesi);
/**
 * Gives the texture and the cell within it that one georama element draws from.
 *
 * @mangled RetCTexAtora__FiRiRi
 * @address 0x2181E0
 * @size 0xD8
 */
static CTexture *RetCTexAtora(int tip_no, int &x, int &y);
INCLUDE_ASM("asm/nonmatchings/memcard", RetCTexAtora__FiRiRi);

void DrawAtoraParts(int x, int y, int tip_no, int top, int bottom, int alpha) {
    CTexture *texture;
    int src_x;
    int src_y;
    int height;

    if (x < 340 || x > 600) {
        return;
    }
    if (y < 80 || y > 300) {
        return;
    }
    if (y < top - 35 || bottom <= y) {
        return;
    }
    if (tip_no < 0) {
        return;
    }
    texture = RetCTexAtora(tip_no, src_x, src_y);
    if (texture == NULL) {
        return;
    }
    height = 36;
    MenuTextureClip(y, src_y, height, top, bottom);
    CRect_i_ src(src_x, src_y, 36, height);
    CRect_i_ shadow(x + 2, y + 1, 36, height);
    DrawMenu2DSprite(texture, shadow, src, 0, 0, 0, (alpha * 80) >> 7);
    CRect_i_ dest(x, y, 36, height);
    DrawMenu2DSprite(texture, dest, src, alpha);
}

static EDITPARTS_INFO *SearchAtoraInfo(int index) {
    int parts;
    int count;

    parts = CommonMenuAtoraInfo->GetNextParts(-1);
    count = -1;
    while (parts != -1) {
        count++;
        if (index == count) {
            return CommonMenuAtoraInfo->GetPartsInfo(parts);
        }
        parts = CommonMenuAtoraInfo->GetNextParts(parts);
    }
    return NULL;
}

static int AtoraAllTipGet(int parts_no) {
    EDITPARTS_INFO *info;
    int result;
    int i;
    EDITPARTS_ELEMENT *element;

    info = CommonMenuAtoraInfo->GetPartsInfo(parts_no);
    if (info == NULL) {
        return 0;
    }
    result = 1;
    for (i = 0; i < 6; i++) {
        element = &info->elements[i];
        if (element == NULL) {
            break;
        }
        if (0 <= element->id && element->enabled == 0) {
            result = 0;
            break;
        }
    }
    return result;
}

static int AlreadyPeopleTalk(int map_no, int chip_no) {
    SV_GRD_NPC *npc;

    npc = SaveData->GetGrdNPCData(map_no, chip_no - 40);
    if (npc == NULL || chip_no - 40 < 0) {
        return 1;
    }
    return npc->talk_message;
}

static int AtoraCompOrEvent(EDITPARTS_INFO *info) {
    EDIT_PARTS_ATRA *atra;
    EDITPARTS_ELEMENT *element;
    int complete;
    int filled;
    int talked;
    int done;
    int result;
    int i;

    atra = GetEditAtraPartsData(MenuAtoraSel.map_no, info->parts_no);
    if (atra == NULL) {
        return 0;
    }
    if (atra->kind == 0) {
        return 0;
    }
    complete = CommonMenuAtoraInfo->CheckComplete(info->parts_no);
    filled = 0;
    talked = 1;
    done = 0;
    if (info != NULL) {
        if (info->unk_0C == info->unk_18) {
            filled = 1;
        }
        for (i = 0; i < 6; i++) {
            element = &info->elements[i];
            if (element->id >= 40) {
                if (element->unk_1C >= 0) {
                    if (AlreadyPeopleTalk(MenuAtoraSel.map_no, element->id) == 0) {
                        talked = 0;
                    }
                }
            }
        }
        if (info->completion_flags & 1) {
            done = 1;
        }
    }
    result = 0;
    if (complete && filled && talked && !done) {
        result = 1;
    }
    return result;
}

static int AtraBoardMaxNum(int ground) {
    EDIT_PARTS_ATRA *parts;
    int count;

    if (ground < 0 || ground >= 6) {
        return 0;
    }
    parts = GetEditAtraPartsData(ground, 0);
    if (parts == NULL) {
        return 0;
    }
    for (count = 0; count < 40 && parts->max > 0; count++) {
        parts++;
    }
    return count;
}

static int AtoraTipStatusSearch(EDITPARTS_INFO *info, int slot) {
    int next;
    int link;
    int code;

    if (info == NULL) {
        return 0;
    }
    if (info->elements[slot].id < 0) {
        return -1;
    }
    link = info->elements[slot].unk_04;
    if (link < 0 || info->elements[slot].enabled != 0) {
        return 0;
    }
    if (link < 3 && slot >= 3) {
        code = 2;
    } else {
        code = 1;
    }
    if (info->elements[link].enabled == 0) {
        code += 10;
    }
    next = info->elements[link].unk_04;
    if (next >= 0 && info->elements[next].enabled == 0) {
        code += 10;
    }
    return code;
}

INCLUDE_ASM("asm/nonmatchings/memcard", AtraTipCanDisplay__FP21EDIT_CHIP_ATTACH_DATA);
INCLUDE_ASM("asm/nonmatchings/memcard", AtoraTipRelationDraw__FiiP14EDITPARTS_INFOiii);

static void AtoraBoardEnableMovePos(int parts_no, int *enable) {
    EDITPARTS_INFO *info;
    int link;
    int i;

    info = SearchAtoraInfo(parts_no);
    if (info == NULL) {
        for (int j = 0; j < 6; j++) {
            enable[j] = 0;
        }
        return;
    }
    for (i = 0; i < 6; i++) {
        enable[i] = 1;
        if (info->elements[i].id < 0) {
            enable[i] = 0;
        } else {
            link = info->elements[i].unk_04;
            if (link < 0) {
                enable[i] = 1;
            } else {
                link = info->elements[link].unk_04;
                if (link < 0) {
                    enable[i] = 1;
                } else if (info->elements[link].enabled != 0) {
                    enable[i] = 1;
                } else {
                    enable[i] = 0;
                }
            }
        }
    }
}

static int AtoraBoardGoToPos(int *enable, int pos, int min) {
    while (min < pos) {
        if (enable[pos] != 0) {
            return pos;
        }
        pos--;
    }
    return pos;
}

INCLUDE_ASM("asm/nonmatchings/memcard", GetAtraMsgNo__Fii);
INCLUDE_ASM("asm/nonmatchings/memcard", AtoraMsgNoGet__Fiii);
INCLUDE_ASM("asm/nonmatchings/memcard", AtoraTipOnlyMsgNoGet__Fii);
/**
 * Gives the cell within the element sheet that one georama element draws from.
 *
 * @mangled AtoraTipGetTexPos__FiRiRi
 * @address 0x219000
 * @size 0xD8
 */
INCLUDE_ASM("asm/nonmatchings/memcard", AtoraTipGetTexPos__FiRiRi);
INCLUDE_ASM("asm/nonmatchings/memcard", AtoraTipObjectOrPerson__Fiiiii);

static CTexture *AtoraTipHoleTexInfoGet(int gold, unsigned char *color) {
    if (gold) {
        color[0] = 0x8C;
        color[1] = 0x80;
        color[2] = 0x50;
        return HoleGold;
    }
    color[0] = 0x80;
    color[1] = 0x80;
    color[2] = 0x80;
    return HoleGray;
}

static void AtoraPlateDrawHaichiBar(EDITPARTS_INFO *info, int x, int y, int flag) {
    int empty = 83 - info->unk_0C * 83 / info->unk_18;
    CRect_i_ dest;
    CRect_i_ src(244, 323 - empty, 12, empty);

    dest.x = x + 12;
    dest.y = y + 107 - empty;
    dest.width = 12;
    dest.height = empty;
    DrawMenu2DSprite(Sozai, dest, src, flag);
    DrawAtraBuildNum(info, x, y, flag);
}

INCLUDE_ASM("asm/nonmatchings/memcard", DrawAtraBuildNum__FP14EDITPARTS_INFOiii);
INCLUDE_ASM("asm/nonmatchings/memcard", DrawAtora__Fiiii);

static void DrawAtoraNothing(int x, int y, int alpha) {
    DrawMenu2DSprite(Sozai, CRect_i_(x, y, 18, 18), CRect_i_(184, 346, 18, 18), alpha);
    DrawMenu2DSprite(Sozai, CRect_i_(x + 18, y, 220, 18), CRect_i_(200, 346, 4, 18), alpha);
    DrawMenu2DSprite(Sozai, CRect_i_(x + 238, y, 18, 18), CRect_i_(202, 346, 18, 18), alpha);
    DrawMenu2DSprite(Sozai, CRect_i_(x, y + 18, 18, 84), CRect_i_(184, 360, 18, 4), alpha);
    DrawMenu2DSprite(Sozai, CRect_i_(x + 238, y + 18, 18, 84), CRect_i_(202, 360, 18, 4), alpha);
    DrawMenu2DSprite(Sozai, CRect_i_(x, y + 102, 18, 18), CRect_i_(184, 364, 18, 18), alpha);
    DrawMenu2DSprite(Sozai, CRect_i_(x + 18, y + 102, 220, 18), CRect_i_(200, 364, 4, 18), alpha);
    DrawMenu2DSprite(Sozai, CRect_i_(x + 238, y + 102, 18, 18), CRect_i_(202, 364, 18, 18), alpha);
    DrawMenu2DSprite(Sozai, CRect_i_(x + 64, y + 44, 132, 30), CRect_i_(124, 418, 132, 30), alpha);
}

static void DrawMsgAtraWarning(ClsMes *mes, int x, int y) {
    if (mes == NULL) {
        return;
    }
    if (mes->mes_made != 200) {
        mes->MakeMesWin(200);
    }
    mes->MakeMesWin(200);
    MenuTextureReload(mes->tex_block);
    mes->stay_frame = 1;
    mes->text_x = x;
    mes->text_y = y;
    mes->Step();
    mes->DrawMesWin();
}

static void AtoraTipInfoInit() {
    NowTipHavePt->mode = 0;
    NowTipHavePt->parts_no = -1;
    NowTipHavePt->slot = -1;
    NowTipHavePt->tip_no = -1;
}

int GetMenuAtraEventFlag() {
    return MenuAtoraSel.event_flag;
}

static void SetMenuAtraEventFlag(int flag) {
    MenuAtoraSel.event_flag = flag;
}

static void MenuAtoraAfterFadeIn() {
    int msg_no;

    CommonMenuMes2.SetBuff(GetAtraMsgReadBuf);
    CommonMenuMes2.mes_made = -1;
    msg_no = AtoraMsgNoGet(MenuAtoraSel.map_no, MenuAtoraSel.board_pos, 0);
    CommonMenuMes2.MakeMesWin(msg_no >= 0 ? msg_no + 1000 : 0);
}

INCLUDE_ASM("asm/nonmatchings/memcard", InitMenuAtora1__FiiPiP1);
INCLUDE_ASM("asm/nonmatchings/memcard", InitMenuAtoraSelect__Fi);
INCLUDE_RODATA("asm/nonmatchings/memcard", @1397);
INCLUDE_ASM("asm/nonmatchings/memcard", ExitAtoraSelect__Fv);

static void AtoraTexInfoGet() {
    CompleteTex = TexManager.GetTexture("complete", -1);
    Sozai = TexManager.GetTexture("sozai", AtoraTextureReadBlock);
    HoleGray = TexManager.GetTexture("holegray", AtoraTextureReadBlock);
    HoleGold = TexManager.GetTexture("holegold", AtoraTextureReadBlock);
    ObTip = TexManager.GetTexture("obtip", AtoraTextureReadBlock);
    ObPerson = TexManager.GetTexture("obperson", AtoraTextureReadBlock);
    VillageBar = TexManager.GetTexture("viltag", AtoraTextureBaseBlock);
    VillageName = TexManager.GetTexture("vilname", AtoraTextureBaseBlock);
}

void DrawMenuAtoraSelect() {
    int alpha;
    int tint;
    int fade;

    alpha = 0x80;
    switch (MenuAtoraSel.step) {
        case 1:
            alpha = MenuAtoraSel.step_count * 8;
            break;
        case 2:
            alpha = 0x80 - MenuAtoraSel.step_count * 8;
            break;
    }
    if (alpha < 0) {
        alpha = 0;
    }
    if (alpha > 0x80) {
        alpha = 0x80;
    }
    if (MenuAtoraSel.step != 8) {
        DrawAtoraSelect(alpha);
        if (MenuAtoraSel.step == 0) {
            DrawMenuObjectVibe(MenuAtoraSel.cursor_x, MenuAtoraSel.cursor_y, 1, MenuAtoraSel.unk_188);
        }
        if (MenuAtoraSel.step != 0 && AtoraTextureEnterFlag != 0) {
            MenuAtoraSel.step_count++;
        } else {
            MenuAtoraSel.step_count = 0;
        }
        CTexture frame = *TexManager.GetTexture("frame_image", -1);
        ((sceGsTex0 *) &frame.tex0)->bits.tcc = 0;
        sceGsTexa texa = mgTexa;
        texa.AEM = 1;
        texa.TA0 = 0x80;
        MGSetGsTEXA(&texa);
        tint = 0;
        fade = 0;
        switch (MenuAtoraSel.step) {
            case 1:
                tint = 0x80 - MenuAtoraSel.step_count * 7;
                break;
            case 7:
                fade = MenuAtoraSel.step_count * 2;
                break;
            case 9:
                fade = 0x80 - MenuAtoraSel.step_count * 2;
                break;
            case 2:
                tint = MenuAtoraSel.step_count * 5 + 0x40;
                break;
        }
        if (tint < 0) {
            tint = 0;
        }
        if (tint > 0x80) {
            tint = 0x80;
        }
        if (fade < 0) {
            fade = 0;
        }
        if (fade > 0x80) {
            fade = 0x80;
        }
        CRect_i_ rect(320, 0, 320, 448);
        DrawMenu2DSprite(&frame, rect, rect, 0x40, 0x40, 0x40, tint);
        MGSetGsTEXA(NULL);
        if (MenuAtoraSel.step == 7 || MenuAtoraSel.step == 9) {
            AllFadeForMenu(fade);
        }
        if (MenuAtoraSel.step == 10) {
            CommonMenuMes3.auto_pos = 5;
            CommonMenuMes3.edge_alpha = 0x80;
            DrawMsgAtraWarning(&CommonMenuMes3, 184, 150);
        } else {
            CommonMenuMes3.mes_made = -1;
        }
    }
    if (MenuAtoraSel.step == 8) {
        EastKingEventDraw();
    }
}
INCLUDE_RODATA("asm/nonmatchings/memcard", @1664);
INCLUDE_ASM("asm/nonmatchings/memcard", DrawAtoraSelect__Fi);
INCLUDE_ASM("asm/nonmatchings/memcard", AtoraTextureEnter__Fv);

static int GetTipKind(int tip_no) {
    if (tip_no < 0 || tip_no >= 100) {
        return 0;
    }
    if (0 <= tip_no && tip_no < 40) {
        return 1;
    }
    if (tip_no >= 40) {
        return 2;
    }
}

static int CompTip(int tip_a, int tip_b) {
    int rank_a;
    int rank_b;

    rank_a = tip_table[GetTipKind(tip_a)];
    rank_b = tip_table[GetTipKind(tip_b)];
    if (tip_a < 0) {
        rank_a = 3;
    }
    if (tip_b < 0) {
        rank_b = 3;
    }
    if (rank_a > rank_b) {
        return 1;
    }
    if (rank_a < rank_b) {
        return -1;
    }
    if (tip_a > tip_b) {
        return 1;
    }
    return (tip_a < tip_b) ? -1 : 0;
}

static int SeitonAtoraTipBoardSub() {
    int rank;
    int kind;
    s16 *list;
    int i;
    int j;
    int moved;

    kind = tip_sort_type;
    for (rank = 0; rank < 3; rank++) {
        tip_table[kind] = rank;
        kind++;
        if (kind >= 3) {
            kind = 0;
        }
    }
    tip_table[0] = 3;
    moved = 0;
    list = MenuAtoraSel.tip_list;
    for (i = 0; i < 119; i++) {
        for (j = i + 1; j < 120; j++) {
            if (CompTip(list[i], list[j]) > 0) {
                MenuDataSwap(&list[i], &list[j]);
                moved = 1;
            }
        }
    }
    return moved;
}

static void SeitonAtoraTipBoard() {
    int i;

    for (i = 0; i < 3; i++) {
        if (SeitonAtoraTipBoardSub()) {
            break;
        }
        tip_sort_type++;
        if (tip_sort_type >= 3) {
            tip_sort_type = 1;
        }
    }
}

INCLUDE_ASM("asm/nonmatchings/memcard", MenuAtoraSelectKey__Fv);
INCLUDE_ASM("asm/nonmatchings/memcard", AtoraBoardKey__Fv);
INCLUDE_ASM("asm/nonmatchings/memcard", AtoraTipKey__Fv);

static void AtoraMenuTipCancel() {
    EDITPARTS_INFO *info;
    EDITPARTS_ELEMENT *element;
    s16 tip_no;

    switch (NowTipHavePt->mode) {
        case 1:
            tip_no = MenuAtoraSel.tip_list[NowTipHavePt->slot];
            MenuAtoraSel.tip_list[NowTipHavePt->slot] = NowTipHavePt->tip_no;
            NowTipHavePt->tip_no = tip_no;
            break;
        case 0:
            info = SearchAtoraInfo(NowTipHavePt->parts_no);
            element = &info->elements[NowTipHavePt->slot];
            if (element->id == NowTipHavePt->tip_no && element->enabled == 0) {
                element->enabled = 1;
            }
            MenuAtoraSel.board_pos = NowTipHavePt->parts_no;
            NowTipHavePt->tip_no = -1;
            break;
    }
}

static void AtoraBoardFadeEffect() {
    CTexture frame = *TexManager.GetTexture("frame_image", -1);

    if (&frame == NULL) {
        return;
    }
    ((sceGsTex0 *) &frame.tex0)->bits.tcc = 0;
    sceGsTexa texa = mgTexa;
    texa.AEM = 1;
    texa.TA0 = 0x80;
    MGSetGsTEXA(&texa);
    spRGBA top;
    spRGBA bottom;
    bottom.r = bottom.g = bottom.b = 0x40;
    top.r = top.g = top.b = 0x40;
    bottom.a = 0x80;
    top.a = 0x80;
    set2DSprite(Vif1Packet, &frame, CRect_i_(0, 0, 320, 1), CRect_i_(0, 0, 320, 1), &top, &top, &bottom, &bottom, 1);
    set2DSprite(Vif1Packet, &frame, CRect_i_(0, 1, 320, 60), CRect_i_(0, 0, 320, 61), &top, &top, &bottom, &bottom, 1);
    top.a = 0x80;
    bottom.a = 0;
    set2DSprite(Vif1Packet, &frame, CRect_i_(0, 61, 320, 59), CRect_i_(0, 60, 320, 60), &top, &top, &bottom, &bottom,
                1);
    top.a = 0;
    bottom.a = 0x80;
    set2DSprite(Vif1Packet, &frame, CRect_i_(0, 277, 320, 89), CRect_i_(0, 276, 320, 90), &top, &top, &bottom,
                &bottom, 1);
    bottom.a = 0x80;
    top.a = 0x80;
    set2DSprite(Vif1Packet, &frame, CRect_i_(0, 366, 320, 1), CRect_i_(0, 366, 320, 1), &top, &top, &bottom, &bottom,
                1);
    set2DSprite(Vif1Packet, &frame, CRect_i_(0, 367, 320, 81), CRect_i_(0, 366, 320, 82), &top, &top, &bottom,
                &bottom, 1);
    MGSetGsTEXA(NULL);
}
INCLUDE_ASM("asm/nonmatchings/memcard", AtoraNameDraw__Fi);
INCLUDE_ASM("asm/nonmatchings/memcard", OptionMenuDraw__Fiiiii);
INCLUDE_ASM("asm/nonmatchings/memcard", DrawOptionLRCur__Fii);
INCLUDE_ASM("asm/nonmatchings/memcard", InitMenuOption__FiiP1);
INCLUDE_RODATA("asm/nonmatchings/memcard", @2211);
INCLUDE_RODATA("asm/nonmatchings/memcard", @2251);
INCLUDE_ASM("asm/nonmatchings/memcard", ExitMenuOption__Fv);

static void InitOptionFlag() {
    int i;

    for (i = 0; i < 12; i++) {
        OptionMenu.flag[i] = 0;
    }
    OptionMenu.flag[6] = 1;
}

static void PrevOptionSetFunc() {
    int i;

    for (i = 0; i < 12; i++) {
        OptionMenu.flag[i] = OptionMenu.prev_flag[i];
    }
}

INCLUDE_ASM("asm/nonmatchings/memcard", MenuOptionKey__Fv);
INCLUDE_RODATA("asm/nonmatchings/memcard", @2345);
INCLUDE_RODATA("asm/nonmatchings/memcard", @2346);
INCLUDE_RODATA("asm/nonmatchings/memcard", @2347);
INCLUDE_ASM("asm/nonmatchings/memcard", DrawMenuOption__Fv);

int OptionMenuFadeOutStart() {
    int result = 0;

    if (OptionMenu.step == 2) {
        result = 1;
    }
    return result;
}

INCLUDE_ASM("asm/nonmatchings/memcard", InitMenuSave__FiiP1);
INCLUDE_RODATA("asm/nonmatchings/memcard", @2503);
INCLUDE_RODATA("asm/nonmatchings/memcard", @2504);
static void ExitSaveSelect() {
    s32 *config;

    CommonMenuMes2.stay_frame = 0;
    CommonMenuMes2.value_show = 0;
    CommonMenuMes2.value_signed = 1;
    CommonMenuMes2.auto_pos = -1;
    switch (SaveMenu.unk_0) {
        case 0:
            GamePad.AutoRepeatOff();
            GamePad.MenuModeOff();
            GamePad.SetAutoRepeat(0x5000, 30, 9);
            GamePad.MenuModeOn(120);
            if (SaveMenu.loaded) {
                config = (s32 *) SaveData->GetConfigData();
                if (config != NULL) {
                    if (config[5]) {
                        CSnd.SetStereoMode(0);
                    } else {
                        CSnd.SetStereoMode(1);
                    }
                }
            }
            break;
        case 1:
            break;
        case 2:
            GamePad.AutoRepeatOff();
            GamePad.MenuModeOff();
            break;
    }
    CommonMenuMes2.cursor_lit = 0;
}
INCLUDE_ASM("asm/nonmatchings/memcard", MenuSaveKey__Fv);
INCLUDE_RODATA("asm/nonmatchings/memcard", @2597__2);
INCLUDE_ASM("asm/nonmatchings/memcard", DrawMenuSave__FPc);
INCLUDE_RODATA("asm/nonmatchings/memcard", @2730);
static int SaveMenuKeyFadeIn() {
    if (SaveMenu.unk_28 > 14) {
        SaveMenu.key_no = 7;
        SaveMenu.unk_28 = 0;
    }
    return 1;
}
static int SaveMenuKeyFadeOut() {
    if (SaveMenu.unk_28 > 32) {
        ExitSaveSelect();
        if (SaveMenu.loaded) {
            SaveMenu.result = 1;
        } else {
            SaveMenu.result = 2;
        }
    }
    return 1;
}
static int SaveMenuKeyModeSelect() {
    if (GamePad.Down(0x5000)) {
        if (SaveMenu.file_no) {
            SaveMenu.file_no = 0;
        } else {
            SaveMenu.file_no = 1;
        }
    }
    if (GamePad.Down(0x40)) {
        if (SaveMenu.file_no) {
            SaveMenu.unk_1C = 1;
        } else {
            SaveMenu.unk_1C = 2;
        }
        SaveMenu.key_no = 3;
        SaveMenu.file_no = 0;
        ComMenuSePlay(1);
        return 1;
    }
    if (GamePad.Down(0x20)) {
        SaveMenu.key_no = 1;
        ExitSaveSelect();
        SaveMenu.unk_28 = 0;
        ComMenuSePlay(2);
        return 1;
    }
    return 1;
}
static int SaveMenuKeyMcSelect() {
    int prev_slot;

    prev_slot = SaveMenu.file_no;
    if (GamePad.Down(0x5000)) {
        if (SaveMenu.file_no) {
            SaveMenu.file_no = 0;
        } else {
            SaveMenu.file_no = 1;
        }
    }
    if (prev_slot != SaveMenu.file_no) {
        ComMenuSePlay(0);
    }
    if (GamePad.Down(0x20)) {
        switch (SaveMenu.unk_0) {
            case 0:
                SaveMenu.key_no = 1;
                ExitSaveSelect();
                break;
            case 1:
                SaveMenu.key_no = 1;
                CommonMenuMes2.stay_frame = 0;
                break;
            case 2:
                SaveMenu.key_no = 1;
                ExitSaveSelect();
                break;
        }
        SaveMenu.unk_28 = 0;
        ComMenuSePlay(2);
        return 1;
    }
    if (GamePad.Down(0x40) && SaveMenu.texture_ready) {
        SaveMenu.key_no = 4;
        McAccess.port = SaveMenu.file_no;
        McAccess.SetFuncNo(0);
        ComMenuSePlay(1);
        return 1;
    }
    if (GamePad.Down2(0x40) && GamePad.Down2(0x20)) {
        SaveMenu.key_no = 18;
        McAccess.SetFuncNo(10);
        McAccess.port = SaveMenu.file_no;
        ComMenuSePlay(1);
    }
    return 1;
}
static int SaveMenuKeyCheckMcType() {
    MC_CARD_INFO *card;

    card = &McAccess.card[McAccess.port];
    if (card->present) {
        switch (card->type) {
            case 2:
                McAccess.SetFuncNo(2);
                SaveMenu.key_no = 5;
                break;
            default:
                SaveMenu.key_no = 14;
                SaveMenu.unk_20 = 1;
                break;
        }
    } else {
        SaveMenu.key_no = 14;
        SaveMenu.unk_20 = 1;
    }
    return 1;
}
static int SaveMenuKeyCheckMc() {
    MC_CARD_INFO *card;

    printf("check end !!\n");
    card = &McAccess.card[McAccess.port];
    SaveMenu.unk_20 = 0;
    if (card->present == 0) {
        printf("not \n");
        SaveMenu.unk_20 = 14;
        SaveMenu.key_no = 3;
        SaveMenu.file_no = McAccess.port;
        return 0;
    }
    if (card->type != 2) {
        printf("type is not PS2\n");
        SaveMenu.unk_20 = 14;
        SaveMenu.key_no = 3;
        SaveMenu.file_no = McAccess.port;
        return 0;
    }
    if ((SaveMenu.unk_1C == 1 || SaveMenu.unk_0 == 2) && (card->dir_exists == 0 || card->formatted == 0)) {
        SaveMenu.unk_20 = 12;
        SaveMenu.key_no = 14;
        return 1;
    }
    if (SaveMenu.unk_1C == 2 && card->dir_exists == 0 && card->free_size < 400 && card->formatted != 0) {
        SaveMenu.unk_20 = 10;
        SaveMenu.key_no = 14;
        return 1;
    }
    if (SaveMenu.unk_0 == 2) {
        SaveMenu.key_no = 23;
    } else if (SaveMenu.unk_1C == 1) {
        SaveMenu.key_no = 6;
        McAccess.SetFuncNo(13);
    } else {
        McAccess.SetFuncNo(4);
        SaveMenu.key_no = 7;
        SaveMenu.file_no = ((s32 *) SaveData->GetConfigData())[17];
    }
    return 1;
}
static int SaveMenuKeyLoadConfig() {
    McAccess.SetFuncNo(4);
    SaveMenu.key_no = 7;
    if (*(s32 *) &((SV_CONFIG_SYS *) SaveData->GetConfigData())->reserved_36[2] != 0) {
        GameClearFlag = 1;
    }
    SaveMenu.file_no = ((s32 *) SaveData->GetConfigData())[17];
    return 1;
}
INCLUDE_ASM("asm/nonmatchings/memcard", SaveMenuKeyFileSelect__Fv);
