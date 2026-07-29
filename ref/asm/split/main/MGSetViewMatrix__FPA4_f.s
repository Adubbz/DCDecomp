.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel MGSetViewMatrix__FPA4_f
/* 02E070 0012DF70 F0FFBD27 */  addiu       $29, $29, -0x10
/* 02E074 0012DF74 0000BF7F */  sq          $31, 0x0($29)
/* 02E078 0012DF78 803F023C */  lui         $2, (0x3F800000 >> 16)
/* 02E07C 0012DF7C 00608244 */  mtc1        $2, $f12
/* 02E080 0012DF80 5C818DC7 */  lwc1        $f13, -0x7EA4($28)
/* 02E084 0012DF84 58B7040C */  jal         MGSetViewMatrix_sub__FPA4_fff
/* 02E088 0012DF88 00000000 */   nop
/* 02E08C 0012DF8C 0000BF7B */  lq          $31, 0x0($29)
/* 02E090 0012DF90 1000BD27 */  addiu       $29, $29, 0x10
/* 02E094 0012DF94 0800E003 */  jr          $31
/* 02E098 0012DF98 00000000 */   nop
/* 02E09C 0012DF9C 00000000 */  nop
