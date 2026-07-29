.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel Cosf__Ff
/* 024000 00123F00 F0FFBD27 */  addiu       $29, $29, -0x10
/* 024004 00123F04 0000BF7F */  sq          $31, 0x0($29)
/* 024008 00123F08 C88080C7 */  lwc1        $f0, -0x7F38($28)
/* 02400C 00123F0C 00030C46 */  add.s       $f12, $f0, $f12
/* 024010 00123F10 908F040C */  jal         Sinf__Ff
/* 024014 00123F14 00000000 */   nop
/* 024018 00123F18 0000BF7B */  lq          $31, 0x0($29)
/* 02401C 00123F1C 1000BD27 */  addiu       $29, $29, 0x10
/* 024020 00123F20 0800E003 */  jr          $31
/* 024024 00123F24 00000000 */   nop
/* 024028 00123F28 00000000 */  nop
/* 02402C 00123F2C 00000000 */  nop
