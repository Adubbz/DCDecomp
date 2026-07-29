.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel _GET_ACTION_MODE__FP12RS_STACKDATAi
/* 0BBBA0 001BBAA0 F0FFBD27 */  addiu       $29, $29, -0x10
/* 0BBBA4 001BBAA4 0000BF7F */  sq          $31, 0x0($29)
/* 0BBBA8 001BBAA8 D501013C */  lui         $1, %hi(BtEventInfo + 0x24)
/* 0BBBAC 001BBAAC 6467258C */  lw          $5, %lo(BtEventInfo + 0x24)($1)
/* 0BBBB0 001BBAB0 70EE060C */  jal         SetStack__FP12RS_STACKDATAi__2
/* 0BBBB4 001BBAB4 00000000 */   nop
/* 0BBBB8 001BBAB8 01000224 */  addiu       $2, $0, 0x1
/* 0BBBBC 001BBABC 0000BF7B */  lq          $31, 0x0($29)
/* 0BBBC0 001BBAC0 1000BD27 */  addiu       $29, $29, 0x10
/* 0BBBC4 001BBAC4 0800E003 */  jr          $31
/* 0BBBC8 001BBAC8 00000000 */   nop
/* 0BBBCC 001BBACC 00000000 */  nop
