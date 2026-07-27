#pragma once

#include "common.h"

/* ?ret */ void McCheckMCPs2(MC_CARD_INFO *); // @ 0x216D50 (0x40 bytes) -- mangled: McCheckMCPs2__FP12MC_CARD_INFO
/* ?ret */ void DrawObjectVibe(int, int, CTexture *, CRect_i_, unsigned char, int); // @ 0x216D90 (0x140 bytes) -- mangled: DrawObjectVibe__FiiP8CTexture8CRect_i_Uci
/* ?ret */ void DrawObjectVibe(int, int, CTexture *, RECT, unsigned char, int); // @ 0x216ED0 (0x70 bytes) -- mangled: DrawObjectVibe__FiiP8CTexture4RECTUci
/* ?ret */ void DrawMenuObjectVibe(int, int, int, int); // @ 0x216F40 (0xD0 bytes) -- mangled: DrawMenuObjectVibe__Fiiii
/* ?ret */ void DrawMenuHelpWindow(CTexture *, int, int, int, float, float, int); // @ 0x217010 (0x390 bytes) -- mangled: DrawMenuHelpWindow__FP8CTextureiiiffi
/* ?ret */ void MenuHelpWinDraw(int, int, float, float, int, int, int, CTexture *); // @ 0x2173A0 (0x370 bytes) -- mangled: MenuHelpWinDraw__FiiffiiiP8CTexture
/* ?ret */ void MenuHelpWinDraw2(int, int, float, float, int, int, int, CTexture *); // @ 0x217710 (0x350 bytes) -- mangled: MenuHelpWinDraw2__FiiffiiiP8CTexture
/* ?ret */ void MenuHelpWinDraw(int, int, float, float, int); // @ 0x217A60 (0xA0 bytes) -- mangled: MenuHelpWinDraw__Fiiffi
/* ?ret */ void DrawMenuWaku(float, float, int, int, int, CTexture *, int); // @ 0x217B00 (0x2C0 bytes) -- mangled: DrawMenuWaku__FffiiiP8CTexturei
/* ?ret */ void DrawMenuNumber(int, int, int, CTexture *, RECT, int, int); // @ 0x217DC0 (0x60 bytes) -- mangled: DrawMenuNumber__FiiiP8CTexture4RECTii
/* ?ret */ void DrawMenuNumber(int, int, int, RECT, CTexture *, int, unsigned char, unsigned char, unsigned char, int); // @ 0x217E20 (0x1B0 bytes) -- mangled: DrawMenuNumber__Fiii4RECTP8CTextureiUcUcUci
/* ?ret */ void DrawMenuNumber(int, int, int, RECT, CTexture *, int, int, int, int); // @ 0x217FD0 (0x1A0 bytes) -- mangled: DrawMenuNumber__Fiii4RECTP8CTextureiiii
/* ?ret */ void GetMsgLengthMenu(ClsMes *, int); // @ 0x218170 (0x70 bytes) -- mangled: GetMsgLengthMenu__FP6ClsMesi
/* ?ret */ void RetCTexAtora(int, int &, int &); // @ 0x2181E0 (0xE0 bytes) -- mangled: RetCTexAtora__FiRiRi
/* ?ret */ void DrawAtoraParts(int, int, int, int, int, int); // @ 0x2182C0 (0x1B0 bytes) -- mangled: DrawAtoraParts__Fiiiiii
/* ?ret */ void SearchAtoraInfo(int); // @ 0x218470 (0x90 bytes) -- mangled: SearchAtoraInfo__Fi
/* ?ret */ void AtoraAllTipGet(int); // @ 0x218500 (0xA0 bytes) -- mangled: AtoraAllTipGet__Fi
/* ?ret */ void AlreadyPeopleTalk(int, int); // @ 0x2185A0 (0x70 bytes) -- mangled: AlreadyPeopleTalk__Fii
/* ?ret */ void AtoraCompOrEvent(EDITPARTS_INFO *); // @ 0x218610 (0x170 bytes) -- mangled: AtoraCompOrEvent__FP14EDITPARTS_INFO
/* ?ret */ void AtraBoardMaxNum(int); // @ 0x218780 (0x90 bytes) -- mangled: AtraBoardMaxNum__Fi
/* ?ret */ void AtoraTipStatusSearch(EDITPARTS_INFO *, int); // @ 0x218810 (0xD0 bytes) -- mangled: AtoraTipStatusSearch__FP14EDITPARTS_INFOi
/* ?ret */ void AtraTipCanDisplay(EDIT_CHIP_ATTACH_DATA *); // @ 0x2188E0 (0x80 bytes) -- mangled: AtraTipCanDisplay__FP21EDIT_CHIP_ATTACH_DATA
/* ?ret */ void AtoraTipRelationDraw(int, int, EDITPARTS_INFO *, int, int, int); // @ 0x218960 (0x200 bytes) -- mangled: AtoraTipRelationDraw__FiiP14EDITPARTS_INFOiii
/* ?ret */ void AtoraBoardEnableMovePos(int, int *); // @ 0x218B60 (0x110 bytes) -- mangled: AtoraBoardEnableMovePos__FiPi
/* ?ret */ void AtoraBoardGoToPos(int *, int, int); // @ 0x218C70 (0x50 bytes) -- mangled: AtoraBoardGoToPos__FPiii
/* ?ret */ void GetAtraMsgNo(int, int); // @ 0x218CC0 (0xE0 bytes) -- mangled: GetAtraMsgNo__Fii
/* ?ret */ void AtoraMsgNoGet(int, int, int); // @ 0x218DA0 (0x200 bytes) -- mangled: AtoraMsgNoGet__Fiii
/* ?ret */ void AtoraTipOnlyMsgNoGet(int, int); // @ 0x218FA0 (0x60 bytes) -- mangled: AtoraTipOnlyMsgNoGet__Fii
/* ?ret */ void AtoraTipGetTexPos(int, int &, int &); // @ 0x219000 (0xE0 bytes) -- mangled: AtoraTipGetTexPos__FiRiRi
/* ?ret */ void AtoraTipObjectOrPerson(int, int, int, int, int); // @ 0x2190E0 (0xE0 bytes) -- mangled: AtoraTipObjectOrPerson__Fiiiii
/* ?ret */ void AtoraTipHoleTexInfoGet(int, unsigned char *); // @ 0x2191C0 (0x50 bytes) -- mangled: AtoraTipHoleTexInfoGet__FiPUc
/* ?ret */ void AtoraPlateDrawHaichiBar(EDITPARTS_INFO *, int, int, int); // @ 0x219210 (0xE0 bytes) -- mangled: AtoraPlateDrawHaichiBar__FP14EDITPARTS_INFOiii
/* ?ret */ void DrawAtraBuildNum(EDITPARTS_INFO *, int, int, int); // @ 0x2192F0 (0x170 bytes) -- mangled: DrawAtraBuildNum__FP14EDITPARTS_INFOiii
/* ?ret */ void DrawAtora(int, int, int, int); // @ 0x219460 (0x860 bytes) -- mangled: DrawAtora__Fiiii
/* ?ret */ void DrawAtoraNothing(int, int, int); // @ 0x219CC0 (0x300 bytes) -- mangled: DrawAtoraNothing__Fiii
/* ?ret */ void DrawMsgAtraWarning(ClsMes *, int, int); // @ 0x219FC0 (0xA0 bytes) -- mangled: DrawMsgAtraWarning__FP6ClsMesii
/* ?ret */ void AtoraTipInfoInit(void); // @ 0x21A060 (0x30 bytes) -- mangled: AtoraTipInfoInit__Fv
/* ?ret */ void GetMenuAtraEventFlag(void); // @ 0x21A090 (0x10 bytes) -- mangled: GetMenuAtraEventFlag__Fv
/* ?ret */ void SetMenuAtraEventFlag(int); // @ 0x21A0A0 (0x10 bytes) -- mangled: SetMenuAtraEventFlag__Fi
/* ?ret */ void MenuAtoraAfterFadeIn(void); // @ 0x21A0B0 (0x80 bytes) -- mangled: MenuAtoraAfterFadeIn__Fv
/* ?ret */ void InitMenuAtora1(int, int, int *, void /* CW back-ref target unresolved */ *); // @ 0x21A130 (0x310 bytes) -- mangled: InitMenuAtora1__FiiPiP1
/* ?ret */ void InitMenuAtoraSelect(int); // @ 0x21A440 (0x450 bytes) -- mangled: InitMenuAtoraSelect__Fi
/* ?ret */ void ExitAtoraSelect(void); // @ 0x21A890 (0xD0 bytes) -- mangled: ExitAtoraSelect__Fv
/* ?ret */ void AtoraTexInfoGet(void); // @ 0x21A960 (0x120 bytes) -- mangled: AtoraTexInfoGet__Fv
/* ?ret */ void DrawMenuAtoraSelect(void); // @ 0x21AA80 (0x400 bytes) -- mangled: DrawMenuAtoraSelect__Fv
/* ?ret */ void DrawAtoraSelect(int); // @ 0x21AE80 (0xFF0 bytes) -- mangled: DrawAtoraSelect__Fi
/* ?ret */ void AtoraTextureEnter(void); // @ 0x21BE70 (0x1B0 bytes) -- mangled: AtoraTextureEnter__Fv
/* ?ret */ void GetTipKind(int); // @ 0x21C020 (0x70 bytes) -- mangled: GetTipKind__Fi
/* ?ret */ void CompTip(int, int); // @ 0x21C090 (0xD0 bytes) -- mangled: CompTip__Fii
/* ?ret */ void SeitonAtoraTipBoardSub(void); // @ 0x21C160 (0x110 bytes) -- mangled: SeitonAtoraTipBoardSub__Fv
/* ?ret */ void SeitonAtoraTipBoard(void); // @ 0x21C270 (0x70 bytes) -- mangled: SeitonAtoraTipBoard__Fv
/* ?ret */ void MenuAtoraSelectKey(void); // @ 0x21C2E0 (0x7B0 bytes) -- mangled: MenuAtoraSelectKey__Fv
/* ?ret */ void AtoraBoardKey(void); // @ 0x21CA90 (0xA30 bytes) -- mangled: AtoraBoardKey__Fv
/* ?ret */ void AtoraTipKey(void); // @ 0x21D4C0 (0x300 bytes) -- mangled: AtoraTipKey__Fv
/* ?ret */ void AtoraMenuTipCancel(void); // @ 0x21D7C0 (0xD0 bytes) -- mangled: AtoraMenuTipCancel__Fv
/* ?ret */ void AtoraBoardFadeEffect(void); // @ 0x21D890 (0x3D0 bytes) -- mangled: AtoraBoardFadeEffect__Fv
/* ?ret */ void AtoraNameDraw(int); // @ 0x21DC60 (0x3C0 bytes) -- mangled: AtoraNameDraw__Fi
/* ?ret */ void OptionMenuDraw(int, int, int, int, int); // @ 0x21E020 (0x430 bytes) -- mangled: OptionMenuDraw__Fiiiii
/* ?ret */ void DrawOptionLRCur(int, int); // @ 0x21E450 (0x80 bytes) -- mangled: DrawOptionLRCur__Fii
/* ?ret */ void InitMenuOption(int, int, void /* CW back-ref target unresolved */ *); // @ 0x21E4D0 (0x2B0 bytes) -- mangled: InitMenuOption__FiiP1
/* ?ret */ void ExitMenuOption(void); // @ 0x21E780 (0x190 bytes) -- mangled: ExitMenuOption__Fv
/* ?ret */ void InitOptionFlag(void); // @ 0x21E910 (0x50 bytes) -- mangled: InitOptionFlag__Fv
/* ?ret */ void PrevOptionSetFunc(void); // @ 0x21E960 (0x50 bytes) -- mangled: PrevOptionSetFunc__Fv
/* ?ret */ void MenuOptionKey(void); // @ 0x21E9B0 (0x900 bytes) -- mangled: MenuOptionKey__Fv
/* ?ret */ void DrawMenuOption(void); // @ 0x21F2B0 (0x830 bytes) -- mangled: DrawMenuOption__Fv
/* ?ret */ void OptionMenuFadeOutStart(void); // @ 0x21FAE0 (0x30 bytes) -- mangled: OptionMenuFadeOutStart__Fv
/* ?ret */ void InitMenuSave(int, int, void /* CW back-ref target unresolved */ *); // @ 0x21FB10 (0x270 bytes) -- mangled: InitMenuSave__FiiP1
/* ?ret */ void ExitSaveSelect(void); // @ 0x21FD80 (0x150 bytes) -- mangled: ExitSaveSelect__Fv
/* ?ret */ void MenuSaveKey(void); // @ 0x21FED0 (0x500 bytes) -- mangled: MenuSaveKey__Fv
/* ?ret */ void DrawMenuSave(char *); // @ 0x2203D0 (0x9C0 bytes) -- mangled: DrawMenuSave__FPc
/* ?ret */ void SaveMenuKeyFadeIn(void); // @ 0x220D90 (0x40 bytes) -- mangled: SaveMenuKeyFadeIn__Fv
/* ?ret */ void SaveMenuKeyFadeOut(void); // @ 0x220DD0 (0x70 bytes) -- mangled: SaveMenuKeyFadeOut__Fv
/* ?ret */ void SaveMenuKeyModeSelect(void); // @ 0x220E40 (0x130 bytes) -- mangled: SaveMenuKeyModeSelect__Fv
/* ?ret */ void SaveMenuKeyMcSelect(void); // @ 0x220F70 (0x230 bytes) -- mangled: SaveMenuKeyMcSelect__Fv
/* ?ret */ void SaveMenuKeyCheckMcType(void); // @ 0x2211A0 (0xC0 bytes) -- mangled: SaveMenuKeyCheckMcType__Fv
/* ?ret */ void SaveMenuKeyCheckMc(void); // @ 0x221260 (0x250 bytes) -- mangled: SaveMenuKeyCheckMc__Fv
/* ?ret */ void SaveMenuKeyLoadConfig(void); // @ 0x2214B0 (0x80 bytes) -- mangled: SaveMenuKeyLoadConfig__Fv
/* ?ret */ void SaveMenuKeyFileSelect(void); // @ 0x221530 (0x200 bytes) -- mangled: SaveMenuKeyFileSelect__Fv
