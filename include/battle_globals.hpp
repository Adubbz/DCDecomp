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
 * @mangled GlobalNameInit__Fv
 * @address 0x238450
 * @size 0x50
 * @unknownret
 */
void GlobalNameInit(void);

/**
 * @mangled InitNameRegist__FiiP1
 * @address 0x2384A0
 * @size 0x190
 * @unknownret
 */
void InitNameRegist(int, int, void /* CW back-ref target unresolved */ *);

/**
 * @mangled ExitNameEnterFunc__Fv
 * @address 0x238630
 * @size 0x70
 * @unknownret
 */
void ExitNameEnterFunc(void);

/**
 * @mangled GetNameTextureInfo__FPP8CTextureiRiRi
 * @address 0x2386A0
 * @size 0xC0
 * @unknownret
 */
void GetNameTextureInfo(CTexture **, int, int &, int &);

/**
 * @mangled DrawCharaName__Fiiiii
 * @address 0x238760
 * @size 0x120
 * @unknownret
 */
void DrawCharaName(int, int, int, int, int);

/**
 * @mangled DrawNameRegiWaku__Fiiiii
 * @address 0x238880
 * @size 0x1F0
 * @unknownret
 */
void DrawNameRegiWaku(int, int, int, int, int);

/**
 * @mangled DrawCharaNameUp__Fiiii
 * @address 0x238A70
 * @size 0x630
 * @unknownret
 */
void DrawCharaNameUp(int, int, int, int);

/**
 * @mangled DrawNameTemplete__Fiiii
 * @address 0x2390A0
 * @size 0x930
 * @unknownret
 */
void DrawNameTemplete(int, int, int, int);

/**
 * @mangled NameCompare__FPsPs
 * @address 0x2399D0
 * @size 0x70
 * @unknownret
 */
void NameCompare(short *, short *);

/**
 * @mangled CheckName__Fv
 * @address 0x239A40
 * @size 0x160
 * @unknownret
 */
void CheckName(void);

/**
 * @mangled NameEnterDraw__Fv
 * @address 0x239BA0
 * @size 0xCA0
 * @unknownret
 */
void NameEnterDraw(void);

/**
 * @mangled NameEnterKey__Fv
 * @address 0x23A840
 * @size 0x1F30
 * @unknownret
 */
void NameEnterKey(void);

/**
 * @mangled NameDefaultSet__Fi
 * @address 0x23C770
 * @size 0x110
 * @unknownret
 */
void NameDefaultSet(int);

/**
 * @mangled GetFontLRTumeW__Fiii
 * @address 0x23C880
 * @size 0x80
 * @unknownret
 */
void GetFontLRTumeW(int, int, int);

/**
 * @mangled CharaSelectNameDraw2__FiiPsPP8CTexturei
 * @address 0x23C900
 * @size 0x250
 * @unknownret
 */
void CharaSelectNameDraw2(int, int, short *, CTexture **, int);

/**
 * @mangled DrawSaveBoardCharaName2__FiiPsPP8CTexture6spRGBA6spRGBA
 * @address 0x23CB50
 * @size 0x290
 * @unknownret
 */
void DrawSaveBoardCharaName2(int, int, short *, CTexture **, spRGBA, spRGBA);

/**
 * @mangled GetMsgLengthCharaName__Fi
 * @address 0x23CDE0
 * @size 0x80
 * @unknownret
 */
void GetMsgLengthCharaName(int);

/**
 * @mangled InitOpeningBook__FP1Pi
 * @address 0x23CE60
 * @size 0xB0
 * @unknownret
 */
void InitOpeningBook(void /* CW back-ref target unresolved */ *, int *);

/**
 * @mangled OpeningBookKey__Fv
 * @address 0x23CF10
 * @size 0x670
 * @unknownret
 */
void OpeningBookKey(void);

/**
 * @mangled OpeningBookDraw__Fv
 * @address 0x23D580
 * @size 0x140
 * @unknownret
 */
void OpeningBookDraw(void);

/**
 * @mangled runerror__FPCc
 * @address 0x23D6C0
 * @size 0x50
 * @unknownret
 */
void runerror(const char *);

/**
 * @mangled stkoverflow__Fv
 * @address 0x23D710
 * @size 0x30
 * @unknownret
 */
void stkoverflow(void);

/**
 * @mangled chk_int__F12RS_STACKDATAP8funcdata
 * @address 0x23D740
 * @size 0x70
 * @unknownret
 */
void chk_int(RS_STACKDATA, funcdata *);

/**
 * @mangled is_true__F12RS_STACKDATA
 * @address 0x23D7B0
 * @size 0x40
 * @unknownret
 */
void is_true(RS_STACKDATA);

/**
 * @mangled divby0error__Fv
 * @address 0x23D7F0
 * @size 0x30
 * @unknownret
 */
void divby0error(void);

/**
 * @mangled modby0error__Fv
 * @address 0x23D820
 * @size 0x30
 * @unknownret
 */
void modby0error(void);

/**
 * @mangled print__FP12RS_STACKDATAi
 * @address 0x23D850
 * @size 0xF0
 * @unknownret
 */
void print(RS_STACKDATA *, int);
