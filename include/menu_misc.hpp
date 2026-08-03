#pragma once

#include "common.h"

// Forward declarations for the types these declarations name. The skeleton
// headers are generated from the retail symbol table, which knows the type
// names but not where they live.
class CCharacter;
class CUserStatus;
class ClsMes;
struct WEAPON_HAVE;


/**
 * @mangled NowGetGameFlagForBtlMenu__Fi
 * @address 0x20BEC0
 * @size 0xC0
 * @unknownret
 */
void NowGetGameFlagForBtlMenu(int);

/**
 * @mangled GetMenuHebikiriFlag__Fv
 * @address 0x20BF80
 * @size 0x30
 * @unknownret
 */
void GetMenuHebikiriFlag(void);

/**
 * @mangled EquipDefaultWeapon__Fi
 * @address 0x20BFB0
 * @size 0xC0
 * @unknownret
 */
void EquipDefaultWeapon(int);

/**
 * @mangled DrawMenuNothing__FiiiiPcii
 * @address 0x20C070
 * @size 0x360
 * @unknownret
 */
void DrawMenuNothing(int, int, int, int, char *, int, int);

/**
 * @mangled GetMenuItemUseVolume__Fv
 * @address 0x20C3D0
 * @size 0x10
 * @unknownret
 */
void GetMenuItemUseVolume(void);

/**
 * @mangled ItemUseFunc__FP11CUserStatusiiiP11WEAPON_HAVE
 * @address 0x20C3E0
 * @size 0x9F0
 * @unknownret
 */
void ItemUseFunc(CUserStatus *, int, int, int, WEAPON_HAVE *);

/**
 * @mangled GetNowWeaponRate__FP11WEAPON_HAVE
 * @address 0x20CDD0
 * @size 0x60
 * @unknownret
 */
void GetNowWeaponRate(WEAPON_HAVE *);

/**
 * @mangled WeaponStatusBreakEnable__FP11WEAPON_HAVE
 * @address 0x20CE30
 * @size 0x40
 * @unknownret
 */
void WeaponStatusBreakEnable(WEAPON_HAVE *);

/**
 * @mangled WeaponStatusBuildUp__FP11WEAPON_HAVERi
 * @address 0x20CE70
 * @size 0xC0
 * @unknownret
 */
void WeaponStatusBuildUp(WEAPON_HAVE *, int &);

/**
 * @mangled MenuWeaponSpSet__FP10CCharacterP11WEAPON_HAVE
 * @address 0x20CF30
 * @size 0x120
 * @unknownret
 */
void MenuWeaponSpSet(CCharacter *, WEAPON_HAVE *);

/**
 * @mangled SetMenuCharaEffectReadFlag__Fi
 * @address 0x20D050
 * @size 0x10
 * @unknownret
 */
void SetMenuCharaEffectReadFlag(int);

/**
 * @mangled GetMenuCharaEffectReadFlag__Fv
 * @address 0x20D060
 * @size 0x10
 * @unknownret
 */
void GetMenuCharaEffectReadFlag(void);

/**
 * @mangled GetDngWepEffectPointer__Fv
 * @address 0x20D070
 * @size 0x10
 * @unknownret
 */
void GetDngWepEffectPointer(void);

/**
 * @mangled GetWepEffectMenuReadBuf__Fv
 * @address 0x20D080
 * @size 0x10
 * @unknownret
 */
void GetWepEffectMenuReadBuf(void);

/**
 * @mangled SetOldEffectKind__Fi
 * @address 0x20D090
 * @size 0x10
 * @unknownret
 */
void SetOldEffectKind(int);

/**
 * @mangled SetWepEffectMenuReadBuf__FP1
 * @address 0x20D0A0
 * @size 0x10
 * @unknownret
 */
void SetWepEffectMenuReadBuf(void /* CW back-ref target unresolved */ *);

/**
 * @mangled DngWepEffectReadStart__Fv
 * @address 0x20D0B0
 * @size 0xC0
 * @unknownret
 */
void DngWepEffectReadStart(void);

/**
 * @mangled MenuWeaponEffectSet__Fi
 * @address 0x20D170
 * @size 0x50
 * @unknownret
 */
void MenuWeaponEffectSet(int);

/**
 * @mangled GetNowTestNo__Fv
 * @address 0x20D1C0
 * @size 0x10
 * @unknownret
 */
void GetNowTestNo(void);

/**
 * @mangled StartReadWepMDS__FP1i
 * @address 0x20D1D0
 * @size 0x1E0
 * @unknownret
 */
void StartReadWepMDS(void /* CW back-ref target unresolved */ *, int);

/**
 * @mangled GetMenuWeaponModelData__Fi
 * @address 0x20D3B0
 * @size 0x20
 * @unknownret
 */
void GetMenuWeaponModelData(int);

/**
 * @mangled InitMenuWeaponModelData__Fv
 * @address 0x20D3D0
 * @size 0x30
 * @unknownret
 */
void InitMenuWeaponModelData(void);

/**
 * @mangled GetMenuWeaponModelInfo__Fi
 * @address 0x20D400
 * @size 0x20
 * @unknownret
 */
void GetMenuWeaponModelInfo(int);

/**
 * @mangled InitMenuWeaponModelReference__Fv
 * @address 0x20D420
 * @size 0x50
 * @unknownret
 */
void InitMenuWeaponModelReference(void);

/**
 * @mangled SetMenuWeaponModelReference__Fiii
 * @address 0x20D470
 * @size 0x30
 * @unknownret
 */
void SetMenuWeaponModelReference(int, int, int);

/**
 * @mangled GetMenuWeaponModelFrameNo__Fi
 * @address 0x20D4A0
 * @size 0x20
 * @unknownret
 */
void GetMenuWeaponModelFrameNo(int);

/**
 * @mangled EnterWeaponModel__Fiii
 * @address 0x20D4C0
 * @size 0x470
 * @unknownret
 */
void EnterWeaponModel(int, int, int);

/**
 * @mangled WeaponModelBuildFunc__Fii
 * @address 0x20D930
 * @size 0x430
 * @unknownret
 */
void WeaponModelBuildFunc(int, int);

/**
 * @mangled DngWeaponEquipModelBuild__FiiP1
 * @address 0x20DD60
 * @size 0x120
 * @unknownret
 */
void DngWeaponEquipModelBuild(int, int, void /* CW back-ref target unresolved */ *);

/**
 * @mangled GetNowMotionStepCnt__Fi
 * @address 0x20DE80
 * @size 0x40
 * @unknownret
 */
void GetNowMotionStepCnt(int);

/**
 * @mangled GetNowActiveCharaStatus__Fi
 * @address 0x20DEC0
 * @size 0x30
 * @unknownret
 */
void GetNowActiveCharaStatus(int);

/**
 * @mangled SetNowCharaMotionNo__Fi
 * @address 0x20DEF0
 * @size 0x130
 * @unknownret
 */
void SetNowCharaMotionNo(int);

/**
 * @mangled SetItemMenuColor__Fi
 * @address 0x20E020
 * @size 0x150
 * @unknownret
 */
void SetItemMenuColor(int);

/**
 * @mangled SetItemMenuOldAmbient__Fv
 * @address 0x20E170
 * @size 0x30
 * @unknownret
 */
void SetItemMenuOldAmbient(void);

/**
 * @mangled StartLoadCharaMDS__FP1ii
 * @address 0x20E1A0
 * @size 0xE0
 * @unknownret
 */
void StartLoadCharaMDS(void /* CW back-ref target unresolved */ *, int, int);

/**
 * @mangled MenuCharaMDSBuild2__Fii
 * @address 0x20E280
 * @size 0x2B0
 * @unknownret
 */
void MenuCharaMDSBuild2(int, int);

/**
 * @mangled GetCharaChangeReadCharaFilePath__FPci
 * @address 0x20E530
 * @size 0x80
 * @unknownret
 */
void GetCharaChangeReadCharaFilePath(char *, int);

/**
 * @mangled CharaChangeInitToGL__FP1i
 * @address 0x20E5B0
 * @size 0x300
 * @unknownret
 */
void CharaChangeInitToGL(void /* CW back-ref target unresolved */ *, int);

/**
 * @mangled CharaChangeInitToGL2__Fi
 * @address 0x20E8B0
 * @size 0xB0
 * @unknownret
 */
void CharaChangeInitToGL2(int);

/**
 * @mangled BtMenuLoadChara__Fv
 * @address 0x20E960
 * @size 0xA0
 * @unknownret
 */
void BtMenuLoadChara(void);

/**
 * @mangled BtMenuLoad2__Fi
 * @address 0x20EA00
 * @size 0xE0
 * @unknownret
 */
void BtMenuLoad2(int);

/**
 * @mangled EastKingCheckComplete__Fv
 * @address 0x20EAE0
 * @size 0x80
 * @unknownret
 */
void EastKingCheckComplete(void);

/**
 * @mangled SetMonsterNameDrawFlag__Fi
 * @address 0x20EB60
 * @size 0x10
 * @unknownret
 */
void SetMonsterNameDrawFlag(int);

/**
 * @mangled GetMonsterNameDrawFlag__Fv
 * @address 0x20EB70
 * @size 0x10
 * @unknownret
 */
void GetMonsterNameDrawFlag(void);

/**
 * @mangled MonsterNameInit__FP6ClsMesPsPUc
 * @address 0x20EB80
 * @size 0x210
 * @unknownret
 */
void MonsterNameInit(ClsMes *, short *, unsigned char *);

/**
 * @mangled MonsterNameMake__Fi
 * @address 0x20ED90
 * @size 0x80
 * @unknownret
 */
void MonsterNameMake(int);

/**
 * @mangled MonsterNamePosSet__Fii
 * @address 0x20EE10
 * @size 0x60
 * @unknownret
 */
void MonsterNamePosSet(int, int);

/**
 * @mangled MonsterNameDraw__Fv
 * @address 0x20EE70
 * @size 0x120
 * @unknownret
 */
void MonsterNameDraw(void);

/**
 * @mangled DngEscapeMsgInit__FP6ClsMesP6ClsMesi
 * @address 0x20EF90
 * @size 0x2B0
 * @unknownret
 */
void DngEscapeMsgInit(ClsMes *, ClsMes *, int);

/**
 * @mangled DngEscapeMsgDraw__Fv
 * @address 0x20F240
 * @size 0x120
 * @unknownret
 */
void DngEscapeMsgDraw(void);

/**
 * @mangled DngEscapeMsgLoop__Fv
 * @address 0x20F360
 * @size 0x170
 * @unknownret
 */
void DngEscapeMsgLoop(void);

/**
 * @mangled CheckItemThrow__FPiPi
 * @address 0x20F4D0
 * @size 0x1B0
 * @unknownret
 */
void CheckItemThrow(int *, int *);

/**
 * @mangled SetWeaponElementStatus__FP11WEAPON_HAVE
 * @address 0x20F680
 * @size 0x60
 * @unknownret
 */
void SetWeaponElementStatus(WEAPON_HAVE *);

/**
 * @mangled CheckWeaponOptionStatus__Fi
 * @address 0x20F6E0
 * @size 0x90
 * @unknownret
 */
void CheckWeaponOptionStatus(int);

/**
 * @mangled IsWeaponOptionGoodOrBad__Fi
 * @address 0x20F770
 * @size 0x40
 * @unknownret
 */
void IsWeaponOptionGoodOrBad(int);

/**
 * @mangled DefaultWeaponOptionSet__Fi
 * @address 0x20F7B0
 * @size 0x40
 * @unknownret
 */
void DefaultWeaponOptionSet(int);

/**
 * @mangled WeaponOptionStatusDraw__FP11WEAPON_HAVEiii
 * @address 0x20F7F0
 * @size 0x230
 * @unknownret
 */
void WeaponOptionStatusDraw(WEAPON_HAVE *, int, int, int);

/**
 * @mangled WeaponStarDraw__FiiP11WEAPON_HAVEi
 * @address 0x20FA20
 * @size 0x1C0
 * @unknownret
 */
void WeaponStarDraw(int, int, WEAPON_HAVE *, int);

/**
 * @mangled LocalWeaponDataChange__FPciii
 * @address 0x20FBE0
 * @size 0x100
 * @unknownret
 */
void LocalWeaponDataChange(char *, int, int, int);

/**
 * @mangled WeaponDataChangeByRGate__FP11WEAPON_HAVEi
 * @address 0x20FCE0
 * @size 0x4F0
 * @unknownret
 */
void WeaponDataChangeByRGate(WEAPON_HAVE *, int);

/**
 * @mangled GetNumHowManyItemsHave__Fi
 * @address 0x2101D0
 * @size 0x110
 * @unknownret
 */
void GetNumHowManyItemsHave(int);

/**
 * @mangled GetEditMenuMax__Fv
 * @address 0x2102E0
 * @size 0x40
 * @unknownret
 */
void GetEditMenuMax(void);

/**
 * @mangled DrawMenuIcon__Fi
 * @address 0x210320
 * @size 0xD0
 * @unknownret
 */
void DrawMenuIcon(int);

/**
 * @mangled GetEditMenuIconPos__FiPi
 * @address 0x2103F0
 * @size 0x100
 * @unknownret
 */
void GetEditMenuIconPos(int, int *);

/**
 * @mangled DrawMoveMenuIcon__Fv
 * @address 0x2104F0
 * @size 0x1C0
 * @unknownret
 */
void DrawMoveMenuIcon(void);

/**
 * @mangled CalMoveFromMenuIcon__Fv
 * @address 0x2106B0
 * @size 0x240
 * @unknownret
 */
void CalMoveFromMenuIcon(void);

/**
 * @mangled CalMoveToMenuIcon__Fv
 * @address 0x2108F0
 * @size 0x1C0
 * @unknownret
 */
void CalMoveToMenuIcon(void);

/**
 * @mangled EditMenuInit__FPii
 * @address 0x210AB0
 * @size 0x2F0
 * @unknownret
 */
void EditMenuInit(int *, int);

/**
 * @mangled EditMenuExit__Fv
 * @address 0x210DA0
 * @size 0x90
 * @unknownret
 */
void EditMenuExit(void);

/**
 * @mangled GetDrawHelpWindow__Fi
 * @address 0x210E30
 * @size 0x70
 * @unknownret
 */
void GetDrawHelpWindow(int);

/**
 * @mangled EditMenuLoop__Fv
 * @address 0x210EA0
 * @size 0x110
 * @unknownret
 */
void EditMenuLoop(void);

/**
 * @mangled EditMenuDraw__Fv
 * @address 0x210FB0
 * @size 0x310
 * @unknownret
 */
void EditMenuDraw(void);

/**
 * @mangled EditMenuStart__Fv
 * @address 0x2112C0
 * @size 0x4C0
 * @unknownret
 */
void EditMenuStart(void);

/**
 * @mangled EditMenuSelectDraw__Fv
 * @address 0x211780
 * @size 0x230
 * @unknownret
 */
void EditMenuSelectDraw(void);

/**
 * @mangled EditMenuSelect__Fv
 * @address 0x2119B0
 * @size 0x390
 * @unknownret
 */
void EditMenuSelect(void);

/**
 * @mangled EditMenuToExitDraw__Fv
 * @address 0x211D40
 * @size 0x20
 * @unknownret
 */
void EditMenuToExitDraw(void);

/**
 * @mangled EditMenuToExit__Fv
 * @address 0x211D60
 * @size 0x150
 * @unknownret
 */
void EditMenuToExit(void);

/**
 * @mangled AtoraSelectDraw__Fv
 * @address 0x211EB0
 * @size 0x90
 * @unknownret
 */
void AtoraSelectDraw(void);

/**
 * @mangled AtoraSelect__Fv
 * @address 0x211F40
 * @size 0x190
 * @unknownret
 */
void AtoraSelect(void);

/**
 * @mangled AtoraMoveDraw__Fv
 * @address 0x2120D0
 * @size 0x10
 * @unknownret
 */
void AtoraMoveDraw(void);

/**
 * @mangled AtoraMove__Fv
 * @address 0x2120E0
 * @size 0x30
 * @unknownret
 */
void AtoraMove(void);

/**
 * @mangled AnalyzeBackDraw__Fii
 * @address 0x212110
 * @size 0x160
 * @unknownret
 */
void AnalyzeBackDraw(int, int);

/**
 * @mangled AnalyzeRequestPer__Fv
 * @address 0x212270
 * @size 0xB0
 * @unknownret
 */
void AnalyzeRequestPer(void);

/**
 * @mangled AnalyzeBarDraw__Fv
 * @address 0x212320
 * @size 0x6A0
 * @unknownret
 */
void AnalyzeBarDraw(void);

/**
 * @mangled ToAnalyzeEditDraw__Fv
 * @address 0x2129C0
 * @size 0x350
 * @unknownret
 */
void ToAnalyzeEditDraw(void);

/**
 * @mangled ToAnalyzeEdit__Fv
 * @address 0x212D10
 * @size 0x50
 * @unknownret
 */
void ToAnalyzeEdit(void);

/**
 * @mangled AnalyzeEditDraw__Fv
 * @address 0x212D60
 * @size 0x1C0
 * @unknownret
 */
void AnalyzeEditDraw(void);

/**
 * @mangled AnalyzeEdit__Fv
 * @address 0x212F20
 * @size 0x60
 * @unknownret
 */
void AnalyzeEdit(void);

/**
 * @mangled FromAnalyzeEditDraw__Fv
 * @address 0x212F80
 * @size 0x50
 * @unknownret
 */
void FromAnalyzeEditDraw(void);

/**
 * @mangled FromAnalyzeEdit__Fv
 * @address 0x212FD0
 * @size 0xB0
 * @unknownret
 */
void FromAnalyzeEdit(void);

/**
 * @mangled EditSaveDraw__Fv
 * @address 0x213080
 * @size 0x80
 * @unknownret
 */
void EditSaveDraw(void);

/**
 * @mangled EditSaveKey__Fv
 * @address 0x213100
 * @size 0xE0
 * @unknownret
 */
void EditSaveKey(void);

/**
 * @mangled OptionDraw__Fv
 * @address 0x2131E0
 * @size 0x70
 * @unknownret
 */
void OptionDraw(void);

/**
 * @mangled EdOptionSelect__Fv
 * @address 0x213250
 * @size 0x100
 * @unknownret
 */
void EdOptionSelect(void);

/**
 * @mangled EdMenuManualKey__Fv
 * @address 0x213350
 * @size 0x100
 * @unknownret
 */
void EdMenuManualKey(void);

/**
 * @mangled EdMenuManualDraw__Fv
 * @address 0x213450
 * @size 0x70
 * @unknownret
 */
void EdMenuManualDraw(void);

/**
 * @mangled InitSaveFileInfoTbl__Fv
 * @address 0x2134C0
 * @size 0x80
 * @unknownret
 */
void InitSaveFileInfoTbl(void);

/**
 * @mangled GetOpenAttribute__FPc
 * @address 0x213540
 * @size 0x90
 * @unknownret
 */
void GetOpenAttribute(char *);
