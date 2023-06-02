.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel ConvDebugSelectToExcelListNo__Fi
/* 12B2F0 0022B1F0 81008224 */  addiu      $2, $4, 0x81
/* 12B2F4 0022B1F4 61014128 */  slti       $at, $2, 0x161
/* 12B2F8 0022B1F8 07002014 */  bnez       $at, .L0022B218
/* 12B2FC 0022B1FC 00000000 */   nop
/* 12B300 0022B200 38014128 */  slti       $at, $2, 0x138
/* 12B304 0022B204 04002010 */  beqz       $at, .L0022B218
/* 12B308 0022B208 00000000 */   nop
/* 12B30C 0022B20C FFFF0224 */  addiu      $2, $0, -0x1
/* 12B310 0022B210 08000010 */  b          .L0022B234
/* 12B314 0022B214 00000000 */   nop
.L0022B218:
/* 12B318 0022B218 F8008328 */  slti       $3, $4, 0xF8
/* 12B31C 0022B21C 05006014 */  bnez       $3, .L0022B234
/* 12B320 0022B220 00000000 */   nop
/* 12B324 0022B224 20018128 */  slti       $at, $4, 0x120
/* 12B328 0022B228 02002010 */  beqz       $at, .L0022B234
/* 12B32C 0022B22C 00000000 */   nop
/* 12B330 0022B230 59FF8224 */  addiu      $2, $4, -0xA7
.L0022B234:
/* 12B334 0022B234 0800E003 */  jr         $31
/* 12B338 0022B238 00000000 */   nop
/* 12B33C 0022B23C 00000000 */  nop
