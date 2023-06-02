.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel AllFillBoxForMenu__FUcUcUcUc
/* 12D2B0 0022D1B0 E0FFBD27 */  addiu      $sp, $sp, -0x20
/* 12D2B4 0022D1B4 0000BF7F */  sq         $31, 0x0($sp)
/* 12D2B8 0022D1B8 28568070 */  paddub     $10, $4, $0
/* 12D2BC 0022D1BC 284EA070 */  paddub     $9, $5, $0
/* 12D2C0 0022D1C0 281EC070 */  paddub     $3, $6, $0
/* 12D2C4 0022D1C4 2846E070 */  paddub     $8, $7, $0
/* 12D2C8 0022D1C8 FF008230 */  andi       $2, $4, 0xFF
/* 12D2CC 0022D1CC 04004004 */  bltz       $2, .L0022D1E0
/* 12D2D0 0022D1D0 00000000 */   nop
/* 12D2D4 0022D1D4 00014128 */  slti       $at, $2, 0x100
/* 12D2D8 0022D1D8 02002014 */  bnez       $at, .L0022D1E4
/* 12D2DC 0022D1DC 00000000 */   nop
.L0022D1E0:
/* 12D2E0 0022D1E0 80000A64 */  daddiu     $10, $0, 0x80
.L0022D1E4:
/* 12D2E4 0022D1E4 FF002231 */  andi       $2, $9, 0xFF
/* 12D2E8 0022D1E8 04004004 */  bltz       $2, .L0022D1FC
/* 12D2EC 0022D1EC 00000000 */   nop
/* 12D2F0 0022D1F0 00014128 */  slti       $at, $2, 0x100
/* 12D2F4 0022D1F4 02002014 */  bnez       $at, .L0022D200
/* 12D2F8 0022D1F8 00000000 */   nop
.L0022D1FC:
/* 12D2FC 0022D1FC 80000964 */  daddiu     $9, $0, 0x80
.L0022D200:
/* 12D300 0022D200 FF006230 */  andi       $2, $3, 0xFF
/* 12D304 0022D204 04004004 */  bltz       $2, .L0022D218
/* 12D308 0022D208 00000000 */   nop
/* 12D30C 0022D20C 00014128 */  slti       $at, $2, 0x100
/* 12D310 0022D210 02002014 */  bnez       $at, .L0022D21C
/* 12D314 0022D214 00000000 */   nop
.L0022D218:
/* 12D318 0022D218 80000364 */  daddiu     $3, $0, 0x80
.L0022D21C:
/* 12D31C 0022D21C FF000231 */  andi       $2, $8, 0xFF
/* 12D320 0022D220 04004004 */  bltz       $2, .L0022D234
/* 12D324 0022D224 00000000 */   nop
/* 12D328 0022D228 00014128 */  slti       $at, $2, 0x100
/* 12D32C 0022D22C 02002014 */  bnez       $at, .L0022D238
/* 12D330 0022D230 00000000 */   nop
.L0022D234:
/* 12D334 0022D234 80000864 */  daddiu     $8, $0, 0x80
.L0022D238:
/* 12D338 0022D238 1000A0AF */  sw         $0, 0x10($sp)
/* 12D33C 0022D23C 1400A0AF */  sw         $0, 0x14($sp)
/* 12D340 0022D240 00280224 */  addiu      $2, $0, 0x2800
/* 12D344 0022D244 1800A2AF */  sw         $2, 0x18($sp)
/* 12D348 0022D248 001C0224 */  addiu      $2, $0, 0x1C00
/* 12D34C 0022D24C 1C00A2AF */  sw         $2, 0x1C($sp)
/* 12D350 0022D250 1000A427 */  addiu      $4, $sp, 0x10
/* 12D354 0022D254 282E4071 */  paddub     $5, $10, $0
/* 12D358 0022D258 28362071 */  paddub     $6, $9, $0
/* 12D35C 0022D25C 283E6070 */  paddub     $7, $3, $0
/* 12D360 0022D260 9CBE040C */  jal        MGFillBox__FRC8CRect_i_UcUcUcUc
/* 12D364 0022D264 00000000 */   nop
/* 12D368 0022D268 0000BF7B */  lq         $31, 0x0($sp)
/* 12D36C 0022D26C 2000BD27 */  addiu      $sp, $sp, 0x20
/* 12D370 0022D270 0800E003 */  jr         $31
/* 12D374 0022D274 00000000 */   nop
/* 12D378 0022D278 00000000 */  nop
/* 12D37C 0022D27C 00000000 */  nop
