.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel CheckSeq__12CNPCharacterFv
/* 056550 00156450 B411838C */  lw          $3, 0x11B4($4)
/* 056554 00156454 B811828C */  lw          $2, 0x11B8($4)
/* 056558 00156458 26106200 */  xor         $2, $3, $2
/* 05655C 0015645C 2B100200 */  sltu        $2, $0, $2
/* 056560 00156460 0800E003 */  jr          $31
/* 056564 00156464 00000000 */   nop
/* 056568 00156468 00000000 */  nop
/* 05656C 0015646C 00000000 */  nop
