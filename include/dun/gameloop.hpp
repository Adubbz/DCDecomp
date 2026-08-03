#pragma once

#include "common.h"

/**
 * @mangled LoadBaseTexture__Fv
 * @address 0x1DABD80
 * @size 0x150
 * @unknownret
 */
void LoadBaseTexture(void);

/**
 * @mangled LoadTempTexture__FPPciPc
 * @address 0x1DABED0
 * @size 0x120
 * @unknownret
 */
void LoadTempTexture(char **, int, char *);

/**
 * @mangled SetTempTexture__FiPc
 * @address 0x1DABFF0
 * @size 0x80
 * @unknownret
 */
void SetTempTexture(int, char *);

/**
 * @mangled MemoryMapDump__Fv
 * @address 0x1DAC070
 * @size 0x150
 * @unknownret
 */
void MemoryMapDump(void);

/**
 * @mangled GameInit__Fv
 * @address 0x1DAC1C0
 * @size 0x17C0
 * @unknownret
 */
void GameInit(void);

/**
 * @mangled GameLoop__Fv
 * @address 0x1DAD980
 * @size 0x2C0
 * @unknownret
 */
void GameLoop(void);

/**
 * @mangled Draw_MainUnitShadow__Fv
 * @address 0x1DADC40
 * @size 0x1D0
 * @unknownret
 */
void Draw_MainUnitShadow(void);

/**
 * @mangled Draw_MainUnit__Fv
 * @address 0x1DADE10
 * @size 0x490
 * @unknownret
 */
void Draw_MainUnit(void);

/**
 * @mangled MainDraw__Fv__3
 * @address 0x1DAE2A0
 * @size 0x2600
 * @unknownret
 * @note disambiguated by disassembler ("__3" suffix); real retail name has no suffix
 */
void MainDraw(void);

/**
 * @mangled MoveChara__Fv__2
 * @address 0x1DB08A0
 * @size 0x6BB0
 * @unknownret
 * @note disambiguated by disassembler ("__2" suffix); real retail name has no suffix
 */
void MoveChara(void);

/**
 * @mangled motionDrive__Fv
 * @address 0x1DB7450
 * @size 0x1340
 * @unknownret
 */
void motionDrive(void);

/**
 * @mangled BtCleatRandomMap__Fv
 * @address 0x1DB8790
 * @size 0xA30
 * @unknownret
 */
void BtCleatRandomMap(void);

/**
 * @mangled BtCleatFreeMap__Fv
 * @address 0x1DB91C0
 * @size 0x120
 * @unknownret
 */
void BtCleatFreeMap(void);

/**
 * @mangled BtArrengeMonstor__Fv
 * @address 0x1DB92E0
 * @size 0x50
 * @unknownret
 */
void BtArrengeMonstor(void);

/**
 * @mangled BtLoadMonstor__Fi
 * @address 0x1DB9330
 * @size 0x260
 * @unknownret
 */
void BtLoadMonstor(int);

/**
 * @mangled EquipReAttach__FP10CCharacteri
 * @address 0x1DB9590
 * @size 0xD0
 * @unknownret
 */
void EquipReAttach(CCharacter *, int);

/**
 * @mangled EquipWeaponFrame__FP10CCharacterii
 * @address 0x1DB9660
 * @size 0x1E0
 * @unknownret
 */
void EquipWeaponFrame(CCharacter *, int, int);

/**
 * @mangled LoadWeapon2__FPUiPUiPUiii
 * @address 0x1DB9840
 * @size 0x2F0
 * @unknownret
 */
void LoadWeapon2(unsigned int *, unsigned int *, unsigned int *, int, int);

/**
 * @mangled SwordDmgCheck1__Ffi
 * @address 0x1DB9B30
 * @size 0x2D0
 * @unknownret
 */
void SwordDmgCheck1(float, int);

/**
 * @mangled SetWeaponColor__Fv
 * @address 0x1DB9E00
 * @size 0x260
 * @unknownret
 */
void SetWeaponColor(void);

/**
 * @mangled Get_Main_EffectPtr__Fii
 * @address 0x1DBA060
 * @size 0x1D0
 * @unknownret
 */
void Get_Main_EffectPtr(int, int);

/**
 * @mangled MainChara_Effect__FP14BT_SHOT_EFFECTPUii
 * @address 0x1DBA230
 * @size 0x190
 * @unknownret
 */
void MainChara_Effect(BT_SHOT_EFFECT *, unsigned int *, int);

/**
 * @mangled LoadChara2__FiiPUiPUiPUiPUi
 * @address 0x1DBA3C0
 * @size 0x570
 * @unknownret
 */
void LoadChara2(int, int, unsigned int *, unsigned int *, unsigned int *, unsigned int *);

/**
 * @mangled LoadData__Fv__3
 * @address 0x1DBA930
 * @size 0x6A0
 * @unknownret
 * @note disambiguated by disassembler ("__3" suffix); real retail name has no suffix
 */
void LoadData(void);

/**
 * @mangled BtCheckDamageProc__Fv
 * @address 0x1DBAFD0
 * @size 0xF10
 * @unknownret
 */
void BtCheckDamageProc(void);

/**
 * @mangled BattleActionThlow__Fv
 * @address 0x1DBBEE0
 * @size 0x720
 * @unknownret
 */
void BattleActionThlow(void);

/**
 * @mangled BattleActionDrink__Fv
 * @address 0x1DBC600
 * @size 0x2A0
 * @unknownret
 */
void BattleActionDrink(void);

/**
 * @mangled BattleActionOn_Jinn__Fv
 * @address 0x1DBC8A0
 * @size 0x90
 * @unknownret
 */
void BattleActionOn_Jinn(void);

/**
 * @mangled BattleActionPlay_Jinn__FP10CCharacteri
 * @address 0x1DBC930
 * @size 0x5D0
 * @unknownret
 */
void BattleActionPlay_Jinn(CCharacter *, int);

/**
 * @mangled BattleActionOn_Ruby__Fv
 * @address 0x1DBCF00
 * @size 0x80
 * @unknownret
 */
void BattleActionOn_Ruby(void);

/**
 * @mangled BattleActionShotRuby__FP10CCharacterifi
 * @address 0x1DBCF80
 * @size 0x3D0
 * @unknownret
 */
void BattleActionShotRuby(CCharacter *, int, float, int);

/**
 * @mangled BattleActionPlay_Ruby__FP10CCharacteri
 * @address 0x1DBD350
 * @size 0x7F0
 * @unknownret
 */
void BattleActionPlay_Ruby(CCharacter *, int);

/**
 * @mangled BattleActionOn_Ozumond__Fv
 * @address 0x1DBDB40
 * @size 0x90
 * @unknownret
 */
void BattleActionOn_Ozumond(void);

/**
 * @mangled BattleActionOn_Ozumond_H__Fv
 * @address 0x1DBDBD0
 * @size 0xA0
 * @unknownret
 */
void BattleActionOn_Ozumond_H(void);

/**
 * @mangled BattleActionOn_Ozumond_F__Fv
 * @address 0x1DBDC70
 * @size 0x80
 * @unknownret
 */
void BattleActionOn_Ozumond_F(void);

/**
 * @mangled BattleActionPlay_Ozumond__Fi
 * @address 0x1DBDCF0
 * @size 0x3D0
 * @unknownret
 */
void BattleActionPlay_Ozumond(int);

/**
 * @mangled BattleActionPlay_Ozumond_H__Fi
 * @address 0x1DBE0C0
 * @size 0x2E0
 * @unknownret
 */
void BattleActionPlay_Ozumond_H(int);

/**
 * @mangled BattleActionPlay_Ozumond_F__Fi
 * @address 0x1DBE3A0
 * @size 0x3C0
 * @unknownret
 */
void BattleActionPlay_Ozumond_F(int);

/**
 * @mangled CameraAutoMove__FP13CCameraFollowP6CCPolyPfff__2
 * @address 0x1DBE760
 * @size 0x210
 * @unknownret
 * @note disambiguated by disassembler ("__2" suffix); real retail name has no suffix
 */
void CameraAutoMove(CCameraFollow *, CCPoly *, float *, float, float);

/**
 * @mangled autoCamTrial__Fv
 * @address 0x1DBE970
 * @size 0x1060
 * @unknownret
 */
void autoCamTrial(void);

/**
 * @mangled DelActiveItem__Fi
 * @address 0x1DBF9D0
 * @size 0xA0
 * @unknownret
 */
void DelActiveItem(int);

/**
 * @mangled Run_TrapCircle__FP15MAP_TRAP_CIRCLE
 * @address 0x1DBFA70
 * @size 0x270
 * @unknownret
 */
void Run_TrapCircle(MAP_TRAP_CIRCLE *);

/**
 * @mangled LockOffTargte__Fv
 * @address 0x1DBFCE0
 * @size 0x30
 * @unknownret
 */
void LockOffTargte(void);

/**
 * @mangled DrawTargetLife__Fv
 * @address 0x1DBFD10
 * @size 0x1C0
 * @unknownret
 */
void DrawTargetLife(void);

/**
 * @mangled DrawtargetCursor__FPffff
 * @address 0x1DBFED0
 * @size 0x290
 * @unknownret
 */
void DrawtargetCursor(float *, float, float, float);

/**
 * @mangled SetNearLockOnTarget__Fii
 * @address 0x1DC0160
 * @size 0x640
 * @unknownret
 */
void SetNearLockOnTarget(int, int);

/**
 * @mangled setTargetCursor__Fi
 * @address 0x1DC07A0
 * @size 0x6E0
 * @unknownret
 */
void setTargetCursor(int);

/**
 * @mangled unitBlowActionRot__FPf
 * @address 0x1DC0E80
 * @size 0xA0
 * @unknownret
 */
void unitBlowActionRot(float *);

/**
 * @mangled setUnitDamageColor__Fi
 * @address 0x1DC0F20
 * @size 0xD0
 * @unknownret
 */
void setUnitDamageColor(int);

/**
 * @mangled RsetUnitAmbientAnime__Fv
 * @address 0x1DC0FF0
 * @size 0x10
 * @unknownret
 */
void RsetUnitAmbientAnime(void);

/**
 * @mangled setUnitAmbientAnime__Ffffff
 * @address 0x1DC1000
 * @size 0x50
 * @unknownret
 */
void setUnitAmbientAnime(float, float, float, float, float);

/**
 * @mangled unitAmbientAnime__FPf
 * @address 0x1DC1050
 * @size 0x130
 * @unknownret
 */
void unitAmbientAnime(float *);

/**
 * @mangled LoadStartLogo__Fi
 * @address 0x1DC1180
 * @size 0x110
 * @unknownret
 */
void LoadStartLogo(int);

/**
 * @mangled FloorTitleOn__Fv
 * @address 0x1DC1290
 * @size 0x30
 * @unknownret
 */
void FloorTitleOn(void);

/**
 * @mangled SetMIniMapStatus__Fi
 * @address 0x1DC12C0
 * @size 0x40
 * @unknownret
 */
void SetMIniMapStatus(int);

/**
 * @mangled ResetStatusInfo__Fv
 * @address 0x1DC1300
 * @size 0x100
 * @unknownret
 */
void ResetStatusInfo(void);

/**
 * @mangled ResetMovePower__Fv
 * @address 0x1DC1400
 * @size 0x20
 * @unknownret
 */
void ResetMovePower(void);

/**
 * @mangled LoaderInit__Fv
 * @address 0x1DC1420
 * @size 0xF0
 * @unknownret
 */
void LoaderInit(void);

/**
 * @mangled LoaderLoop__Fv
 * @address 0x1DC1510
 * @size 0x280
 * @unknownret
 */
void LoaderLoop(void);

/**
 * @mangled InitEyeCamera__Fv
 * @address 0x1DC1790
 * @size 0x50
 * @unknownret
 */
void InitEyeCamera(void);

/**
 * @mangled EyeCamera__Fv
 * @address 0x1DC17E0
 * @size 0x0
 * @unknownret
 */
void EyeCamera(void);
