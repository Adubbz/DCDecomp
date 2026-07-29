.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel _NO_RESET_CHARA_NO__FP12RS_STACKDATAi
/* 0BD540 001BD440 01000224 */  addiu       $2, $0, 0x1
/* 0BD544 001BD444 D501013C */  lui         $1, %hi(BtEventInfo + 0xB0)
/* 0BD548 001BD448 F06722AC */  sw          $2, %lo(BtEventInfo + 0xB0)($1)
/* 0BD54C 001BD44C 0800E003 */  jr          $31
/* 0BD550 001BD450 00000000 */   nop
/* 0BD554 001BD454 00000000 */  nop
/* 0BD558 001BD458 00000000 */  nop
/* 0BD55C 001BD45C 00000000 */  nop
