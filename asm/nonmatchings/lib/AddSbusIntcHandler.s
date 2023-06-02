.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel AddSbusIntcHandler
/* 140A0 00113FA0 0A000324 */  addiu      $3, $0, 0xA
/* 140A4 00113FA4 0C000000 */  syscall    0
/* 140A8 00113FA8 0800E003 */  jr         $31
/* 140AC 00113FAC 00000000 */   nop
