.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel EdLimitShadowLight__FPA4_ff
/* 88050 00187F50 100080C4 */  lwc1       $f0, 0x10($4)
/* 88054 00187F54 42000C46 */  mul.s      $f1, $f0, $f12
/* 88058 00187F58 100081E4 */  swc1       $f1, 0x10($4)
/* 8805C 00187F5C 803F033C */  lui        $3, (0x3F800000 >> 16)
/* 88060 00187F60 00008344 */  mtc1       $3, $f0
/* 88064 00187F64 00000000 */  nop
/* 88068 00187F68 34080046 */  c.lt.s     $f1, $f0
/* 8806C 00187F6C 00000000 */  nop
/* 88070 00187F70 02000045 */  bc1f       .L00187F7C
/* 88074 00187F74 00000000 */   nop
/* 88078 00187F78 100083AC */  sw         $3, 0x10($4)
.L00187F7C:
/* 8807C 00187F7C 0800E003 */  jr         $31
/* 88080 00187F80 00000000 */   nop
/* 88084 00187F84 00000000 */  nop
/* 88088 00187F88 00000000 */  nop
/* 8808C 00187F8C 00000000 */  nop
