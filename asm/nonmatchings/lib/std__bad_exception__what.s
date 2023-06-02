.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel what__Q23std13bad_exceptionCFv
/* 22E90 00122D90 2A00023C */  lui        $2, %hi(_1039)
/* 22E94 00122D94 0800E003 */  jr         $31
/* 22E98 00122D98 788D4224 */   addiu     $2, $2, %lo(_1039)
/* 22E9C 00122D9C 00000000 */  nop
