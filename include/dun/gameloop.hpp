#pragma once

#include "common.h"

/* ?ret */ void LoadBaseTexture(void); // @ 0x1DABD80 (0x150 bytes) -- mangled: LoadBaseTexture__Fv
/* ?ret */ void LoadTempTexture(char **, int, char *); // @ 0x1DABED0 (0x120 bytes) -- mangled: LoadTempTexture__FPPciPc
/* ?ret */ void SetTempTexture(int, char *); // @ 0x1DABFF0 (0x80 bytes) -- mangled: SetTempTexture__FiPc
/* ?ret */ void MemoryMapDump(void); // @ 0x1DAC070 (0x150 bytes) -- mangled: MemoryMapDump__Fv
/* ?ret */ void GameInit(void); // @ 0x1DAC1C0 (0x17C0 bytes) -- mangled: GameInit__Fv
/* ?ret */ void GameLoop(void); // @ 0x1DAD980 (0x2C0 bytes) -- mangled: GameLoop__Fv
/* ?ret */ void Draw_MainUnitShadow(void); // @ 0x1DADC40 (0x1D0 bytes) -- mangled: Draw_MainUnitShadow__Fv
/* ?ret */ void Draw_MainUnit(void); // @ 0x1DADE10 (0x490 bytes) -- mangled: Draw_MainUnit__Fv
/* ?ret */ void MainDraw(void); // @ 0x1DAE2A0 (0x2600 bytes) -- mangled: MainDraw__Fv__3  // disambiguated by disassembler ("__3" suffix); real retail name has no suffix
/* ?ret */ void MoveChara(void); // @ 0x1DB08A0 (0x6BB0 bytes) -- mangled: MoveChara__Fv__2  // disambiguated by disassembler ("__2" suffix); real retail name has no suffix
/* ?ret */ void motionDrive(void); // @ 0x1DB7450 (0x1340 bytes) -- mangled: motionDrive__Fv
/* ?ret */ void BtCleatRandomMap(void); // @ 0x1DB8790 (0xA30 bytes) -- mangled: BtCleatRandomMap__Fv
/* ?ret */ void BtCleatFreeMap(void); // @ 0x1DB91C0 (0x120 bytes) -- mangled: BtCleatFreeMap__Fv
/* ?ret */ void BtArrengeMonstor(void); // @ 0x1DB92E0 (0x50 bytes) -- mangled: BtArrengeMonstor__Fv
/* ?ret */ void BtLoadMonstor(int); // @ 0x1DB9330 (0x260 bytes) -- mangled: BtLoadMonstor__Fi
/* ?ret */ void EquipReAttach(CCharacter *, int); // @ 0x1DB9590 (0xD0 bytes) -- mangled: EquipReAttach__FP10CCharacteri
/* ?ret */ void EquipWeaponFrame(CCharacter *, int, int); // @ 0x1DB9660 (0x1E0 bytes) -- mangled: EquipWeaponFrame__FP10CCharacterii
/* ?ret */ void LoadWeapon2(unsigned int *, unsigned int *, unsigned int *, int, int); // @ 0x1DB9840 (0x2F0 bytes) -- mangled: LoadWeapon2__FPUiPUiPUiii
/* ?ret */ void SwordDmgCheck1(float, int); // @ 0x1DB9B30 (0x2D0 bytes) -- mangled: SwordDmgCheck1__Ffi
/* ?ret */ void SetWeaponColor(void); // @ 0x1DB9E00 (0x260 bytes) -- mangled: SetWeaponColor__Fv
/* ?ret */ void Get_Main_EffectPtr(int, int); // @ 0x1DBA060 (0x1D0 bytes) -- mangled: Get_Main_EffectPtr__Fii
/* ?ret */ void MainChara_Effect(BT_SHOT_EFFECT *, unsigned int *, int); // @ 0x1DBA230 (0x190 bytes) -- mangled: MainChara_Effect__FP14BT_SHOT_EFFECTPUii
/* ?ret */ void LoadChara2(int, int, unsigned int *, unsigned int *, unsigned int *, unsigned int *); // @ 0x1DBA3C0 (0x570 bytes) -- mangled: LoadChara2__FiiPUiPUiPUiPUi
/* ?ret */ void LoadData(void); // @ 0x1DBA930 (0x6A0 bytes) -- mangled: LoadData__Fv__3  // disambiguated by disassembler ("__3" suffix); real retail name has no suffix
/* ?ret */ void BtCheckDamageProc(void); // @ 0x1DBAFD0 (0xF10 bytes) -- mangled: BtCheckDamageProc__Fv
/* ?ret */ void BattleActionThlow(void); // @ 0x1DBBEE0 (0x720 bytes) -- mangled: BattleActionThlow__Fv
/* ?ret */ void BattleActionDrink(void); // @ 0x1DBC600 (0x2A0 bytes) -- mangled: BattleActionDrink__Fv
/* ?ret */ void BattleActionOn_Jinn(void); // @ 0x1DBC8A0 (0x90 bytes) -- mangled: BattleActionOn_Jinn__Fv
/* ?ret */ void BattleActionPlay_Jinn(CCharacter *, int); // @ 0x1DBC930 (0x5D0 bytes) -- mangled: BattleActionPlay_Jinn__FP10CCharacteri
/* ?ret */ void BattleActionOn_Ruby(void); // @ 0x1DBCF00 (0x80 bytes) -- mangled: BattleActionOn_Ruby__Fv
/* ?ret */ void BattleActionShotRuby(CCharacter *, int, float, int); // @ 0x1DBCF80 (0x3D0 bytes) -- mangled: BattleActionShotRuby__FP10CCharacterifi
/* ?ret */ void BattleActionPlay_Ruby(CCharacter *, int); // @ 0x1DBD350 (0x7F0 bytes) -- mangled: BattleActionPlay_Ruby__FP10CCharacteri
/* ?ret */ void BattleActionOn_Ozumond(void); // @ 0x1DBDB40 (0x90 bytes) -- mangled: BattleActionOn_Ozumond__Fv
/* ?ret */ void BattleActionOn_Ozumond_H(void); // @ 0x1DBDBD0 (0xA0 bytes) -- mangled: BattleActionOn_Ozumond_H__Fv
/* ?ret */ void BattleActionOn_Ozumond_F(void); // @ 0x1DBDC70 (0x80 bytes) -- mangled: BattleActionOn_Ozumond_F__Fv
/* ?ret */ void BattleActionPlay_Ozumond(int); // @ 0x1DBDCF0 (0x3D0 bytes) -- mangled: BattleActionPlay_Ozumond__Fi
/* ?ret */ void BattleActionPlay_Ozumond_H(int); // @ 0x1DBE0C0 (0x2E0 bytes) -- mangled: BattleActionPlay_Ozumond_H__Fi
/* ?ret */ void BattleActionPlay_Ozumond_F(int); // @ 0x1DBE3A0 (0x3C0 bytes) -- mangled: BattleActionPlay_Ozumond_F__Fi
/* ?ret */ void CameraAutoMove(CCameraFollow *, CCPoly *, float *, float, float); // @ 0x1DBE760 (0x210 bytes) -- mangled: CameraAutoMove__FP13CCameraFollowP6CCPolyPfff__2  // disambiguated by disassembler ("__2" suffix); real retail name has no suffix
/* ?ret */ void autoCamTrial(void); // @ 0x1DBE970 (0x1060 bytes) -- mangled: autoCamTrial__Fv
/* ?ret */ void DelActiveItem(int); // @ 0x1DBF9D0 (0xA0 bytes) -- mangled: DelActiveItem__Fi
/* ?ret */ void Run_TrapCircle(MAP_TRAP_CIRCLE *); // @ 0x1DBFA70 (0x270 bytes) -- mangled: Run_TrapCircle__FP15MAP_TRAP_CIRCLE
/* ?ret */ void LockOffTargte(void); // @ 0x1DBFCE0 (0x30 bytes) -- mangled: LockOffTargte__Fv
/* ?ret */ void DrawTargetLife(void); // @ 0x1DBFD10 (0x1C0 bytes) -- mangled: DrawTargetLife__Fv
/* ?ret */ void DrawtargetCursor(float *, float, float, float); // @ 0x1DBFED0 (0x290 bytes) -- mangled: DrawtargetCursor__FPffff
/* ?ret */ void SetNearLockOnTarget(int, int); // @ 0x1DC0160 (0x640 bytes) -- mangled: SetNearLockOnTarget__Fii
/* ?ret */ void setTargetCursor(int); // @ 0x1DC07A0 (0x6E0 bytes) -- mangled: setTargetCursor__Fi
/* ?ret */ void unitBlowActionRot(float *); // @ 0x1DC0E80 (0xA0 bytes) -- mangled: unitBlowActionRot__FPf
/* ?ret */ void setUnitDamageColor(int); // @ 0x1DC0F20 (0xD0 bytes) -- mangled: setUnitDamageColor__Fi
/* ?ret */ void RsetUnitAmbientAnime(void); // @ 0x1DC0FF0 (0x10 bytes) -- mangled: RsetUnitAmbientAnime__Fv
/* ?ret */ void setUnitAmbientAnime(float, float, float, float, float); // @ 0x1DC1000 (0x50 bytes) -- mangled: setUnitAmbientAnime__Ffffff
/* ?ret */ void unitAmbientAnime(float *); // @ 0x1DC1050 (0x130 bytes) -- mangled: unitAmbientAnime__FPf
/* ?ret */ void LoadStartLogo(int); // @ 0x1DC1180 (0x110 bytes) -- mangled: LoadStartLogo__Fi
/* ?ret */ void FloorTitleOn(void); // @ 0x1DC1290 (0x30 bytes) -- mangled: FloorTitleOn__Fv
/* ?ret */ void SetMIniMapStatus(int); // @ 0x1DC12C0 (0x40 bytes) -- mangled: SetMIniMapStatus__Fi
/* ?ret */ void ResetStatusInfo(void); // @ 0x1DC1300 (0x100 bytes) -- mangled: ResetStatusInfo__Fv
/* ?ret */ void ResetMovePower(void); // @ 0x1DC1400 (0x20 bytes) -- mangled: ResetMovePower__Fv
/* ?ret */ void LoaderInit(void); // @ 0x1DC1420 (0xF0 bytes) -- mangled: LoaderInit__Fv
/* ?ret */ void LoaderLoop(void); // @ 0x1DC1510 (0x280 bytes) -- mangled: LoaderLoop__Fv
/* ?ret */ void InitEyeCamera(void); // @ 0x1DC1790 (0x50 bytes) -- mangled: InitEyeCamera__Fv
/* ?ret */ void EyeCamera(void); // @ 0x1DC17E0 (0x0 bytes) -- mangled: EyeCamera__Fv
