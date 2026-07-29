.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel __ct__13CTextureBlockFv
/* 031060 00130F60 E0FFBD27 */  addiu       $29, $29, -0x20
/* 031064 00130F64 1000BF7F */  sq          $31, 0x10($29)
/* 031068 00130F68 0000B07F */  sq          $16, 0x0($29)
/* 03106C 00130F6C 28868070 */  paddub      $16, $4, $0
/* 031070 00130F70 E4C3040C */  jal         Initialize__13CTextureBlockFv
/* 031074 00130F74 00000000 */   nop
/* 031078 00130F78 28160072 */  paddub      $2, $16, $0
/* 03107C 00130F7C 1000BF7B */  lq          $31, 0x10($29)
/* 031080 00130F80 0000B07B */  lq          $16, 0x0($29)
/* 031084 00130F84 2000BD27 */  addiu       $29, $29, 0x20
/* 031088 00130F88 0800E003 */  jr          $31
/* 03108C 00130F8C 00000000 */   nop
