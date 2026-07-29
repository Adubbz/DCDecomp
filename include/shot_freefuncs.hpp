#pragma once

#include "common.h"

// Forward declarations for the types these declarations name. The skeleton
// headers are generated from the retail symbol table, which knows the type
// names but not where they live.
class CTexture;


/* ?ret */ void WaterSplash_Init(void); // @ 0x1AF360 (0x50 bytes) -- mangled: WaterSplash_Init__Fv
/* ?ret */ void CheckHealingWater(void); // @ 0x1AF3B0 (0x330 bytes) -- mangled: CheckHealingWater__Fv
/* ?ret */ void CheckHealZone(void); // @ 0x1AF6E0 (0x2A0 bytes) -- mangled: CheckHealZone__Fv
/* ?ret */ void HealingWater(void); // @ 0x1AF980 (0x160 bytes) -- mangled: HealingWater__Fv
/* ?ret */ void DrawWaterLing(void); // @ 0x1AFAE0 (0x280 bytes) -- mangled: DrawWaterLing__Fv
/* ?ret */ void StepWaterLing(void); // @ 0x1AFD60 (0x130 bytes) -- mangled: StepWaterLing__Fv
/* ?ret */ void SetBattleStyle(int, int); // @ 0x1AFE90 (0x1D0 bytes) -- mangled: SetBattleStyle__Fii
/* ?ret */ void ValuePrint(int, int, int, int, unsigned char); // @ 0x1B0060 (0x200 bytes) -- mangled: ValuePrint__FiiiiUc
/* ?ret */ void BtStatusAlarmInit(void); // @ 0x1B0260 (0xC0 bytes) -- mangled: BtStatusAlarmInit__Fv
/* ?ret */ void BtStatusAlarmAnime(void); // @ 0x1B0320 (0xD0 bytes) -- mangled: BtStatusAlarmAnime__Fv
/* ?ret */ void BtGetStatusPal(int, float, float); // @ 0x1B03F0 (0x80 bytes) -- mangled: BtGetStatusPal__Fiff
/* ?ret */ void BtGetStatusPal2(int, float, float); // @ 0x1B0470 (0x80 bytes) -- mangled: BtGetStatusPal2__Fiff
/* ?ret */ void topStatusInfo(int, int, int); // @ 0x1B04F0 (0x1440 bytes) -- mangled: topStatusInfo__Fiii
/* ?ret */ void StatusErrCheck(int); // @ 0x1B1930 (0x30 bytes) -- mangled: StatusErrCheck__Fi
/* ?ret */ void BtStatusErrColorSet(void); // @ 0x1B1960 (0xF0 bytes) -- mangled: BtStatusErrColorSet__Fv
/* ?ret */ void BtStatusErrStep(void); // @ 0x1B1A50 (0x160 bytes) -- mangled: BtStatusErrStep__Fv
/* ?ret */ void BtSetStatusErr(int); // @ 0x1B1BB0 (0x1D0 bytes) -- mangled: BtSetStatusErr__Fi
/* ?ret */ void BtStatusErrDraw(int); // @ 0x1B1D80 (0x170 bytes) -- mangled: BtStatusErrDraw__Fi
/* ?ret */ void setItemToReserved(char *, int, int, char *, int, int); // @ 0x1B1EF0 (0x1D0 bytes) -- mangled: setItemToReserved__FPciiPcii
/* ?ret */ void BtMapJumpCashClear(void); // @ 0x1B20C0 (0x20 bytes) -- mangled: BtMapJumpCashClear__Fv
/* ?ret */ void BtMapJumpLoad(char *); // @ 0x1B20E0 (0x710 bytes) -- mangled: BtMapJumpLoad__FPc
/* ?ret */ void BtSet3DCellModel(float *, CTexture *, float, int, int, int, int, int); // @ 0x1B27F0 (0x110 bytes) -- mangled: BtSet3DCellModel__FPfP8CTexturefiiiii
