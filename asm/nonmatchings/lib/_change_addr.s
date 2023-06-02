.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel _change_addr
/* 16608 00116508 1000828C */  lw         $2, 0x10($4)
/* 1660C 0011650C 0800E003 */  jr         $31
/* 16610 00116510 0800A2AC */   sw        $2, 0x8($5)
/* 16614 00116514 00000000 */  nop
