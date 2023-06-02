.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel ExitDeleteThread
/* 14260 00114160 24000324 */  addiu      $3, $0, 0x24
/* 14264 00114164 0C000000 */  syscall    0
/* 14268 00114168 0800E003 */  jr         $31
/* 1426C 0011416C 00000000 */   nop
