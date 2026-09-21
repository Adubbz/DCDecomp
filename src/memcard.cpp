#include "memcard.hpp"

#include <cmath>

#include "battle_globals.hpp"
#include "clsmes.hpp"
#include "dataread.hpp"
#include "editatra.hpp"
#include "editpartsinfo.hpp"
#include "gamepad.hpp"
#include "memorycardaccess.hpp"
#include "menu_draw.hpp"
#include "mglib.hpp"
#include "rect.hpp"
#include "savedata.hpp"
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
INCLUDE_ASM("asm/nonmatchings/memcard", DrawMenuHelpWindow__FP8CTextureiiiffi);
INCLUDE_ASM("asm/nonmatchings/memcard", MenuHelpWinDraw__FiiffiiiP8CTexture);
INCLUDE_ASM("asm/nonmatchings/memcard", MenuHelpWinDraw2__FiiffiiiP8CTexture);
INCLUDE_ASM("asm/nonmatchings/memcard", MenuHelpWinDraw__Fiiffi);
INCLUDE_ASM("asm/nonmatchings/memcard", DrawMenuWaku__FffiiiP8CTexturei);

int DrawMenuNumber(int x, int y, int number, CTexture *texture, RECT rect, int overlap, int flag) {
    return DrawMenuNumber(x, y, number, rect, texture, overlap, 0, 0x1C0, flag);
}

INCLUDE_ASM("asm/nonmatchings/memcard", DrawMenuNumber__Fiii4RECTP8CTextureiUcUcUci);
INCLUDE_ASM("asm/nonmatchings/memcard", DrawMenuNumber__Fiii4RECTP8CTextureiiii);
INCLUDE_ASM("asm/nonmatchings/memcard", GetMsgLengthMenu__FP6ClsMesi);
/**
 * Gives the texture and the cell within it that one georama element draws from.
 *
 * @mangled RetCTexAtora__FiRiRi
 * @address 0x2181E0
 * @size 0xD8
 */
INCLUDE_ASM("asm/nonmatchings/memcard", RetCTexAtora__FiRiRi);
INCLUDE_ASM("asm/nonmatchings/memcard", DrawAtoraParts__Fiiiiii);

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

INCLUDE_ASM("asm/nonmatchings/memcard", AtoraAllTipGet__Fi);

static int AlreadyPeopleTalk(int map_no, int chip_no) {
    SV_GRD_NPC *npc;

    npc = SaveData->GetGrdNPCData(map_no, chip_no - 40);
    if (npc == NULL || chip_no - 40 < 0) {
        return 1;
    }
    return npc->talk_message;
}

INCLUDE_ASM("asm/nonmatchings/memcard", AtoraCompOrEvent__FP14EDITPARTS_INFO);

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
INCLUDE_ASM("asm/nonmatchings/memcard", AtoraTipHoleTexInfoGet__FiPUc);
INCLUDE_ASM("asm/nonmatchings/memcard", AtoraPlateDrawHaichiBar__FP14EDITPARTS_INFOiii);
INCLUDE_ASM("asm/nonmatchings/memcard", DrawAtraBuildNum__FP14EDITPARTS_INFOiii);
INCLUDE_ASM("asm/nonmatchings/memcard", DrawAtora__Fiiii);
INCLUDE_ASM("asm/nonmatchings/memcard", DrawAtoraNothing__Fiii);
INCLUDE_ASM("asm/nonmatchings/memcard", DrawMsgAtraWarning__FP6ClsMesii);
INCLUDE_ASM("asm/nonmatchings/memcard", AtoraTipInfoInit__Fv);
INCLUDE_ASM("asm/nonmatchings/memcard", GetMenuAtraEventFlag__Fv);
INCLUDE_ASM("asm/nonmatchings/memcard", SetMenuAtraEventFlag__Fi);
INCLUDE_ASM("asm/nonmatchings/memcard", MenuAtoraAfterFadeIn__Fv);
INCLUDE_ASM("asm/nonmatchings/memcard", InitMenuAtora1__FiiPiP1);
INCLUDE_ASM("asm/nonmatchings/memcard", InitMenuAtoraSelect__Fi);
INCLUDE_RODATA("asm/nonmatchings/memcard", @1397);
INCLUDE_ASM("asm/nonmatchings/memcard", ExitAtoraSelect__Fv);
INCLUDE_ASM("asm/nonmatchings/memcard", AtoraTexInfoGet__Fv);
INCLUDE_RODATA("asm/nonmatchings/memcard", @1410);
INCLUDE_RODATA("asm/nonmatchings/memcard", @1411);
INCLUDE_RODATA("asm/nonmatchings/memcard", @1412);
INCLUDE_RODATA("asm/nonmatchings/memcard", @1413);
INCLUDE_RODATA("asm/nonmatchings/memcard", @1414__2);
INCLUDE_RODATA("asm/nonmatchings/memcard", @1415__2);
INCLUDE_RODATA("asm/nonmatchings/memcard", @1416);
INCLUDE_RODATA("asm/nonmatchings/memcard", @1417);
INCLUDE_ASM("asm/nonmatchings/memcard", DrawMenuAtoraSelect__Fv);
INCLUDE_RODATA("asm/nonmatchings/memcard", @1502);
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

INCLUDE_ASM("asm/nonmatchings/memcard", CompTip__Fii);
INCLUDE_ASM("asm/nonmatchings/memcard", SeitonAtoraTipBoardSub__Fv);
INCLUDE_ASM("asm/nonmatchings/memcard", SeitonAtoraTipBoard__Fv);
INCLUDE_ASM("asm/nonmatchings/memcard", MenuAtoraSelectKey__Fv);
INCLUDE_ASM("asm/nonmatchings/memcard", AtoraBoardKey__Fv);
INCLUDE_ASM("asm/nonmatchings/memcard", AtoraTipKey__Fv);
INCLUDE_ASM("asm/nonmatchings/memcard", AtoraMenuTipCancel__Fv);
INCLUDE_ASM("asm/nonmatchings/memcard", AtoraBoardFadeEffect__Fv);
INCLUDE_ASM("asm/nonmatchings/memcard", AtoraNameDraw__Fi);
INCLUDE_ASM("asm/nonmatchings/memcard", OptionMenuDraw__Fiiiii);
INCLUDE_ASM("asm/nonmatchings/memcard", DrawOptionLRCur__Fii);
INCLUDE_ASM("asm/nonmatchings/memcard", InitMenuOption__FiiP1);
INCLUDE_RODATA("asm/nonmatchings/memcard", @2211);
INCLUDE_RODATA("asm/nonmatchings/memcard", @2251);
INCLUDE_ASM("asm/nonmatchings/memcard", ExitMenuOption__Fv);
INCLUDE_ASM("asm/nonmatchings/memcard", InitOptionFlag__Fv);
INCLUDE_ASM("asm/nonmatchings/memcard", PrevOptionSetFunc__Fv);
INCLUDE_ASM("asm/nonmatchings/memcard", MenuOptionKey__Fv);
INCLUDE_RODATA("asm/nonmatchings/memcard", @2345);
INCLUDE_RODATA("asm/nonmatchings/memcard", @2346);
INCLUDE_RODATA("asm/nonmatchings/memcard", @2347);
INCLUDE_ASM("asm/nonmatchings/memcard", DrawMenuOption__Fv);
INCLUDE_ASM("asm/nonmatchings/memcard", OptionMenuFadeOutStart__Fv);
INCLUDE_ASM("asm/nonmatchings/memcard", InitMenuSave__FiiP1);
INCLUDE_RODATA("asm/nonmatchings/memcard", @2503);
INCLUDE_RODATA("asm/nonmatchings/memcard", @2504);
INCLUDE_ASM("asm/nonmatchings/memcard", ExitSaveSelect__Fv);
INCLUDE_ASM("asm/nonmatchings/memcard", MenuSaveKey__Fv);
INCLUDE_RODATA("asm/nonmatchings/memcard", @2597__2);
INCLUDE_ASM("asm/nonmatchings/memcard", DrawMenuSave__FPc);
INCLUDE_RODATA("asm/nonmatchings/memcard", @2730);
INCLUDE_ASM("asm/nonmatchings/memcard", SaveMenuKeyFadeIn__Fv);
INCLUDE_ASM("asm/nonmatchings/memcard", SaveMenuKeyFadeOut__Fv);
INCLUDE_ASM("asm/nonmatchings/memcard", SaveMenuKeyModeSelect__Fv);
INCLUDE_ASM("asm/nonmatchings/memcard", SaveMenuKeyMcSelect__Fv);
INCLUDE_ASM("asm/nonmatchings/memcard", SaveMenuKeyCheckMcType__Fv);
INCLUDE_ASM("asm/nonmatchings/memcard", SaveMenuKeyCheckMc__Fv);
INCLUDE_RODATA("asm/nonmatchings/memcard", @2823);
INCLUDE_RODATA("asm/nonmatchings/memcard", @2824);
INCLUDE_RODATA("asm/nonmatchings/memcard", @2825);
INCLUDE_ASM("asm/nonmatchings/memcard", SaveMenuKeyLoadConfig__Fv);
INCLUDE_ASM("asm/nonmatchings/memcard", SaveMenuKeyFileSelect__Fv);
