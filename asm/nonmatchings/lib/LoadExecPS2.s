.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel LoadExecPS2
/* 14060 00113F60 06000324 */  addiu      $3, $0, 0x6
/* 14064 00113F64 0C000000 */  syscall    0
/* 14068 00113F68 0800E003 */  jr         $31
/* 1406C 00113F6C 00000000 */   nop
