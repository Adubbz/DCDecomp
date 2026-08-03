#pragma once

#include "common.h"

// Forward declarations for the types these declarations name. The skeleton
// headers are generated from the retail symbol table, which knows the type
// names but not where they live.
class CTexture;


/**
 * @mangled WaterSplash_Init__Fv
 * @address 0x1AF360
 * @size 0x50
 * @unknownret
 */
void WaterSplash_Init(void);

/**
 * @mangled CheckHealingWater__Fv
 * @address 0x1AF3B0
 * @size 0x330
 * @unknownret
 */
void CheckHealingWater(void);

/**
 * @mangled CheckHealZone__Fv
 * @address 0x1AF6E0
 * @size 0x2A0
 * @unknownret
 */
void CheckHealZone(void);

/**
 * @mangled HealingWater__Fv
 * @address 0x1AF980
 * @size 0x160
 * @unknownret
 */
void HealingWater(void);

/**
 * @mangled DrawWaterLing__Fv
 * @address 0x1AFAE0
 * @size 0x280
 * @unknownret
 */
void DrawWaterLing(void);

/**
 * @mangled StepWaterLing__Fv
 * @address 0x1AFD60
 * @size 0x130
 * @unknownret
 */
void StepWaterLing(void);

/**
 * @mangled SetBattleStyle__Fii
 * @address 0x1AFE90
 * @size 0x1D0
 * @unknownret
 */
void SetBattleStyle(int, int);

/**
 * @mangled ValuePrint__FiiiiUc
 * @address 0x1B0060
 * @size 0x200
 * @unknownret
 */
void ValuePrint(int, int, int, int, unsigned char);

/**
 * @mangled BtStatusAlarmInit__Fv
 * @address 0x1B0260
 * @size 0xC0
 * @unknownret
 */
void BtStatusAlarmInit(void);

/**
 * @mangled BtStatusAlarmAnime__Fv
 * @address 0x1B0320
 * @size 0xD0
 * @unknownret
 */
void BtStatusAlarmAnime(void);

/**
 * @mangled BtGetStatusPal__Fiff
 * @address 0x1B03F0
 * @size 0x80
 * @unknownret
 */
void BtGetStatusPal(int, float, float);

/**
 * @mangled BtGetStatusPal2__Fiff
 * @address 0x1B0470
 * @size 0x80
 * @unknownret
 */
void BtGetStatusPal2(int, float, float);

/**
 * @mangled topStatusInfo__Fiii
 * @address 0x1B04F0
 * @size 0x1440
 * @unknownret
 */
void topStatusInfo(int, int, int);

/**
 * @mangled StatusErrCheck__Fi
 * @address 0x1B1930
 * @size 0x30
 * @unknownret
 */
void StatusErrCheck(int);

/**
 * @mangled BtStatusErrColorSet__Fv
 * @address 0x1B1960
 * @size 0xF0
 * @unknownret
 */
void BtStatusErrColorSet(void);

/**
 * @mangled BtStatusErrStep__Fv
 * @address 0x1B1A50
 * @size 0x160
 * @unknownret
 */
void BtStatusErrStep(void);

/**
 * @mangled BtSetStatusErr__Fi
 * @address 0x1B1BB0
 * @size 0x1D0
 * @unknownret
 */
void BtSetStatusErr(int);

/**
 * @mangled BtStatusErrDraw__Fi
 * @address 0x1B1D80
 * @size 0x170
 * @unknownret
 */
void BtStatusErrDraw(int);

/**
 * @mangled setItemToReserved__FPciiPcii
 * @address 0x1B1EF0
 * @size 0x1D0
 * @unknownret
 */
void setItemToReserved(char *, int, int, char *, int, int);

/**
 * @mangled BtMapJumpCashClear__Fv
 * @address 0x1B20C0
 * @size 0x20
 * @unknownret
 */
void BtMapJumpCashClear(void);

/**
 * @mangled BtMapJumpLoad__FPc
 * @address 0x1B20E0
 * @size 0x710
 * @unknownret
 */
void BtMapJumpLoad(char *);

/**
 * @mangled BtSet3DCellModel__FPfP8CTexturefiiiii
 * @address 0x1B27F0
 * @size 0x110
 * @unknownret
 */
void BtSet3DCellModel(float *, CTexture *, float, int, int, int, int, int);
