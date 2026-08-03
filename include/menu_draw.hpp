#pragma once

#include "common.h"

// Forward declarations for the types these declarations name. The skeleton
// headers are generated from the retail symbol table, which knows the type
// names but not where they live.
struct ATTACH_LIST;
class CCamera;
class CFrame;
class CRect_i_;
class CTexture;
class CUserStatus;
class ClsMes;
struct IHAVEITEM;
struct ITEM_PACK;
struct PERSONAL_BOARD;
struct SAVEDATA_INFO;
struct WEAPON_HAVE;
struct spRGBA;


/**
 * @mangled SaveMenuKeySaveCheck__Fv
 * @address 0x221730
 * @size 0x170
 * @unknownret
 */
void SaveMenuKeySaveCheck(void);

/**
 * @mangled SaveMenuKeySaveDecide__Fv
 * @address 0x2218A0
 * @size 0xE0
 * @unknownret
 */
void SaveMenuKeySaveDecide(void);

/**
 * @mangled SaveMenuKeySave__Fv
 * @address 0x221980
 * @size 0x130
 * @unknownret
 */
void SaveMenuKeySave(void);

/**
 * @mangled SaveMenuKeyEndSave__Fv
 * @address 0x221AB0
 * @size 0x80
 * @unknownret
 */
void SaveMenuKeyEndSave(void);

/**
 * @mangled SaveMenuKeyLoadDecide__Fv
 * @address 0x221B30
 * @size 0x100
 * @unknownret
 */
void SaveMenuKeyLoadDecide(void);

/**
 * @mangled SaveMenuKeyLoad__Fv
 * @address 0x221C30
 * @size 0xE0
 * @unknownret
 */
void SaveMenuKeyLoad(void);

/**
 * @mangled SaveMenuKeyArart__Fv
 * @address 0x221D10
 * @size 0x130
 * @unknownret
 */
void SaveMenuKeyArart(void);

/**
 * @mangled SaveMenuKeyNewDirSelect__Fv
 * @address 0x221E40
 * @size 0xD0
 * @unknownret
 */
void SaveMenuKeyNewDirSelect(void);

/**
 * @mangled SaveMenuKeyNewDir__Fv
 * @address 0x221F10
 * @size 0x110
 * @unknownret
 */
void SaveMenuKeyNewDir(void);

/**
 * @mangled SaveMenuKeyFormat__Fv
 * @address 0x222020
 * @size 0x150
 * @unknownret
 */
void SaveMenuKeyFormat(void);

/**
 * @mangled SaveMenuKeyUnFormat__Fv
 * @address 0x222170
 * @size 0x80
 * @unknownret
 */
void SaveMenuKeyUnFormat(void);

/**
 * @mangled SaveMenuKeyDifVersion__Fv
 * @address 0x2221F0
 * @size 0x60
 * @unknownret
 */
void SaveMenuKeyDifVersion(void);

/**
 * @mangled SaveMenuKeyDelete__Fv
 * @address 0x222250
 * @size 0x10
 * @unknownret
 */
void SaveMenuKeyDelete(void);

/**
 * @mangled SaveMenuKeyCopy__Fv
 * @address 0x222260
 * @size 0x10
 * @unknownret
 */
void SaveMenuKeyCopy(void);

/**
 * @mangled SaveMenuKeyAfterEnding__Fv
 * @address 0x222270
 * @size 0x80
 * @unknownret
 */
void SaveMenuKeyAfterEnding(void);

/**
 * @mangled SaveMenuKeySaveDecideEnding__Fv
 * @address 0x2222F0
 * @size 0x80
 * @unknownret
 */
void SaveMenuKeySaveDecideEnding(void);

/**
 * @mangled SaveMenuKeySaveEnding__Fv
 * @address 0x222370
 * @size 0x40
 * @unknownret
 */
void SaveMenuKeySaveEnding(void);

/**
 * @mangled SaveMenuKeyEndSaveEnding__Fv
 * @address 0x2223B0
 * @size 0x60
 * @unknownret
 */
void SaveMenuKeyEndSaveEnding(void);

/**
 * @mangled GetSaveMenuMsgNo__Fv
 * @address 0x222410
 * @size 0x230
 * @unknownret
 */
void GetSaveMenuMsgNo(void);

/**
 * @mangled SaveMenuTextureEnter__Fv
 * @address 0x222640
 * @size 0x2D0
 * @unknownret
 */
void SaveMenuTextureEnter(void);

/**
 * @mangled SaveMenuEffectFadeOut__Fv
 * @address 0x222910
 * @size 0x30
 * @unknownret
 */
void SaveMenuEffectFadeOut(void);

/**
 * @mangled GetSaveBoardAlphaInfo__FiiRiRii
 * @address 0x222940
 * @size 0x160
 * @unknownret
 */
void GetSaveBoardAlphaInfo(int, int, int &, int &, int);

/**
 * @mangled DrawSaveBoard__FP13SAVEDATA_INFOPP8CTextureiiii
 * @address 0x222AA0
 * @size 0x9C0
 * @unknownret
 */
void DrawSaveBoard(SAVEDATA_INFO *, CTexture **, int, int, int, int);

/**
 * @mangled DrawNewFileTemplete__Fiii
 * @address 0x223460
 * @size 0x4E0
 * @unknownret
 */
void DrawNewFileTemplete(int, int, int);

/**
 * @mangled InitExistData__Fv
 * @address 0x223940
 * @size 0x180
 * @unknownret
 */
void InitExistData(void);

/**
 * @mangled SaveEnableCheck__Fv
 * @address 0x223AC0
 * @size 0x1A0
 * @unknownret
 */
void SaveEnableCheck(void);

/**
 * @mangled InitEventItemSelect__FiPiP9ITEM_PACKiiii
 * @address 0x223C60
 * @size 0x480
 * @unknownret
 */
void InitEventItemSelect(int, int *, ITEM_PACK *, int, int, int, int);

/**
 * @mangled EventItemSelectExit__Fv
 * @address 0x2240E0
 * @size 0x60
 * @unknownret
 */
void EventItemSelectExit(void);

/**
 * @mangled EventItemSelectLoop__FPi
 * @address 0x224140
 * @size 0x120
 * @unknownret
 */
void EventItemSelectLoop(int *);

/**
 * @mangled EventItemSelectKey__FPi
 * @address 0x224260
 * @size 0x6B0
 * @unknownret
 */
void EventItemSelectKey(int *);

/**
 * @mangled DrawEventAndFishMenuBoard_Ver__FP8CTexture8CRect_i_iiii
 * @address 0x224910
 * @size 0x150
 * @unknownret
 */
void DrawEventAndFishMenuBoard_Ver(CTexture *, CRect_i_, int, int, int, int);

/**
 * @mangled DrawEventAndFishMenuBoard__FP8CTextureiiii
 * @address 0x224A60
 * @size 0x2F0
 * @unknownret
 */
void DrawEventAndFishMenuBoard(CTexture *, int, int, int, int);

/**
 * @mangled EventItemSelectDraw__Fv
 * @address 0x224D50
 * @size 0x6D0
 * @unknownret
 */
void EventItemSelectDraw(void);

/**
 * @mangled DrawEventItemBoard__FiiiiiP8CTexture
 * @address 0x225420
 * @size 0x110
 * @unknownret
 */
void DrawEventItemBoard(int, int, int, int, int, CTexture *);

/**
 * @mangled PlayerAllItemCheck__Fi
 * @address 0x225530
 * @size 0xA0
 * @unknownret
 */
void PlayerAllItemCheck(int);

/**
 * @mangled GetAddAttachItem__Fi
 * @address 0x2255D0
 * @size 0x30
 * @unknownret
 */
void GetAddAttachItem(int);

/**
 * @mangled TransWepNo__Fi
 * @address 0x225600
 * @size 0xE0
 * @unknownret
 */
void TransWepNo(int);

/**
 * @mangled TransWepNoNewToOld__Fi
 * @address 0x2256E0
 * @size 0x130
 * @unknownret
 */
void TransWepNoNewToOld(int);

/**
 * @mangled PlusAttachmentVolume__FP11ATTACH_LISTP11ATTACH_LISTf
 * @address 0x225810
 * @size 0x160
 * @unknownret
 */
void PlusAttachmentVolume(ATTACH_LIST *, ATTACH_LIST *, float);

/**
 * @mangled GetWeaponAttachStatusUp__FP11WEAPON_HAVEi
 * @address 0x225970
 * @size 0x130
 * @unknownret
 */
void GetWeaponAttachStatusUp(WEAPON_HAVE *, int);

/**
 * @mangled SetWeaponAttachStatus__FP11WEAPON_HAVE
 * @address 0x225AA0
 * @size 0xC0
 * @unknownret
 */
void SetWeaponAttachStatus(WEAPON_HAVE *);

/**
 * @mangled WeaponAllValueSet__FP11WEAPON_HAVEP11WEAPON_HAVEi
 * @address 0x225B60
 * @size 0x3F0
 * @unknownret
 */
void WeaponAllValueSet(WEAPON_HAVE *, WEAPON_HAVE *, int);

/**
 * @mangled SetAttachMentValue__FiisP11ATTACH_LIST
 * @address 0x225F50
 * @size 0x160
 * @unknownret
 */
void SetAttachMentValue(int, int, short, ATTACH_LIST *);

/**
 * @mangled GetAttachVolumeForMsg__FP11ATTACH_LIST
 * @address 0x2260B0
 * @size 0x60
 * @unknownret
 */
void GetAttachVolumeForMsg(ATTACH_LIST *);

/**
 * @mangled InitDunEnterMenu__Fiii
 * @address 0x226110
 * @size 0x410
 * @unknownret
 */
void InitDunEnterMenu(int, int, int);

/**
 * @mangled ExitDunEnterMenu__Fv
 * @address 0x226520
 * @size 0x70
 * @unknownret
 */
void ExitDunEnterMenu(void);

/**
 * @mangled DunEnterMenuLoop__Fv
 * @address 0x226590
 * @size 0x90
 * @unknownret
 */
void DunEnterMenuLoop(void);

/**
 * @mangled DunEnterMenuKey__Fv
 * @address 0x226620
 * @size 0x6F0
 * @unknownret
 */
void DunEnterMenuKey(void);

/**
 * @mangled DunEnterDraw__Fv
 * @address 0x226D10
 * @size 0x540
 * @unknownret
 */
void DunEnterDraw(void);

/**
 * @mangled DunEnterBoardWaku__Fiii
 * @address 0x227250
 * @size 0x4B0
 * @unknownret
 */
void DunEnterBoardWaku(int, int, int);

/**
 * @mangled DunEnterBoard__Fiii
 * @address 0x227700
 * @size 0x7C0
 * @unknownret
 */
void DunEnterBoard(int, int, int);

/**
 * @mangled DrawEnemyNum__Fiiiiii
 * @address 0x227EC0
 * @size 0x160
 * @unknownret
 */
void DrawEnemyNum(int, int, int, int, int, int);

/**
 * @mangled DrawGetAtoraNumBoard__Fiiiiii
 * @address 0x228020
 * @size 0x250
 * @unknownret
 */
void DrawGetAtoraNumBoard(int, int, int, int, int, int);

/**
 * @mangled DrawDunNumberClip__Fiiiiii
 * @address 0x228270
 * @size 0xE0
 * @unknownret
 */
void DrawDunNumberClip(int, int, int, int, int, int);

/**
 * @mangled DrawDunEnterBack__Fi
 * @address 0x228350
 * @size 0xA0
 * @unknownret
 */
void DrawDunEnterBack(int);

/**
 * @mangled DrawDunEnterFloorName__Fiiiiii
 * @address 0x2283F0
 * @size 0x290
 * @unknownret
 */
void DrawDunEnterFloorName(int, int, int, int, int, int);

/**
 * @mangled StartQuickChange__FP1iPii
 * @address 0x228680
 * @size 0x530
 * @unknownret
 */
void StartQuickChange(void /* CW back-ref target unresolved */ *, int, int *, int);

/**
 * @mangled CharaChangeLoop__Fv
 * @address 0x228BB0
 * @size 0x2E0
 * @unknownret
 */
void CharaChangeLoop(void);

/**
 * @mangled CharaChangeKey__Fv
 * @address 0x228E90
 * @size 0x8B0
 * @unknownret
 */
void CharaChangeKey(void);

/**
 * @mangled CharaChangeDraw__Fv
 * @address 0x229740
 * @size 0xAD0
 * @unknownret
 */
void CharaChangeDraw(void);

/**
 * @mangled DngActItemModelReadStart__FP1
 * @address 0x22A210
 * @size 0x180
 * @unknownret
 */
void DngActItemModelReadStart(void /* CW back-ref target unresolved */ *);

/**
 * @mangled DngActItemModelBuild__Fi
 * @address 0x22A390
 * @size 0x210
 * @unknownret
 */
void DngActItemModelBuild(int);

/**
 * @mangled DngActiveItemTextureCopy__Fv
 * @address 0x22A5A0
 * @size 0x110
 * @unknownret
 */
void DngActiveItemTextureCopy(void);

/**
 * @mangled DngActiveWeaponTextureCopy__Fv
 * @address 0x22A6B0
 * @size 0x130
 * @unknownret
 */
void DngActiveWeaponTextureCopy(void);

/**
 * @mangled GetWeaponMsgNo__FP11WEAPON_HAVE
 * @address 0x22A7E0
 * @size 0x60
 * @unknownret
 */
void GetWeaponMsgNo(WEAPON_HAVE *);

/**
 * @mangled GetWeaponMsgNo2__Fi
 * @address 0x22A840
 * @size 0x40
 * @unknownret
 */
void GetWeaponMsgNo2(int);

/**
 * @mangled DrawWepAttach__FiiP11WEAPON_HAVEii
 * @address 0x22A880
 * @size 0x1C0
 * @unknownret
 */
void DrawWepAttach(int, int, WEAPON_HAVE *, int, int);

/**
 * @mangled GetAtraTipNowHave__Fii
 * @address 0x22AA40
 * @size 0x180
 * @unknownret
 */
void GetAtraTipNowHave(int, int);

/**
 * @mangled GetDispVolumeForFloat__Ff
 * @address 0x22ABC0
 * @size 0x70
 * @unknownret
 */
void GetDispVolumeForFloat(float);

/**
 * @mangled InitItemPolygonView__FiP1
 * @address 0x22AC30
 * @size 0xF0
 * @unknownret
 */
void InitItemPolygonView(int, void /* CW back-ref target unresolved */ *);

/**
 * @mangled EnterItemPolygonView__Fv
 * @address 0x22AD20
 * @size 0x220
 * @unknownret
 */
void EnterItemPolygonView(void);

/**
 * @mangled LocalDrawItemPolygonView__Fv
 * @address 0x22AF40
 * @size 0x270
 * @unknownret
 */
void LocalDrawItemPolygonView(void);

/**
 * @mangled DrawItemPolygonView__Fv
 * @address 0x22B1B0
 * @size 0x40
 * @unknownret
 */
void DrawItemPolygonView(void);

/**
 * @mangled ConvDebugSelectToExcelListNo__Fi
 * @address 0x22B1F0
 * @size 0x50
 * @unknownret
 */
void ConvDebugSelectToExcelListNo(int);

/**
 * @mangled DebugItemGetKey__Fv
 * @address 0x22B240
 * @size 0x370
 * @unknownret
 */
void DebugItemGetKey(void);

/**
 * @mangled DebugItemGetDraw__Fv
 * @address 0x22B5B0
 * @size 0x210
 * @unknownret
 */
void DebugItemGetDraw(void);

/**
 * @mangled DrawItemDataView__Fi
 * @address 0x22B7C0
 * @size 0x230
 * @unknownret
 */
void DrawItemDataView(int);

/**
 * @mangled GetMenuTextureDir__Fv
 * @address 0x22B9F0
 * @size 0x10
 * @unknownret
 */
void GetMenuTextureDir(void);

/**
 * @mangled GetMenuLangFlag__Fv
 * @address 0x22BA00
 * @size 0x10
 * @unknownret
 */
void GetMenuLangFlag(void);

/**
 * @mangled GetNowSelectLanguage__Fi
 * @address 0x22BA10
 * @size 0x40
 * @unknownret
 */
void GetNowSelectLanguage(int);

/**
 * @mangled GetPathReadDifferntLang__FPc
 * @address 0x22BA50
 * @size 0x60
 * @unknownret
 */
void GetPathReadDifferntLang(char *);

/**
 * @mangled LoadFileBGMenuData__FPcP1
 * @address 0x22BAB0
 * @size 0x90
 * @unknownret
 */
void LoadFileBGMenuData(char *, void /* CW back-ref target unresolved */ *);

/**
 * @mangled LoadFileMenuData__FPcPUi
 * @address 0x22BB40
 * @size 0x70
 * @unknownret
 */
void LoadFileMenuData(char *, unsigned int *);

/**
 * @mangled BtlMenuBufferSet__Fi
 * @address 0x22BBB0
 * @size 0x50
 * @unknownret
 */
void BtlMenuBufferSet(int);

/**
 * @mangled MenuCalcBufAlignment__FP1
 * @address 0x22BC00
 * @size 0x40
 * @unknownret
 */
void MenuCalcBufAlignment(void /* CW back-ref target unresolved */ *);

/**
 * @mangled GetAtoraMaxVillage__Fv
 * @address 0x22BC40
 * @size 0xD0
 * @unknownret
 */
void GetAtoraMaxVillage(void);

/**
 * @mangled GetNowMapTransAtraMap__Fi
 * @address 0x22BD10
 * @size 0xE0
 * @unknownret
 */
void GetNowMapTransAtraMap(int);

/**
 * @mangled MenuWorldTrans__FP7CCamera
 * @address 0x22BDF0
 * @size 0xA0
 * @unknownret
 */
void MenuWorldTrans(CCamera *);

/**
 * @mangled MenuPolygonDraw__FiPFv_v
 * @address 0x22BE90
 * @size 0x190
 * @unknownret
 */
void MenuPolygonDraw(int, void (*)(void));

/**
 * @mangled Get3DPosTo2DPos__FP6CFramePi
 * @address 0x22C020
 * @size 0x70
 * @unknownret
 */
void Get3DPosTo2DPos(CFrame *, int *);

/**
 * @mangled GetMenuCommonFontW__Fii
 * @address 0x22C090
 * @size 0x40
 * @unknownret
 */
void GetMenuCommonFontW(int, int);

/**
 * @mangled GetMenuCommonPutXY__FP6ClsMesi
 * @address 0x22C0D0
 * @size 0x70
 * @unknownret
 */
void GetMenuCommonPutXY(ClsMes *, int);

/**
 * @mangled InitMenuMesSet__FiPs
 * @address 0x22C140
 * @size 0xD60
 * @unknownret
 */
void InitMenuMesSet(int, short *);

/**
 * @mangled DrawMenuClsMes__FP6ClsMesii
 * @address 0x22CEA0
 * @size 0x50
 * @unknownret
 */
void DrawMenuClsMes(ClsMes *, int, int);

/**
 * @mangled ComMenuSePlay__Fi
 * @address 0x22CEF0
 * @size 0x30
 * @unknownret
 */
void ComMenuSePlay(int);

/**
 * @mangled DrawMenu2DSprite__FP8CTexture8CRect_i_8CRect_i_i
 * @address 0x22CF20
 * @size 0x70
 * @unknownret
 */
void DrawMenu2DSprite(CTexture *, CRect_i_, CRect_i_, int);

/**
 * @mangled DrawMenu2DSprite__FP8CTexture8CRect_i_8CRect_i_UcUcUci
 * @address 0x22CF90
 * @size 0xA0
 * @unknownret
 */
void DrawMenu2DSprite(CTexture *, CRect_i_, CRect_i_, unsigned char, unsigned char, unsigned char, int);

/**
 * @mangled DrawMenu2DSprite__FP8CTexture8CRect_i_8CRect_i_P6spRGBAP6spRGBAP6spRGBAP6spRGBA
 * @address 0x22D030
 * @size 0xB0
 * @unknownret
 */
void DrawMenu2DSprite(CTexture *, CRect_i_, CRect_i_, spRGBA *, spRGBA *, spRGBA *, spRGBA *);

/**
 * @mangled MenuTextureReload__Fi
 * @address 0x22D0E0
 * @size 0x50
 * @unknownret
 */
void MenuTextureReload(int);

/**
 * @mangled MenuTextureDelete__FPi
 * @address 0x22D130
 * @size 0x80
 * @unknownret
 */
void MenuTextureDelete(int *);

/**
 * @mangled AllFillBoxForMenu__FUcUcUcUc
 * @address 0x22D1B0
 * @size 0xD0
 * @unknownret
 */
void AllFillBoxForMenu(unsigned char, unsigned char, unsigned char, unsigned char);

/**
 * @mangled AllFadeForMenu__Fi
 * @address 0x22D280
 * @size 0x30
 * @unknownret
 */
void AllFadeForMenu(int);

/**
 * @mangled FrameImageDraw__Fii
 * @address 0x22D2B0
 * @size 0x120
 * @unknownret
 */
void FrameImageDraw(int, int);

/**
 * @mangled DrawMenuColorGradation__FR8CRect_i_P6spRGBAP6spRGBAP6spRGBAP6spRGBA
 * @address 0x22D3D0
 * @size 0x80
 * @unknownret
 */
void DrawMenuColorGradation(CRect_i_ &, spRGBA *, spRGBA *, spRGBA *, spRGBA *);

/**
 * @mangled DrawMenuSideGradation__FR8CRect_i_P6spRGBAP6spRGBA
 * @address 0x22D450
 * @size 0x70
 * @unknownret
 */
void DrawMenuSideGradation(CRect_i_ &, spRGBA *, spRGBA *);

/**
 * @mangled DrawDontSetItemMark__Fiiiii
 * @address 0x22D4C0
 * @size 0xE0
 * @unknownret
 */
void DrawDontSetItemMark(int, int, int, int, int);

/**
 * @mangled DrawIconParts__Fiiiiiii
 * @address 0x22D5A0
 * @size 0x1E0
 * @unknownret
 */
void DrawIconParts(int, int, int, int, int, int, int);

/**
 * @mangled DrawAttachNumberOrWeapon__Fiiiiiiii
 * @address 0x22D780
 * @size 0x270
 * @unknownret
 */
void DrawAttachNumberOrWeapon(int, int, int, int, int, int, int, int);

/**
 * @mangled FadeTexX__FiiiiPci
 * @address 0x22D9F0
 * @size 0x3A0
 * @unknownret
 */
void FadeTexX(int, int, int, int, char *, int);

/**
 * @mangled RetCTex__FsRiRi
 * @address 0x22DD90
 * @size 0xF0
 * @unknownret
 */
void RetCTex(short, int &, int &);

/**
 * @mangled MenuTextureClip__FRiRiRiii
 * @address 0x22DE80
 * @size 0x80
 * @unknownret
 */
void MenuTextureClip(int &, int &, int &, int, int);

/**
 * @mangled GetNumberKeta__Fi
 * @address 0x22DF00
 * @size 0x40
 * @unknownret
 */
void GetNumberKeta(int);

/**
 * @mangled GetMenuIconInfo__Fi
 * @address 0x22DF40
 * @size 0x60
 * @unknownret
 */
void GetMenuIconInfo(int);

/**
 * @mangled DrawMainMenuIcon__Fiiiiii
 * @address 0x22DFA0
 * @size 0x1E0
 * @unknownret
 */
void DrawMainMenuIcon(int, int, int, int, int, int);

/**
 * @mangled DrawMenuVibeItem__Fiiiii
 * @address 0x22E180
 * @size 0x190
 * @unknownret
 */
void DrawMenuVibeItem(int, int, int, int, int);

/**
 * @mangled GetMainMenuRightHelpWinLangOffset__FRfRfRfRf
 * @address 0x22E310
 * @size 0xB0
 * @unknownret
 */
void GetMainMenuRightHelpWinLangOffset(float &, float &, float &, float &);

/**
 * @mangled GetMainMenuRightHelpMsgLangOffset__FRiRi
 * @address 0x22E3C0
 * @size 0x80
 * @unknownret
 */
void GetMainMenuRightHelpMsgLangOffset(int &, int &);

/**
 * @mangled InitHaveData__FP9IHAVEITEM
 * @address 0x22E440
 * @size 0x30
 * @unknownret
 */
void InitHaveData(IHAVEITEM *);

/**
 * @mangled InitHaveWep__FP11WEAPON_HAVE
 * @address 0x22E470
 * @size 0x40
 * @unknownret
 */
void InitHaveWep(WEAPON_HAVE *);

/**
 * @mangled InitHaveAttach__FP11ATTACH_LIST
 * @address 0x22E4B0
 * @size 0x30
 * @unknownret
 */
void InitHaveAttach(ATTACH_LIST *);

/**
 * @mangled MenuDataSwap__FPsPs
 * @address 0x22E4E0
 * @size 0x30
 * @unknownret
 */
void MenuDataSwap(short *, short *);

/**
 * @mangled MenuDataSwap__FPiPi
 * @address 0x22E510
 * @size 0x30
 * @unknownret
 */
void MenuDataSwap(int *, int *);

/**
 * @mangled MenuDataSwap__FP11WEAPON_HAVEP11WEAPON_HAVE
 * @address 0x22E540
 * @size 0x90
 * @unknownret
 */
void MenuDataSwap(WEAPON_HAVE *, WEAPON_HAVE *);

/**
 * @mangled MenuDataSwap__FP11ATTACH_LISTP11ATTACH_LIST
 * @address 0x22E5D0
 * @size 0x90
 * @unknownret
 */
void MenuDataSwap(ATTACH_LIST *, ATTACH_LIST *);

/**
 * @mangled SetMenuTrushMark__FP9ITEM_PACK
 * @address 0x22E660
 * @size 0xB0
 * @unknownret
 */
void SetMenuTrushMark(ITEM_PACK *);

/**
 * @mangled DeleteMenuTrushMark__Fv
 * @address 0x22E710
 * @size 0x30
 * @unknownret
 */
void DeleteMenuTrushMark(void);

/**
 * @mangled InitPersonalBoardMode__FP11CUserStatusP14PERSONAL_BOARDii
 * @address 0x22E740
 * @size 0x270
 * @unknownret
 */
void InitPersonalBoardMode(CUserStatus *, PERSONAL_BOARD *, int, int);

/**
 * @mangled BoardModeChangeKey__Fv
 * @address 0x22E9B0
 * @size 0x130
 * @unknownret
 */
void BoardModeChangeKey(void);

/**
 * @mangled PersonalBoardLimmitCheck__Fv
 * @address 0x22EAE0
 * @size 0x1A0
 * @unknownret
 */
void PersonalBoardLimmitCheck(void);

/**
 * @mangled PersonalBoardKeySub__Fv
 * @address 0x22EC80
 * @size 0x2E0
 * @unknownret
 */
void PersonalBoardKeySub(void);

/**
 * @mangled PersonalBoardKey__Fv
 * @address 0x22EF60
 * @size 0x30
 * @unknownret
 */
void PersonalBoardKey(void);

/**
 * @mangled PersonalBoardItemPush__FP9IHAVEITEMi
 * @address 0x22EF90
 * @size 0x110
 * @unknownret
 */
void PersonalBoardItemPush(IHAVEITEM *, int);
