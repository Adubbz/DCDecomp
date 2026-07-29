.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel PersonalBoardKey__Fv
/* 12F060 0022EF60 F0FFBD27 */  addiu       $29, $29, -0x10
/* 12F064 0022EF64 0000BF7F */  sq          $31, 0x0($29)
/* 12F068 0022EF68 6CBA080C */  jal         BoardModeChangeKey__Fv
/* 12F06C 0022EF6C 00000000 */   nop
/* 12F070 0022EF70 B8BA080C */  jal         PersonalBoardLimmitCheck__Fv
/* 12F074 0022EF74 00000000 */   nop
/* 12F078 0022EF78 20BB080C */  jal         PersonalBoardKeySub__Fv
/* 12F07C 0022EF7C 00000000 */   nop
/* 12F080 0022EF80 0000BF7B */  lq          $31, 0x0($29)
/* 12F084 0022EF84 1000BD27 */  addiu       $29, $29, 0x10
/* 12F088 0022EF88 0800E003 */  jr          $31
/* 12F08C 0022EF8C 00000000 */   nop
