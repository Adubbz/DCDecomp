.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel _DisableDmac
/* 14190 00114090 17000324 */  addiu      $3, $0, 0x17
/* 14194 00114094 0C000000 */  syscall    0
/* 14198 00114098 0800E003 */  jr         $31
/* 1419C 0011409C 00000000 */   nop
