.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel CommandNORMAL__FPPv
/* 3FD60 0013FC60 0000838C */  lw         $3, 0x0($4)
/* 3FD64 0013FC64 000060C4 */  lwc1       $f0, 0x0($3)
/* 3FD68 0013FC68 0C8D838F */  lw         $3, -0x72F4($gp)
/* 3FD6C 0013FC6C 580060E4 */  swc1       $f0, 0x58($3)
/* 3FD70 0013FC70 0800E003 */  jr         $31
/* 3FD74 0013FC74 00000000 */   nop
/* 3FD78 0013FC78 00000000 */  nop
/* 3FD7C 0013FC7C 00000000 */  nop
