.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel CommandFOLLOW__FPPv
/* 03FD80 0013FC80 0000838C */  lw          $3, 0x0($4)
/* 03FD84 0013FC84 000060C4 */  lwc1        $f0, 0x0($3)
/* 03FD88 0013FC88 0C8D838F */  lw          $3, -0x72F4($28)
/* 03FD8C 0013FC8C D00060E4 */  swc1        $f0, 0xD0($3)
/* 03FD90 0013FC90 0400838C */  lw          $3, 0x4($4)
/* 03FD94 0013FC94 000060C4 */  lwc1        $f0, 0x0($3)
/* 03FD98 0013FC98 0C8D838F */  lw          $3, -0x72F4($28)
/* 03FD9C 0013FC9C D40060E4 */  swc1        $f0, 0xD4($3)
/* 03FDA0 0013FCA0 0800838C */  lw          $3, 0x8($4)
/* 03FDA4 0013FCA4 000060C4 */  lwc1        $f0, 0x0($3)
/* 03FDA8 0013FCA8 0C8D838F */  lw          $3, -0x72F4($28)
/* 03FDAC 0013FCAC D80060E4 */  swc1        $f0, 0xD8($3)
/* 03FDB0 0013FCB0 0800E003 */  jr          $31
/* 03FDB4 0013FCB4 00000000 */   nop
/* 03FDB8 0013FCB8 00000000 */  nop
/* 03FDBC 0013FCBC 00000000 */  nop
