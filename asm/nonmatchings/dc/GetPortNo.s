.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel GetPortNo__Fi
/* 5A300 0015A200 F0FFBD27 */  addiu      $sp, $sp, -0x10
/* 5A304 0015A204 0000BF7F */  sq         $31, 0x0($sp)
/* 5A308 0015A208 2C68050C */  jal        GetSeInfo__Fi
/* 5A30C 0015A20C 00000000 */   nop
/* 5A310 0015A210 03004280 */  lb         $2, 0x3($2)
/* 5A314 0015A214 03004004 */  bltz       $2, .L0015A224
/* 5A318 0015A218 00000000 */   nop
/* 5A31C 0015A21C 02000010 */  b          .L0015A228
/* 5A320 0015A220 00000000 */   nop
.L0015A224:
/* 5A324 0015A224 0E000224 */  addiu      $2, $0, 0xE
.L0015A228:
/* 5A328 0015A228 0000BF7B */  lq         $31, 0x0($sp)
/* 5A32C 0015A22C 1000BD27 */  addiu      $sp, $sp, 0x10
/* 5A330 0015A230 0800E003 */  jr         $31
/* 5A334 0015A234 00000000 */   nop
/* 5A338 0015A238 00000000 */  nop
/* 5A33C 0015A23C 00000000 */  nop
