#pragma once

#include "common.h"

// Forward declarations for the types these declarations name. The skeleton
// headers are generated from the retail symbol table, which knows the type
// names but not where they live.
class CMemoryCardAccess;
class CRect_i_;
class CTexture;
class ClsMes;
struct EDITPARTS_INFO;
struct MC_CARD_INFO;
struct RECT;

/**
 * Returns one when a card is present in the port and is a PlayStation 2 memory
 * card.
 *
 * @mangled McCheckMCPs2__FP12MC_CARD_INFO
 * @address 0x216D50
 * @size 0x40
 */
int McCheckMCPs2(MC_CARD_INFO *);

/**
 * Draws a menu sprite that sways a few pixels around a position in time with
 * the cursor animation.
 *
 * @mangled DrawObjectVibe__FiiP8CTexture8CRect_i_Uci
 * @address 0x216D90
 * @size 0x140
 */
void DrawObjectVibe(int, int, CTexture *, CRect_i_, unsigned char, int);

/**
 * Draws a swaying menu sprite from a source rectangle given as a RECT.
 *
 * @mangled DrawObjectVibe__FiiP8CTexture4RECTUci
 * @address 0x216ED0
 * @size 0x70
 */
void DrawObjectVibe(int, int, CTexture *, RECT, unsigned char, int);

/**
 * Draws one swaying 32-pixel icon of the common menu texture, with a shadow
 * beneath it when asked.
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
 * Draws a nine-piece help window from the tiles at a texture position,
 * stretching its middle by a width and a height in tile units.
 *
 * @mangled MenuHelpWinDraw__FiiffiiiP8CTexture
 * @address 0x2173A0
 * @size 0x370
 */
void MenuHelpWinDraw(int, int, float, float, int, int, int, CTexture *);

/**
 * Draws the same help window as MenuHelpWinDraw with the width and height of
 * its middle in pixels.
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
 * Draws the four corners of a selection frame around a rectangle, drawn in by
 * an offset that cycles every 30 frames.
 *
 * @mangled DrawMenuWaku__FffiiiP8CTexturei
 * @address 0x217B00
 * @size 0x2C0
 */
void DrawMenuWaku(float, float, int, int, int, CTexture *, int);

/**
 * Draws a number right-aligned to a position, clipped to the height of the
 * screen, and returns the left edge of its leading digit.
 *
 * @mangled DrawMenuNumber__FiiiP8CTexture4RECTii
 * @address 0x217DC0
 * @size 0x60
 */
int DrawMenuNumber(int, int, int, CTexture *, RECT, int, int);

/**
 * Draws a number right-aligned to a position in a tint colour, and returns the
 * left edge of its leading digit.
 *
 * @mangled DrawMenuNumber__Fiii4RECTP8CTextureiUcUcUci
 * @address 0x217E20
 * @size 0x1B0
 */
int DrawMenuNumber(int, int, int, RECT, CTexture *, int, unsigned char, unsigned char, unsigned char, int);

/**
 * Draws a number right-aligned to a position, clipped to a band of the screen,
 * and returns the left edge of its leading digit.
 *
 * @mangled DrawMenuNumber__Fiii4RECTP8CTextureiiii
 * @address 0x217FD0
 * @size 0x1A0
 */
int DrawMenuNumber(int, int, int, RECT, CTexture *, int, int, int, int);

/**
 * Returns how many codes the first line of a system message holds, or zero when
 * the message is missing.
 *
 * @mangled GetMsgLengthMenu__FP6ClsMesi
 * @address 0x218170
 * @size 0x70
 */
int GetMsgLengthMenu(ClsMes *, int);

/**
 * Draws the icon of a georama chip with a drop shadow, clipped to a band of the
 * screen and skipped outside the board.
 *
 * @mangled DrawAtoraParts__Fiiiiii
 * @address 0x2182C0
 * @size 0x1B0
 */
void DrawAtoraParts(int, int, int, int, int, int);

/**
 * Returns the message number describing a georama element.
 *
 * @mangled GetAtraMsgNo__Fii
 * @address 0x218CC0
 * @size 0xE0
 */
int GetAtraMsgNo(int, int);

/**
 * Draws how many of a georama part have been built, over its total.
 *
 * @mangled DrawAtraBuildNum__FP14EDITPARTS_INFOiii
 * @address 0x2192F0
 * @size 0x170
 */
void DrawAtraBuildNum(EDITPARTS_INFO *, int, int, int);

/**
 * Draws the plate of one georama part with its picture, placement gauge and
 * chip sockets, or a pulsing completion sprite once the part is ready for its
 * completion event.
 *
 * @mangled DrawAtora__Fiiii
 * @address 0x219460
 * @size 0x860
 */
void DrawAtora(int, int, int, int);

/**
 * Returns whether the georama menu is running an event.
 *
 * @mangled GetMenuAtraEventFlag__Fv
 * @address 0x21A090
 * @size 0x10
 */
int GetMenuAtraEventFlag();

/**
 * Sets up the georama menu's state, message windows and drawing buffer.
 *
 * @mangled InitMenuAtora1__FiiPiP1
 * @address 0x21A130
 * @size 0x310
 */
void InitMenuAtora1(int, int, int *, u_long128 *);

/**
 * Opens the board for the given georama, queueing its textures when they are
 * not loaded yet, picking its part records and placing the cursor.
 *
 * @mangled InitMenuAtoraSelect__Fi
 * @address 0x21A440
 * @size 0x450
 */
void InitMenuAtoraSelect(int);

/**
 * Draws one frame of the georama board screen.
 *
 * @mangled DrawMenuAtoraSelect__Fv
 * @address 0x21AA80
 * @size 0x400
 */
void DrawMenuAtoraSelect();

/**
 * Steps the georama board screen and returns the code of the action it carried
 * out, 100 once the player closes it and zero when nothing happened.
 *
 * @mangled MenuAtoraSelectKey__Fv
 * @address 0x21C2E0
 * @size 0x7B0
 */
int MenuAtoraSelectKey();

/**
 * Draws the names of the parts in the three board slots around the cursor, and
 * the board's edge fade.
 *
 * @mangled AtoraNameDraw__Fi
 * @address 0x21DC60
 * @size 0x3C0
 */
void AtoraNameDraw(int);

/**
 * Starts the option screen, queueing option.pac and copying the current
 * settings into its rows, and returns zero when the loader reports no size for
 * the file.
 *
 * @mangled InitMenuOption__FiiP1
 * @address 0x21E4D0
 * @size 0x2B0
 */
int InitMenuOption(int, int, u_long128 *);

/**
 * Steps the option screen and returns one on the frame it closes and stores the
 * settings, zero otherwise.
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
 * Returns whether the option screen has started to close.
 *
 * @mangled OptionMenuFadeOutStart__Fv
 * @address 0x21FAE0
 * @size 0x30
 */
int OptionMenuFadeOutStart();

/**
 * Starts the save screen in the given mode, queueing savetex.pak and starting
 * the memory card library, and returns zero if the library fails to start.
 *
 * @mangled InitMenuSave__FiiP1
 * @address 0x21FB10
 * @size 0x270
 */
int InitMenuSave(int, int, u_long128 *);

/**
 * Steps the save screen and returns zero while it runs, one once it has closed
 * after a load and two once it has closed otherwise.
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
 * The second message window the menus share.
 */
extern ClsMes CommonMenuMes2;

/**
 * The third message window the menus share.
 */
extern ClsMes CommonMenuMes3;

/**
 * The message window that names the selected georama element.
 */
extern ClsMes AtoraNameMes;

/**
 * The memory card state the save, load and option screens work through.
 */
extern CMemoryCardAccess McAccess;
