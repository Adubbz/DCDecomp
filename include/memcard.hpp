#pragma once

#include "common.h"

// Forward declarations for the types these declarations name. The skeleton
// headers are generated from the retail symbol table, which knows the type
// names but not where they live.
class CRect_i_;
class CTexture;
class ClsMes;
struct EDITPARTS_INFO;
struct EDIT_CHIP_ATTACH_DATA;
struct MC_CARD_INFO;
struct RECT;

/**
 * Reports whether a memory card entry describes a PlayStation 2 card.
 *
 * @mangled McCheckMCPs2__FP12MC_CARD_INFO
 * @address 0x216D50
 * @size 0x40
 */
int McCheckMCPs2(MC_CARD_INFO *);

/**
 * Draws a menu sprite rocking about its own centre.
 *
 * @mangled DrawObjectVibe__FiiP8CTexture8CRect_i_Uci
 * @address 0x216D90
 * @size 0x140
 */
void DrawObjectVibe(int, int, CTexture *, CRect_i_, unsigned char, int);

/**
 * Draws a rocking menu sprite whose source rectangle is given by the plain C name.
 *
 * @mangled DrawObjectVibe__FiiP8CTexture4RECTUci
 * @address 0x216ED0
 * @size 0x70
 */
void DrawObjectVibe(int, int, CTexture *, RECT, unsigned char, int);

/**
 * Draws one rocking icon of the common menu texture.
 *
 * @mangled DrawMenuObjectVibe__Fiiii
 * @address 0x216F40
 * @size 0xD0
 */
void DrawMenuObjectVibe(int, int, int, int);

/**
 * Draws a help window of the given size from its nine-patch texture.
 *
 * @mangled DrawMenuHelpWindow__FP8CTextureiiiffi
 * @address 0x217010
 * @size 0x390
 */
void DrawMenuHelpWindow(CTexture *, int, int, int, float, float, int);

/**
 * Draws a help window with the corner and edge tiles the caller names.
 *
 * @mangled MenuHelpWinDraw__FiiffiiiP8CTexture
 * @address 0x2173A0
 * @size 0x370
 */
void MenuHelpWinDraw(int, int, float, float, int, int, int, CTexture *);

/**
 * Draws a help window in the second style, with its own tile arrangement.
 *
 * @mangled MenuHelpWinDraw2__FiiffiiiP8CTexture
 * @address 0x217710
 * @size 0x350
 */
void MenuHelpWinDraw2(int, int, float, float, int, int, int, CTexture *);

/**
 * Draws a help window from the common menu texture.
 *
 * @mangled MenuHelpWinDraw__Fiiffi
 * @address 0x217A60
 * @size 0xA0
 */
void MenuHelpWinDraw(int, int, float, float, int);

/**
 * Draws a menu frame of the given size from its corner and edge tiles.
 *
 * @mangled DrawMenuWaku__FffiiiP8CTexturei
 * @address 0x217B00
 * @size 0x2C0
 */
void DrawMenuWaku(float, float, int, int, int, CTexture *, int);

/**
 * Draws a number in the menu's default colour and returns the width it took.
 *
 * @mangled DrawMenuNumber__FiiiP8CTexture4RECTii
 * @address 0x217DC0
 * @size 0x60
 */
int DrawMenuNumber(int, int, int, CTexture *, RECT, int, int);

/**
 * Draws a number tinted by a colour triple and returns the width it took.
 *
 * @mangled DrawMenuNumber__Fiii4RECTP8CTextureiUcUcUci
 * @address 0x217E20
 * @size 0x1B0
 */
int DrawMenuNumber(int, int, int, RECT, CTexture *, int, unsigned char, unsigned char, unsigned char, int);

/**
 * Draws a number digit by digit, right aligned, and returns the width it took.
 *
 * @mangled DrawMenuNumber__Fiii4RECTP8CTextureiiii
 * @address 0x217FD0
 * @size 0x1A0
 */
int DrawMenuNumber(int, int, int, RECT, CTexture *, int, int, int, int);

/**
 * Returns the displayed length of one line of a message window's text.
 *
 * @mangled GetMsgLengthMenu__FP6ClsMesi
 * @address 0x218170
 * @size 0x70
 */
int GetMsgLengthMenu(ClsMes *, int);

/**
 * Returns the texture a georama chip is drawn from, with its position in the sheet.
 *
 * @mangled RetCTexAtora__FiRiRi
 * @address 0x2181E0
 * @size 0xE0
 */
CTexture *RetCTexAtora(int, int &, int &);

/**
 * Draws one georama part icon, clipped to the sheet cell it occupies.
 *
 * @mangled DrawAtoraParts__Fiiiiii
 * @address 0x2182C0
 * @size 0x1B0
 */
void DrawAtoraParts(int, int, int, int, int, int);

/**
 * Returns the georama part record the board's n-th occupied slot holds.
 *
 * @mangled SearchAtoraInfo__Fi
 * @address 0x218470
 * @size 0x90
 */
EDITPARTS_INFO *SearchAtoraInfo(int);

/**
 * Returns whether every chip of a georama part has been acquired.
 *
 * @mangled AtoraAllTipGet__Fi
 * @address 0x218500
 * @size 0xA0
 */
int AtoraAllTipGet(int);

/**
 * Returns whether the player has already spoken to a georama resident.
 *
 * @mangled AlreadyPeopleTalk__Fii
 * @address 0x2185A0
 * @size 0x70
 */
int AlreadyPeopleTalk(int, int);

/**
 * Returns whether a georama part is complete or is still waiting on its event.
 *
 * @mangled AtoraCompOrEvent__FP14EDITPARTS_INFO
 * @address 0x218610
 * @size 0x170
 */
int AtoraCompOrEvent(EDITPARTS_INFO *);

/**
 * Returns how many board slots a georama ground offers.
 *
 * @mangled AtraBoardMaxNum__Fi
 * @address 0x218780
 * @size 0x90
 */
int AtraBoardMaxNum(int);

/**
 * Returns the placement state of one chip of a georama part.
 *
 * @mangled AtoraTipStatusSearch__FP14EDITPARTS_INFOi
 * @address 0x218810
 * @size 0xD0
 */
int AtoraTipStatusSearch(EDITPARTS_INFO *, int);

/**
 * Returns whether a chip attachment may be shown on the board.
 *
 * @mangled AtraTipCanDisplay__FP21EDIT_CHIP_ATTACH_DATA
 * @address 0x2188E0
 * @size 0x80
 */
int AtraTipCanDisplay(EDIT_CHIP_ATTACH_DATA *);

/**
 * Draws the links between a georama chip and the chips it is attached to.
 *
 * @mangled AtoraTipRelationDraw__FiiP14EDITPARTS_INFOiii
 * @address 0x218960
 * @size 0x200
 */
void AtoraTipRelationDraw(int, int, EDITPARTS_INFO *, int, int, int);

/**
 * Fills in which of the six board directions the cursor may move in.
 *
 * @mangled AtoraBoardEnableMovePos__FiPi
 * @address 0x218B60
 * @size 0x110
 */
void AtoraBoardEnableMovePos(int, int *);

/**
 * Returns the nearest occupied board slot at or below a position.
 *
 * @mangled AtoraBoardGoToPos__FPiii
 * @address 0x218C70
 * @size 0x50
 */
int AtoraBoardGoToPos(int *, int, int);

/**
 * Returns the message number describing a georama element.
 *
 * @mangled GetAtraMsgNo__Fii
 * @address 0x218CC0
 * @size 0xE0
 */
int GetAtraMsgNo(int, int);

/**
 * Returns the message number the board shows for the selected part.
 *
 * @mangled AtoraMsgNoGet__Fiii
 * @address 0x218DA0
 * @size 0x200
 */
int AtoraMsgNoGet(int, int, int);

/**
 * Returns the message number for a chip on its own.
 *
 * @mangled AtoraTipOnlyMsgNoGet__Fii
 * @address 0x218FA0
 * @size 0x60
 */
int AtoraTipOnlyMsgNoGet(int, int);

/**
 * Answers where a georama chip's icon sits in the chip texture.
 *
 * @mangled AtoraTipGetTexPos__FiRiRi
 * @address 0x219000
 * @size 0xE0
 */
void AtoraTipGetTexPos(int, int &, int &);

/**
 * Draws a chip's icon as either the object or the resident it stands for.
 *
 * @mangled AtoraTipObjectOrPerson__Fiiiii
 * @address 0x2190E0
 * @size 0xE0
 */
void AtoraTipObjectOrPerson(int, int, int, int, int);

/**
 * Answers which socket graphic a chip slot uses.
 *
 * @mangled AtoraTipHoleTexInfoGet__FiPUc
 * @address 0x2191C0
 * @size 0x50
 */
int AtoraTipHoleTexInfoGet(int, unsigned char *);

/**
 * Draws the placement bar under a georama part's plate.
 *
 * @mangled AtoraPlateDrawHaichiBar__FP14EDITPARTS_INFOiii
 * @address 0x219210
 * @size 0xE0
 */
void AtoraPlateDrawHaichiBar(EDITPARTS_INFO *, int, int, int);

/**
 * Draws how many of a georama part have been built, over its total.
 *
 * @mangled DrawAtraBuildNum__FP14EDITPARTS_INFOiii
 * @address 0x2192F0
 * @size 0x170
 */
void DrawAtraBuildNum(EDITPARTS_INFO *, int, int, int);

/**
 * Draws the georama board: its parts, their chips and the links between them.
 *
 * @mangled DrawAtora__Fiiii
 * @address 0x219460
 * @size 0x860
 */
void DrawAtora(int, int, int, int);

/**
 * Draws the empty georama board.
 *
 * @mangled DrawAtoraNothing__Fiii
 * @address 0x219CC0
 * @size 0x300
 */
void DrawAtoraNothing(int, int, int);

/**
 * Draws the georama warning message window.
 *
 * @mangled DrawMsgAtraWarning__FP6ClsMesii
 * @address 0x219FC0
 * @size 0xA0
 */
void DrawMsgAtraWarning(ClsMes *, int, int);

/**
 * Clears the georama chip selection.
 *
 * @mangled AtoraTipInfoInit__Fv
 * @address 0x21A060
 * @size 0x30
 */
void AtoraTipInfoInit();

/**
 * Returns whether the georama menu is running an event.
 *
 * @mangled GetMenuAtraEventFlag__Fv
 * @address 0x21A090
 * @size 0x10
 */
int GetMenuAtraEventFlag();

/**
 * Records whether the georama menu is running an event.
 *
 * @mangled SetMenuAtraEventFlag__Fi
 * @address 0x21A0A0
 * @size 0x10
 */
void SetMenuAtraEventFlag(int);

/**
 * Puts up the board's message window once the screen has faded in.
 *
 * @mangled MenuAtoraAfterFadeIn__Fv
 * @address 0x21A0B0
 * @size 0x80
 */
void MenuAtoraAfterFadeIn();

/**
 * Sets up the georama menu's state, message windows and drawing buffer.
 *
 * @mangled InitMenuAtora1__FiiPiP1
 * @address 0x21A130
 * @size 0x310
 */
void InitMenuAtora1(int, int, int *, u_long128 *);

/**
 * Starts the georama board screen and queues the data it reads.
 *
 * @mangled InitMenuAtoraSelect__Fi
 * @address 0x21A440
 * @size 0x450
 */
void InitMenuAtoraSelect(int);

/**
 * Releases the georama board screen's message windows and cursor.
 *
 * @mangled ExitAtoraSelect__Fv
 * @address 0x21A890
 * @size 0xD0
 */
void ExitAtoraSelect();

/**
 * Looks up the textures the georama board draws from.
 *
 * @mangled AtoraTexInfoGet__Fv
 * @address 0x21A960
 * @size 0x120
 */
void AtoraTexInfoGet();

/**
 * Draws one frame of the georama board screen.
 *
 * @mangled DrawMenuAtoraSelect__Fv
 * @address 0x21AA80
 * @size 0x400
 */
void DrawMenuAtoraSelect();

/**
 * Draws the georama board screen's board, panels and cursor.
 *
 * @mangled DrawAtoraSelect__Fi
 * @address 0x21AE80
 * @size 0xFF0
 */
void DrawAtoraSelect(int);

/**
 * Loads the georama board screen's texture block.
 *
 * @mangled AtoraTextureEnter__Fv
 * @address 0x21BE70
 * @size 0x1B0
 */
int AtoraTextureEnter();

/**
 * Returns which of the three chip groups a chip number belongs to.
 *
 * @mangled GetTipKind__Fi
 * @address 0x21C020
 * @size 0x70
 */
int GetTipKind(int);

/**
 * Orders two chips by group and number for the board's sort.
 *
 * @mangled CompTip__Fii
 * @address 0x21C090
 * @size 0xD0
 */
int CompTip(int, int);

/**
 * Makes one pass of the chip board's sort, and says whether it swapped.
 *
 * @mangled SeitonAtoraTipBoardSub__Fv
 * @address 0x21C160
 * @size 0x110
 */
int SeitonAtoraTipBoardSub();

/**
 * Sorts the chip board into group and number order.
 *
 * @mangled SeitonAtoraTipBoard__Fv
 * @address 0x21C270
 * @size 0x70
 */
void SeitonAtoraTipBoard();

/**
 * Steps the georama board screen, and says whether it is still running.
 *
 * @mangled MenuAtoraSelectKey__Fv
 * @address 0x21C2E0
 * @size 0x7B0
 */
int MenuAtoraSelectKey();

/**
 * Steps the board cursor, and says whether the board is still in control.
 *
 * @mangled AtoraBoardKey__Fv
 * @address 0x21CA90
 * @size 0xA30
 */
int AtoraBoardKey();

/**
 * Steps the chip cursor, and says whether the chip board is still in control.
 *
 * @mangled AtoraTipKey__Fv
 * @address 0x21D4C0
 * @size 0x300
 */
int AtoraTipKey();

/**
 * Returns control from the chip board to the part board.
 *
 * @mangled AtoraMenuTipCancel__Fv
 * @address 0x21D7C0
 * @size 0xD0
 */
void AtoraMenuTipCancel();

/**
 * Draws the board's edge fade.
 *
 * @mangled AtoraBoardFadeEffect__Fv
 * @address 0x21D890
 * @size 0x3D0
 */
void AtoraBoardFadeEffect();

/**
 * Draws the name and description of the selected georama element.
 *
 * @mangled AtoraNameDraw__Fi
 * @address 0x21DC60
 * @size 0x3C0
 */
void AtoraNameDraw(int);

/**
 * Draws one option row's label and setting.
 *
 * @mangled OptionMenuDraw__Fiiiii
 * @address 0x21E020
 * @size 0x430
 */
void OptionMenuDraw(int, int, int, int, int);

/**
 * Draws the left and right arrows beside the selected option.
 *
 * @mangled DrawOptionLRCur__Fii
 * @address 0x21E450
 * @size 0x80
 */
void DrawOptionLRCur(int, int);

/**
 * Starts the option screen and queues the data it reads.
 *
 * @mangled InitMenuOption__FiiP1
 * @address 0x21E4D0
 * @size 0x2B0
 */
int InitMenuOption(int, int, u_long128 *);

/**
 * Applies the option settings and releases the screen.
 *
 * @mangled ExitMenuOption__Fv
 * @address 0x21E780
 * @size 0x190
 */
void ExitMenuOption();

/**
 * Loads the option rows from the saved configuration.
 *
 * @mangled InitOptionFlag__Fv
 * @address 0x21E910
 * @size 0x50
 */
void InitOptionFlag();

/**
 * Writes the option rows back to the saved configuration.
 *
 * @mangled PrevOptionSetFunc__Fv
 * @address 0x21E960
 * @size 0x50
 */
void PrevOptionSetFunc();

/**
 * Steps the option screen, and says whether it is still running.
 *
 * @mangled MenuOptionKey__Fv
 * @address 0x21E9B0
 * @size 0x900
 */
int MenuOptionKey();

/**
 * Draws one frame of the option screen.
 *
 * @mangled DrawMenuOption__Fv
 * @address 0x21F2B0
 * @size 0x830
 */
void DrawMenuOption();

/**
 * Says whether the option screen has begun fading out.
 *
 * @mangled OptionMenuFadeOutStart__Fv
 * @address 0x21FAE0
 * @size 0x30
 */
int OptionMenuFadeOutStart();

/**
 * Starts the save screen, queues its data and opens the memory card.
 *
 * @mangled InitMenuSave__FiiP1
 * @address 0x21FB10
 * @size 0x270
 */
int InitMenuSave(int, int, u_long128 *);

/**
 * Applies the configuration the save screen loaded and releases it.
 *
 * @mangled ExitSaveSelect__Fv
 * @address 0x21FD80
 * @size 0x150
 */
void ExitSaveSelect();

/**
 * Steps the save screen, and says whether it is still running.
 *
 * @mangled MenuSaveKey__Fv
 * @address 0x21FED0
 * @size 0x500
 */
int MenuSaveKey();

/**
 * Draws one frame of the save screen.
 *
 * @mangled DrawMenuSave__FPc
 * @address 0x2203D0
 * @size 0x9C0
 */
void DrawMenuSave(char *);

/**
 * Steps the save screen's fade in, and says whether it is done.
 *
 * @mangled SaveMenuKeyFadeIn__Fv
 * @address 0x220D90
 * @size 0x40
 */
int SaveMenuKeyFadeIn();

/**
 * Steps the save screen's fade out, and says whether it is done.
 *
 * @mangled SaveMenuKeyFadeOut__Fv
 * @address 0x220DD0
 * @size 0x70
 */
int SaveMenuKeyFadeOut();

/**
 * Steps the save or load choice, and says whether it is done.
 *
 * @mangled SaveMenuKeyModeSelect__Fv
 * @address 0x220E40
 * @size 0x130
 */
int SaveMenuKeyModeSelect();

/**
 * Steps the memory card slot choice, and says whether it is done.
 *
 * @mangled SaveMenuKeyMcSelect__Fv
 * @address 0x220F70
 * @size 0x230
 */
int SaveMenuKeyMcSelect();

/**
 * Steps the card type check, and says whether it is done.
 *
 * @mangled SaveMenuKeyCheckMcType__Fv
 * @address 0x2211A0
 * @size 0xC0
 */
int SaveMenuKeyCheckMcType();

/**
 * Steps the card contents check, and says whether it is done.
 *
 * @mangled SaveMenuKeyCheckMc__Fv
 * @address 0x221260
 * @size 0x250
 */
int SaveMenuKeyCheckMc();

/**
 * Applies the configuration read from the card, and says it is done.
 *
 * @mangled SaveMenuKeyLoadConfig__Fv
 * @address 0x2214B0
 * @size 0x80
 */
int SaveMenuKeyLoadConfig();

/**
 * Steps the save file choice, and says whether it is done.
 *
 * @mangled SaveMenuKeyFileSelect__Fv
 * @address 0x221530
 * @size 0x200
 */
int SaveMenuKeyFileSelect();
