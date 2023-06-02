.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel _ReleaseAlarm
/* 141B0 001140B0 19000324 */  addiu      $3, $0, 0x19
/* 141B4 001140B4 0C000000 */  syscall    0
/* 141B8 001140B8 0800E003 */  jr         $31
/* 141BC 001140BC 00000000 */   nop
