.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel CommandNORMAL__FPPv
/* 03FD60 0013FC60 0000838C */  lw          $3, 0x0($4)
/* 03FD64 0013FC64 000060C4 */  lwc1        $f0, 0x0($3)
/* 03FD68 0013FC68 0C8D838F */  lw          $3, -0x72F4($28)
/* 03FD6C 0013FC6C 580060E4 */  swc1        $f0, 0x58($3)
/* 03FD70 0013FC70 0800E003 */  jr          $31
/* 03FD74 0013FC74 00000000 */   nop
/* 03FD78 0013FC78 00000000 */  nop
/* 03FD7C 0013FC7C 00000000 */  nop
