.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel EdLimitShadowLight__FPA4_ff
/* 088050 00187F50 100080C4 */  lwc1        $f0, 0x10($4)
/* 088054 00187F54 42000C46 */  mul.s       $f1, $f0, $f12
/* 088058 00187F58 100081E4 */  swc1        $f1, 0x10($4)
/* 08805C 00187F5C 803F033C */  lui         $3, (0x3F800000 >> 16)
/* 088060 00187F60 00008344 */  mtc1        $3, $f0
/* 088064 00187F64 00000000 */  nop
/* 088068 00187F68 34080046 */  c.lt.s      $f1, $f0
/* 08806C 00187F6C 00000000 */  nop
/* 088070 00187F70 02000045 */  bc1f        .L00187F7C
/* 088074 00187F74 00000000 */   nop
/* 088078 00187F78 100083AC */  sw          $3, 0x10($4)
.L00187F7C:
/* 08807C 00187F7C 0800E003 */  jr          $31
/* 088080 00187F80 00000000 */   nop
/* 088084 00187F84 00000000 */  nop
/* 088088 00187F88 00000000 */  nop
/* 08808C 00187F8C 00000000 */  nop
