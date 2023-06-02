.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel RemoveSbusIntcHandler
/* 140B0 00113FB0 0B000324 */  addiu      $3, $0, 0xB
/* 140B4 00113FB4 0C000000 */  syscall    0
/* 140B8 00113FB8 0800E003 */  jr         $31
/* 140BC 00113FBC 00000000 */   nop
