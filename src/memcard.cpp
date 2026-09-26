#pragma helper_mask_gpr 0x30
#pragma helper_mask_fpr 0x1000

#include "memcard.hpp"

#include <cmath>
#include <cstdio>
#include <cstring>

#include "battle_globals.hpp"
#include "clsmes.hpp"
#include "dataread.hpp"
#include "eastking.hpp"
#include "editatra.hpp"
#include "editloop.hpp"
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
#include "userstatus.hpp"

/**
 * Holds the state of the option screen.
 */
struct OPTION_MENU_STATE {
    s32 mode;    /**< How the screen was opened; 0 from the main menu. */
    s32 buttons; /**< Whether the cursor is on the screen's buttons rather than its rows. */
    u8 unk_08[4];
    s32 cursor;     /**< Cell that the cursor is on, as ten times the row plus the column. */
    s32 step;       /**< Stage that the screen is at, 2 once it has begun to close. */
    s32 step_count; /**< Frames the screen has spent at its stage. */
    float cursor_x; /**< Screen X of the cursor. */
    float cursor_y; /**< Screen Y of the cursor. */
    float page_x;   /**< Screen X of the rows, eased toward the cursor's page. */
    s32 flag[12];      /**< Setting of each option row. */
    s32 prev_flag[12]; /**< Setting of each option row when the screen opened. */
    s16 texture_ready; /**< Whether the screen's textures have been entered. */
    s16 block_no;      /**< Texture block the screen's textures load into. */
};

STATIC_ASSERT(sizeof(OPTION_MENU_STATE) == 0x88);

/** The state of the option screen. */
extern OPTION_MENU_STATE OptionMenu;

/** The StayTex menu texture. */
CTexture *StayTex;

/** The AttachIcon menu texture. */
CTexture *AttachIcon;

/** The texture of the item icons. */
CTexture *ItemIcon;

/** The ItemIcon2 menu texture. */
CTexture *ItemIcon2;

/** The texture of the weapon icons. */
CTexture *WepIcon;

CTexture *Sozai;
CTexture *HoleGray;
CTexture *HoleGold;
CTexture *ObTip;
CTexture *ObPerson;
CTexture *CompleteTex;
CTexture *VillageBar;
CTexture *VillageName;

/** The texture that the save screen's file boards draw from. */
CTexture *SaveBoard;

/** The texture that the option screen draws from. */
CTexture *MenuOption;

/** Holds the georama parts of a town the player is not standing in. */
extern CEditPartsInfo BtEditPartsInfo;

#ifdef NON_MATCHING // draft declarations
#include <cstdlib>

#include "editmenu.hpp"
#include "menu_inventory.hpp"

extern u8 MesWinTexBuff_12[0x100];
extern CTexture *SaveMenuMojiTextbl[4];
extern CTexture *PerBoardTex;
#endif

CEditPartsInfo *CommonMenuAtoraInfo;
short *GetAtraMsgReadBuf;

/** The chip that the georama board's cursor has picked up. */
ATORA_TIP_HAVE *NowTipHavePt;

/** Whether the board screen's texture block has finished loading. */
int AtoraTextureEnterFlag;

/** The texture block that holds the board's town tags and names. */
int AtoraTextureBaseBlock;

/** The texture block the georama board screen loads for its own textures. */
int AtoraTextureReadBlock;

/** The buffer that the georama board screen reads its files into. */
u_long128 *AtoraOffsetBuf;

s32 CursorVibeCnt;

/** The chip group that the board's sort ranks first. */
extern int tip_sort_type;

/** The save menu's steps, by SAVE_MENU_STATE::key_no. */
extern int (*SaveMenuFunc[26])();

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

/**
 * Draws the pulsing highlight over an object on the georama board.
 */
void DrawMenuObjectVibe(int x, int y, int highlight, int alpha) {
    CTexture *texture = TexManager.GetTexture(AtoraVibeTextureName, -1);
    CRect_i_ src(alpha, 0x28, 0x20, 0x20);

    if (highlight != 0) {
        DrawObjectVibe(x + 5, y + 3, texture, src, 0, 100);
    }
    DrawObjectVibe(x, y, texture, src, 0x80, 0x80);
}

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

/**
 * Draws the framed help window used by the georama menu.
 */
void MenuHelpWinDraw(int x, int y, float width, float height, int alpha) {
    StayTex = TexManager.GetTexture(AtoraVibeTextureName, -1);
    MenuHelpWinDraw(x, y, width, height, alpha, 0, 0, StayTex);
}

void DrawMenuWaku(float x, float y, int width, int height, int type, CTexture *texture, int alpha) {
    RECT *src;
    float offset;
    int left;
    int top;
    int right;
    int bottom;

    if (texture != NULL) {
        static int MenuWakuCnt = 0;

        offset = 0.2f * MenuWakuCnt;
        left = x + offset;
        top = y + offset;
        right = (x + width) - offset;
        bottom = (y + height) - offset;
        RECT corner[2] = {{74, 72, 16, 16}, {106, 72, 27, 24}};
        src = &corner[type];
        DrawMenu2DSprite(texture, CRect_i_(left, top, src->width, src->height),
                         CRect_i_(src->x, src->y, src->width, src->height), alpha);
        DrawMenu2DSprite(texture, CRect_i_(right, top, src->width, src->height),
                         CRect_i_(src->x + src->width, src->y, src->width, src->height), alpha);
        DrawMenu2DSprite(texture, CRect_i_(left, bottom, src->width, src->height),
                         CRect_i_(src->x, src->y + src->height, src->width, src->height), alpha);
        DrawMenu2DSprite(texture, CRect_i_(right, bottom, src->width, src->height),
                         CRect_i_(src->x + src->width, src->y + src->height, src->width, src->height), alpha);
        MenuWakuCnt++;
        if (MenuWakuCnt < 0 || MenuWakuCnt >= 30) {
            MenuWakuCnt = 0;
        }
    }
}

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

int GetMsgLengthMenu(ClsMes *mes, int mes_no) {
    int length = 0;
    short *code = mes->GetTextLineDataTop_system(mes_no);

    if (code != NULL) {
        while (1) {
            short c = *code++;
            if ((unsigned int) (c + 0x100) <= 1U || code == NULL) {
                break;
            }
            length++;
        }
    }
    return length;
}
/**
 * Gives the texture and the cell within it that one georama element draws from.
 *
 * @mangled RetCTexAtora__FiRiRi
 * @address 0x2181E0
 * @size 0xD8
 */
static CTexture *RetCTexAtora(int tip_no, int &x, int &y);

static CTexture *RetCTexAtora(int tip_no, int &x, int &y) {
    CTexture *texture;
    int tex_no;

    tex_no = GetEditAtraChipData(MenuAtoraSel.map_no, tip_no)->tex_no;
    x = ((tex_no + 7) % 7) * 36;
    y = (tex_no / 7) * 36;
    if (tip_no < 40) {
        texture = ObTip;
    } else if (tip_no >= 40) {
        texture = ObPerson;
    }
    return texture;
}

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
        if (info->placed == info->stock) {
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

/**
 * Answers whether a georama chip attachment may be shown on the board: a
 * person's chip stays hidden until that resident has moved in.
 */
static int AtraTipCanDisplay(EDIT_CHIP_ATTACH_DATA *attach) {
    int display;

    display = 1;
    if (attach != NULL && attach->id < 40 && attach->unk_18 >= 0 &&
        (SaveData->GetGrdNPCData(MenuAtoraSel.map_no, attach->unk_18)->flags & 2) == 0) {
        display = 0;
    }
    return display;
}

static void AtoraTipRelationDraw(int x, int y, EDITPARTS_INFO *info, int slot, int link, int alpha) {
    int dx;
    int dy;
    int u;
    int v;
    int height;

    if (info != NULL) {
        static int tipcurCnt = 0;

        u = 172;
        v = 390;
        height = 14;
        // Only link codes ending in 1 or 2 give the arrow an offset.
        if (link > 0) {
            switch (link % 10) {
                case 1:
                    dx = -10;
                    dy = 8;
                    u += 12;
                    break;
                case 2:
                    dx = 12;
                    dy = -12;
                    break;
            }
        }
        if (tipcurCnt % 460 > 200) {
            dy += 3;
            v += 14;
            height = 10;
        }
        if (link < 49 && link >= 20) {
            return;
        }
        if (link < 50 && link > 0) {
            DrawMenu2DSprite(Sozai, CRect_i_(x + dx, y + dy, 12, height), CRect_i_(u, v, 12, height), alpha);
        }
        if (link >= 10) {
            DrawMenu2DSprite(Sozai, CRect_i_(x, y, 36, 35), CRect_i_(220, 346, 36, 37), alpha);
        }
        tipcurCnt++;
        if (tipcurCnt < 0 || tipcurCnt > 999999) {
            tipcurCnt = 0;
        }
    }
}

/** Frame counter that DrawAtora's part plates animate with. */
int AtoraHeyCnt;

/** Frame counter that DrawAtora's completion sprites animate with. */
int CompMsgCt;

/** The configuration words that the option screen edits. */
s32 *OpConfigPt;

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

int GetAtraMsgNo(int map_no, int element) {
    int mes_no;

    if (element < 0 || element >= 100) {
        mes_no = 999;
    } else {
        EDIT_ELEMENT_ATRA *atra = GetEditAtraData(map_no, element);
        mes_no = atra->msg_no + (map_no * 200 + 1000);
        switch (map_no) {
            case 2:
                if (element == 1) {
                    int count = SaveData->GetGameIntFlag(1);
                    if (count > 0) {
                        mes_no += count + 0x1C;
                    }
                }
                break;
        }
        if (element >= 40) {
            mes_no += 40;
        }
        if (element >= 80) {
            mes_no += 40;
        }
    }
    return mes_no;
}
#ifdef NON_MATCHING
static int AtoraMsgNoGet(int map_no, int board_pos, int slot) {
    int mes_no;
    EDITPARTS_INFO *info = SearchAtoraInfo(board_pos);

    if (info == NULL) {
        return -1;
    }
    EDIT_PARTS_ATRA *parts = GetEditAtraPartsData(map_no, info->parts_no);
    if (parts == NULL) {
        return -1;
    }
    if (slot != 0) {
        EDIT_CHIP_ATTACH_DATA *chip = &parts->elements[slot - 1];
        EDIT_ELEMENT_ATRA *element = GetEditAtraChipData(map_no, chip->id);
        EDIT_CHIP_ATTACH_DATA *shown =
            &GetEditAtraPartsData(MenuAtoraSel.map_no, info->parts_no)->elements[slot - 1];
        mes_no = element->msg_no + (map_no * 200 + 40);
        if (chip->id >= 40) {
            mes_no += 40;
        }
        if (info->elements[slot - 1].enabled == 0) {
            mes_no += 60;
        }
        int linked = info->elements[slot - 1].unk_04;
        if ((linked >= 0 && info->elements[linked].enabled == 0) || AtraTipCanDisplay(shown) == 0) {
            mes_no = -0x314;
        }
    } else {
        int parts_no = info->parts_no;
        if (parts_no < 0) {
            mes_no = -1000;
        } else {
            mes_no = parts->unk_0C + map_no * 200;
            if (map_no == 2 && parts_no == 1) {
                int count = SaveData->GetGameIntFlag(1);
                if (count > 0) {
                    mes_no += count + 0x1C;
                }
            }
        }
    }
    return mes_no;
}
#else
INCLUDE_ASM("asm/nonmatchings/memcard", AtoraMsgNoGet__Fiii);
#endif

static int AtoraTipOnlyMsgNoGet(int map_no, int number) {
    EDIT_ELEMENT_ATRA *chip;
    int msg_no;

    chip = GetEditAtraChipData(map_no, number);
    if (chip == NULL) {
        return -1;
    }
    msg_no = chip->msg_no + 40;
    if (number >= 40) {
        msg_no += 40;
    }
    return msg_no;
}
/**
 * Gives the cell within the element sheet that one georama element draws from.
 *
 * @mangled AtoraTipGetTexPos__FiRiRi
 * @address 0x219000
 * @size 0xD8
 */
static void AtoraTipGetTexPos(int tip_no, int &x, int &y) {
    int tex_no;

    tex_no = GetEditAtraChipData(MenuAtoraSel.map_no, tip_no)->tex_no;
    if (tip_no >= 40) {
        x = 144;
        y = 180;
    } else if (0 <= tex_no && tex_no < 40) {
        x = (tex_no % 7) * 36;
        y = (tex_no / 7) * 36;
    }
}
static void AtoraTipObjectOrPerson(int x, int y, int tip_no, int dark, int alpha) {
    int u;
    int v;
    CTexture *texture = RetCTexAtora(tip_no, u, v);
    CRect_i_ source(u, v, 0x24, 0x24);
    int red, green, blue;
    blue = green = red = 0x80;
    if (dark != 0) {
        red = 0x80;
        green = 0x44;
        blue = 0;
    }
    DrawMenu2DSprite(texture, CRect_i_(x, y, source.width, source.height - 1), source, red, green, blue, alpha);
}

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
    int empty = 83 - info->placed * 83 / info->stock;
    CRect_i_ dest;
    CRect_i_ src(244, 323 - empty, 12, empty);

    dest.x = x + 12;
    dest.y = y + 107 - empty;
    dest.width = 12;
    dest.height = empty;
    DrawMenu2DSprite(Sozai, dest, src, flag);
    DrawAtraBuildNum(info, x, y, flag);
}

void DrawAtraBuildNum(EDITPARTS_INFO *info, int x, int y, int alpha) {
    RECT digit = {0, 212, 12, 12};
    int num_x;

    num_x = x + 8;
    if ((info->stock - info->placed) / 10 > 0) {
        num_x += 24;
    } else {
        num_x += 12;
    }
    if (info->stock / 10 > 0) {
        num_x += 24;
    } else {
        num_x += 12;
    }
    num_x = DrawMenuNumber(info->stock, num_x, y + 5, StayTex, digit, 1, alpha);
    DrawMenu2DSprite(StayTex, CRect_i_(num_x - 10, y + 5, 12, 12), CRect_i_(120, digit.y, 12, 12), alpha);
    DrawMenuNumber(info->stock - info->placed, num_x - 7, y + 5, StayTex, digit, 1, alpha);
}
#ifdef NON_MATCHING
void DrawAtora(int x, int y, int parts_index, int alpha) {
    int u;
    int v;
    unsigned char colour[4];

    if (y < -100 || y >= 0x1CD) {
        return;
    }
    EDITPARTS_INFO *info = CommonMenuAtoraInfo->GetPartsInfo(parts_index);
    if (info == NULL) {
        return;
    }
    EDIT_PARTS_ATRA *parts = GetEditAtraPartsData(MenuAtoraSel.map_no, info->parts_no);
    int complete = CommonMenuAtoraInfo->CheckComplete(parts_index);
    int all_tips = AtoraAllTipGet(parts_index);
    int event = AtoraCompOrEvent(info);
    u = 0;
    v = 0;
    if (all_tips != 0 || (info->unk_08 != 0 && info->elements[0].id < 0)) {
        v = 0x78;
    }
    DrawMenu2DSprite(Sozai, CRect_i_(x, y, 0x100, 0x78), CRect_i_(0, v, 0x100, 0x79), alpha);
    if (info->stock > 0 && MenuAtoraSel.map_no != 5) {
        AtoraPlateDrawHaichiBar(info, x, y, alpha);
    }
    int picture_x = x + 0x20;
    int picture_y = y + 8;
    int draw_picture = 1;
    int tex_no = parts->unk_08;
    u = (tex_no / 6) * 0x54 + 0x104;
    v = (tex_no + 6) % 6 * 0x54;
    if (MenuAtoraSel.map_no == 5) {
        if (complete == 0) {
            draw_picture = 0;
        } else {
            picture_x = x + 0x14;
            picture_y = y + 0xC;
        }
    }
    if (draw_picture != 0) {
        DrawMenu2DSprite(Sozai, CRect_i_(picture_x, picture_y, 0x54, 0x54), CRect_i_(u, v, 0x54, 0x54), alpha);
    }
    u = 0;
    v = 0;
    int slot_x = 0x78;
    int slot_y = 8;
    if (parts->elements[0].id < 0) {
        DrawMenu2DSprite(Sozai, CRect_i_(x + 0x88, y - 1, 0x78, 0x5D), CRect_i_(0, 0xF0, 0x78, 0x5C), alpha);
        DrawMenu2DSprite(Sozai, CRect_i_(x + 0x88, y + 7, 0x64, 0x1C), CRect_i_(0, 0x164, 0x64, 0x1C), alpha);
    } else if (event == 0) {
        for (int i = 0; i < 6; i++) {
            GetEditAtraChipData(MenuAtoraSel.map_no, parts->elements[i].id);
            EDIT_CHIP_ATTACH_DATA *chip = &parts->elements[i];
            if (chip->id >= 0) {
                int status = AtoraTipStatusSearch(info, i);
                if (AtraTipCanDisplay(chip) == 0) {
                    status = 50;
                }
                int tip_x = x + slot_x;
                int tip_y = y + slot_y;
                AtoraTipRelationDraw(tip_x, tip_y, info, i, status, alpha);
                if ((chip->unk_04 < 0 || status < 3) && status != 50) {
                    AtoraTipGetTexPos(chip->id, u, v);
                    CTexture *hole = AtoraTipHoleTexInfoGet(all_tips, colour);
                    DrawMenu2DSprite(hole, CRect_i_(tip_x, tip_y, 0x24, 0x24), CRect_i_(u, v, 0x24, 0x25), colour[0],
                                     colour[1], colour[2], alpha);
                }
                if (info->elements[i].enabled != 0) {
                    AtoraTipObjectOrPerson(tip_x, tip_y, info->elements[i].id, all_tips, alpha);
                    if (complete == 0 && chip->unk_18 >= 0 && AlreadyPeopleTalk(MenuAtoraSel.map_no, chip->id) == 0 &&
                        AtoraHeyCnt % (chip->id + 0x4B) < 0x46) {
                        DrawMenu2DSprite(CompleteTex, CRect_i_(tip_x - 9, tip_y - 7, 0x20, 0x15),
                                         CRect_i_(0xE2, 0, 0x20, 0x16), alpha);
                    }
                }
            }
            slot_x += 0x2C;
            if (i == 2) {
                slot_x = 0x78;
                slot_y = 0x35;
            }
        }
    } else {
        int count = 0;
        for (int i = 0; i < 6 && info->elements[i].id >= 0; i++) {
            count++;
        }
        float wave = cosf(3.1415927f * CompMsgCt / (160.0f + (count >> 1)));
        float sway = 6.0f * wave;
        int base_x = (int) ((float) (x + 0x70 - 6) + sway);
        int base_y = (int) ((float) (y + 6) + 2.0f * wave);
        float width = 128.0f + sway;
        float height = 88.0f + 3.0f * wave;
        int draw_x = (int) ((float) base_x + 8.0f * cosf(3.1415927f * CompMsgCt / (180.0f + count)));
        int draw_y = (int) ((float) base_y + 4.0f * sinf(3.1415927f * CompMsgCt / (140.0f + count)));
        DrawMenu2DSprite(CompleteTex, CRect_i_(draw_x, draw_y, (int) width, (int) height), CRect_i_(0, 0x28, 0x80, 0x58),
                         alpha);
    }
    CompMsgCt++;
    if (CompMsgCt >= 320000 || CompMsgCt < 0) {
        CompMsgCt = 0;
    }
}
#else
INCLUDE_ASM("asm/nonmatchings/memcard", DrawAtora__Fiiii);
#endif

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

#ifdef NON_MATCHING
void InitMenuAtora1(int open_mode, int edit_map, int *texture_blocks, u_long128 *buffer) {
    MenuAtoraSel.unk_04 = open_mode;
    InitPersonalBoardMode((CUserStatus *) SaveData->GetDngStatus(), (PERSONAL_BOARD *) &MenuAtoraSel.unk_14, 2, edit_map + 3);
    MenuAtoraSel.prev_mes_buff = CommonMenuMes2.buff;
    AtoraTextureBaseBlock = texture_blocks[0];
    AtoraTextureReadBlock = texture_blocks[1];
    AtoraOffsetBuf = buffer;
    AtoraOffsetBuf = MenuCalcBufAlignment(buffer);
    AtoraTextureEnterFlag = 0;
    MenuAtoraSel.unk_08 = edit_map;
    CommonMenuMes3.Preset(4);
    CommonMenuMes3.style = 0;
    CommonMenuMes3.end_mark = 0;
    CommonMenuMes3.auto_pos = -1;
    CommonMenuMes3.mes_made = -1;
    AtoraNameMes.Preset(4);
    AtoraNameMes.unk_17B0 = MesWinTexBuff_12;
    memset(AtoraNameMes.unk_17B0, 0, 0x100);
    AtoraNameMes.rows = 4;
    u8 widths[6] = {0x10, 0x0C, 0x0C, 0x0C, 0x0C, 0x10};
    AtoraNameMes.char_width = widths[GetMenuLangFlag()];
    AtoraNameMes.narrow_gaiji_set = 2;
    for (int i = 0; i < 10; i++) {
        AtoraNameMes.mes_no[i] = 999;
        AtoraNameMes.values[i] = -1;
    }
    AtoraNameMes.mes_made = -1;
    AtoraNameMes.narrow_gaiji = 1;
    NowTipHavePt = (ATORA_TIP_HAVE *) MenuAtoraSel.unk_44;
    MenuAtoraSel.unk_17E = 0;
    MenuAtoraSel.tip_pos = 0;
    MenuAtoraSel.step = 1;
    MenuAtoraSel.step_count = 0;
    SetMenuAtraEventFlag(0);
    CMenuCursor *cursor = SaveData->GetMenuCursor();
    if (cursor->reset_pos == 0) {
        MenuAtoraSel.mode = cursor->mode[3];
        if (MenuAtoraSel.mode < 0 || MenuAtoraSel.mode >= 2) {
            MenuAtoraSel.mode = 0;
        }
        s16 pos = cursor->pos[3];
        switch (MenuAtoraSel.mode) {
            case 0:
                MenuAtoraSel.board_pos = pos;
                break;
            case 1:
                MenuAtoraSel.tip_pos = pos;
                MenuAtoraSel.unk_2C = MenuAtoraSel.tip_pos / 5 - 2;
                if (MenuAtoraSel.unk_2C < 0) {
                    MenuAtoraSel.unk_2C = 0;
                }
                break;
        }
    } else {
        MenuAtoraSel.mode = 0;
        MenuAtoraSel.board_pos = 0;
        MenuAtoraSel.tip_pos = 0;
    }
    if (GetMenuAtraEventFlag() != 0) {
        MenuAtoraSel.board_pos = MenuAtoraSel.unk_198;
    }
}
#else
INCLUDE_ASM("asm/nonmatchings/memcard", InitMenuAtora1__FiiPiP1);
#endif

void InitMenuAtoraSelect(int map_no) {
    int place;
    char path[64];
    int map;
    int next;
    int count;
    EDITPARTS_INFO *info;
    int pos;
    int y;
    int i;

    MenuAtoraSel.map_no = map_no;
    map = MenuAtoraSel.map_no;
    if (AtoraTextureEnterFlag == 0) {
        GetPathReadDifferntLang(path);
        strcat(path, "a%d.pak");
        sprintf(path, path, map + 1);
        if (ReadBGSync()) {
            BreakReadBG();
        }
        StartReadBG();
        LoadFileBG(path, AtoraOffsetBuf, NULL);
        MenuAtoraSel.unk_1A8 = 0;
        if ((MenuAtoraSel.unk_04 == 2 || MenuAtoraSel.unk_04 == 1) && MenuAtoraSel.map_no == MapNo) {
            CommonMenuAtoraInfo = &EditPartsInfo;
        } else {
            CommonMenuAtoraInfo = &BtEditPartsInfo;
            CommonMenuAtoraInfo->Load(MenuAtoraSel.map_no, SaveData, 1);
        }
    }
    MenuAtoraSel.tip_list = SaveData->GetElemData(map);
    next = CommonMenuAtoraInfo->GetNextPartsNum(-1);
    AtoraTipInfoInit();
    count = AtraBoardMaxNum(MenuAtoraSel.map_no);
    if (MenuAtoraSel.board_pos > count - 1) {
        MenuAtoraSel.board_pos = count - 1;
    }
    info = SearchAtoraInfo(MenuAtoraSel.board_pos);
    if (MenuAtoraSel.mode == 0) {
        if (info != NULL) {
            if (MenuAtoraSel.tip_pos > 0 && info->elements[MenuAtoraSel.tip_pos - 1].id < 0) {
                MenuAtoraSel.tip_pos = 0;
            }
        } else {
            MenuAtoraSel.tip_pos = 0;
        }
    }
    MenuAtoraSel.scroll_y = 146.0f - 130.0f * MenuAtoraSel.board_pos;
    if (0 < next) {
        MenuAtoraSel.cursor_x = 38.0f;
        MenuAtoraSel.cursor_y = 175.0f;
    } else {
        place = MenuAtoraSel.tip_pos % 4;
        MenuAtoraSel.cursor_x = place * 58 + 334;
        place = (MenuAtoraSel.tip_pos >> 2) - MenuAtoraSel.unk_2C;
        if (place < 0) {
            place = 0;
        }
        if (place > 3) {
            place = 3;
        }
        MenuAtoraSel.cursor_y = place * 50 + 118;
    }
    if (next > 0) {
        pos = MenuAtoraSel.board_pos - 1;
        y = MenuAtoraSel.scroll_y + 80 + 130.0f * pos;
        for (i = 0; i < 3; i++) {
            info = SearchAtoraInfo(pos);
            if (info != NULL) {
                AtoraNameMes.mes_no[i] = info->parts_no + (MenuAtoraSel.map_no * 200 + 1000);
                AtoraNameMes.line_pos[0].x = 134;
                AtoraNameMes.line_pos[0].y = y;
                y += 130.0f;
            } else {
                AtoraNameMes.mes_no[i] = 999;
            }
            pos++;
        }
        AtoraNameMes.mes_made = -1;
        AtoraNameMes.MakeMesWin(210);
    }
}

/**
 * Stores the mode of a menu in the saved menu cursors.
 */
static inline void SetCursorMode(CMenuCursor *cursor, int menu, int mode) {
    cursor->mode[menu] = mode;
}

/**
 * Closes the georama board screen, saving the cursor position unless the
 * menus were told to forget it, and restores the shared message windows.
 */
static void ExitAtoraSelect() {
    CMenuCursor *cursor;
    int pos;

    cursor = SaveData->GetMenuCursor();
    if (cursor->reset_pos == 0) {
        SetCursorMode(cursor, 3, MenuAtoraSel.mode);
        switch (MenuAtoraSel.mode) {
            case 0:
                pos = MenuAtoraSel.board_pos;
                break;
            case 1:
                pos = MenuAtoraSel.tip_pos;
                break;
        }
        cursor->pos[3] = pos;
    }
    CommonMenuMes2.SetBuff(MenuAtoraSel.prev_mes_buff);
    CommonMenuMes3.auto_pos = -1;
    CommonMenuMes3.Preset(1);
    AtoraNameMes.narrow_gaiji = 0;
}

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
#ifdef NON_MATCHING
static void DrawAtoraSelect(int fade) {
    int u;
    int v;
    float cursor_x;
    float cursor_y;
    int waku_x;
    int waku_y;
    int waku_size;

    AtoraTexInfoGet();
    int alpha = 0x80;
    switch (MenuAtoraSel.step) {
        case 2:
        case 1:
            alpha = fade;
            break;
        case 6:
            alpha = MenuAtoraSel.step_count * 5;
            break;
    }
    if (alpha > 0x80) {
        alpha = 0x80;
    }
    int open_mode = MenuAtoraSel.unk_04;
    MenuAtoraSel.name_alpha = alpha;
    EDITPARTS_INFO *info = SearchAtoraInfo(MenuAtoraSel.board_pos);
    int event = 0;
    int all_tips = 0;
    if (info != NULL) {
        event = AtoraCompOrEvent(info);
        all_tips = AtoraAllTipGet(info->parts_no);
    }
    MenuTextureReload(AtoraTextureReadBlock);
    float target = 146.0f - 130.0f * MenuAtoraSel.board_pos;
    float step = (target - MenuAtoraSel.scroll_y) / 2.0f;
    int odd = (int) step % 2;
    MenuAtoraSel.scroll_y = (int) ((float) MenuAtoraSel.scroll_y + (step / 2.0f + odd));
    int settled = 1;
    if (!((float) abs((int) ((float) MenuAtoraSel.scroll_y - target)) <= 4.0f)) {
        settled = 0;
        event = 0;
        all_tips = 0;
    }
    if (MenuAtoraSel.mode != 0 || open_mode != 2) {
        settled = 0;
    }
    if (NowEditMap != MenuAtoraSel.map_no) {
        settled = 0;
    }
    if (info != NULL) {
        if (info->placed == info->stock) {
            settled = 0;
        }
    } else {
        settled = 0;
    }
    int remaining = AtraBoardMaxNum(MenuAtoraSel.map_no);
    int parts = CommonMenuAtoraInfo->GetNextParts(-1);
    float y = MenuAtoraSel.scroll_y;
    if (AtoraTextureEnterFlag != 0) {
        AtoraHeyCnt++;
        while (parts >= 0) {
            DrawAtora(0x38, (int) y, parts, alpha);
            parts = CommonMenuAtoraInfo->GetNextParts(parts);
            y += 130.0f;
            remaining--;
        }
        while (remaining > 0) {
            DrawAtoraNothing(0x38, (int) y, alpha);
            y += 130.0f;
            remaining--;
        }
        if (AtoraHeyCnt > 10000000) {
            AtoraHeyCnt = 0;
        }
        if (settled != 0 || (MenuAtoraSel.map_no == 5 && all_tips != 0)) {
            float sign_y = 208.0f + 8.0f * sinf(3.1415927f * ((float) (CursorVibeCnt % 89) - 45.0f) / 45.0f);
            CRect_i_ source(0, 0, 0x50, 0x20);
            if (MenuAtoraSel.map_no == 5 && all_tips != 0) {
                source.x += 0x50;
            }
            DrawMenu2DSprite(CompleteTex, CRect_i_(0x83, (int) (1.0f + sign_y), source.width, source.height), source, 6, 6,
                             6, (alpha * 0x50) >> 7);
            DrawMenu2DSprite(CompleteTex, CRect_i_(0x80, (int) sign_y, source.width, source.height), source, alpha);
        }
        if (MenuAtoraSel.step == 4) {
            sceGsAlpha blend = mgAlpha;
            blend.bits.a = 0;
            blend.bits.b = 2;
            blend.bits.c = 0;
            blend.bits.d = 1;
            MGSetGsALPHA(&blend);
            int flash = (int) (128.0f - 3.0f * MenuAtoraSel.step_count);
            if (flash < 5) {
                flash = 0;
                MenuAtoraSel.step = 0;
            }
            DrawMenu2DSprite(Sozai, CRect_i_(0x34, 0x8B, 0x10C, 0x82), CRect_i_(0x8C, 0x1C0, 0x74, 0x40), flash);
            MGSetGsALPHA(NULL);
        }
        AtoraBoardFadeEffect();
    }
    int count = PersonalRetMax(MenuAtoraSel.unk_18);
    MenuAtoraSel.unk_24 += ((float) (0x7F - MenuAtoraSel.unk_2C * 0x28) - MenuAtoraSel.unk_24) / 4.0f;
    int board_y = (int) MenuAtoraSel.unk_24;
    MenuTextureReload(PerBoardTex->block);
    DrawPerBoardDraw(0, count, 0x168, board_y, 0x81, 0x121, PerBoardTex, 0x80);
    if (AtoraTextureEnterFlag != 0) {
        MenuTextureReload(AtoraTextureReadBlock);
        CommonIconDraw(MenuAtoraSel.unk_18, count, 0x168, board_y + 1, 0x81, 0x121, alpha);
    }
    MenuTextureReload(PerBoardTex->block);
    PersonalBoardTagDraw(MenuAtoraSel.unk_18, 0x154, 0x78, PerBoardTex, 0, 0x80);
    if (PerBoardTex != NULL) {
        MenuTextureReload(PerBoardTex->block);
        PersonalBoardDrawWaku(0x154, 0x78, PerBoardTex, 0x80);
        PersonalBoardScrlBarDraw(count, 0x154, 0x78, MenuAtoraSel.unk_28, MenuAtoraSel.unk_2C, PerBoardTex, 0x80);
        PersonalBoardMaxDraw(count, 0x154, 0x78, PerBoardTex, 0x80);
    }
    AtoraNameDraw(0);
    if (GetAtoraMaxVillage() - 3 > 0) {
        int arrow_y = (int) (66.0f + 4.0f * sinf(3.1415927f * (float) (CursorVibeCnt % 79 - 40) / 40.0f));
        DrawMenu2DSprite(PerBoardTex, CRect_i_(0x146, arrow_y, 0x1A, 0x18), CRect_i_(0x62, 0x14, 0x1A, 0x18), 0x80);
        DrawMenu2DSprite(PerBoardTex, CRect_i_(0x20C, arrow_y, 0x1A, 0x18), CRect_i_(0x7C, 0x14, 0x1A, 0x18), 0x80);
    }
    if (PerBoardTex != NULL) {
        MenuTextureReload(PerBoardTex->block);
    }
    switch (MenuAtoraSel.mode) {
        case 0:
            if (info == NULL) {
                cursor_x = 76.0f;
                cursor_y = 176.0f;
            } else if (MenuAtoraSel.tip_pos == 0) {
                cursor_x = 56.0f;
                cursor_y = 176.0f;
                waku_x = (int) 58.0f;
                waku_y = (int) 161.0f;
                waku_size = 0x56;
            } else {
                waku_size = 0x24;
                cursor_x = (MenuAtoraSel.tip_pos + 2) % 3 * 0x2C + 0x92;
                if (MenuAtoraSel.tip_pos > 0 && MenuAtoraSel.tip_pos < 4) {
                    cursor_y = 167.0f;
                } else {
                    cursor_y = 210.0f;
                }
                waku_x = (int) (3.0f + cursor_x);
                waku_y = (int) (cursor_y - 5.0f);
            }
            break;
        case 1: {
            cursor_x = MenuAtoraSel.tip_pos % 5 * 0x28 + 0x14E;
            int row = MenuAtoraSel.tip_pos / 5 - MenuAtoraSel.unk_2C;
            if (row < 0) {
                row = 0;
            }
            if (row >= 4) {
                row = 3;
            }
            cursor_y = row * 0x28 + 0x8A;
            waku_x = (int) cursor_x;
            waku_y = (int) cursor_y;
            waku_size = 0x24;
            break;
        }
    }
    MenuAtoraSel.unk_188 = 0x40;
    if (NowTipHavePt->tip_no >= 0) {
        MenuAtoraSel.unk_188 = 0x80;
        cursor_x += 25.0f;
        cursor_y += 12.0f;
    } else {
        switch (MenuAtoraSel.mode) {
            case 0:
                if (info != NULL) {
                    if (MenuAtoraSel.tip_pos > 0 && info->elements[MenuAtoraSel.tip_pos - 1].enabled != 0) {
                        cursor_x += 27.0f;
                        cursor_y += 12.0f;
                        MenuAtoraSel.unk_188 = 0x60;
                    } else {
                        MenuAtoraSel.unk_188 = 0x40;
                    }
                }
                break;
            case 1:
                if (MenuAtoraSel.tip_pos >= 0 && MenuAtoraSel.tip_list[MenuAtoraSel.tip_pos] >= 0) {
                    cursor_x += 25.0f;
                    cursor_y += 12.0f;
                    MenuAtoraSel.unk_188 = 0x60;
                }
                break;
        }
    }
    MenuAtoraSel.cursor_x += (cursor_x - MenuAtoraSel.cursor_x) / 4.0f;
    MenuAtoraSel.cursor_y += (cursor_y - MenuAtoraSel.cursor_y) / 4.0f;
    if (MenuAtoraSel.step == 0) {
        MenuTextureReload(AtoraTextureReadBlock);
        int tip_no = NowTipHavePt->tip_no;
        if (tip_no >= 0) {
            CTexture *texture = RetCTexAtora(tip_no, u, v);
            if (texture != NULL) {
                float sway_x = 7.0f * cosf(0.0805537f * CursorVibeCnt);
                float sway_y = 5.0f * sinf(0.1163553f * CursorVibeCnt);
                int tip_x = (int) (2.0f + (MenuAtoraSel.cursor_x + sway_x));
                int tip_y = (int) (MenuAtoraSel.cursor_y + sway_y - 14.0f);
                CRect_i_ source(u, v, 0x24, 0x24);
                DrawMenu2DSprite(texture, CRect_i_(tip_x + 5, tip_y + 3, 0x24, 0x24), source, 10, 10, 10, 0x50);
                float hand_x = MenuAtoraSel.cursor_x + sway_x;
                float hand_y = MenuAtoraSel.cursor_y + sway_y;
                DrawMenu2DSprite(StayTex, CRect_i_((int) hand_x + 6, (int) hand_y + 3, 0x20, 0x20),
                                 CRect_i_(0x80, 0x28, 0x20, 0x20), 10, 10, 10, 0x50);
                DrawMenu2DSprite(texture, CRect_i_(tip_x, tip_y, 0x24, 0x24), source, 0x80);
            }
        }
        int draw_waku = 1;
        if (MenuAtoraSel.mode == 0) {
            if (info == NULL) {
                draw_waku = 0;
            }
            if (open_mode == 2 && MenuAtoraSel.tip_pos > 0 && event != 0) {
                draw_waku = 0;
            }
        }
        if (MenuAtoraSel.step == 3 ||
            (MenuAtoraSel.mode == 0 && MenuAtoraSel.tip_pos == 0 && MenuAtoraSel.map_no == 5)) {
            draw_waku = 0;
        }
        if (draw_waku != 0) {
            DrawMenuWaku(waku_x + 0x15, waku_y - 0xE, waku_size, waku_size, 0, StayTex, 0x80);
        }
    }
}
#else
INCLUDE_ASM("asm/nonmatchings/memcard", DrawAtoraSelect__Fi);
#endif

static int AtoraTextureEnter() {
    LOADTEXTURE_INFO2 tex[3] = {{"#frame_image3#640#448#4", 0, 0}, {NULL, 0, 0}, {NULL, 0, 0}};
    BG_READ_INFO *bg;

    tex[1].block_no = tex[0].block_no = AtoraTextureReadBlock;
    bg = GetReadBGFile(0);
    char name[16] = "a%d.img";
    sprintf(name, name, MenuAtoraSel.map_no + 1);
    tex[1].name = (char *) GetPackFile((u_int *) bg->buffer, name, NULL);
    TexManager.DeleteTextureBlock(AtoraTextureReadBlock);
    TexManager.LoadTextureBlockEX(-1, tex);
    CompleteTex = TexManager.GetTexture("complete", -1);
    Sozai = TexManager.GetTexture("sozai", AtoraTextureReadBlock);
    HoleGray = TexManager.GetTexture("holegray", AtoraTextureReadBlock);
    HoleGold = TexManager.GetTexture("holegold", AtoraTextureReadBlock);
    ObTip = TexManager.GetTexture("obtip", AtoraTextureReadBlock);
    ObPerson = TexManager.GetTexture("obperson", AtoraTextureReadBlock);
    return 1;
}

/** The rank that the board's sort gives each chip group, by group. */
int tip_table[3] = {3, 1, 2};

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

#ifdef NON_MATCHING
int MenuAtoraSelectKey() {
    int result = 0;

    if (ReadBGSync() == 0 && AtoraTextureEnterFlag == 0) {
        AtoraTextureEnterFlag = AtoraTextureEnter();
    }
    switch (MenuAtoraSel.step) {
        case 1:
            if (MenuAtoraSel.step_count >= 16 && AtoraTextureEnterFlag != 0) {
                MenuAtoraSel.step = 0;
                MenuAtoraAfterFadeIn();
            }
            break;
        case 2:
            if (MenuAtoraSel.step_count >= 19) {
                ExitAtoraSelect();
                MenuAtoraSel.step = 0;
            }
            break;
        case 3:
            if (MenuAtoraSel.map_no == 5) {
                SetMenuAtraEventFlag(1);
                MenuAtoraSel.step = 7;
                GetPrevEastKingSndVol();
                SndBgmFadeOut(0x2D, 0);
            } else if (MenuAtoraSel.unk_04 == 2) {
                CommonMenuAtoraInfo->GetPartsInfo(MenuAtoraSel.board_pos);
                MenuAtoraSel.step = 0;
                EditMenuStatus.mode = 5;
                EditMenuStatus.event_no = MenuAtoraSel.board_pos;
                MenuAtoraSel.unk_17E = MenuAtoraSel.board_pos;
                ExitAtoraSelect();
                GamePad.AutoRepeatOff();
                GamePad.MenuModeOff();
                return 110;
            }
            break;
        case 7:
            if (MenuAtoraSel.step_count < 50) {
                SndStep();
            }
            if (MenuAtoraSel.step_count == 50) {
                SndBgmStop();
            }
            if (MenuAtoraSel.step_count >= 71) {
                CommonMenuAtoraInfo->Save(MenuAtoraSel.map_no, SaveData);
                MenuAtoraSel.step = 8;
                int blocks[1] = {0};
                blocks[0] = AtoraTextureReadBlock;
                int parts_no = SearchAtoraInfo(MenuAtoraSel.board_pos)->parts_no;
                MenuAtoraSel.unk_198 = MenuAtoraSel.board_pos;
                MenuAtoraSel.unk_17E = MenuAtoraSel.board_pos;
                InitEastKingEvent(parts_no, blocks, AtoraOffsetBuf);
            }
            break;
        case 8:
            if (EastKingEventKey() == 1) {
                MenuAtoraSel.step = 9;
                AtoraTextureEnterFlag = 0;
                InitMenuAtoraSelect(MenuAtoraSel.map_no);
                SetMenuAtraEventFlag(0);
                MenuAtoraSel.step_count = 0;
            }
            break;
        case 9:
            SndStep();
            if (MenuAtoraSel.step_count > 64) {
                MenuAtoraSel.step = 0;
            }
            break;
        case 4:
            if (MenuAtoraSel.step_count > 40) {
                MenuAtoraSel.step = 0;
            }
            break;
        case 10:
            if (GamePad.Down(0x60) != 0) {
                MenuAtoraSel.step = 0;
            }
            break;
        case 6:
            if (MenuAtoraSel.step_count >= 25 && AtoraTextureEnterFlag != 0) {
                MenuAtoraSel.step = 0;
            }
        case 0: {
            switch (MenuAtoraSel.mode) {
                case 0:
                    result = AtoraBoardKey();
                    break;
                case 1:
                    result = AtoraTipKey();
                    break;
            }
            int villages = GetAtoraMaxVillage();
            int page = MenuAtoraSel.unk_18;
            if (GamePad.Down(0xA) != 0) {
                if (NowTipHavePt->tip_no < 0) {
                    MenuAtoraSel.unk_18++;
                    if (villages < MenuAtoraSel.unk_18) {
                        MenuAtoraSel.unk_18 = 3;
                    }
                } else {
                    ComMenuSePlay(2);
                }
            }
            if (GamePad.Down(5) != 0) {
                if (NowTipHavePt->tip_no < 0) {
                    MenuAtoraSel.unk_18--;
                    if (MenuAtoraSel.unk_18 < 3) {
                        MenuAtoraSel.unk_18 = villages;
                    }
                } else {
                    ComMenuSePlay(2);
                }
            }
            if (page != MenuAtoraSel.unk_18) {
                result = 20;
            }
            switch (result) {
                case 10:
                    EditMenuStatus.mode = 0;
                    EditMenuStatus.parts = SearchAtoraInfo(MenuAtoraSel.board_pos)->parts_no;
                    MenuAtoraSel.unk_17E = MenuAtoraSel.board_pos;
                    ExitAtoraSelect();
                    ComMenuSePlay(1);
                    break;
                case 20:
                    if (NowTipHavePt->tip_no >= 0) {
                        ComMenuSePlay(2);
                    } else {
                        CommonMenuAtoraInfo->Save(MenuAtoraSel.map_no, SaveData);
                        MenuAtoraSel.map_no = MenuAtoraSel.unk_18 - 3;
                        AtoraTextureEnterFlag = 0;
                        int max = AtraBoardMaxNum(MenuAtoraSel.map_no);
                        if (MenuAtoraSel.board_pos >= max) {
                            MenuAtoraSel.board_pos = max;
                        }
                        MenuAtoraSel.unk_17E = MenuAtoraSel.board_pos;
                        InitMenuAtoraSelect(MenuAtoraSel.map_no);
                        MenuAtoraSel.step = 6;
                        MenuAtoraSel.step_count = 0;
                        MenuAtoraSel.name_alpha = 0;
                        ComMenuSePlay(1);
                    }
                    break;
                case 100:
                    MenuAtoraSel.step = 2;
                    MenuAtoraSel.step_count = 0;
                    CommonMenuAtoraInfo->Save(MenuAtoraSel.map_no, SaveData);
                    ExitAtoraSelect();
                    break;
            }
            break;
        }
    }
    int mes_no = 0;
    switch (MenuAtoraSel.mode) {
        case 0: {
            int no = AtoraMsgNoGet(MenuAtoraSel.map_no, MenuAtoraSel.board_pos, MenuAtoraSel.tip_pos);
            mes_no = no + 1000;
            if (no < 0) {
                mes_no = 0;
            }
            if (no == -0x314) {
                mes_no = 0xD4;
            }
            break;
        }
        case 1: {
            int tip_no = MenuAtoraSel.tip_list[MenuAtoraSel.tip_pos];
            int base = MenuAtoraSel.map_no * 200 + 1000;
            if (tip_no >= 0) {
                mes_no = base + AtoraTipOnlyMsgNoGet(MenuAtoraSel.map_no, tip_no);
            } else {
                int held = NowTipHavePt->tip_no;
                if (held >= 0) {
                    mes_no = base + AtoraTipOnlyMsgNoGet(MenuAtoraSel.map_no, held);
                }
            }
            if (mes_no < 0) {
                mes_no = 0;
            }
            break;
        }
    }
    if (AtoraTextureEnterFlag == 0 || MenuAtoraSel.step == 1) {
        mes_no = 0;
    }
    if (CommonMenuMes2.mes_made != mes_no) {
        CommonMenuMes2.MakeMesWin(mes_no);
    }
    return result;
}
#else
INCLUDE_ASM("asm/nonmatchings/memcard", MenuAtoraSelectKey__Fv);
#endif
#ifdef NON_MATCHING
static int AtoraBoardKey() {
    int movable[8];
    int open_mode = MenuAtoraSel.unk_04;
    int max = AtraBoardMaxNum(MenuAtoraSel.map_no);
    int old_cursor = MenuAtoraSel.tip_pos;
    int old_pos = MenuAtoraSel.board_pos;
    int moved = 0;
    int result = 0;
    int se = -1;

    if (GamePad.Down(0x1000) != 0) {
        moved = 1;
        if (MenuAtoraSel.tip_pos == 0) {
            if (MenuAtoraSel.board_pos > 0) {
                MenuAtoraSel.board_pos--;
            }
            MenuAtoraSel.tip_pos = 0;
        } else if (MenuAtoraSel.tip_pos >= 4 && MenuAtoraSel.tip_pos < 7) {
            MenuAtoraSel.tip_pos -= 3;
        } else if (MenuAtoraSel.board_pos > 0) {
            MenuAtoraSel.board_pos--;
            AtoraBoardEnableMovePos(MenuAtoraSel.board_pos, movable);
            MenuAtoraSel.tip_pos += 3;
            int slot = AtoraBoardGoToPos(movable, MenuAtoraSel.tip_pos - 1, 3);
            if (movable[slot] != 0) {
                MenuAtoraSel.tip_pos = slot + 1;
            } else {
                MenuAtoraSel.tip_pos -= 3;
                slot = AtoraBoardGoToPos(movable, MenuAtoraSel.tip_pos - 1, 0);
                if (movable[slot] != 0) {
                    MenuAtoraSel.tip_pos = slot + 1;
                } else {
                    MenuAtoraSel.tip_pos = 0;
                }
            }
        }
    } else if (GamePad.Down(0x4000) != 0) {
        moved = 1;
        if (MenuAtoraSel.tip_pos == 0) {
            if (MenuAtoraSel.board_pos < max - 1) {
                MenuAtoraSel.board_pos++;
            }
        } else if (MenuAtoraSel.tip_pos >= 4 && MenuAtoraSel.tip_pos < 7) {
            if (MenuAtoraSel.board_pos < max - 1) {
                MenuAtoraSel.board_pos++;
                MenuAtoraSel.tip_pos -= 3;
                AtoraBoardEnableMovePos(MenuAtoraSel.board_pos, movable);
                int slot = AtoraBoardGoToPos(movable, MenuAtoraSel.tip_pos - 1, 0);
                if (movable[slot] != 0) {
                    MenuAtoraSel.tip_pos = slot + 1;
                } else {
                    MenuAtoraSel.tip_pos = 0;
                }
            }
        } else {
            AtoraBoardEnableMovePos(MenuAtoraSel.board_pos, movable);
            MenuAtoraSel.tip_pos += 3;
            int slot = AtoraBoardGoToPos(movable, MenuAtoraSel.tip_pos - 1, 3);
            if (movable[slot] != 0) {
                MenuAtoraSel.tip_pos = slot + 1;
            } else if (MenuAtoraSel.board_pos < max - 1) {
                MenuAtoraSel.board_pos++;
                MenuAtoraSel.tip_pos -= 3;
                AtoraBoardEnableMovePos(MenuAtoraSel.board_pos, movable);
                slot = AtoraBoardGoToPos(movable, MenuAtoraSel.tip_pos - 1, 0);
                if (movable[slot] != 0) {
                    MenuAtoraSel.tip_pos = slot + 1;
                } else {
                    MenuAtoraSel.tip_pos = 0;
                }
            }
        }
    } else if (GamePad.Down(0x8000) != 0) {
        moved = 1;
        MenuAtoraSel.tip_pos--;
        if (MenuAtoraSel.tip_pos <= 0 || MenuAtoraSel.tip_pos == 3) {
            MenuAtoraSel.tip_pos = 0;
        }
    } else if (GamePad.Down(0x2000) != 0) {
        moved = 1;
        EDITPARTS_INFO *info = SearchAtoraInfo(MenuAtoraSel.board_pos);
        AtoraBoardEnableMovePos(MenuAtoraSel.board_pos, movable);
        int event = 0;
        if (info != NULL) {
            event = AtoraCompOrEvent(info);
        }
        int to_list = 0;
        if (info == NULL || event != 0) {
            to_list = 1;
        } else if (movable[MenuAtoraSel.tip_pos] != 0) {
            MenuAtoraSel.tip_pos++;
            if (MenuAtoraSel.tip_pos == 4 || MenuAtoraSel.tip_pos == 7) {
                to_list = 1;
            }
        } else {
            to_list = 1;
        }
        if (to_list != 0) {
            MenuAtoraSel.mode = 1;
            MenuAtoraSel.tip_pos = MenuAtoraSel.unk_2C * 5 + 5;
        }
        if (MenuAtoraSel.mode == 1) {
            MenuAtoraSel.unk_1C[0] = 1;
        }
    }
    if (MenuAtoraSel.mode == 0) {
        EDITPARTS_INFO *info = SearchAtoraInfo(MenuAtoraSel.board_pos);
        int event = 0;
        if (info != NULL) {
            event = AtoraCompOrEvent(info);
        }
        if (event != 0) {
            MenuAtoraSel.tip_pos = 0;
        }
    }
    if (moved == 0) {
        if (GamePad.Down(0x40) != 0) {
            EDITPARTS_INFO *info = SearchAtoraInfo(MenuAtoraSel.board_pos);
            if (info != NULL) {
                int full = 0;
                if (info->placed == info->stock) {
                    full = 1;
                }
                AtoraCompOrEvent(info);
                int all_tips = AtoraAllTipGet(info->parts_no);
                if (MenuAtoraSel.unk_04 == 1) {
                    MenuAtoraSel.step = 10;
                    se = 2;
                } else if (MenuAtoraSel.tip_pos == 0) {
                    int held = NowTipHavePt->tip_no;
                    if (held >= 0) {
                        se = 2;
                    } else if (full == 0 && held < 0 && open_mode == 2 && NowEditMap == MenuAtoraSel.map_no) {
                        MenuAtoraSel.unk_17E = MenuAtoraSel.board_pos;
                        ComMenuSePlay(1);
                        return 10;
                    } else if (all_tips != 0 && MenuAtoraSel.map_no == 5) {
                        MenuAtoraSel.step = 3;
                        MenuAtoraSel.step_count = 0;
                        MenuAtoraSel.unk_17E = MenuAtoraSel.board_pos;
                    } else {
                        se = 2;
                    }
                } else if (all_tips != 0) {
                    ComMenuSePlay(2);
                    return 0;
                } else {
                    AtoraBoardEnableMovePos(MenuAtoraSel.board_pos, movable);
                    int slot = MenuAtoraSel.tip_pos - 1;
                    if (NowTipHavePt->tip_no < 0) {
                        if (info->elements[slot].enabled == 0) {
                            se = 2;
                        } else {
                            int free = 1;
                            for (int i = slot; i < 6; i++) {
                                if (slot == info->elements[i].unk_04 && info->elements[i].enabled != 0) {
                                    free = 0;
                                }
                            }
                            if (free != 0) {
                                NowTipHavePt->tip_no = info->elements[slot].id;
                                info->elements[slot].enabled = 0;
                                NowTipHavePt->slot = slot;
                                NowTipHavePt->mode = 0;
                                NowTipHavePt->parts_no = MenuAtoraSel.board_pos;
                                se = 6;
                            } else {
                                se = 2;
                            }
                        }
                    } else {
                        EDITPARTS_ELEMENT *element = &info->elements[slot];
                        EDIT_CHIP_ATTACH_DATA *chip =
                            &GetEditAtraPartsData(MenuAtoraSel.map_no, info->parts_no)->elements[slot];
                        int fits = 1;
                        if (NowTipHavePt->tip_no != element->id) {
                            fits = 0;
                        }
                        if (element->enabled != 0) {
                            fits = 0;
                        }
                        int linked = element->unk_04;
                        if (linked >= 0 && info->elements[linked].enabled == 0) {
                            fits = 0;
                        }
                        if (AtraTipCanDisplay(chip) == 0) {
                            fits = 0;
                        }
                        if (fits != 0) {
                            element->enabled = 1;
                            if (info == NULL) {
                                return 0;
                            }
                            if (AtoraAllTipGet(info->parts_no) != 0) {
                                ComMenuSePlay(15);
                                MenuAtoraSel.step = 4;
                                MenuAtoraSel.tip_pos = 0;
                                MenuAtoraSel.step_count = 0;
                            } else {
                                se = 5;
                            }
                            AtoraTipInfoInit();
                        } else {
                            se = 2;
                        }
                    }
                }
            }
        } else if (GamePad.Down(0x20) != 0) {
            se = 2;
            if (NowTipHavePt->tip_no < 0) {
                MenuAtoraSel.unk_17E = MenuAtoraSel.board_pos;
                result = 100;
            } else {
                AtoraMenuTipCancel();
            }
        }
    }
    if (old_cursor != MenuAtoraSel.tip_pos || old_pos != MenuAtoraSel.board_pos) {
        se = 0;
    }
    ComMenuSePlay(se);
    return result;
}
#else
INCLUDE_ASM("asm/nonmatchings/memcard", AtoraBoardKey__Fv);
#endif

static int AtoraTipKey() {
    int result = 0;
    int pos = MenuAtoraSel.tip_pos;
    int mode = MenuAtoraSel.mode;
    int page = MenuAtoraSel.unk_18;

    switch (PersonalBoardKey()) {
        case 1: {
            EDITPARTS_INFO *info = SearchAtoraInfo(MenuAtoraSel.board_pos);
            int event = 0;
            if (info != NULL) {
                event = AtoraCompOrEvent(info);
            }
            int enable[6];
            AtoraBoardEnableMovePos(MenuAtoraSel.board_pos, enable);
            MenuAtoraSel.mode = 0;
            if (info == NULL || event != 0) {
                MenuAtoraSel.tip_pos = 0;
            } else {
                int slot = AtoraBoardGoToPos(enable, MenuAtoraSel.tip_pos < MenuAtoraSel.unk_2C * 5 + 10 ? 2 : 5, 0);
                if (enable[slot]) {
                    MenuAtoraSel.tip_pos = slot + 1;
                } else {
                    MenuAtoraSel.tip_pos = 0;
                }
            }
            ComMenuSePlay(0);
            break;
        }
    }
    if (MenuAtoraSel.mode == 1) {
        if (pos != MenuAtoraSel.tip_pos || mode != MenuAtoraSel.mode || page != MenuAtoraSel.unk_18) {
            ComMenuSePlay(0);
        }
        if (GamePad.Down(0x40)) {
            s16 *tip = &MenuAtoraSel.tip_list[MenuAtoraSel.tip_pos];
            if (NowTipHavePt->tip_no == *tip) {
                ComMenuSePlay(2);
            } else {
                ComMenuSePlay(1);
                s16 tip_no = *tip;
                *tip = NowTipHavePt->tip_no;
                NowTipHavePt->tip_no = tip_no;
                NowTipHavePt->slot = MenuAtoraSel.tip_pos;
                NowTipHavePt->mode = 1;
                NowTipHavePt->parts_no = -1;
            }
            return 0;
        } else if (GamePad.Down(0x20)) {
            ComMenuSePlay(2);
            if (NowTipHavePt->tip_no < 0) {
                result = 100;
            } else {
                AtoraMenuTipCancel();
            }
        } else if (GamePad.Down(0x80)) {
            ComMenuSePlay(1);
            SeitonAtoraTipBoard();
        }
    }
    return result;
}

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

void AtoraNameDraw(int) {
    int prev_mes_no[3];
    int pos;
    int y;
    int i;
    int mes_no;
    int x;
    int alpha;
    EDITPARTS_INFO *info;

    MenuTextureReload(AtoraNameMes.tex_block);
    pos = MenuAtoraSel.board_pos - 1;
    for (int j = 0; j < 3; j++) {
        prev_mes_no[j] = AtoraNameMes.mes_no[j];
    }
    y = MenuAtoraSel.scroll_y + 92 + 130.0f * pos;
    for (i = 0; i < 3; i++) {
        if (y < 96 || y > 341) {
            mes_no = 999;
        } else {
            info = SearchAtoraInfo(pos);
            if (info != NULL) {
                mes_no = GetAtraMsgNo(MenuAtoraSel.map_no, info->parts_no);
            } else {
                mes_no = 999;
            }
        }
        AtoraNameMes.mes_no[i] = mes_no;
        x = GetMsgLengthMenu(&AtoraNameMes, mes_no);
        if (GetMenuLangFlag() == 0 && mes_no == 1000) {
            x = GetMsgLengthCharaName(0) + 3;
        }
        x = 186.0f - 58.0f * (x / 10.0f);
        if (GetMenuLangFlag() > 0) {
            if (mes_no == 2001) {
                x += 6;
            }
            if (mes_no == 2002) {
                x += 8;
            }
        }
        if (i >= 0 && i < 10) {
            AtoraNameMes.line_pos[i].x = x;
            AtoraNameMes.line_pos[i].y = y;
        }
        y += 130.0f;
        pos++;
    }
    for (int k = 0; k < 3; k++) {
        if (AtoraNameMes.mes_no[k] != prev_mes_no[k]) {
            AtoraNameMes.mes_made = -1;
            AtoraNameMes.MakeMesWin(210);
            break;
        }
    }
    alpha = MenuAtoraSel.name_alpha;
    switch (MenuAtoraSel.step) {
        case 7:
            alpha = 0x80 - MenuAtoraSel.step_count * 2;
            if (alpha < 0) {
                alpha = 0;
            }
            break;
        case 9:
            alpha = MenuAtoraSel.step_count * 2;
            if (alpha > 0x80) {
                alpha = 0x80;
            }
            break;
        case 8:
            alpha = 0;
            break;
    }
    AtoraNameMes.edge_alpha = alpha;
    AtoraNameMes.Step();
    AtoraNameMes.DrawMesWin();
    if (GetMenuAtraEventFlag() == 0) {
        AtoraBoardFadeEffect();
    }
}

#ifdef NON_MATCHING
static void OptionMenuDraw(int x, int y, int button_x, int button_y, int alpha) {
    int labels[12] = {10, 0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 11};
    int kinds[12] = {0, 0, 0, 1, 0, 0, 3, 0, 0, 0, 0, 2};
    int row_y = y;

    for (int i = 0; i < 12; i++) {
        CRect_i_ dest(0, 0, 0xD2, 0x18);
        CRect_i_ source(0, 0, 0xD2, 0x18);
        int label = labels[i];
        if (label < 7) {
            source.x = 0;
            source.y = label * 0x18;
        } else {
            source.x = source.width;
            source.y = (label - 7) * 0x18;
        }
        dest.x = x;
        dest.y = row_y + 1;
        DrawMenu2DSprite(MenuOption, dest, source, alpha);
        int kind = kinds[i];
        switch (kind) {
            case 2:
            case 1:
            case 0: {
                int setting = OptionMenu.flag[i] << 6;
                DrawMenu2DSprite(MenuOption, CRect_i_(x + 0xEE, row_y + 1, 0x40, 0x17),
                                 CRect_i_(setting, kind * 0x30 + 0xB0 + 1, 0x40, 0x18), alpha);
                DrawMenu2DSprite(MenuOption, CRect_i_(x + 0x136, row_y + 1, 0x40, 0x17),
                                 CRect_i_(setting >= 0x40 ? 0 : 0x40, (kind * 2 + 1) * 0x18 + 0xB0 + 1, 0x40, 0x18),
                                 alpha);
                break;
            }
            case 3: {
                int v = 0xB0;
                int cell_x = x + 0xEE;
                int setting = OptionMenu.flag[i];
                for (int j = 0; j < 3; j++) {
                    int u = 0xA0;
                    if (j == setting) {
                        u = 0x80;
                    }
                    DrawMenu2DSprite(MenuOption, CRect_i_(cell_x, row_y + 1, 0x20, 0x17), CRect_i_(u, v + 1, 0x20, 0x18),
                                     alpha);
                    v += 0x18;
                    cell_x += 0x24;
                }
                int u = 0;
                if (setting != 3) {
                    u = 0x40;
                }
                DrawMenu2DSprite(MenuOption, CRect_i_(cell_x, row_y + 1, 0x40, 0x17), CRect_i_(u, 0xC7, 0x40, 0x18),
                                 alpha);
                break;
            }
        }
        row_y += 0x1E;
        if (i == 5) {
            x += 0x230;
            row_y = y;
        }
    }
    DrawMenu2DSprite(MenuOption, CRect_i_(button_x, button_y, 0x3C, 0x1D), CRect_i_(0x1C4, 0xE2, 0x3C, 0x1D), alpha);
}
#else
INCLUDE_ASM("asm/nonmatchings/memcard", OptionMenuDraw__Fiiiii);
#endif

static void DrawOptionLRCur(int side, int alpha) {
    int cursor_x[2] = {32, 520};
    int v;

    v = side * 32 + 256;
    DrawMenu2DSprite(MenuOption, CRect_i_(cursor_x[side], 180, 96, 32), CRect_i_(416, v, 96, 32), alpha);
}

int InitMenuOption(int mode, int block_no, u_long128 *buffer) {
    u_long128 *data;
    CUserStatus *status;
    int i;

    switch ((int) buffer) {
        case 0:
            buffer = (u_long128 *) read_buffer;
    }
    data = MenuCalcBufAlignment(buffer);
    StartReadBG();
    if (LoadFileBGMenuData("option.pac", data) <= 0) {
        return 0;
    }
    OptionMenu.mode = mode;
    OptionMenu.block_no = block_no;
    switch (OptionMenu.mode) {
        case 0:
            GamePad.SetAutoRepeat(0xF000, 30, 5);
            GamePad.MenuModeOn(120);
    }
    OptionMenu.texture_ready = 0;
    OptionMenu.step = 1;
    OptionMenu.step_count = 0;
    OptionMenu.cursor = 10;
    OptionMenu.cursor_x = (OptionMenu.cursor % 10) * 70 + 316;
    OptionMenu.cursor_y = ((OptionMenu.cursor - 10) / 10) * 30 + 90;
    OptionMenu.page_x = 136.0f;
    OpConfigPt = (s32 *) SaveData->GetConfigData();
    status = (CUserStatus *) SaveData->GetDngStatus();
    OptionMenu.flag[0] = SaveData->GetMenuCursor()->reset_pos;
    OptionMenu.flag[1] = OpConfigPt[7];
    OptionMenu.flag[2] = OpConfigPt[4];
    OptionMenu.flag[3] = OpConfigPt[5];
    OptionMenu.flag[4] = OpConfigPt[2];
    OptionMenu.flag[5] = OpConfigPt[3];
    OptionMenu.flag[6] = status->minimap_status;
    OptionMenu.flag[7] = OpConfigPt[10];
    OptionMenu.flag[8] = OpConfigPt[9];
    OptionMenu.flag[9] = OpConfigPt[11];
    OptionMenu.flag[10] = OpConfigPt[8];
    OptionMenu.flag[11] = OpConfigPt[6];
    for (i = 0; i < 12; i++) {
        OptionMenu.prev_flag[i] = OptionMenu.flag[i];
    }
    return 1;
}
INCLUDE_RODATA("asm/nonmatchings/memcard", @2251);

/**
 * Stores whether the menus discard their saved positions in the saved menu
 * cursors.
 */
static inline void SetCursorResetPos(CMenuCursor *cursor, int reset) {
    cursor->reset_pos = reset;
}

/**
 * Closes the option screen, writing every setting the player changed back to
 * the configuration and the saved status.
 */
static void ExitMenuOption() {
    CUserStatus *status;
    CMenuCursor *cursor;

    if (OptionMenu.mode == 0) {
        GamePad.AutoRepeatOff();
        GamePad.MenuModeOff();
        GamePad.SetAutoRepeat(0x5000, 30, 9);
        GamePad.MenuModeOn(120);
    }
    status = (CUserStatus *) SaveData->GetDngStatus();
    cursor = SaveData->GetMenuCursor();
    SetCursorResetPos(cursor, OptionMenu.flag[0]);
    if (cursor->reset_pos) {
        cursor->InitPos();
    }
    OpConfigPt[7] = OptionMenu.flag[1];
    OpConfigPt[4] = OptionMenu.flag[2];
    OpConfigPt[5] = OptionMenu.flag[3];
    CSnd.SetStereoMode(OpConfigPt[5] ? 0 : 1);
    OpConfigPt[2] = OptionMenu.flag[4];
    OpConfigPt[3] = OptionMenu.flag[5];
    status->minimap_status = OptionMenu.flag[6];
    OpConfigPt[10] = OptionMenu.flag[7];
    OpConfigPt[9] = OptionMenu.flag[8];
    OpConfigPt[11] = OptionMenu.flag[9];
    OpConfigPt[8] = OptionMenu.flag[10];
    OpConfigPt[6] = OptionMenu.flag[11];
}

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

#ifdef NON_MATCHING
int MenuOptionKey() {
    int result = 0;

    switch (OptionMenu.step) {
        case 1:
            if (OptionMenu.texture_ready == 0) {
                ReadBG();
                if (ReadBGSync() == 0) {
                    LOADTEXTURE_INFO2 texture = {0};
                    texture.block_no = OptionMenu.block_no;
                    BG_READ_INFO *file = GetReadBGFile(0);
                    texture.name = (char *) GetPackFile((u_int *) file->buffer, "option.img", NULL);
                    TexManager.DeleteTextureBlock(OptionMenu.block_no);
                    TexManager.CleanUpTextureList();
                    TexManager.LoadTextureBlockEX(-1, &texture);
                    MenuOption = TexManager.GetTexture("option2", -1);
                    if (OptionMenu.mode == 0) {
                        InitMenuMesSet(0, (short *) GetPackFile((u_int *) file->buffer, "allmenu.mes", NULL));
                        CommonMenuMes2.MakeMesWin(0x15E);
                    }
                    OptionMenu.texture_ready = 1;
                }
            }
            if (OptionMenu.texture_ready != 0 && OptionMenu.step_count > 12) {
                OptionMenu.step = 0;
                OptionMenu.step_count = 0;
            }
            break;
        case 2:
            if (OptionMenu.step_count > 24) {
                ExitMenuOption();
                CommonMenuMes2.mes_made = -1;
                result = 1;
            }
            break;
        default: {
            int old_cursor = OptionMenu.cursor;
            int old_mode = OptionMenu.buttons;
            if (GamePad.Down(0xF) != 0) {
                if (OptionMenu.cursor / 10 - 1 < 6) {
                    OptionMenu.cursor += 60;
                } else {
                    OptionMenu.cursor -= 60;
                }
            }
            switch (OptionMenu.buttons) {
                case 0:
                    if (GamePad.Down(0x4000) != 0) {
                        int row = OptionMenu.cursor / 10 - 1;
                        if (row != 11 && row != 5) {
                            OptionMenu.cursor += 10;
                        } else {
                            OptionMenu.buttons = 1;
                        }
                    }
                    if (GamePad.Down(0x1000) != 0) {
                        int row = OptionMenu.cursor / 10 - 1;
                        if (row != 6 && row != 0) {
                            OptionMenu.cursor -= 10;
                        } else {
                            OptionMenu.buttons = 1;
                        }
                    }
                    if (GamePad.Down(0x2000) != 0) {
                        OptionMenu.cursor++;
                        if (OptionMenu.cursor / 10 - 1 != 6) {
                            if (OptionMenu.cursor % 10 == 2) {
                                OptionMenu.cursor -= 2;
                                OptionMenu.cursor += 60;
                                if (OptionMenu.cursor / 10 - 1 >= 12) {
                                    OptionMenu.cursor -= 120;
                                }
                            }
                        } else if (OptionMenu.cursor % 10 == 4) {
                            OptionMenu.cursor -= 64;
                        }
                    }
                    if (GamePad.Down(0x8000) != 0) {
                        if (OptionMenu.cursor % 10 != 0) {
                            OptionMenu.cursor--;
                        } else {
                            int row = OptionMenu.cursor / 10 - 1;
                            if (row != 0) {
                                if (row < 6) {
                                    OptionMenu.cursor += 60;
                                } else {
                                    OptionMenu.cursor -= 60;
                                }
                                OptionMenu.cursor++;
                            } else {
                                OptionMenu.cursor = 0x49;
                            }
                        }
                    }
                    if (OptionMenu.cursor / 10 - 1 != 6 && OptionMenu.cursor % 10 >= 2) {
                        OptionMenu.cursor--;
                    }
                    if (GamePad.Down(0x40) != 0) {
                        ComMenuSePlay(1);
                        OptionMenu.flag[OptionMenu.cursor / 10 - 1] = OptionMenu.cursor % 10;
                    }
                    break;
                case 1:
                    if (GamePad.Down(0x4000) != 0) {
                        OptionMenu.buttons = 0;
                        if (OptionMenu.cursor / 10 - 1 < 6) {
                            OptionMenu.cursor = 10;
                        } else {
                            OptionMenu.cursor = 60;
                        }
                    }
                    if (GamePad.Down(0x1000) != 0) {
                        OptionMenu.buttons = 0;
                        if (OptionMenu.cursor / 10 - 1 < 6) {
                            OptionMenu.cursor = 60;
                        } else {
                            OptionMenu.cursor = 120;
                        }
                    }
                    if (GamePad.Down(0x40) != 0) {
                        OptionMenu.step = 2;
                        OptionMenu.step_count = 0;
                        ComMenuSePlay(2);
                    } else if (GamePad.Down(0x80) != 0) {
                        InitOptionFlag();
                    } else if (GamePad.Down(0x10) != 0) {
                        PrevOptionSetFunc();
                    }
                    break;
            }
            if (old_cursor != OptionMenu.cursor || old_mode != OptionMenu.buttons) {
                ComMenuSePlay(0);
            }
            if (GamePad.Down(0x20) != 0) {
                OptionMenu.step = 2;
                OptionMenu.step_count = 0;
                ComMenuSePlay(2);
            }
            int mes_no = OptionMenu.cursor / 10 + 0x15D;
            if (OptionMenu.buttons == 1) {
                mes_no = 0x171;
            }
            if (CommonMenuMes2.mes_made != mes_no) {
                CommonMenuMes2.MakeMesWin(mes_no);
            }
            break;
        }
    }
    return result;
}
#else
INCLUDE_ASM("asm/nonmatchings/memcard", MenuOptionKey__Fv);
#endif
INCLUDE_RODATA("asm/nonmatchings/memcard", @2345);
INCLUDE_RODATA("asm/nonmatchings/memcard", @2346);
INCLUDE_RODATA("asm/nonmatchings/memcard", @2347);
#ifdef NON_MATCHING
void DrawMenuOption() {
    setbilinear(0);
    if (OptionMenu.texture_ready == 0) {
        return;
    }
    MenuTextureReload(OptionMenu.block_no);
    int alpha = 0x80;
    switch (OptionMenu.step) {
        case 0:
            break;
        case 1:
            alpha = OptionMenu.step_count * 7;
            break;
        case 2:
            alpha = 0x80 - OptionMenu.step_count * 7;
            break;
    }
    if (alpha >= 0x80) {
        alpha = 0x80;
    }
    if (alpha <= 0) {
        alpha = 0;
    }
    int row = OptionMenu.cursor / 10 - 1;
    int column = OptionMenu.cursor % 10;
    int page_x;
    if (row < 6) {
        page_x = 0x88;
    } else {
        page_x = -0x1A8;
    }
    OptionMenu.page_x += ((float) page_x - OptionMenu.page_x) / 4.0f;
    int x = (int) OptionMenu.page_x;
    OptionMenuDraw(x, 0x5A, 0x1AE, 0x122, alpha);
    int right = 1;
    if (x < -0x90) {
        right = 0;
    }
    DrawOptionLRCur(right, alpha);
    int target_x;
    int target_y;
    if (OptionMenu.buttons != 1) {
        target_x = column * 0x47 + 0x15C;
        if (row == 6) {
            if (column != 3) {
                target_x = column * 0x24 + 0x15C;
            } else {
                target_x = 0x1C8;
            }
        }
        if (row < 6) {
            target_y = row * 0x1E + 0x5A;
        } else {
            target_y = (row - 6) * 0x1E + 0x5A;
        }
    } else {
        target_x = 0x192;
        target_y = 0x126;
    }
    OptionMenu.cursor_x += ((float) target_x - OptionMenu.cursor_x) / 4.0f;
    OptionMenu.cursor_y += ((float) target_y - OptionMenu.cursor_y) / 4.0f;
    int width;
    if (OptionMenu.buttons != 1) {
        width = 0x3C;
        if (row == 6 && column != 3) {
            width = 0x24;
        }
    } else {
        width = 0x40;
    }
    if (OptionMenu.step != 2 && OptionMenu.step != 1) {
        static int OpMenuWakuCnt = 0;
        static int OptionCurCnt = 0;
        float shrink = 0.2f * OpMenuWakuCnt;
        int left = (int) ((float) (target_x + 0x14) + shrink);
        int top = (int) ((float) (target_y - 9) + shrink);
        int right_x = (int) ((float) (target_x + 0x14 + width) - shrink);
        int bottom = (int) ((float) (target_y + 0x11) - shrink);
        CRect_i_ corner(0xB2, 0xF8, 8, 8);
        DrawMenu2DSprite(MenuOption, CRect_i_(left, top, corner.width, corner.height), corner, alpha);
        int u = corner.x + corner.width;
        DrawMenu2DSprite(MenuOption, CRect_i_(right_x, top, corner.width, corner.height),
                         CRect_i_(u, corner.y, corner.width, corner.height), alpha);
        int v = corner.y + corner.height;
        DrawMenu2DSprite(MenuOption, CRect_i_(left, bottom, corner.width, corner.height),
                         CRect_i_(corner.x, v, corner.width, corner.height), alpha);
        DrawMenu2DSprite(MenuOption, CRect_i_(right_x, bottom, corner.width, corner.height),
                         CRect_i_(u, v, corner.width, corner.height), alpha);
        OpMenuWakuCnt++;
        if (OpMenuWakuCnt < 0 || OpMenuWakuCnt >= 30) {
            OpMenuWakuCnt = 0;
        }
        float hand_x = OptionMenu.cursor_x + 7.0f * cosf(0.0805537f * OptionCurCnt);
        float hand_y = OptionMenu.cursor_y + 5.0f * sinf(0.1163553f * OptionCurCnt);
        CRect_i_ hand(0xD2, 0xF8, 0x20, 0x20);
        DrawMenu2DSprite(MenuOption, CRect_i_((int) (5.0f + hand_x), (int) (3.0f + hand_y), 0x20, 0x20), hand, 0, 0, 0,
                         (alpha * 100) >> 7);
        DrawMenu2DSprite(MenuOption, CRect_i_((int) hand_x, (int) hand_y, 0x20, 0x20), hand, alpha);
        OptionCurCnt++;
        if (OptionCurCnt > 0x107AC0 || OptionCurCnt < 0) {
            OptionCurCnt = 0;
        }
    }
    if (OptionMenu.step != 0) {
        OptionMenu.step_count++;
    } else {
        OptionMenu.step_count = 0;
    }
    if (OptionMenu.mode == 0) {
        float win_x;
        float win_y;
        float win_w;
        float win_h;
        int text_x;
        int text_y;
        DrawMenu2DSprite(MenuOption, CRect_i_(0x50, 0x28, 0xAA, 0x28), CRect_i_(0xB3, 0x118, 0xAA, 0x28), alpha);
        GetMainMenuRightHelpWinLangOffset(win_x, win_y, win_w, win_h);
        int help_x = (int) win_x;
        MenuHelpWinDraw(help_x, (int) win_y, win_w, win_h, alpha);
        GetMainMenuRightHelpMsgLangOffset(text_x, text_y);
        CommonMenuMes2.edge_alpha = alpha;
        MenuTextureReload(CommonMenuMes2.tex_block);
        int mes_x = (int) (win_x + text_x);
        DrawMenuClsMes(&CommonMenuMes2, mes_x, (int) (win_y + text_y));
    }
    setbilinear(1);
}
#else
INCLUDE_ASM("asm/nonmatchings/memcard", DrawMenuOption__Fv);
#endif

int OptionMenuFadeOutStart() {
    int result = 0;

    if (OptionMenu.step == 2) {
        result = 1;
    }
    return result;
}

int InitMenuSave(int mode, int block_no, u_long128 *buffer) {
    u_long128 *data;
    int clear;

    data = buffer;
    if (buffer == NULL) {
        data = (u_long128 *) read_buffer;
    }
    data = MenuCalcBufAlignment(data);
    SaveMenu.unk_0 = mode;
    SaveMenu.block_no = block_no;
    SaveMenu.result = 0;
    SaveMenu.unk_28 = 0;
    SaveMenu.texture_ready = 0;
    SaveMenu.file_no = 0;
    SaveMenu.loaded = 0;
    StartReadBG();
    LoadFileBGMenuData("savetex.pak", data);
    if (McAccess.InitForMC()) {
        return 0;
    }
    switch (SaveMenu.unk_0) {
        case 0:
            GamePad.SetAutoRepeat(0xA000, 30, 5);
            GamePad.MenuModeOn(120);
            SaveMenu.key_no = 3;
            SaveMenu.unk_1C = 1;
            break;
        case 1:
            SaveMenu.key_no = 3;
            SaveMenu.unk_1C = 2;
            EditSave();
            break;
        case 2:
        case 3:
            clear = SaveMenu.unk_0 == 2;
            *(s32 *) &((SV_CONFIG_SYS *) SaveData->GetConfigData())->reserved_36[2] = clear;
            printf("SaveData clear flag = %d\n",
                   *(s32 *) &((SV_CONFIG_SYS *) SaveData->GetConfigData())->reserved_36[2]);
            GameClearFlag = SaveMenu.unk_0 == 2;
            SaveMenu.unk_0 = 2;
            GamePad.SetAutoRepeat(0xA000, 30, 5);
            GamePad.MenuModeOn(120);
            SaveMenu.key_no = 22;
            SaveMenu.unk_1C = 2;
            break;
    }
    SaveMenu.return_key_no = -1;
    CommonMenuMes2.stay_frame = 1;
    CommonMenuMes2.value_show = 1;
    CommonMenuMes2.auto_pos = 5;
    McAccess.SetFuncNo(1);
    CommonMenuMes2.cursor_lit = 1;
    return 1;
}

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

int MenuSaveKey() {
    int func_no;
    int result;
    int now_func_no;
    int msg_no;
    int value;
    MC_ERROR_INFO *error;
    MC_ERROR_INFO *last_error;

    if (!SaveMenu.texture_ready) {
        SaveMenu.texture_ready = SaveMenuTextureEnter();
    }
    func_no = McAccess.GetFuncNo();
    result = McAccess.Step();
    now_func_no = McAccess.GetFuncNo();
    if (func_no == now_func_no) {
        last_error = &McAccess.error;
        switch (now_func_no) {
            case 9:
                if (result < 0) {
                    SaveMenu.key_no = 14;
                    SaveMenu.unk_20 = 7;
                    McAccess.SetFuncNo(1);
                }
                break;
            case 3:
            case 5:
                if (result < 0) {
                    SaveMenu.key_no = 14;
                    SaveMenu.unk_20 = 8;
                    McAccess.SetFuncNo(1);
                }
                break;
            case 6:
                if (result < 0) {
                    SaveMenu.key_no = 14;
                    SaveMenu.unk_20 = 9;
                    McAccess.SetFuncNo(1);
                }
                break;
            case 2:
                last_error->code = 0;
            case 4:
                if (result < 0) {
                    SaveMenu.key_no = 14;
                    SaveMenu.unk_20 = 6;
                    McAccess.SetFuncNo(1);
                    break;
                }
                switch (last_error->code) {
                    case 0:
                        break;
                    case 1:
                        SaveMenu.return_key_no = SaveMenu.key_no;
                        SaveMenu.key_no = 19;
                        McAccess.SetFuncNo(1);
                        break;
                    case 2:
                    case 3:
                        break;
                    case 4:
                        SaveMenu.key_no = 14;
                        SaveMenu.unk_20 = 2;
                        break;
                }
                break;
        }
    } else {
        switch (func_no) {
            case 4:
                break;
            case 6:
                switch (SaveMenu.unk_0) {
                    case 0:
                        SaveMenu.key_no = 1;
                        SaveMenu.loaded = 1;
                        McAccess.DmySync();
                        break;
                    case 1:
                        EditLoad();
                        break;
                    case 2:
                        break;
                }
                break;
            case 7:
                error = &McAccess.error;
                switch (error->code) {
                    case 1:
                        McAccess.SetFuncNo(4);
                        McAccess.step = error->step;
                        if (SaveMenu.return_key_no >= 0) {
                            SaveMenu.key_no = SaveMenu.return_key_no;
                        }
                        if (McAccess.step > 49) {
                            McAccess.step = 0;
                        }
                        error->code = 0;
                        error->retry_count = 0;
                        break;
                    case 0:
                        McAccess.SetFuncNo(4);
                        break;
                }
                break;
            case 5:
                ComMenuSePlay(12);
                McAccess.SetFuncNo(4);
                break;
        }
    }
    switch (McAccess.GetFuncNo()) {
        case 1:
            SaveMenuFunc[SaveMenu.key_no]();
            break;
    }
    msg_no = GetSaveMenuMsgNo();
    if (CommonMenuMes2.mes_made != msg_no) {
        value = SaveMenu.file_no + 1;
        switch (msg_no - 250) {
            case 3:
            case 6:
            case 7:
            case 17:
            case 29:
            case 30:
                value = McAccess.port + 1;
                break;
        }
        CommonMenuMes2.value = value;
        if (msg_no == 299) {
            CommonMenuMes2.value = McAccess.error.file_no;
        }
        printf("msgno = %d\n", msg_no);
        CommonMenuMes2.MakeMesWin(msg_no);
    }
    return SaveMenu.result;
}
#ifdef NON_MATCHING
void DrawMenuSave(char *) {
    if (SaveMenu.texture_ready == 0) {
        return;
    }
    setbilinear(0);
    switch (SaveMenu.unk_0) {
        case 1:
        case 0:
            break;
        case 2:
            AllFillBoxForMenu(0, 0, 0, 0x80);
            break;
    }
    int alpha = 0x80;
    switch (SaveMenu.key_no) {
        case 0:
            alpha = SaveMenu.unk_28 * 6;
            if (alpha > 0x80) {
                alpha = 0x80;
            }
            break;
        case 1:
            alpha = 0x80 - SaveMenu.unk_28 * 4;
            if (alpha < 0) {
                alpha = 0;
            }
            break;
    }
    MenuTextureReload(SaveMenu.block_no);
    float board_y = SaveMenu.unk_10;
    SaveMenu.unk_10 = (int) (board_y + ((150.0f - 150.0f * SaveMenu.file_no) - board_y) / 4.0f);
    float y = SaveMenu.unk_10;
    int bright = 0x80;
    int key = SaveMenu.key_no;
    if (key == 19 || key == 17 || key == 14 || key == 13 || key == 12 || key == 9) {
        bright = 0x40;
    }
    int show = 0;
    if (key == 13 || key == 12 || key == 9 || key == 8 || key == 7) {
        show = 1;
    }
    if (SaveMenu.key_no == 1 && SaveMenu.unk_0 == 0 && SaveMenu.loaded != 0) {
        show = 1;
    }
    if (show != 0 && (unsigned int) (McAccess.GetFuncNo() - 4) >= 2U) {
        if (McAccess.file_info != NULL) {
            for (int i = 0; i < 12; i++) {
                SAVEDATA_INFO *file = &McAccess.file_info[i];
                if (file != NULL) {
                    if (file->state == 0) {
                        int board_x = (int) 140.0f;
                        DrawNewFileTemplete(board_x, (int) y, alpha);
                    } else {
                        int board_x = (int) 140.0f;
                        DrawSaveBoard(file, SaveMenuMojiTextbl, board_x, (int) y, bright, alpha);
                    }
                    y += 150.0f;
                }
            }
        } else {
            printf("mcinfo is NULL\n");
        }
    }
    float text_pos[2] = {0.0f, 0.0f};
    CommonMenuMes2.auto_pos = -1;
    switch (McAccess.GetFuncNo()) {
        case 1:
            switch (SaveMenu.key_no) {
                case 2:
                    text_pos[0] = 240.0f;
                    text_pos[1] = 154.0f;
                    CommonMenuMes2.auto_pos = 5;
                    break;
                case 17:
                case 3:
                case 16:
                case 15:
                    text_pos[0] = 184.0f;
                    text_pos[1] = 152.0f;
                    CommonMenuMes2.auto_pos = 5;
                    break;
                case 12:
                case 9:
                    text_pos[0] = 246.0f;
                    text_pos[1] = 156.0f;
                    CommonMenuMes2.auto_pos = 5;
                    break;
                case 19:
                    text_pos[0] = 196.0f;
                    text_pos[1] = 140.0f;
                    CommonMenuMes2.auto_pos = 5;
                    break;
                case 14:
                    text_pos[0] = 230.0f;
                    text_pos[1] = 140.0f;
                    CommonMenuMes2.auto_pos = 5;
                case 22:
                    text_pos[0] = 196.0f;
                    text_pos[1] = 140.0f;
                    CommonMenuMes2.auto_pos = 5;
                case 11:
                case 25:
                    text_pos[0] = 196.0f;
                    text_pos[1] = 140.0f;
                    CommonMenuMes2.auto_pos = 5;
                    break;
            }
            break;
        case 7:
            text_pos[0] = 216.0f;
            text_pos[1] = 180.0f;
            CommonMenuMes2.auto_pos = 5;
            break;
        default:
            text_pos[0] = 184.0f;
            text_pos[1] = 152.0f;
            CommonMenuMes2.auto_pos = 5;
            break;
    }
    MenuTextureReload(CommonMenuMes2.tex_block);
    CommonMenuMes2.edge_alpha = alpha;
    if (CommonMenuMes2.edge_alpha > 0x80) {
        CommonMenuMes2.edge_alpha = 0x80;
    }
    if (CommonMenuMes2.edge_alpha < 0) {
        CommonMenuMes2.edge_alpha = 0;
    }
    int mes_x = (int) text_pos[0];
    DrawMenuClsMes(&CommonMenuMes2, mes_x, (int) text_pos[1]);
    int hand_x = -1;
    int hand_y = -1;
    CommonMenuMes2.cursor_row = -1;
    switch (SaveMenu.key_no) {
        case 3:
        case 2:
            CommonMenuMes2.cursor_row = SaveMenu.file_no + 2;
            break;
        case 7:
            if (McAccess.GetFuncNo() != 4 && McAccess.GetFuncNo() != 5) {
                hand_x = 0x78;
                hand_y = 0xBC;
            }
            break;
    }
    if (hand_x > 0 && hand_y > 0) {
        static int ct = 0;
        CRect_i_ size(0, 0, 0x20, 0x20);
        float draw_x = (float) hand_x + 7.0f * cosf(0.0805537f * ct);
        float draw_y = (float) hand_y + 5.0f * sinf(0.1163553f * ct);
        CRect_i_ source(0x160, 0xD6, 0x20, 0x20);
        DrawMenu2DSprite(SaveBoard, CRect_i_((int) (5.0f + draw_x), (int) (3.0f + draw_y), size.width, size.height),
                         source, 0, 0, 0, alpha);
        DrawMenu2DSprite(SaveBoard, CRect_i_((int) draw_x, (int) draw_y, size.width, size.height), source, alpha);
        ct++;
        if (!((float) ct < 105299.0f)) {
            ct = 0;
        }
    }
    if (SaveMenu.key_no != 0 && SaveMenu.key_no != 3 && SaveMenu.key_no != 1) {
        SaveMenu.unk_28 = 0;
    } else {
        SaveMenu.unk_28++;
    }
    switch (SaveMenu.unk_0) {
        case 0:
            DrawMenu2DSprite(SaveBoard, CRect_i_(0x46, 0x32, 0x3A, 0x27), CRect_i_(0x110, 0xD8, 0x3A, 0x28), alpha);
            DrawMenu2DSprite(SaveBoard, CRect_i_(0x86, 0x37, 0x4A, 0x1E), CRect_i_(0x110, 0x100, 0x4A, 0x1E), alpha);
            return;
        case 2:
            DrawMainMenuIcon(0x46, 0x32, 5, 1, 0x80, alpha);
            break;
    }
}
#else
INCLUDE_ASM("asm/nonmatchings/memcard", DrawMenuSave__FPc);
#endif
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

static int SaveMenuKeyFileSelect() {
    int prev_file;
    SAVEDATA_INFO *info;

    prev_file = SaveMenu.file_no;
    if (GamePad.Down(0x4000)) {
        SaveMenu.file_no++;
        if (SaveMenu.file_no >= 12) {
            SaveMenu.file_no--;
        }
    }
    if (GamePad.Down(0x1000) && 0 < SaveMenu.file_no) {
        SaveMenu.file_no--;
    }
    if (prev_file != SaveMenu.file_no) {
        ComMenuSePlay(0);
    }
    if (GamePad.Down(0x20)) {
        SaveMenu.key_no = 3;
        SaveMenu.file_no = McAccess.port;
        SaveMenu.unk_28 = 0;
        ComMenuSePlay(2);
        return 1;
    }
    if (GamePad.Down(0x40)) {
        switch (SaveMenu.unk_1C) {
            case 2:
                SaveMenu.key_no = 8;
                McAccess.SetFuncNo(0);
                break;
            case 1:
                info = &McAccess.file_info[SaveMenu.file_no];
                if (info->state) {
                    SaveMenu.key_no = 12;
                } else {
                    ComMenuSePlay(2);
                }
                break;
        }
        ComMenuSePlay(1);
        return 1;
    }
    return 1;
}
