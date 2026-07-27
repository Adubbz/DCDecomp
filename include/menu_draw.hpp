#pragma once

#include "common.h"

/* ?ret */ void SaveMenuKeySaveCheck(void); // @ 0x221730 (0x170 bytes) -- mangled: SaveMenuKeySaveCheck__Fv
/* ?ret */ void SaveMenuKeySaveDecide(void); // @ 0x2218A0 (0xE0 bytes) -- mangled: SaveMenuKeySaveDecide__Fv
/* ?ret */ void SaveMenuKeySave(void); // @ 0x221980 (0x130 bytes) -- mangled: SaveMenuKeySave__Fv
/* ?ret */ void SaveMenuKeyEndSave(void); // @ 0x221AB0 (0x80 bytes) -- mangled: SaveMenuKeyEndSave__Fv
/* ?ret */ void SaveMenuKeyLoadDecide(void); // @ 0x221B30 (0x100 bytes) -- mangled: SaveMenuKeyLoadDecide__Fv
/* ?ret */ void SaveMenuKeyLoad(void); // @ 0x221C30 (0xE0 bytes) -- mangled: SaveMenuKeyLoad__Fv
/* ?ret */ void SaveMenuKeyArart(void); // @ 0x221D10 (0x130 bytes) -- mangled: SaveMenuKeyArart__Fv
/* ?ret */ void SaveMenuKeyNewDirSelect(void); // @ 0x221E40 (0xD0 bytes) -- mangled: SaveMenuKeyNewDirSelect__Fv
/* ?ret */ void SaveMenuKeyNewDir(void); // @ 0x221F10 (0x110 bytes) -- mangled: SaveMenuKeyNewDir__Fv
/* ?ret */ void SaveMenuKeyFormat(void); // @ 0x222020 (0x150 bytes) -- mangled: SaveMenuKeyFormat__Fv
/* ?ret */ void SaveMenuKeyUnFormat(void); // @ 0x222170 (0x80 bytes) -- mangled: SaveMenuKeyUnFormat__Fv
/* ?ret */ void SaveMenuKeyDifVersion(void); // @ 0x2221F0 (0x60 bytes) -- mangled: SaveMenuKeyDifVersion__Fv
/* ?ret */ void SaveMenuKeyDelete(void); // @ 0x222250 (0x10 bytes) -- mangled: SaveMenuKeyDelete__Fv
/* ?ret */ void SaveMenuKeyCopy(void); // @ 0x222260 (0x10 bytes) -- mangled: SaveMenuKeyCopy__Fv
/* ?ret */ void SaveMenuKeyAfterEnding(void); // @ 0x222270 (0x80 bytes) -- mangled: SaveMenuKeyAfterEnding__Fv
/* ?ret */ void SaveMenuKeySaveDecideEnding(void); // @ 0x2222F0 (0x80 bytes) -- mangled: SaveMenuKeySaveDecideEnding__Fv
/* ?ret */ void SaveMenuKeySaveEnding(void); // @ 0x222370 (0x40 bytes) -- mangled: SaveMenuKeySaveEnding__Fv
/* ?ret */ void SaveMenuKeyEndSaveEnding(void); // @ 0x2223B0 (0x60 bytes) -- mangled: SaveMenuKeyEndSaveEnding__Fv
/* ?ret */ void GetSaveMenuMsgNo(void); // @ 0x222410 (0x230 bytes) -- mangled: GetSaveMenuMsgNo__Fv
/* ?ret */ void SaveMenuTextureEnter(void); // @ 0x222640 (0x2D0 bytes) -- mangled: SaveMenuTextureEnter__Fv
/* ?ret */ void SaveMenuEffectFadeOut(void); // @ 0x222910 (0x30 bytes) -- mangled: SaveMenuEffectFadeOut__Fv
/* ?ret */ void GetSaveBoardAlphaInfo(int, int, int &, int &, int); // @ 0x222940 (0x160 bytes) -- mangled: GetSaveBoardAlphaInfo__FiiRiRii
/* ?ret */ void DrawSaveBoard(SAVEDATA_INFO *, CTexture **, int, int, int, int); // @ 0x222AA0 (0x9C0 bytes) -- mangled: DrawSaveBoard__FP13SAVEDATA_INFOPP8CTextureiiii
/* ?ret */ void DrawNewFileTemplete(int, int, int); // @ 0x223460 (0x4E0 bytes) -- mangled: DrawNewFileTemplete__Fiii
/* ?ret */ void InitExistData(void); // @ 0x223940 (0x180 bytes) -- mangled: InitExistData__Fv
/* ?ret */ void SaveEnableCheck(void); // @ 0x223AC0 (0x1A0 bytes) -- mangled: SaveEnableCheck__Fv
/* ?ret */ void InitEventItemSelect(int, int *, ITEM_PACK *, int, int, int, int); // @ 0x223C60 (0x480 bytes) -- mangled: InitEventItemSelect__FiPiP9ITEM_PACKiiii
/* ?ret */ void EventItemSelectExit(void); // @ 0x2240E0 (0x60 bytes) -- mangled: EventItemSelectExit__Fv
/* ?ret */ void EventItemSelectLoop(int *); // @ 0x224140 (0x120 bytes) -- mangled: EventItemSelectLoop__FPi
/* ?ret */ void EventItemSelectKey(int *); // @ 0x224260 (0x6B0 bytes) -- mangled: EventItemSelectKey__FPi
/* ?ret */ void DrawEventAndFishMenuBoard_Ver(CTexture *, CRect_i_, int, int, int, int); // @ 0x224910 (0x150 bytes) -- mangled: DrawEventAndFishMenuBoard_Ver__FP8CTexture8CRect_i_iiii
/* ?ret */ void DrawEventAndFishMenuBoard(CTexture *, int, int, int, int); // @ 0x224A60 (0x2F0 bytes) -- mangled: DrawEventAndFishMenuBoard__FP8CTextureiiii
/* ?ret */ void EventItemSelectDraw(void); // @ 0x224D50 (0x6D0 bytes) -- mangled: EventItemSelectDraw__Fv
/* ?ret */ void DrawEventItemBoard(int, int, int, int, int, CTexture *); // @ 0x225420 (0x110 bytes) -- mangled: DrawEventItemBoard__FiiiiiP8CTexture
/* ?ret */ void PlayerAllItemCheck(int); // @ 0x225530 (0xA0 bytes) -- mangled: PlayerAllItemCheck__Fi
/* ?ret */ void GetAddAttachItem(int); // @ 0x2255D0 (0x30 bytes) -- mangled: GetAddAttachItem__Fi
/* ?ret */ void TransWepNo(int); // @ 0x225600 (0xE0 bytes) -- mangled: TransWepNo__Fi
/* ?ret */ void TransWepNoNewToOld(int); // @ 0x2256E0 (0x130 bytes) -- mangled: TransWepNoNewToOld__Fi
/* ?ret */ void PlusAttachmentVolume(ATTACH_LIST *, ATTACH_LIST *, float); // @ 0x225810 (0x160 bytes) -- mangled: PlusAttachmentVolume__FP11ATTACH_LISTP11ATTACH_LISTf
/* ?ret */ void GetWeaponAttachStatusUp(WEAPON_HAVE *, int); // @ 0x225970 (0x130 bytes) -- mangled: GetWeaponAttachStatusUp__FP11WEAPON_HAVEi
/* ?ret */ void SetWeaponAttachStatus(WEAPON_HAVE *); // @ 0x225AA0 (0xC0 bytes) -- mangled: SetWeaponAttachStatus__FP11WEAPON_HAVE
/* ?ret */ void WeaponAllValueSet(WEAPON_HAVE *, WEAPON_HAVE *, int); // @ 0x225B60 (0x3F0 bytes) -- mangled: WeaponAllValueSet__FP11WEAPON_HAVEP11WEAPON_HAVEi
/* ?ret */ void SetAttachMentValue(int, int, short, ATTACH_LIST *); // @ 0x225F50 (0x160 bytes) -- mangled: SetAttachMentValue__FiisP11ATTACH_LIST
/* ?ret */ void GetAttachVolumeForMsg(ATTACH_LIST *); // @ 0x2260B0 (0x60 bytes) -- mangled: GetAttachVolumeForMsg__FP11ATTACH_LIST
/* ?ret */ void InitDunEnterMenu(int, int, int); // @ 0x226110 (0x410 bytes) -- mangled: InitDunEnterMenu__Fiii
/* ?ret */ void ExitDunEnterMenu(void); // @ 0x226520 (0x70 bytes) -- mangled: ExitDunEnterMenu__Fv
/* ?ret */ void DunEnterMenuLoop(void); // @ 0x226590 (0x90 bytes) -- mangled: DunEnterMenuLoop__Fv
/* ?ret */ void DunEnterMenuKey(void); // @ 0x226620 (0x6F0 bytes) -- mangled: DunEnterMenuKey__Fv
/* ?ret */ void DunEnterDraw(void); // @ 0x226D10 (0x540 bytes) -- mangled: DunEnterDraw__Fv
/* ?ret */ void DunEnterBoardWaku(int, int, int); // @ 0x227250 (0x4B0 bytes) -- mangled: DunEnterBoardWaku__Fiii
/* ?ret */ void DunEnterBoard(int, int, int); // @ 0x227700 (0x7C0 bytes) -- mangled: DunEnterBoard__Fiii
/* ?ret */ void DrawEnemyNum(int, int, int, int, int, int); // @ 0x227EC0 (0x160 bytes) -- mangled: DrawEnemyNum__Fiiiiii
/* ?ret */ void DrawGetAtoraNumBoard(int, int, int, int, int, int); // @ 0x228020 (0x250 bytes) -- mangled: DrawGetAtoraNumBoard__Fiiiiii
/* ?ret */ void DrawDunNumberClip(int, int, int, int, int, int); // @ 0x228270 (0xE0 bytes) -- mangled: DrawDunNumberClip__Fiiiiii
/* ?ret */ void DrawDunEnterBack(int); // @ 0x228350 (0xA0 bytes) -- mangled: DrawDunEnterBack__Fi
/* ?ret */ void DrawDunEnterFloorName(int, int, int, int, int, int); // @ 0x2283F0 (0x290 bytes) -- mangled: DrawDunEnterFloorName__Fiiiiii
/* ?ret */ void StartQuickChange(void /* CW back-ref target unresolved */ *, int, int *, int); // @ 0x228680 (0x530 bytes) -- mangled: StartQuickChange__FP1iPii
/* ?ret */ void CharaChangeLoop(void); // @ 0x228BB0 (0x2E0 bytes) -- mangled: CharaChangeLoop__Fv
/* ?ret */ void CharaChangeKey(void); // @ 0x228E90 (0x8B0 bytes) -- mangled: CharaChangeKey__Fv
/* ?ret */ void CharaChangeDraw(void); // @ 0x229740 (0xAD0 bytes) -- mangled: CharaChangeDraw__Fv
/* ?ret */ void DngActItemModelReadStart(void /* CW back-ref target unresolved */ *); // @ 0x22A210 (0x180 bytes) -- mangled: DngActItemModelReadStart__FP1
/* ?ret */ void DngActItemModelBuild(int); // @ 0x22A390 (0x210 bytes) -- mangled: DngActItemModelBuild__Fi
/* ?ret */ void DngActiveItemTextureCopy(void); // @ 0x22A5A0 (0x110 bytes) -- mangled: DngActiveItemTextureCopy__Fv
/* ?ret */ void DngActiveWeaponTextureCopy(void); // @ 0x22A6B0 (0x130 bytes) -- mangled: DngActiveWeaponTextureCopy__Fv
/* ?ret */ void GetWeaponMsgNo(WEAPON_HAVE *); // @ 0x22A7E0 (0x60 bytes) -- mangled: GetWeaponMsgNo__FP11WEAPON_HAVE
/* ?ret */ void GetWeaponMsgNo2(int); // @ 0x22A840 (0x40 bytes) -- mangled: GetWeaponMsgNo2__Fi
/* ?ret */ void DrawWepAttach(int, int, WEAPON_HAVE *, int, int); // @ 0x22A880 (0x1C0 bytes) -- mangled: DrawWepAttach__FiiP11WEAPON_HAVEii
/* ?ret */ void GetAtraTipNowHave(int, int); // @ 0x22AA40 (0x180 bytes) -- mangled: GetAtraTipNowHave__Fii
/* ?ret */ void GetDispVolumeForFloat(float); // @ 0x22ABC0 (0x70 bytes) -- mangled: GetDispVolumeForFloat__Ff
/* ?ret */ void InitItemPolygonView(int, void /* CW back-ref target unresolved */ *); // @ 0x22AC30 (0xF0 bytes) -- mangled: InitItemPolygonView__FiP1
/* ?ret */ void EnterItemPolygonView(void); // @ 0x22AD20 (0x220 bytes) -- mangled: EnterItemPolygonView__Fv
/* ?ret */ void LocalDrawItemPolygonView(void); // @ 0x22AF40 (0x270 bytes) -- mangled: LocalDrawItemPolygonView__Fv
/* ?ret */ void DrawItemPolygonView(void); // @ 0x22B1B0 (0x40 bytes) -- mangled: DrawItemPolygonView__Fv
/* ?ret */ void ConvDebugSelectToExcelListNo(int); // @ 0x22B1F0 (0x50 bytes) -- mangled: ConvDebugSelectToExcelListNo__Fi
/* ?ret */ void DebugItemGetKey(void); // @ 0x22B240 (0x370 bytes) -- mangled: DebugItemGetKey__Fv
/* ?ret */ void DebugItemGetDraw(void); // @ 0x22B5B0 (0x210 bytes) -- mangled: DebugItemGetDraw__Fv
/* ?ret */ void DrawItemDataView(int); // @ 0x22B7C0 (0x230 bytes) -- mangled: DrawItemDataView__Fi
/* ?ret */ void GetMenuTextureDir(void); // @ 0x22B9F0 (0x10 bytes) -- mangled: GetMenuTextureDir__Fv
/* ?ret */ void GetMenuLangFlag(void); // @ 0x22BA00 (0x10 bytes) -- mangled: GetMenuLangFlag__Fv
/* ?ret */ void GetNowSelectLanguage(int); // @ 0x22BA10 (0x40 bytes) -- mangled: GetNowSelectLanguage__Fi
/* ?ret */ void GetPathReadDifferntLang(char *); // @ 0x22BA50 (0x60 bytes) -- mangled: GetPathReadDifferntLang__FPc
/* ?ret */ void LoadFileBGMenuData(char *, void /* CW back-ref target unresolved */ *); // @ 0x22BAB0 (0x90 bytes) -- mangled: LoadFileBGMenuData__FPcP1
/* ?ret */ void LoadFileMenuData(char *, unsigned int *); // @ 0x22BB40 (0x70 bytes) -- mangled: LoadFileMenuData__FPcPUi
/* ?ret */ void BtlMenuBufferSet(int); // @ 0x22BBB0 (0x50 bytes) -- mangled: BtlMenuBufferSet__Fi
/* ?ret */ void MenuCalcBufAlignment(void /* CW back-ref target unresolved */ *); // @ 0x22BC00 (0x40 bytes) -- mangled: MenuCalcBufAlignment__FP1
/* ?ret */ void GetAtoraMaxVillage(void); // @ 0x22BC40 (0xD0 bytes) -- mangled: GetAtoraMaxVillage__Fv
/* ?ret */ void GetNowMapTransAtraMap(int); // @ 0x22BD10 (0xE0 bytes) -- mangled: GetNowMapTransAtraMap__Fi
/* ?ret */ void MenuWorldTrans(CCamera *); // @ 0x22BDF0 (0xA0 bytes) -- mangled: MenuWorldTrans__FP7CCamera
/* ?ret */ void MenuPolygonDraw(int, void (*)(void)); // @ 0x22BE90 (0x190 bytes) -- mangled: MenuPolygonDraw__FiPFv_v
/* ?ret */ void Get3DPosTo2DPos(CFrame *, int *); // @ 0x22C020 (0x70 bytes) -- mangled: Get3DPosTo2DPos__FP6CFramePi
/* ?ret */ void GetMenuCommonFontW(int, int); // @ 0x22C090 (0x40 bytes) -- mangled: GetMenuCommonFontW__Fii
/* ?ret */ void GetMenuCommonPutXY(ClsMes *, int); // @ 0x22C0D0 (0x70 bytes) -- mangled: GetMenuCommonPutXY__FP6ClsMesi
/* ?ret */ void InitMenuMesSet(int, short *); // @ 0x22C140 (0xD60 bytes) -- mangled: InitMenuMesSet__FiPs
/* ?ret */ void DrawMenuClsMes(ClsMes *, int, int); // @ 0x22CEA0 (0x50 bytes) -- mangled: DrawMenuClsMes__FP6ClsMesii
/* ?ret */ void ComMenuSePlay(int); // @ 0x22CEF0 (0x30 bytes) -- mangled: ComMenuSePlay__Fi
/* ?ret */ void DrawMenu2DSprite(CTexture *, CRect_i_, CRect_i_, int); // @ 0x22CF20 (0x70 bytes) -- mangled: DrawMenu2DSprite__FP8CTexture8CRect_i_8CRect_i_i
/* ?ret */ void DrawMenu2DSprite(CTexture *, CRect_i_, CRect_i_, unsigned char, unsigned char, unsigned char, int); // @ 0x22CF90 (0xA0 bytes) -- mangled: DrawMenu2DSprite__FP8CTexture8CRect_i_8CRect_i_UcUcUci
/* ?ret */ void DrawMenu2DSprite(CTexture *, CRect_i_, CRect_i_, spRGBA *, spRGBA *, spRGBA *, spRGBA *); // @ 0x22D030 (0xB0 bytes) -- mangled: DrawMenu2DSprite__FP8CTexture8CRect_i_8CRect_i_P6spRGBAP6spRGBAP6spRGBAP6spRGBA
/* ?ret */ void MenuTextureReload(int); // @ 0x22D0E0 (0x50 bytes) -- mangled: MenuTextureReload__Fi
/* ?ret */ void MenuTextureDelete(int *); // @ 0x22D130 (0x80 bytes) -- mangled: MenuTextureDelete__FPi
/* ?ret */ void AllFillBoxForMenu(unsigned char, unsigned char, unsigned char, unsigned char); // @ 0x22D1B0 (0xD0 bytes) -- mangled: AllFillBoxForMenu__FUcUcUcUc
/* ?ret */ void AllFadeForMenu(int); // @ 0x22D280 (0x30 bytes) -- mangled: AllFadeForMenu__Fi
/* ?ret */ void FrameImageDraw(int, int); // @ 0x22D2B0 (0x120 bytes) -- mangled: FrameImageDraw__Fii
/* ?ret */ void DrawMenuColorGradation(CRect_i_ &, spRGBA *, spRGBA *, spRGBA *, spRGBA *); // @ 0x22D3D0 (0x80 bytes) -- mangled: DrawMenuColorGradation__FR8CRect_i_P6spRGBAP6spRGBAP6spRGBAP6spRGBA
/* ?ret */ void DrawMenuSideGradation(CRect_i_ &, spRGBA *, spRGBA *); // @ 0x22D450 (0x70 bytes) -- mangled: DrawMenuSideGradation__FR8CRect_i_P6spRGBAP6spRGBA
/* ?ret */ void DrawDontSetItemMark(int, int, int, int, int); // @ 0x22D4C0 (0xE0 bytes) -- mangled: DrawDontSetItemMark__Fiiiii
/* ?ret */ void DrawIconParts(int, int, int, int, int, int, int); // @ 0x22D5A0 (0x1E0 bytes) -- mangled: DrawIconParts__Fiiiiiii
/* ?ret */ void DrawAttachNumberOrWeapon(int, int, int, int, int, int, int, int); // @ 0x22D780 (0x270 bytes) -- mangled: DrawAttachNumberOrWeapon__Fiiiiiiii
/* ?ret */ void FadeTexX(int, int, int, int, char *, int); // @ 0x22D9F0 (0x3A0 bytes) -- mangled: FadeTexX__FiiiiPci
/* ?ret */ void RetCTex(short, int &, int &); // @ 0x22DD90 (0xF0 bytes) -- mangled: RetCTex__FsRiRi
/* ?ret */ void MenuTextureClip(int &, int &, int &, int, int); // @ 0x22DE80 (0x80 bytes) -- mangled: MenuTextureClip__FRiRiRiii
/* ?ret */ void GetNumberKeta(int); // @ 0x22DF00 (0x40 bytes) -- mangled: GetNumberKeta__Fi
/* ?ret */ void GetMenuIconInfo(int); // @ 0x22DF40 (0x60 bytes) -- mangled: GetMenuIconInfo__Fi
/* ?ret */ void DrawMainMenuIcon(int, int, int, int, int, int); // @ 0x22DFA0 (0x1E0 bytes) -- mangled: DrawMainMenuIcon__Fiiiiii
/* ?ret */ void DrawMenuVibeItem(int, int, int, int, int); // @ 0x22E180 (0x190 bytes) -- mangled: DrawMenuVibeItem__Fiiiii
/* ?ret */ void GetMainMenuRightHelpWinLangOffset(float &, float &, float &, float &); // @ 0x22E310 (0xB0 bytes) -- mangled: GetMainMenuRightHelpWinLangOffset__FRfRfRfRf
/* ?ret */ void GetMainMenuRightHelpMsgLangOffset(int &, int &); // @ 0x22E3C0 (0x80 bytes) -- mangled: GetMainMenuRightHelpMsgLangOffset__FRiRi
/* ?ret */ void InitHaveData(IHAVEITEM *); // @ 0x22E440 (0x30 bytes) -- mangled: InitHaveData__FP9IHAVEITEM
/* ?ret */ void InitHaveWep(WEAPON_HAVE *); // @ 0x22E470 (0x40 bytes) -- mangled: InitHaveWep__FP11WEAPON_HAVE
/* ?ret */ void InitHaveAttach(ATTACH_LIST *); // @ 0x22E4B0 (0x30 bytes) -- mangled: InitHaveAttach__FP11ATTACH_LIST
/* ?ret */ void MenuDataSwap(short *, short *); // @ 0x22E4E0 (0x30 bytes) -- mangled: MenuDataSwap__FPsPs
/* ?ret */ void MenuDataSwap(int *, int *); // @ 0x22E510 (0x30 bytes) -- mangled: MenuDataSwap__FPiPi
/* ?ret */ void MenuDataSwap(WEAPON_HAVE *, WEAPON_HAVE *); // @ 0x22E540 (0x90 bytes) -- mangled: MenuDataSwap__FP11WEAPON_HAVEP11WEAPON_HAVE
/* ?ret */ void MenuDataSwap(ATTACH_LIST *, ATTACH_LIST *); // @ 0x22E5D0 (0x90 bytes) -- mangled: MenuDataSwap__FP11ATTACH_LISTP11ATTACH_LIST
/* ?ret */ void SetMenuTrushMark(ITEM_PACK *); // @ 0x22E660 (0xB0 bytes) -- mangled: SetMenuTrushMark__FP9ITEM_PACK
/* ?ret */ void DeleteMenuTrushMark(void); // @ 0x22E710 (0x30 bytes) -- mangled: DeleteMenuTrushMark__Fv
/* ?ret */ void InitPersonalBoardMode(CUserStatus *, PERSONAL_BOARD *, int, int); // @ 0x22E740 (0x270 bytes) -- mangled: InitPersonalBoardMode__FP11CUserStatusP14PERSONAL_BOARDii
/* ?ret */ void BoardModeChangeKey(void); // @ 0x22E9B0 (0x130 bytes) -- mangled: BoardModeChangeKey__Fv
/* ?ret */ void PersonalBoardLimmitCheck(void); // @ 0x22EAE0 (0x1A0 bytes) -- mangled: PersonalBoardLimmitCheck__Fv
/* ?ret */ void PersonalBoardKeySub(void); // @ 0x22EC80 (0x2E0 bytes) -- mangled: PersonalBoardKeySub__Fv
/* ?ret */ void PersonalBoardKey(void); // @ 0x22EF60 (0x30 bytes) -- mangled: PersonalBoardKey__Fv
/* ?ret */ void PersonalBoardItemPush(IHAVEITEM *, int); // @ 0x22EF90 (0x110 bytes) -- mangled: PersonalBoardItemPush__FP9IHAVEITEMi
