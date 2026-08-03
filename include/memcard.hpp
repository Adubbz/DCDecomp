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
 * @mangled McCheckMCPs2__FP12MC_CARD_INFO
 * @address 0x216D50
 * @size 0x40
 * @unknownret
 */
void McCheckMCPs2(MC_CARD_INFO *);

/**
 * @mangled DrawObjectVibe__FiiP8CTexture8CRect_i_Uci
 * @address 0x216D90
 * @size 0x140
 * @unknownret
 */
void DrawObjectVibe(int, int, CTexture *, CRect_i_, unsigned char, int);

/**
 * @mangled DrawObjectVibe__FiiP8CTexture4RECTUci
 * @address 0x216ED0
 * @size 0x70
 * @unknownret
 */
void DrawObjectVibe(int, int, CTexture *, RECT, unsigned char, int);

/**
 * @mangled DrawMenuObjectVibe__Fiiii
 * @address 0x216F40
 * @size 0xD0
 * @unknownret
 */
void DrawMenuObjectVibe(int, int, int, int);

/**
 * @mangled DrawMenuHelpWindow__FP8CTextureiiiffi
 * @address 0x217010
 * @size 0x390
 * @unknownret
 */
void DrawMenuHelpWindow(CTexture *, int, int, int, float, float, int);

/**
 * @mangled MenuHelpWinDraw__FiiffiiiP8CTexture
 * @address 0x2173A0
 * @size 0x370
 * @unknownret
 */
void MenuHelpWinDraw(int, int, float, float, int, int, int, CTexture *);

/**
 * @mangled MenuHelpWinDraw2__FiiffiiiP8CTexture
 * @address 0x217710
 * @size 0x350
 * @unknownret
 */
void MenuHelpWinDraw2(int, int, float, float, int, int, int, CTexture *);

/**
 * @mangled MenuHelpWinDraw__Fiiffi
 * @address 0x217A60
 * @size 0xA0
 * @unknownret
 */
void MenuHelpWinDraw(int, int, float, float, int);

/**
 * @mangled DrawMenuWaku__FffiiiP8CTexturei
 * @address 0x217B00
 * @size 0x2C0
 * @unknownret
 */
void DrawMenuWaku(float, float, int, int, int, CTexture *, int);

/**
 * @mangled DrawMenuNumber__FiiiP8CTexture4RECTii
 * @address 0x217DC0
 * @size 0x60
 * @unknownret
 */
void DrawMenuNumber(int, int, int, CTexture *, RECT, int, int);

/**
 * @mangled DrawMenuNumber__Fiii4RECTP8CTextureiUcUcUci
 * @address 0x217E20
 * @size 0x1B0
 * @unknownret
 */
void DrawMenuNumber(int, int, int, RECT, CTexture *, int, unsigned char, unsigned char, unsigned char, int);

/**
 * @mangled DrawMenuNumber__Fiii4RECTP8CTextureiiii
 * @address 0x217FD0
 * @size 0x1A0
 * @unknownret
 */
void DrawMenuNumber(int, int, int, RECT, CTexture *, int, int, int, int);

/**
 * @mangled GetMsgLengthMenu__FP6ClsMesi
 * @address 0x218170
 * @size 0x70
 * @unknownret
 */
void GetMsgLengthMenu(ClsMes *, int);

/**
 * @mangled RetCTexAtora__FiRiRi
 * @address 0x2181E0
 * @size 0xE0
 * @unknownret
 */
void RetCTexAtora(int, int &, int &);

/**
 * @mangled DrawAtoraParts__Fiiiiii
 * @address 0x2182C0
 * @size 0x1B0
 * @unknownret
 */
void DrawAtoraParts(int, int, int, int, int, int);

/**
 * @mangled SearchAtoraInfo__Fi
 * @address 0x218470
 * @size 0x90
 * @unknownret
 */
void SearchAtoraInfo(int);

/**
 * @mangled AtoraAllTipGet__Fi
 * @address 0x218500
 * @size 0xA0
 * @unknownret
 */
void AtoraAllTipGet(int);

/**
 * @mangled AlreadyPeopleTalk__Fii
 * @address 0x2185A0
 * @size 0x70
 * @unknownret
 */
void AlreadyPeopleTalk(int, int);

/**
 * @mangled AtoraCompOrEvent__FP14EDITPARTS_INFO
 * @address 0x218610
 * @size 0x170
 * @unknownret
 */
void AtoraCompOrEvent(EDITPARTS_INFO *);

/**
 * @mangled AtraBoardMaxNum__Fi
 * @address 0x218780
 * @size 0x90
 * @unknownret
 */
void AtraBoardMaxNum(int);

/**
 * @mangled AtoraTipStatusSearch__FP14EDITPARTS_INFOi
 * @address 0x218810
 * @size 0xD0
 * @unknownret
 */
void AtoraTipStatusSearch(EDITPARTS_INFO *, int);

/**
 * @mangled AtraTipCanDisplay__FP21EDIT_CHIP_ATTACH_DATA
 * @address 0x2188E0
 * @size 0x80
 * @unknownret
 */
void AtraTipCanDisplay(EDIT_CHIP_ATTACH_DATA *);

/**
 * @mangled AtoraTipRelationDraw__FiiP14EDITPARTS_INFOiii
 * @address 0x218960
 * @size 0x200
 * @unknownret
 */
void AtoraTipRelationDraw(int, int, EDITPARTS_INFO *, int, int, int);

/**
 * @mangled AtoraBoardEnableMovePos__FiPi
 * @address 0x218B60
 * @size 0x110
 * @unknownret
 */
void AtoraBoardEnableMovePos(int, int *);

/**
 * @mangled AtoraBoardGoToPos__FPiii
 * @address 0x218C70
 * @size 0x50
 * @unknownret
 */
void AtoraBoardGoToPos(int *, int, int);

/**
 * @mangled GetAtraMsgNo__Fii
 * @address 0x218CC0
 * @size 0xE0
 * @unknownret
 */
void GetAtraMsgNo(int, int);

/**
 * @mangled AtoraMsgNoGet__Fiii
 * @address 0x218DA0
 * @size 0x200
 * @unknownret
 */
void AtoraMsgNoGet(int, int, int);

/**
 * @mangled AtoraTipOnlyMsgNoGet__Fii
 * @address 0x218FA0
 * @size 0x60
 * @unknownret
 */
void AtoraTipOnlyMsgNoGet(int, int);

/**
 * @mangled AtoraTipGetTexPos__FiRiRi
 * @address 0x219000
 * @size 0xE0
 * @unknownret
 */
void AtoraTipGetTexPos(int, int &, int &);

/**
 * @mangled AtoraTipObjectOrPerson__Fiiiii
 * @address 0x2190E0
 * @size 0xE0
 * @unknownret
 */
void AtoraTipObjectOrPerson(int, int, int, int, int);

/**
 * @mangled AtoraTipHoleTexInfoGet__FiPUc
 * @address 0x2191C0
 * @size 0x50
 * @unknownret
 */
void AtoraTipHoleTexInfoGet(int, unsigned char *);

/**
 * @mangled AtoraPlateDrawHaichiBar__FP14EDITPARTS_INFOiii
 * @address 0x219210
 * @size 0xE0
 * @unknownret
 */
void AtoraPlateDrawHaichiBar(EDITPARTS_INFO *, int, int, int);

/**
 * @mangled DrawAtraBuildNum__FP14EDITPARTS_INFOiii
 * @address 0x2192F0
 * @size 0x170
 * @unknownret
 */
void DrawAtraBuildNum(EDITPARTS_INFO *, int, int, int);

/**
 * @mangled DrawAtora__Fiiii
 * @address 0x219460
 * @size 0x860
 * @unknownret
 */
void DrawAtora(int, int, int, int);

/**
 * @mangled DrawAtoraNothing__Fiii
 * @address 0x219CC0
 * @size 0x300
 * @unknownret
 */
void DrawAtoraNothing(int, int, int);

/**
 * @mangled DrawMsgAtraWarning__FP6ClsMesii
 * @address 0x219FC0
 * @size 0xA0
 * @unknownret
 */
void DrawMsgAtraWarning(ClsMes *, int, int);

/**
 * @mangled AtoraTipInfoInit__Fv
 * @address 0x21A060
 * @size 0x30
 * @unknownret
 */
void AtoraTipInfoInit(void);

/**
 * @mangled GetMenuAtraEventFlag__Fv
 * @address 0x21A090
 * @size 0x10
 * @unknownret
 */
void GetMenuAtraEventFlag(void);

/**
 * @mangled SetMenuAtraEventFlag__Fi
 * @address 0x21A0A0
 * @size 0x10
 * @unknownret
 */
void SetMenuAtraEventFlag(int);

/**
 * @mangled MenuAtoraAfterFadeIn__Fv
 * @address 0x21A0B0
 * @size 0x80
 * @unknownret
 */
void MenuAtoraAfterFadeIn(void);

/**
 * @mangled InitMenuAtora1__FiiPiP1
 * @address 0x21A130
 * @size 0x310
 * @unknownret
 */
void InitMenuAtora1(int, int, int *, void /* CW back-ref target unresolved */ *);

/**
 * @mangled InitMenuAtoraSelect__Fi
 * @address 0x21A440
 * @size 0x450
 * @unknownret
 */
void InitMenuAtoraSelect(int);

/**
 * @mangled ExitAtoraSelect__Fv
 * @address 0x21A890
 * @size 0xD0
 * @unknownret
 */
void ExitAtoraSelect(void);

/**
 * @mangled AtoraTexInfoGet__Fv
 * @address 0x21A960
 * @size 0x120
 * @unknownret
 */
void AtoraTexInfoGet(void);

/**
 * @mangled DrawMenuAtoraSelect__Fv
 * @address 0x21AA80
 * @size 0x400
 * @unknownret
 */
void DrawMenuAtoraSelect(void);

/**
 * @mangled DrawAtoraSelect__Fi
 * @address 0x21AE80
 * @size 0xFF0
 * @unknownret
 */
void DrawAtoraSelect(int);

/**
 * @mangled AtoraTextureEnter__Fv
 * @address 0x21BE70
 * @size 0x1B0
 * @unknownret
 */
void AtoraTextureEnter(void);

/**
 * @mangled GetTipKind__Fi
 * @address 0x21C020
 * @size 0x70
 * @unknownret
 */
void GetTipKind(int);

/**
 * @mangled CompTip__Fii
 * @address 0x21C090
 * @size 0xD0
 * @unknownret
 */
void CompTip(int, int);

/**
 * @mangled SeitonAtoraTipBoardSub__Fv
 * @address 0x21C160
 * @size 0x110
 * @unknownret
 */
void SeitonAtoraTipBoardSub(void);

/**
 * @mangled SeitonAtoraTipBoard__Fv
 * @address 0x21C270
 * @size 0x70
 * @unknownret
 */
void SeitonAtoraTipBoard(void);

/**
 * @mangled MenuAtoraSelectKey__Fv
 * @address 0x21C2E0
 * @size 0x7B0
 * @unknownret
 */
void MenuAtoraSelectKey(void);

/**
 * @mangled AtoraBoardKey__Fv
 * @address 0x21CA90
 * @size 0xA30
 * @unknownret
 */
void AtoraBoardKey(void);

/**
 * @mangled AtoraTipKey__Fv
 * @address 0x21D4C0
 * @size 0x300
 * @unknownret
 */
void AtoraTipKey(void);

/**
 * @mangled AtoraMenuTipCancel__Fv
 * @address 0x21D7C0
 * @size 0xD0
 * @unknownret
 */
void AtoraMenuTipCancel(void);

/**
 * @mangled AtoraBoardFadeEffect__Fv
 * @address 0x21D890
 * @size 0x3D0
 * @unknownret
 */
void AtoraBoardFadeEffect(void);

/**
 * @mangled AtoraNameDraw__Fi
 * @address 0x21DC60
 * @size 0x3C0
 * @unknownret
 */
void AtoraNameDraw(int);

/**
 * @mangled OptionMenuDraw__Fiiiii
 * @address 0x21E020
 * @size 0x430
 * @unknownret
 */
void OptionMenuDraw(int, int, int, int, int);

/**
 * @mangled DrawOptionLRCur__Fii
 * @address 0x21E450
 * @size 0x80
 * @unknownret
 */
void DrawOptionLRCur(int, int);

/**
 * @mangled InitMenuOption__FiiP1
 * @address 0x21E4D0
 * @size 0x2B0
 * @unknownret
 */
void InitMenuOption(int, int, void /* CW back-ref target unresolved */ *);

/**
 * @mangled ExitMenuOption__Fv
 * @address 0x21E780
 * @size 0x190
 * @unknownret
 */
void ExitMenuOption(void);

/**
 * @mangled InitOptionFlag__Fv
 * @address 0x21E910
 * @size 0x50
 * @unknownret
 */
void InitOptionFlag(void);

/**
 * @mangled PrevOptionSetFunc__Fv
 * @address 0x21E960
 * @size 0x50
 * @unknownret
 */
void PrevOptionSetFunc(void);

/**
 * @mangled MenuOptionKey__Fv
 * @address 0x21E9B0
 * @size 0x900
 * @unknownret
 */
void MenuOptionKey(void);

/**
 * @mangled DrawMenuOption__Fv
 * @address 0x21F2B0
 * @size 0x830
 * @unknownret
 */
void DrawMenuOption(void);

/**
 * @mangled OptionMenuFadeOutStart__Fv
 * @address 0x21FAE0
 * @size 0x30
 * @unknownret
 */
void OptionMenuFadeOutStart(void);

/**
 * @mangled InitMenuSave__FiiP1
 * @address 0x21FB10
 * @size 0x270
 * @unknownret
 */
void InitMenuSave(int, int, void /* CW back-ref target unresolved */ *);

/**
 * @mangled ExitSaveSelect__Fv
 * @address 0x21FD80
 * @size 0x150
 * @unknownret
 */
void ExitSaveSelect(void);

/**
 * @mangled MenuSaveKey__Fv
 * @address 0x21FED0
 * @size 0x500
 * @unknownret
 */
void MenuSaveKey(void);

/**
 * @mangled DrawMenuSave__FPc
 * @address 0x2203D0
 * @size 0x9C0
 * @unknownret
 */
void DrawMenuSave(char *);

/**
 * @mangled SaveMenuKeyFadeIn__Fv
 * @address 0x220D90
 * @size 0x40
 * @unknownret
 */
void SaveMenuKeyFadeIn(void);

/**
 * @mangled SaveMenuKeyFadeOut__Fv
 * @address 0x220DD0
 * @size 0x70
 * @unknownret
 */
void SaveMenuKeyFadeOut(void);

/**
 * @mangled SaveMenuKeyModeSelect__Fv
 * @address 0x220E40
 * @size 0x130
 * @unknownret
 */
void SaveMenuKeyModeSelect(void);

/**
 * @mangled SaveMenuKeyMcSelect__Fv
 * @address 0x220F70
 * @size 0x230
 * @unknownret
 */
void SaveMenuKeyMcSelect(void);

/**
 * @mangled SaveMenuKeyCheckMcType__Fv
 * @address 0x2211A0
 * @size 0xC0
 * @unknownret
 */
void SaveMenuKeyCheckMcType(void);

/**
 * @mangled SaveMenuKeyCheckMc__Fv
 * @address 0x221260
 * @size 0x250
 * @unknownret
 */
void SaveMenuKeyCheckMc(void);

/**
 * @mangled SaveMenuKeyLoadConfig__Fv
 * @address 0x2214B0
 * @size 0x80
 * @unknownret
 */
void SaveMenuKeyLoadConfig(void);

/**
 * @mangled SaveMenuKeyFileSelect__Fv
 * @address 0x221530
 * @size 0x200
 * @unknownret
 */
void SaveMenuKeyFileSelect(void);
