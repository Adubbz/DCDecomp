#pragma once

#include "common.h"

/* ?ret */ void GlobalNameInit(void); // @ 0x238450 (0x50 bytes) -- mangled: GlobalNameInit__Fv
/* ?ret */ void InitNameRegist(int, int, void /* CW back-ref target unresolved */ *); // @ 0x2384A0 (0x190 bytes) -- mangled: InitNameRegist__FiiP1
/* ?ret */ void ExitNameEnterFunc(void); // @ 0x238630 (0x70 bytes) -- mangled: ExitNameEnterFunc__Fv
/* ?ret */ void GetNameTextureInfo(CTexture **, int, int &, int &); // @ 0x2386A0 (0xC0 bytes) -- mangled: GetNameTextureInfo__FPP8CTextureiRiRi
/* ?ret */ void DrawCharaName(int, int, int, int, int); // @ 0x238760 (0x120 bytes) -- mangled: DrawCharaName__Fiiiii
/* ?ret */ void DrawNameRegiWaku(int, int, int, int, int); // @ 0x238880 (0x1F0 bytes) -- mangled: DrawNameRegiWaku__Fiiiii
/* ?ret */ void DrawCharaNameUp(int, int, int, int); // @ 0x238A70 (0x630 bytes) -- mangled: DrawCharaNameUp__Fiiii
/* ?ret */ void DrawNameTemplete(int, int, int, int); // @ 0x2390A0 (0x930 bytes) -- mangled: DrawNameTemplete__Fiiii
/* ?ret */ void NameCompare(short *, short *); // @ 0x2399D0 (0x70 bytes) -- mangled: NameCompare__FPsPs
/* ?ret */ void CheckName(void); // @ 0x239A40 (0x160 bytes) -- mangled: CheckName__Fv
/* ?ret */ void NameEnterDraw(void); // @ 0x239BA0 (0xCA0 bytes) -- mangled: NameEnterDraw__Fv
/* ?ret */ void NameEnterKey(void); // @ 0x23A840 (0x1F30 bytes) -- mangled: NameEnterKey__Fv
/* ?ret */ void NameDefaultSet(int); // @ 0x23C770 (0x110 bytes) -- mangled: NameDefaultSet__Fi
/* ?ret */ void GetFontLRTumeW(int, int, int); // @ 0x23C880 (0x80 bytes) -- mangled: GetFontLRTumeW__Fiii
/* ?ret */ void CharaSelectNameDraw2(int, int, short *, CTexture **, int); // @ 0x23C900 (0x250 bytes) -- mangled: CharaSelectNameDraw2__FiiPsPP8CTexturei
/* ?ret */ void DrawSaveBoardCharaName2(int, int, short *, CTexture **, spRGBA, spRGBA); // @ 0x23CB50 (0x290 bytes) -- mangled: DrawSaveBoardCharaName2__FiiPsPP8CTexture6spRGBA6spRGBA
/* ?ret */ void GetMsgLengthCharaName(int); // @ 0x23CDE0 (0x80 bytes) -- mangled: GetMsgLengthCharaName__Fi
/* ?ret */ void InitOpeningBook(void /* CW back-ref target unresolved */ *, int *); // @ 0x23CE60 (0xB0 bytes) -- mangled: InitOpeningBook__FP1Pi
/* ?ret */ void OpeningBookKey(void); // @ 0x23CF10 (0x50 bytes) -- mangled: OpeningBookKey__Fv
/* ?ret */ void OpeningBookDraw(void); // @ 0x23D580 (0xA4 bytes) -- mangled: OpeningBookDraw__Fv
/* ?ret */ void runerror(const char *); // @ 0x23D6C0 (0x50 bytes) -- mangled: runerror__FPCc
/* ?ret */ void stkoverflow(void); // @ 0x23D710 (0x30 bytes) -- mangled: stkoverflow__Fv
/* ?ret */ void chk_int(RS_STACKDATA, funcdata *); // @ 0x23D740 (0x70 bytes) -- mangled: chk_int__F12RS_STACKDATAP8funcdata
/* ?ret */ void is_true(RS_STACKDATA); // @ 0x23D7B0 (0x40 bytes) -- mangled: is_true__F12RS_STACKDATA
/* ?ret */ void divby0error(void); // @ 0x23D7F0 (0x30 bytes) -- mangled: divby0error__Fv
/* ?ret */ void modby0error(void); // @ 0x23D820 (0x30 bytes) -- mangled: modby0error__Fv
/* ?ret */ void print(RS_STACKDATA *, int); // @ 0x23D850 (0xF0 bytes) -- mangled: print__FP12RS_STACKDATAi
