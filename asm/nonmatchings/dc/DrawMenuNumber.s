.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel DrawMenuNumber__FiiiP8CTexture4RECTii
/* 117EC0 00217DC0 D0FFBD27 */  addiu      $sp, $sp, -0x30
/* 117EC4 00217DC4 1000BF7F */  sq         $31, 0x10($sp)
/* 117EC8 00217DC8 2816E070 */  paddub     $2, $7, $0
/* 117ECC 00217DCC 2000A727 */  addiu      $7, $sp, 0x20
/* 117ED0 00217DD0 000003C5 */  lwc1       $f3, 0x0($8)
/* 117ED4 00217DD4 040002C5 */  lwc1       $f2, 0x4($8)
/* 117ED8 00217DD8 080001C5 */  lwc1       $f1, 0x8($8)
/* 117EDC 00217DDC 0C0000C5 */  lwc1       $f0, 0xC($8)
/* 117EE0 00217DE0 0000E3E4 */  swc1       $f3, 0x0($7)
/* 117EE4 00217DE4 0400E2E4 */  swc1       $f2, 0x4($7)
/* 117EE8 00217DE8 0800E1E4 */  swc1       $f1, 0x8($7)
/* 117EEC 00217DEC 0C00E0E4 */  swc1       $f0, 0xC($7)
/* 117EF0 00217DF0 0000AAFF */  sd         $10, 0x0($sp)
/* 117EF4 00217DF4 28464070 */  paddub     $8, $2, $0
/* 117EF8 00217DF8 28560070 */  paddub     $10, $0, $0
/* 117EFC 00217DFC C0010B24 */  addiu      $11, $0, 0x1C0
/* 117F00 00217E00 F45F080C */  jal        DrawMenuNumber__Fiii4RECTP8CTextureiiii
/* 117F04 00217E04 00000000 */   nop
/* 117F08 00217E08 1000BF7B */  lq         $31, 0x10($sp)
/* 117F0C 00217E0C 3000BD27 */  addiu      $sp, $sp, 0x30
/* 117F10 00217E10 0800E003 */  jr         $31
/* 117F14 00217E14 00000000 */   nop
/* 117F18 00217E18 00000000 */  nop
/* 117F1C 00217E1C 00000000 */  nop
