.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel OpC_LoadDataBG3__Fv
/* 010240 01DBBF40 F0FFBD27 */  addiu       $29, $29, -0x10
/* 010244 01DBBF44 0000BF7F */  sq          $31, 0x0($29)
.L01DBBF48_2C1748:
/* 010248 01DBBF48 8CFB040C */  jal         ReadBGSync__Fv
/* 01024C 01DBBF4C 00000000 */   nop
/* 010250 01DBBF50 FDFF4014 */  bnez        $2, .L01DBBF48_2C1748
/* 010254 01DBBF54 00000000 */   nop
/* 010258 01DBBF58 948B858F */  lw          $5, -0x746C($28)
/* 01025C 01DBBF5C DE01023C */  lui         $2, %hi(LIT_376__8)
/* 010260 01DBBF60 10EC4424 */  addiu       $4, $2, %lo(LIT_376__8)
/* 010264 01DBBF64 28360070 */  paddub      $6, $0, $0
/* 010268 01DBBF68 ACFA040C */  jal         LoadFileBG__FPcP1Pi
/* 01026C 01DBBF6C 00000000 */   nop
/* 010270 01DBBF70 FFFF0324 */  addiu       $3, $0, -0x1
/* 010274 01DBBF74 DE01013C */  lui         $1, %hi(CScript__2 + 0x1C)
/* 010278 01DBBF78 1C1B23AC */  sw          $3, %lo(CScript__2 + 0x1C)($1)
/* 01027C 01DBBF7C 0000BF7B */  lq          $31, 0x0($29)
/* 010280 01DBBF80 1000BD27 */  addiu       $29, $29, 0x10
/* 010284 01DBBF84 0800E003 */  jr          $31
/* 010288 01DBBF88 00000000 */   nop
/* 01028C 01DBBF8C 00000000 */  nop
