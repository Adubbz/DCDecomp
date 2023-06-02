.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel SetVelocity__5CWindFf
/* 3B5B0 0013B4B0 20008CE4 */  swc1       $f12, 0x20($4)
/* 3B5B4 0013B4B4 0800E003 */  jr         $31
/* 3B5B8 0013B4B8 00000000 */   nop
/* 3B5BC 0013B4BC 00000000 */  nop
