.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel MGGetVSyncCount__Fv
/* 2C310 0012C210 108C828F */  lw         $2, -0x73F0($gp)
/* 2C314 0012C214 0800E003 */  jr         $31
/* 2C318 0012C218 00000000 */   nop
/* 2C31C 0012C21C 00000000 */  nop
