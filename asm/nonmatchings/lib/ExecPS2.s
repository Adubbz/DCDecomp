.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel ExecPS2
/* 14070 00113F70 07000324 */  addiu      $3, $0, 0x7
/* 14074 00113F74 0C000000 */  syscall    0
/* 14078 00113F78 0800E003 */  jr         $31
/* 1407C 00113F7C 00000000 */   nop
