#pragma once

#include "common.h"

// Forward declarations for the types these declarations name. The skeleton
// headers are generated from the retail symbol table, which knows the type
// names but not where they live.
class CTexture;
struct spRGBA;

/**
 * Clears the water-splash effects.
 *
 * @mangled WaterSplash_Init__Fv
 * @address 0x1AF360
 * @size 0x48
 */
void WaterSplash_Init(void);

/**
 * Reports whether the party stands in healing water.
 *
 * @mangled CheckHealingWater__Fv
 * @address 0x1AF3B0
 * @size 0x328
 */
int CheckHealingWater(void);

/**
 * Reports whether the party stands in a healing zone.
 *
 * @mangled CheckHealZone__Fv
 * @address 0x1AF6E0
 * @size 0x29C
 */
int CheckHealZone(void);

/**
 * Restores the party while they stand in healing water.
 *
 * @mangled HealingWater__Fv
 * @address 0x1AF980
 * @size 0x158
 */
void HealingWater(void);

/**
 * Draws the rings spreading on the water.
 *
 * @mangled DrawWaterLing__Fv
 * @address 0x1AFAE0
 * @size 0x27C
 */
void DrawWaterLing(void);

/**
 * Advances the rings spreading on the water.
 *
 * @mangled StepWaterLing__Fv
 * @address 0x1AFD60
 * @size 0x130
 */
void StepWaterLing(void);

/**
 * Chooses the stance the player takes from the nearest monster.
 *
 * @mangled SetBattleStyle__Fii
 * @address 0x1AFE90
 * @size 0x1D0
 */
float SetBattleStyle(int, int);

/**
 * Draws a three-digit value out of the number sheet.
 *
 * @mangled ValuePrint__FiiiiUc
 * @address 0x1B0060
 * @size 0x1F8
 */
int ValuePrint(int, int, int, int, unsigned char);

/**
 * Clears the pulse that warns of low life.
 *
 * @mangled BtStatusAlarmInit__Fv
 * @address 0x1B0260
 * @size 0xB8
 */
void BtStatusAlarmInit(void);

/**
 * Advances the pulse that warns of low life.
 *
 * @mangled BtStatusAlarmAnime__Fv
 * @address 0x1B0320
 * @size 0xC8
 */
void BtStatusAlarmAnime(void);

/**
 * Chooses the colour a status bar draws in from how full it is.
 *
 * @mangled BtGetStatusPal__Fiff
 * @address 0x1B03F0
 * @size 0x80
 */
spRGBA *BtGetStatusPal(int, float, float);

/**
 * Chooses the second colour a status bar draws in from how full it is.
 *
 * @mangled BtGetStatusPal2__Fiff
 * @address 0x1B0470
 * @size 0x80
 */
spRGBA *BtGetStatusPal2(int, float, float);

/**
 * Draws the life, magic and stamina bars at the top of the screen.
 *
 * @mangled topStatusInfo__Fiii
 * @address 0x1B04F0
 * @size 0x1438
 */
void topStatusInfo(int, int, int);

/**
 * Reports whether the party is suffering one status ailment.
 *
 * @mangled StatusErrCheck__Fi
 * @address 0x1B1930
 * @size 0x28
 */
int StatusErrCheck(int status);

/**
 * Chooses the tint the party's status ailment gives them.
 *
 * @mangled BtStatusErrColorSet__Fv
 * @address 0x1B1960
 * @size 0xE8
 * Gives the colour a status ailment tints a model with, and 1 while one runs.
 */
int BtStatusErrColorSet(void);

/**
 * Advances the party's status ailments and applies what they cost.
 *
 * @mangled BtStatusErrStep__Fv
 * @address 0x1B1A50
 * @size 0x154
 */
void BtStatusErrStep(void);

/**
 * Inflicts one status ailment on the party.
 *
 * @mangled BtSetStatusErr__Fi
 * @address 0x1B1BB0
 * @size 0x1CC
 */
void BtSetStatusErr(int);

/**
 * Draws the icons of the party's status ailments.
 *
 * @mangled BtStatusErrDraw__Fi
 * @address 0x1B1D80
 * @size 0x16C
 */
void BtStatusErrDraw(int);

/**
 * Draws one item into the reserved slot area.
 *
 * @mangled setItemToReserved__FPciiPcii
 * @address 0x1B1EF0
 * @size 0x1CC
 */
void setItemToReserved(char *, int, int, char *, int, int);

/**
 * Clears the cached map-jump data.
 *
 * @mangled BtMapJumpCashClear__Fv
 * @address 0x1B20C0
 * @size 0x1C
 */
void BtMapJumpCashClear(void);

/**
 * Reads the map a jump leads to, along with its message buffer.
 *
 * @mangled BtMapJumpLoad__FPc
 * @address 0x1B20E0
 * @size 0x70C
 */
void BtMapJumpLoad(char *);

/**
 * Draws a textured cell in world space.
 *
 * @mangled BtSet3DCellModel__FPfP8CTexturefiiiii
 * @address 0x1B27F0
 * @size 0x108
 */
void BtSet3DCellModel(float *, CTexture *, float, int, int, int, int, int);

/**
 * Gives the way a shot flies for one heading and pitch.
 *
 * @mangled setShotVector__FPffff
 * @address 0x1D4100
 * @size 0x98
 * @unknownret
 */
void setShotVector(float *vector, float speed, float heading, float pitch);

/**
 * Gives the way the player's character faces, at one pitch.
 *
 * @mangled getCharacterVector__FPff
 * @address 0x1D41A0
 * @size 0xC0
 * @unknownret
 */
void getCharacterVector(float *vector, float pitch);

/**
 * Gives the way a thrown thing has to leave one point to land on another.
 *
 * @mangled ParabolicInitialVector__FPfPfPfff
 * @address 0x1D4080
 * @size 0x7C
 * @unknownret
 */
void ParabolicInitialVector(float *vector, float *from, float *to, float gravity,
                            float height);
