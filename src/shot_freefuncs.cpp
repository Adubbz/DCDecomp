#include "shot_freefuncs.hpp"

/**
 * Clears the water-splash effects.
 *
 * @mangled WaterSplash_Init__Fv
 * @address 0x1AF360
 * @size 0x48
 */
INCLUDE_ASM("asm/nonmatchings/shot_freefuncs", WaterSplash_Init__Fv);
/**
 * Reports whether the party stands in healing water.
 *
 * @mangled CheckHealingWater__Fv
 * @address 0x1AF3B0
 * @size 0x328
 */
INCLUDE_ASM("asm/nonmatchings/shot_freefuncs", CheckHealingWater__Fv);
/**
 * Reports whether the party stands in a healing zone.
 *
 * @mangled CheckHealZone__Fv
 * @address 0x1AF6E0
 * @size 0x29C
 */
INCLUDE_ASM("asm/nonmatchings/shot_freefuncs", CheckHealZone__Fv);
/**
 * Restores the party while they stand in healing water.
 *
 * @mangled HealingWater__Fv
 * @address 0x1AF980
 * @size 0x158
 */
INCLUDE_ASM("asm/nonmatchings/shot_freefuncs", HealingWater__Fv);
/**
 * Draws the rings spreading on the water.
 *
 * @mangled DrawWaterLing__Fv
 * @address 0x1AFAE0
 * @size 0x27C
 */
INCLUDE_ASM("asm/nonmatchings/shot_freefuncs", DrawWaterLing__Fv);
INCLUDE_RODATA("asm/nonmatchings/shot_freefuncs", @703);
/**
 * Advances the rings spreading on the water.
 *
 * @mangled StepWaterLing__Fv
 * @address 0x1AFD60
 * @size 0x130
 */
INCLUDE_ASM("asm/nonmatchings/shot_freefuncs", StepWaterLing__Fv);
/**
 * Chooses the stance the player takes from the nearest monster.
 *
 * @mangled SetBattleStyle__Fii
 * @address 0x1AFE90
 * @size 0x1D0
 */
INCLUDE_ASM("asm/nonmatchings/shot_freefuncs", SetBattleStyle__Fii);
/**
 * Draws a three-digit value out of the number sheet.
 *
 * @mangled ValuePrint__FiiiiUc
 * @address 0x1B0060
 * @size 0x1F8
 */
INCLUDE_ASM("asm/nonmatchings/shot_freefuncs", ValuePrint__FiiiiUc);
INCLUDE_RODATA("asm/nonmatchings/shot_freefuncs", @778);
/**
 * Clears the pulse that warns of low life.
 *
 * @mangled BtStatusAlarmInit__Fv
 * @address 0x1B0260
 * @size 0xB8
 */
INCLUDE_ASM("asm/nonmatchings/shot_freefuncs", BtStatusAlarmInit__Fv);
/**
 * Advances the pulse that warns of low life.
 *
 * @mangled BtStatusAlarmAnime__Fv
 * @address 0x1B0320
 * @size 0xC8
 */
INCLUDE_ASM("asm/nonmatchings/shot_freefuncs", BtStatusAlarmAnime__Fv);
/**
 * Chooses the colour a status bar draws in from how full it is.
 *
 * @mangled BtGetStatusPal__Fiff
 * @address 0x1B03F0
 * @size 0x80
 */
INCLUDE_ASM("asm/nonmatchings/shot_freefuncs", BtGetStatusPal__Fiff);
/**
 * Chooses the second colour a status bar draws in from how full it is.
 *
 * @mangled BtGetStatusPal2__Fiff
 * @address 0x1B0470
 * @size 0x80
 */
INCLUDE_ASM("asm/nonmatchings/shot_freefuncs", BtGetStatusPal2__Fiff);
/**
 * Draws the life, magic and stamina bars at the top of the screen.
 *
 * @mangled topStatusInfo__Fiii
 * @address 0x1B04F0
 * @size 0x1438
 */
INCLUDE_ASM("asm/nonmatchings/shot_freefuncs", topStatusInfo__Fiii);
INCLUDE_RODATA("asm/nonmatchings/shot_freefuncs", @1150);
/**
 * Reports whether the party is suffering one status ailment.
 *
 * @mangled StatusErrCheck__Fi
 * @address 0x1B1930
 * @size 0x28
 */
INCLUDE_ASM("asm/nonmatchings/shot_freefuncs", StatusErrCheck__Fi);
/**
 * Chooses the tint the party's status ailment gives them.
 *
 * @mangled BtStatusErrColorSet__Fv
 * @address 0x1B1960
 * @size 0xE8
 */
INCLUDE_ASM("asm/nonmatchings/shot_freefuncs", BtStatusErrColorSet__Fv);
/**
 * Advances the party's status ailments and applies what they cost.
 *
 * @mangled BtStatusErrStep__Fv
 * @address 0x1B1A50
 * @size 0x154
 */
INCLUDE_ASM("asm/nonmatchings/shot_freefuncs", BtStatusErrStep__Fv);
/**
 * Inflicts one status ailment on the party.
 *
 * @mangled BtSetStatusErr__Fi
 * @address 0x1B1BB0
 * @size 0x1CC
 */
INCLUDE_ASM("asm/nonmatchings/shot_freefuncs", BtSetStatusErr__Fi);
/**
 * Draws the icons of the party's status ailments.
 *
 * @mangled BtStatusErrDraw__Fi
 * @address 0x1B1D80
 * @size 0x16C
 */
INCLUDE_ASM("asm/nonmatchings/shot_freefuncs", BtStatusErrDraw__Fi);
/**
 * Draws one item into the reserved slot area.
 *
 * @mangled setItemToReserved__FPciiPcii
 * @address 0x1B1EF0
 * @size 0x1CC
 */
INCLUDE_ASM("asm/nonmatchings/shot_freefuncs", setItemToReserved__FPciiPcii);
/**
 * Clears the cached map-jump data.
 *
 * @mangled BtMapJumpCashClear__Fv
 * @address 0x1B20C0
 * @size 0x1C
 */
INCLUDE_ASM("asm/nonmatchings/shot_freefuncs", BtMapJumpCashClear__Fv);
/**
 * Reads the map a jump leads to, along with its message buffer.
 *
 * @mangled BtMapJumpLoad__FPc
 * @address 0x1B20E0
 * @size 0x70C
 */
INCLUDE_ASM("asm/nonmatchings/shot_freefuncs", BtMapJumpLoad__FPc);
INCLUDE_RODATA("asm/nonmatchings/shot_freefuncs", @1353__2);
INCLUDE_RODATA("asm/nonmatchings/shot_freefuncs", @1354);
INCLUDE_RODATA("asm/nonmatchings/shot_freefuncs", @1355);
INCLUDE_RODATA("asm/nonmatchings/shot_freefuncs", @1356);
INCLUDE_RODATA("asm/nonmatchings/shot_freefuncs", @1357);
INCLUDE_RODATA("asm/nonmatchings/shot_freefuncs", @1358);
INCLUDE_RODATA("asm/nonmatchings/shot_freefuncs", @1359);
INCLUDE_RODATA("asm/nonmatchings/shot_freefuncs", @1360);
INCLUDE_RODATA("asm/nonmatchings/shot_freefuncs", @1361);
INCLUDE_RODATA("asm/nonmatchings/shot_freefuncs", @1362);
INCLUDE_RODATA("asm/nonmatchings/shot_freefuncs", @1363);
INCLUDE_RODATA("asm/nonmatchings/shot_freefuncs", @1364);
INCLUDE_RODATA("asm/nonmatchings/shot_freefuncs", @1365);
INCLUDE_RODATA("asm/nonmatchings/shot_freefuncs", @1366);
INCLUDE_RODATA("asm/nonmatchings/shot_freefuncs", @1367);
INCLUDE_RODATA("asm/nonmatchings/shot_freefuncs", @1368);
INCLUDE_RODATA("asm/nonmatchings/shot_freefuncs", @1369__2);
INCLUDE_RODATA("asm/nonmatchings/shot_freefuncs", @1370);
/**
 * Draws a textured cell in world space.
 *
 * @mangled BtSet3DCellModel__FPfP8CTexturefiiiii
 * @address 0x1B27F0
 * @size 0x108
 */
INCLUDE_ASM("asm/nonmatchings/shot_freefuncs", BtSet3DCellModel__FPfP8CTexturefiiiii);
