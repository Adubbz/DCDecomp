#pragma once

#include "common.h"

// Forward declarations for the types these declarations name. The skeleton
// headers are generated from the retail symbol table, which knows the type
// names but not where they live.
class CTexture;
struct RS_STACKDATA;
struct funcdata;
struct spRGBA;

/**
 * Gives every party member their default name.
 *
 * @mangled GlobalNameInit__Fv
 * @address 0x238450
 * @size 0x48
 */
void GlobalNameInit(void);

/**
 * Opens the name-entry screen and reads its textures.
 *
 * @mangled InitNameRegist__FiiP1
 * @address 0x2384A0
 * @size 0x190
 */
void InitNameRegist(int, int, void /* CW back-ref target unresolved */ *);

/**
 * Gives the name-entry screen's textures back and closes it.
 *
 * @mangled ExitNameEnterFunc__Fv
 * @address 0x238630
 * @size 0x68
 */
void ExitNameEnterFunc(void);

/**
 * Gives the texture and cell one name character draws from.
 *
 * @mangled GetNameTextureInfo__FPP8CTextureiRiRi
 * @address 0x2386A0
 * @size 0xBC
 */
void GetNameTextureInfo(CTexture **, int, int &, int &);

/**
 * Draws a party member's name.
 *
 * @mangled DrawCharaName__Fiiiii
 * @address 0x238760
 * @size 0x118
 */
void DrawCharaName(int, int, int, int, int);

/**
 * Draws the frame around the name being entered, bobbing it with a sine.
 *
 * @mangled DrawNameRegiWaku__Fiiiii
 * @address 0x238880
 * @size 0x1F0
 */
void DrawNameRegiWaku(int, int, int, int, int);

/**
 * Draws the name being entered above the keyboard.
 *
 * @mangled DrawCharaNameUp__Fiiii
 * @address 0x238A70
 * @size 0x628
 */
void DrawCharaNameUp(int, int, int, int);

/**
 * Draws the character keyboard the name is entered from.
 *
 * @mangled DrawNameTemplete__Fiiii
 * @address 0x2390A0
 * @size 0x930
 */
void DrawNameTemplete(int, int, int, int);

/**
 * Reports whether the entered name may be used.
 *
 * @mangled CheckName__Fv
 * @address 0x239A40
 * @size 0x160
 */
void CheckName(void);

/**
 * Draws the name-entry screen.
 *
 * @mangled NameEnterDraw__Fv
 * @address 0x239BA0
 * @size 0xC9C
 */
void NameEnterDraw(void);

/**
 * Moves the cursor across the keyboard and enters the character it settles on.
 *
 * @mangled NameEnterKey__Fv
 * @address 0x23A840
 * @size 0x1F28
 */
void NameEnterKey(void);

/**
 * Gives one party member their default name for the chosen language.
 *
 * @mangled NameDefaultSet__Fi
 * @address 0x23C770
 * @size 0x110
 */
void NameDefaultSet(int chara_no);

/**
 * Gives the kerning between two name characters.
 *
 * @mangled GetFontLRTumeW__Fiii
 * @address 0x23C880
 * @size 0x78
 */
void GetFontLRTumeW(int, int, int);

/**
 * Draws a party member's name on the character-select page.
 *
 * @mangled CharaSelectNameDraw2__FiiPsPP8CTexturei
 * @address 0x23C900
 * @size 0x250
 */
void CharaSelectNameDraw2(int, int, short *, CTexture **, int);

/**
 * Draws a party member's name on the save board, in a gradient.
 *
 * @mangled DrawSaveBoardCharaName2__FiiPsPP8CTexture6spRGBA6spRGBA
 * @address 0x23CB50
 * @size 0x284
 */
void DrawSaveBoardCharaName2(int, int, short *, CTexture **, spRGBA, spRGBA);

/**
 * Gives how wide a party member's name draws.
 *
 * @mangled GetMsgLengthCharaName__Fi
 * @address 0x23CDE0
 * @size 0x78
 * Counts the characters of a party member's name, up to ten, or gives zero for
 * an index outside the party.
 */
int GetMsgLengthCharaName(int chara_no);

/**
 * Opens the storybook that begins the game.
 *
 * @mangled InitOpeningBook__FP1Pi
 * @address 0x23CE60
 * @size 0xB0
 */
void InitOpeningBook(void /* CW back-ref target unresolved */ *, int *);

/**
 * Turns the storybook's pages with the pad.
 *
 * @mangled OpeningBookKey__Fv
 * @address 0x23CF10
 * @size 0x664
 */
void OpeningBookKey(void);

/**
 * Draws the storybook page by page.
 *
 * @mangled OpeningBookDraw__Fv
 * @address 0x23D580
 * @size 0x134
 */
void OpeningBookDraw(void);

/**
 * @mangled runerror__FPCc
 * @address 0x23D6C0
 * @size 0x44
 * @unknownret
 */
void runerror(const char *);

/**
 * @mangled stkoverflow__Fv
 * @address 0x23D710
 * @size 0x28
 * @unknownret
 */
void stkoverflow(void);

/**
 * @mangled chk_int__F12RS_STACKDATAP8funcdata
 * @address 0x23D740
 * @size 0x68
 * @unknownret
 */
int chk_int(RS_STACKDATA, funcdata *);

/**
 * @mangled is_true__F12RS_STACKDATA
 * @address 0x23D7B0
 * @size 0x3C
 * @unknownret
 */
int is_true(RS_STACKDATA);

/**
 * @mangled divby0error__Fv
 * @address 0x23D7F0
 * @size 0x28
 * @unknownret
 */
void divby0error(void);

/**
 * @mangled modby0error__Fv
 * @address 0x23D820
 * @size 0x28
 * @unknownret
 */
void modby0error(void);

/**
 * @mangled print__FP12RS_STACKDATAi
 * @address 0x23D850
 * @size 0xE8
 * @unknownret
 */
void print(RS_STACKDATA *, int);
