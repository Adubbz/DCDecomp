.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel CommandFOLLOW__FPPv
/* 3FD80 0013FC80 0000838C */  lw         $3, 0x0($4)
/* 3FD84 0013FC84 000060C4 */  lwc1       $f0, 0x0($3)
/* 3FD88 0013FC88 0C8D838F */  lw         $3, -0x72F4($gp)
/* 3FD8C 0013FC8C D00060E4 */  swc1       $f0, 0xD0($3)
/* 3FD90 0013FC90 0400838C */  lw         $3, 0x4($4)
/* 3FD94 0013FC94 000060C4 */  lwc1       $f0, 0x0($3)
/* 3FD98 0013FC98 0C8D838F */  lw         $3, -0x72F4($gp)
/* 3FD9C 0013FC9C D40060E4 */  swc1       $f0, 0xD4($3)
/* 3FDA0 0013FCA0 0800838C */  lw         $3, 0x8($4)
/* 3FDA4 0013FCA4 000060C4 */  lwc1       $f0, 0x0($3)
/* 3FDA8 0013FCA8 0C8D838F */  lw         $3, -0x72F4($gp)
/* 3FDAC 0013FCAC D80060E4 */  swc1       $f0, 0xD8($3)
/* 3FDB0 0013FCB0 0800E003 */  jr         $31
/* 3FDB4 0013FCB4 00000000 */   nop
/* 3FDB8 0013FCB8 00000000 */  nop
/* 3FDBC 0013FCBC 00000000 */  nop
