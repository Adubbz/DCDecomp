#pragma once

#include "common.h"

/* ?ret */ void NowGetGameFlagForBtlMenu(int); // @ 0x20BEC0 (0xC0 bytes) -- mangled: NowGetGameFlagForBtlMenu__Fi
/* ?ret */ void GetMenuHebikiriFlag(void); // @ 0x20BF80 (0x30 bytes) -- mangled: GetMenuHebikiriFlag__Fv
/* ?ret */ void EquipDefaultWeapon(int); // @ 0x20BFB0 (0xC0 bytes) -- mangled: EquipDefaultWeapon__Fi
/* ?ret */ void DrawMenuNothing(int, int, int, int, char *, int, int); // @ 0x20C070 (0x360 bytes) -- mangled: DrawMenuNothing__FiiiiPcii
/* ?ret */ void GetMenuItemUseVolume(void); // @ 0x20C3D0 (0x10 bytes) -- mangled: GetMenuItemUseVolume__Fv
/* ?ret */ void ItemUseFunc(CUserStatus *, int, int, int, WEAPON_HAVE *); // @ 0x20C3E0 (0x9F0 bytes) -- mangled: ItemUseFunc__FP11CUserStatusiiiP11WEAPON_HAVE
/* ?ret */ void GetNowWeaponRate(WEAPON_HAVE *); // @ 0x20CDD0 (0x60 bytes) -- mangled: GetNowWeaponRate__FP11WEAPON_HAVE
/* ?ret */ void WeaponStatusBreakEnable(WEAPON_HAVE *); // @ 0x20CE30 (0x40 bytes) -- mangled: WeaponStatusBreakEnable__FP11WEAPON_HAVE
/* ?ret */ void WeaponStatusBuildUp(WEAPON_HAVE *, int &); // @ 0x20CE70 (0xC0 bytes) -- mangled: WeaponStatusBuildUp__FP11WEAPON_HAVERi
/* ?ret */ void MenuWeaponSpSet(CCharacter *, WEAPON_HAVE *); // @ 0x20CF30 (0x120 bytes) -- mangled: MenuWeaponSpSet__FP10CCharacterP11WEAPON_HAVE
/* ?ret */ void SetMenuCharaEffectReadFlag(int); // @ 0x20D050 (0x10 bytes) -- mangled: SetMenuCharaEffectReadFlag__Fi
/* ?ret */ void GetMenuCharaEffectReadFlag(void); // @ 0x20D060 (0x10 bytes) -- mangled: GetMenuCharaEffectReadFlag__Fv
/* ?ret */ void GetDngWepEffectPointer(void); // @ 0x20D070 (0x10 bytes) -- mangled: GetDngWepEffectPointer__Fv
/* ?ret */ void GetWepEffectMenuReadBuf(void); // @ 0x20D080 (0x10 bytes) -- mangled: GetWepEffectMenuReadBuf__Fv
/* ?ret */ void SetOldEffectKind(int); // @ 0x20D090 (0x10 bytes) -- mangled: SetOldEffectKind__Fi
/* ?ret */ void SetWepEffectMenuReadBuf(void /* CW back-ref target unresolved */ *); // @ 0x20D0A0 (0x10 bytes) -- mangled: SetWepEffectMenuReadBuf__FP1
/* ?ret */ void DngWepEffectReadStart(void); // @ 0x20D0B0 (0xC0 bytes) -- mangled: DngWepEffectReadStart__Fv
/* ?ret */ void MenuWeaponEffectSet(int); // @ 0x20D170 (0x50 bytes) -- mangled: MenuWeaponEffectSet__Fi
/* ?ret */ void GetNowTestNo(void); // @ 0x20D1C0 (0x10 bytes) -- mangled: GetNowTestNo__Fv
/* ?ret */ void StartReadWepMDS(void /* CW back-ref target unresolved */ *, int); // @ 0x20D1D0 (0x1E0 bytes) -- mangled: StartReadWepMDS__FP1i
/* ?ret */ void GetMenuWeaponModelData(int); // @ 0x20D3B0 (0x20 bytes) -- mangled: GetMenuWeaponModelData__Fi
/* ?ret */ void InitMenuWeaponModelData(void); // @ 0x20D3D0 (0x30 bytes) -- mangled: InitMenuWeaponModelData__Fv
/* ?ret */ void GetMenuWeaponModelInfo(int); // @ 0x20D400 (0x20 bytes) -- mangled: GetMenuWeaponModelInfo__Fi
/* ?ret */ void InitMenuWeaponModelReference(void); // @ 0x20D420 (0x50 bytes) -- mangled: InitMenuWeaponModelReference__Fv
/* ?ret */ void SetMenuWeaponModelReference(int, int, int); // @ 0x20D470 (0x30 bytes) -- mangled: SetMenuWeaponModelReference__Fiii
/* ?ret */ void GetMenuWeaponModelFrameNo(int); // @ 0x20D4A0 (0x20 bytes) -- mangled: GetMenuWeaponModelFrameNo__Fi
/* ?ret */ void EnterWeaponModel(int, int, int); // @ 0x20D4C0 (0x470 bytes) -- mangled: EnterWeaponModel__Fiii
/* ?ret */ void WeaponModelBuildFunc(int, int); // @ 0x20D930 (0x430 bytes) -- mangled: WeaponModelBuildFunc__Fii
/* ?ret */ void DngWeaponEquipModelBuild(int, int, void /* CW back-ref target unresolved */ *); // @ 0x20DD60 (0x120 bytes) -- mangled: DngWeaponEquipModelBuild__FiiP1
/* ?ret */ void GetNowMotionStepCnt(int); // @ 0x20DE80 (0x40 bytes) -- mangled: GetNowMotionStepCnt__Fi
/* ?ret */ void GetNowActiveCharaStatus(int); // @ 0x20DEC0 (0x30 bytes) -- mangled: GetNowActiveCharaStatus__Fi
/* ?ret */ void SetNowCharaMotionNo(int); // @ 0x20DEF0 (0x130 bytes) -- mangled: SetNowCharaMotionNo__Fi
/* ?ret */ void SetItemMenuColor(int); // @ 0x20E020 (0x150 bytes) -- mangled: SetItemMenuColor__Fi
/* ?ret */ void SetItemMenuOldAmbient(void); // @ 0x20E170 (0x30 bytes) -- mangled: SetItemMenuOldAmbient__Fv
/* ?ret */ void StartLoadCharaMDS(void /* CW back-ref target unresolved */ *, int, int); // @ 0x20E1A0 (0xE0 bytes) -- mangled: StartLoadCharaMDS__FP1ii
/* ?ret */ void MenuCharaMDSBuild2(int, int); // @ 0x20E280 (0x2B0 bytes) -- mangled: MenuCharaMDSBuild2__Fii
/* ?ret */ void GetCharaChangeReadCharaFilePath(char *, int); // @ 0x20E530 (0x80 bytes) -- mangled: GetCharaChangeReadCharaFilePath__FPci
/* ?ret */ void CharaChangeInitToGL(void /* CW back-ref target unresolved */ *, int); // @ 0x20E5B0 (0x300 bytes) -- mangled: CharaChangeInitToGL__FP1i
/* ?ret */ void CharaChangeInitToGL2(int); // @ 0x20E8B0 (0xB0 bytes) -- mangled: CharaChangeInitToGL2__Fi
/* ?ret */ void BtMenuLoadChara(void); // @ 0x20E960 (0xA0 bytes) -- mangled: BtMenuLoadChara__Fv
/* ?ret */ void BtMenuLoad2(int); // @ 0x20EA00 (0xE0 bytes) -- mangled: BtMenuLoad2__Fi
/* ?ret */ void EastKingCheckComplete(void); // @ 0x20EAE0 (0x80 bytes) -- mangled: EastKingCheckComplete__Fv
/* ?ret */ void SetMonsterNameDrawFlag(int); // @ 0x20EB60 (0x10 bytes) -- mangled: SetMonsterNameDrawFlag__Fi
/* ?ret */ void GetMonsterNameDrawFlag(void); // @ 0x20EB70 (0x10 bytes) -- mangled: GetMonsterNameDrawFlag__Fv
/* ?ret */ void MonsterNameInit(ClsMes *, short *, unsigned char *); // @ 0x20EB80 (0x210 bytes) -- mangled: MonsterNameInit__FP6ClsMesPsPUc
/* ?ret */ void MonsterNameMake(int); // @ 0x20ED90 (0x80 bytes) -- mangled: MonsterNameMake__Fi
/* ?ret */ void MonsterNamePosSet(int, int); // @ 0x20EE10 (0x60 bytes) -- mangled: MonsterNamePosSet__Fii
/* ?ret */ void MonsterNameDraw(void); // @ 0x20EE70 (0x120 bytes) -- mangled: MonsterNameDraw__Fv
/* ?ret */ void DngEscapeMsgInit(ClsMes *, ClsMes *, int); // @ 0x20EF90 (0x2B0 bytes) -- mangled: DngEscapeMsgInit__FP6ClsMesP6ClsMesi
/* ?ret */ void DngEscapeMsgDraw(void); // @ 0x20F240 (0x120 bytes) -- mangled: DngEscapeMsgDraw__Fv
/* ?ret */ void DngEscapeMsgLoop(void); // @ 0x20F360 (0x170 bytes) -- mangled: DngEscapeMsgLoop__Fv
/* ?ret */ void CheckItemThrow(int *, int *); // @ 0x20F4D0 (0x1B0 bytes) -- mangled: CheckItemThrow__FPiPi
/* ?ret */ void SetWeaponElementStatus(WEAPON_HAVE *); // @ 0x20F680 (0x60 bytes) -- mangled: SetWeaponElementStatus__FP11WEAPON_HAVE
/* ?ret */ void CheckWeaponOptionStatus(int); // @ 0x20F6E0 (0x90 bytes) -- mangled: CheckWeaponOptionStatus__Fi
/* ?ret */ void IsWeaponOptionGoodOrBad(int); // @ 0x20F770 (0x40 bytes) -- mangled: IsWeaponOptionGoodOrBad__Fi
/* ?ret */ void DefaultWeaponOptionSet(int); // @ 0x20F7B0 (0x40 bytes) -- mangled: DefaultWeaponOptionSet__Fi
/* ?ret */ void WeaponOptionStatusDraw(WEAPON_HAVE *, int, int, int); // @ 0x20F7F0 (0x230 bytes) -- mangled: WeaponOptionStatusDraw__FP11WEAPON_HAVEiii
/* ?ret */ void WeaponStarDraw(int, int, WEAPON_HAVE *, int); // @ 0x20FA20 (0x1C0 bytes) -- mangled: WeaponStarDraw__FiiP11WEAPON_HAVEi
/* ?ret */ void LocalWeaponDataChange(char *, int, int, int); // @ 0x20FBE0 (0x100 bytes) -- mangled: LocalWeaponDataChange__FPciii
/* ?ret */ void WeaponDataChangeByRGate(WEAPON_HAVE *, int); // @ 0x20FCE0 (0x94 bytes) -- mangled: WeaponDataChangeByRGate__FP11WEAPON_HAVEi
/* ?ret */ void GetNumHowManyItemsHave(int); // @ 0x2101D0 (0x110 bytes) -- mangled: GetNumHowManyItemsHave__Fi
/* ?ret */ void GetEditMenuMax(void); // @ 0x2102E0 (0x40 bytes) -- mangled: GetEditMenuMax__Fv
/* ?ret */ void DrawMenuIcon(int); // @ 0x210320 (0xD0 bytes) -- mangled: DrawMenuIcon__Fi
/* ?ret */ void GetEditMenuIconPos(int, int *); // @ 0x2103F0 (0x100 bytes) -- mangled: GetEditMenuIconPos__FiPi
/* ?ret */ void DrawMoveMenuIcon(void); // @ 0x2104F0 (0x1C0 bytes) -- mangled: DrawMoveMenuIcon__Fv
/* ?ret */ void CalMoveFromMenuIcon(void); // @ 0x2106B0 (0x240 bytes) -- mangled: CalMoveFromMenuIcon__Fv
/* ?ret */ void CalMoveToMenuIcon(void); // @ 0x2108F0 (0x1C0 bytes) -- mangled: CalMoveToMenuIcon__Fv
/* ?ret */ void EditMenuInit(int *, int); // @ 0x210AB0 (0x2F0 bytes) -- mangled: EditMenuInit__FPii
/* ?ret */ void EditMenuExit(void); // @ 0x210DA0 (0x90 bytes) -- mangled: EditMenuExit__Fv
/* ?ret */ void GetDrawHelpWindow(int); // @ 0x210E30 (0x70 bytes) -- mangled: GetDrawHelpWindow__Fi
/* ?ret */ void EditMenuLoop(void); // @ 0x210EA0 (0x44 bytes) -- mangled: EditMenuLoop__Fv
/* ?ret */ void EditMenuDraw(void); // @ 0x210FB0 (0x60 bytes) -- mangled: EditMenuDraw__Fv
/* ?ret */ void EditMenuStart(void); // @ 0x2112C0 (0x4C0 bytes) -- mangled: EditMenuStart__Fv
/* ?ret */ void EditMenuSelectDraw(void); // @ 0x211780 (0x230 bytes) -- mangled: EditMenuSelectDraw__Fv
/* ?ret */ void EditMenuSelect(void); // @ 0x2119B0 (0x1BC bytes) -- mangled: EditMenuSelect__Fv
/* ?ret */ void EditMenuToExitDraw(void); // @ 0x211D40 (0x20 bytes) -- mangled: EditMenuToExitDraw__Fv
/* ?ret */ void EditMenuToExit(void); // @ 0x211D60 (0x150 bytes) -- mangled: EditMenuToExit__Fv
/* ?ret */ void AtoraSelectDraw(void); // @ 0x211EB0 (0x90 bytes) -- mangled: AtoraSelectDraw__Fv
/* ?ret */ void AtoraSelect(void); // @ 0x211F40 (0x190 bytes) -- mangled: AtoraSelect__Fv
/* ?ret */ void AtoraMoveDraw(void); // @ 0x2120D0 (0x10 bytes) -- mangled: AtoraMoveDraw__Fv
/* ?ret */ void AtoraMove(void); // @ 0x2120E0 (0x30 bytes) -- mangled: AtoraMove__Fv
/* ?ret */ void AnalyzeBackDraw(int, int); // @ 0x212110 (0x160 bytes) -- mangled: AnalyzeBackDraw__Fii
/* ?ret */ void AnalyzeRequestPer(void); // @ 0x212270 (0xB0 bytes) -- mangled: AnalyzeRequestPer__Fv
/* ?ret */ void AnalyzeBarDraw(void); // @ 0x212320 (0x6A0 bytes) -- mangled: AnalyzeBarDraw__Fv
/* ?ret */ void ToAnalyzeEditDraw(void); // @ 0x2129C0 (0x350 bytes) -- mangled: ToAnalyzeEditDraw__Fv
/* ?ret */ void ToAnalyzeEdit(void); // @ 0x212D10 (0x50 bytes) -- mangled: ToAnalyzeEdit__Fv
/* ?ret */ void AnalyzeEditDraw(void); // @ 0x212D60 (0x1C0 bytes) -- mangled: AnalyzeEditDraw__Fv
/* ?ret */ void AnalyzeEdit(void); // @ 0x212F20 (0x60 bytes) -- mangled: AnalyzeEdit__Fv
/* ?ret */ void FromAnalyzeEditDraw(void); // @ 0x212F80 (0x50 bytes) -- mangled: FromAnalyzeEditDraw__Fv
/* ?ret */ void FromAnalyzeEdit(void); // @ 0x212FD0 (0xB0 bytes) -- mangled: FromAnalyzeEdit__Fv
/* ?ret */ void EditSaveDraw(void); // @ 0x213080 (0x80 bytes) -- mangled: EditSaveDraw__Fv
/* ?ret */ void EditSaveKey(void); // @ 0x213100 (0xE0 bytes) -- mangled: EditSaveKey__Fv
/* ?ret */ void OptionDraw(void); // @ 0x2131E0 (0x70 bytes) -- mangled: OptionDraw__Fv
/* ?ret */ void EdOptionSelect(void); // @ 0x213250 (0x100 bytes) -- mangled: EdOptionSelect__Fv
/* ?ret */ void EdMenuManualKey(void); // @ 0x213350 (0x100 bytes) -- mangled: EdMenuManualKey__Fv
/* ?ret */ void EdMenuManualDraw(void); // @ 0x213450 (0x70 bytes) -- mangled: EdMenuManualDraw__Fv
/* ?ret */ void InitSaveFileInfoTbl(void); // @ 0x2134C0 (0x80 bytes) -- mangled: InitSaveFileInfoTbl__Fv
/* ?ret */ void GetOpenAttribute(char *); // @ 0x213540 (0x90 bytes) -- mangled: GetOpenAttribute__FPc
