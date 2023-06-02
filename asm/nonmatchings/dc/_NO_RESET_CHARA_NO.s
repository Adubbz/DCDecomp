.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel _NO_RESET_CHARA_NO__FP12RS_STACKDATAi
/* BD540 001BD440 01000224 */  addiu      $2, $0, 0x1
/* BD544 001BD444 D501013C */  lui        $at, (0x1D567F0 >> 16)
/* BD548 001BD448 F06722AC */  sw         $2, (0x1D567F0 & 0xFFFF)($at)
/* BD54C 001BD44C 0800E003 */  jr         $31
/* BD550 001BD450 00000000 */   nop
/* BD554 001BD454 00000000 */  nop
/* BD558 001BD458 00000000 */  nop
/* BD55C 001BD45C 00000000 */  nop
