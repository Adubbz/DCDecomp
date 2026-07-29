.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel EdGetClock__Fv
/* 078240 00178140 F0FFBD27 */  addiu       $29, $29, -0x10
/* 078244 00178144 0000BF7F */  sq          $31, 0x0($29)
/* 078248 00178148 04918CC7 */  lwc1        $f12, -0x6EFC($28)
/* 07824C 0017814C 54D0050C */  jal         InvertTime__Ff
/* 078250 00178150 00000000 */   nop
/* 078254 00178154 0000BF7B */  lq          $31, 0x0($29)
/* 078258 00178158 1000BD27 */  addiu       $29, $29, 0x10
/* 07825C 0017815C 0800E003 */  jr          $31
/* 078260 00178160 00000000 */   nop
/* 078264 00178164 00000000 */  nop
/* 078268 00178168 00000000 */  nop
/* 07826C 0017816C 00000000 */  nop
