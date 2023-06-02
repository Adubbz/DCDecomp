.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel iReferThreadStatus
/* 14330 00114230 CFFF0324 */  addiu      $3, $0, -0x31
/* 14334 00114234 0C000000 */  syscall    0
/* 14338 00114238 0800E003 */  jr         $31
/* 1433C 0011423C 00000000 */   nop
