.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel sceGsGetGParam
/* 124C0 001123C0 2500023C */  lui        $2, %hi(gp.6)
/* 124C4 001123C4 0800E003 */  jr         $31
/* 124C8 001123C8 90094224 */   addiu     $2, $2, %lo(gp.6)
/* 124CC 001123CC 00000000 */  nop
