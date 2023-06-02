.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel what__Q23std9exceptionCFv
/* 22700 00122600 2A00023C */  lui        $2, %hi(_245)
/* 22704 00122604 0800E003 */  jr         $31
/* 22708 00122608 C88C4224 */   addiu     $2, $2, %lo(_245)
/* 2270C 0012260C 00000000 */  nop
