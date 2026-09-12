#include "memcard.hpp"

#include "battle_globals.hpp"
#include "clsmes.hpp"
#include "dataread.hpp"
#include "editatra.hpp"
#include "editpartsinfo.hpp"
#include "gamepad.hpp"
#include "memorycardaccess.hpp"
#include "menu_draw.hpp"
#include "rect.hpp"
#include "savedata.hpp"
#include "texture.hpp"

// The chip attachment record is opaque to every unit; only the unit's own
// functions take a pointer to it.
struct EDIT_CHIP_ATTACH_DATA;

/* The unit's own functions, in the order retail defines them. Each is static in
   retail's symbol table, so it is declared here rather than in the header. */

/**
 * Returns the georama part record the board's n-th occupied slot holds.
 *
 * @mangled SearchAtoraInfo__Fi
 * @address 0x218470
 * @size 0x90
 */
static EDITPARTS_INFO *SearchAtoraInfo(int);

/**
 * Returns whether every chip of a georama part has been acquired.
 *
 * @mangled AtoraAllTipGet__Fi
 * @address 0x218500
 * @size 0xA0
 */
static int AtoraAllTipGet(int);

/**
 * Returns whether the player has already spoken to a georama resident.
 *
 * @mangled AlreadyPeopleTalk__Fii
 * @address 0x2185A0
 * @size 0x70
 */
static int AlreadyPeopleTalk(int, int);

/**
 * Returns whether a georama part is complete or is still waiting on its event.
 *
 * @mangled AtoraCompOrEvent__FP14EDITPARTS_INFO
 * @address 0x218610
 * @size 0x170
 */
static int AtoraCompOrEvent(EDITPARTS_INFO *);

/**
 * Returns how many board slots a georama ground offers.
 *
 * @mangled AtraBoardMaxNum__Fi
 * @address 0x218780
 * @size 0x90
 */
static int AtraBoardMaxNum(int);

/**
 * Returns the placement state of one chip of a georama part.
 *
 * @mangled AtoraTipStatusSearch__FP14EDITPARTS_INFOi
 * @address 0x218810
 * @size 0xD0
 */
static int AtoraTipStatusSearch(EDITPARTS_INFO *, int);

/**
 * Returns whether a chip attachment may be shown on the board.
 *
 * @mangled AtraTipCanDisplay__FP21EDIT_CHIP_ATTACH_DATA
 * @address 0x2188E0
 * @size 0x80
 */
static int AtraTipCanDisplay(EDIT_CHIP_ATTACH_DATA *);

/**
 * Draws the links between a georama chip and the chips it is attached to.
 *
 * @mangled AtoraTipRelationDraw__FiiP14EDITPARTS_INFOiii
 * @address 0x218960
 * @size 0x200
 */
static void AtoraTipRelationDraw(int, int, EDITPARTS_INFO *, int, int, int);

/**
 * Fills in which of the six board directions the cursor may move in.
 *
 * @mangled AtoraBoardEnableMovePos__FiPi
 * @address 0x218B60
 * @size 0x110
 */
static void AtoraBoardEnableMovePos(int, int *);

/**
 * Returns the nearest occupied board slot at or below a position.
 *
 * @mangled AtoraBoardGoToPos__FPiii
 * @address 0x218C70
 * @size 0x50
 */
static int AtoraBoardGoToPos(int *, int, int);

/**
 * Returns the message number the board shows for the selected part.
 *
 * @mangled AtoraMsgNoGet__Fiii
 * @address 0x218DA0
 * @size 0x200
 */
static int AtoraMsgNoGet(int, int, int);

/**
 * Returns the message number for a chip on its own.
 *
 * @mangled AtoraTipOnlyMsgNoGet__Fii
 * @address 0x218FA0
 * @size 0x60
 */
static int AtoraTipOnlyMsgNoGet(int, int);

/**
 * Draws a chip's icon as either the object or the resident it stands for.
 *
 * @mangled AtoraTipObjectOrPerson__Fiiiii
 * @address 0x2190E0
 * @size 0xE0
 */
static void AtoraTipObjectOrPerson(int, int, int, int, int);

/**
 * Answers which socket graphic a chip slot uses.
 *
 * @mangled AtoraTipHoleTexInfoGet__FiPUc
 * @address 0x2191C0
 * @size 0x50
 */
static int AtoraTipHoleTexInfoGet(int, unsigned char *);

/**
 * Draws the placement bar under a georama part's plate.
 *
 * @mangled AtoraPlateDrawHaichiBar__FP14EDITPARTS_INFOiii
 * @address 0x219210
 * @size 0xE0
 */
static void AtoraPlateDrawHaichiBar(EDITPARTS_INFO *, int, int, int);

/**
 * Draws the empty georama board.
 *
 * @mangled DrawAtoraNothing__Fiii
 * @address 0x219CC0
 * @size 0x300
 */
static void DrawAtoraNothing(int, int, int);

/**
 * Draws the georama warning message window.
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
 * @size 0x30
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
 * Puts up the board's message window once the screen has faded in.
 *
 * @mangled MenuAtoraAfterFadeIn__Fv
 * @address 0x21A0B0
 * @size 0x80
 */
static void MenuAtoraAfterFadeIn();

/**
 * Releases the georama board screen's message windows and cursor.
 *
 * @mangled ExitAtoraSelect__Fv
 * @address 0x21A890
 * @size 0xD0
 */
static void ExitAtoraSelect();

/**
 * Looks up the textures the georama board draws from.
 *
 * @mangled AtoraTexInfoGet__Fv
 * @address 0x21A960
 * @size 0x120
 */
static void AtoraTexInfoGet();

/**
 * Draws the georama board screen's board, panels and cursor.
 *
 * @mangled DrawAtoraSelect__Fi
 * @address 0x21AE80
 * @size 0xFF0
 */
static void DrawAtoraSelect(int);

/**
 * Loads the georama board screen's texture block.
 *
 * @mangled AtoraTextureEnter__Fv
 * @address 0x21BE70
 * @size 0x1B0
 */
static int AtoraTextureEnter();

/**
 * Returns which of the three chip groups a chip number belongs to.
 *
 * @mangled GetTipKind__Fi
 * @address 0x21C020
 * @size 0x70
 */
static int GetTipKind(int);

/**
 * Orders two chips by group and number for the board's sort.
 *
 * @mangled CompTip__Fii
 * @address 0x21C090
 * @size 0xD0
 */
static int CompTip(int, int);

/**
 * Makes one pass of the chip board's sort, and says whether it swapped.
 *
 * @mangled SeitonAtoraTipBoardSub__Fv
 * @address 0x21C160
 * @size 0x110
 */
static int SeitonAtoraTipBoardSub();

/**
 * Sorts the chip board into group and number order.
 *
 * @mangled SeitonAtoraTipBoard__Fv
 * @address 0x21C270
 * @size 0x70
 */
static void SeitonAtoraTipBoard();

/**
 * Steps the board cursor, and says whether the board is still in control.
 *
 * @mangled AtoraBoardKey__Fv
 * @address 0x21CA90
 * @size 0xA30
 */
static int AtoraBoardKey();

/**
 * Steps the chip cursor, and says whether the chip board is still in control.
 *
 * @mangled AtoraTipKey__Fv
 * @address 0x21D4C0
 * @size 0x300
 */
static int AtoraTipKey();

/**
 * Returns control from the chip board to the part board.
 *
 * @mangled AtoraMenuTipCancel__Fv
 * @address 0x21D7C0
 * @size 0xD0
 */
static void AtoraMenuTipCancel();

/**
 * Draws the board's edge fade.
 *
 * @mangled AtoraBoardFadeEffect__Fv
 * @address 0x21D890
 * @size 0x3D0
 */
static void AtoraBoardFadeEffect();

/**
 * Draws one option row's label and setting.
 *
 * @mangled OptionMenuDraw__Fiiiii
 * @address 0x21E020
 * @size 0x430
 */
static void OptionMenuDraw(int, int, int, int, int);

/**
 * Draws the left and right arrows beside the selected option.
 *
 * @mangled DrawOptionLRCur__Fii
 * @address 0x21E450
 * @size 0x80
 */
static void DrawOptionLRCur(int, int);

/**
 * Applies the option settings and releases the screen.
 *
 * @mangled ExitMenuOption__Fv
 * @address 0x21E780
 * @size 0x190
 */
static void ExitMenuOption();

/**
 * Loads the option rows from the saved configuration.
 *
 * @mangled InitOptionFlag__Fv
 * @address 0x21E910
 * @size 0x50
 */
static void InitOptionFlag();

/**
 * Writes the option rows back to the saved configuration.
 *
 * @mangled PrevOptionSetFunc__Fv
 * @address 0x21E960
 * @size 0x50
 */
static void PrevOptionSetFunc();

/**
 * Applies the configuration the save screen loaded and releases it.
 *
 * @mangled ExitSaveSelect__Fv
 * @address 0x21FD80
 * @size 0x150
 */
static void ExitSaveSelect();

/**
 * Steps the save screen's fade in, and says whether it is done.
 *
 * @mangled SaveMenuKeyFadeIn__Fv
 * @address 0x220D90
 * @size 0x40
 */
static int SaveMenuKeyFadeIn();

/**
 * Steps the save screen's fade out, and says whether it is done.
 *
 * @mangled SaveMenuKeyFadeOut__Fv
 * @address 0x220DD0
 * @size 0x70
 */
static int SaveMenuKeyFadeOut();

/**
 * Steps the save or load choice, and says whether it is done.
 *
 * @mangled SaveMenuKeyModeSelect__Fv
 * @address 0x220E40
 * @size 0x130
 */
static int SaveMenuKeyModeSelect();

/**
 * Steps the memory card slot choice, and says whether it is done.
 *
 * @mangled SaveMenuKeyMcSelect__Fv
 * @address 0x220F70
 * @size 0x230
 */
static int SaveMenuKeyMcSelect();

/**
 * Steps the card type check, and says whether it is done.
 *
 * @mangled SaveMenuKeyCheckMcType__Fv
 * @address 0x2211A0
 * @size 0xC0
 */
static int SaveMenuKeyCheckMcType();

/**
 * Steps the card contents check, and says whether it is done.
 *
 * @mangled SaveMenuKeyCheckMc__Fv
 * @address 0x221260
 * @size 0x250
 */
static int SaveMenuKeyCheckMc();

/**
 * Applies the configuration read from the card, and says it is done.
 *
 * @mangled SaveMenuKeyLoadConfig__Fv
 * @address 0x2214B0
 * @size 0x80
 */
static int SaveMenuKeyLoadConfig();

/**
 * Steps the save file choice, and says whether it is done.
 *
 * @mangled SaveMenuKeyFileSelect__Fv
 * @address 0x221530
 * @size 0x200
 */
static int SaveMenuKeyFileSelect();

INCLUDE_ASM("asm/nonmatchings/memcard", McCheckMCPs2__FP12MC_CARD_INFO);
INCLUDE_ASM("asm/nonmatchings/memcard", DrawObjectVibe__FiiP8CTexture8CRect_i_Uci);
INCLUDE_ASM("asm/nonmatchings/memcard", DrawObjectVibe__FiiP8CTexture4RECTUci);
INCLUDE_ASM("asm/nonmatchings/memcard", DrawMenuObjectVibe__Fiiii);
INCLUDE_ASM("asm/nonmatchings/memcard", DrawMenuHelpWindow__FP8CTextureiiiffi);
INCLUDE_ASM("asm/nonmatchings/memcard", MenuHelpWinDraw__FiiffiiiP8CTexture);
INCLUDE_ASM("asm/nonmatchings/memcard", MenuHelpWinDraw2__FiiffiiiP8CTexture);
INCLUDE_ASM("asm/nonmatchings/memcard", MenuHelpWinDraw__Fiiffi);
INCLUDE_ASM("asm/nonmatchings/memcard", DrawMenuWaku__FffiiiP8CTexturei);
INCLUDE_ASM("asm/nonmatchings/memcard", DrawMenuNumber__FiiiP8CTexture4RECTii);
INCLUDE_ASM("asm/nonmatchings/memcard", DrawMenuNumber__Fiii4RECTP8CTextureiUcUcUci);
INCLUDE_ASM("asm/nonmatchings/memcard", DrawMenuNumber__Fiii4RECTP8CTextureiiii);
INCLUDE_ASM("asm/nonmatchings/memcard", GetMsgLengthMenu__FP6ClsMesi);
INCLUDE_ASM("asm/nonmatchings/memcard", RetCTexAtora__FiRiRi);
INCLUDE_ASM("asm/nonmatchings/memcard", DrawAtoraParts__Fiiiiii);
INCLUDE_ASM("asm/nonmatchings/memcard", SearchAtoraInfo__Fi);
INCLUDE_ASM("asm/nonmatchings/memcard", AtoraAllTipGet__Fi);
INCLUDE_ASM("asm/nonmatchings/memcard", AlreadyPeopleTalk__Fii);
INCLUDE_ASM("asm/nonmatchings/memcard", AtoraCompOrEvent__FP14EDITPARTS_INFO);
INCLUDE_ASM("asm/nonmatchings/memcard", AtraBoardMaxNum__Fi);
INCLUDE_ASM("asm/nonmatchings/memcard", AtoraTipStatusSearch__FP14EDITPARTS_INFOi);
INCLUDE_ASM("asm/nonmatchings/memcard", AtraTipCanDisplay__FP21EDIT_CHIP_ATTACH_DATA);
INCLUDE_ASM("asm/nonmatchings/memcard", AtoraTipRelationDraw__FiiP14EDITPARTS_INFOiii);
INCLUDE_ASM("asm/nonmatchings/memcard", AtoraBoardEnableMovePos__FiPi);
INCLUDE_ASM("asm/nonmatchings/memcard", AtoraBoardGoToPos__FPiii);
INCLUDE_ASM("asm/nonmatchings/memcard", GetAtraMsgNo__Fii);
INCLUDE_ASM("asm/nonmatchings/memcard", AtoraMsgNoGet__Fiii);
INCLUDE_ASM("asm/nonmatchings/memcard", AtoraTipOnlyMsgNoGet__Fii);
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
INCLUDE_ASM("asm/nonmatchings/memcard", GetTipKind__Fi);
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
