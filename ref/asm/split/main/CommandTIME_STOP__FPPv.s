.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel CommandTIME_STOP__FPPv
/* 076FD0 00176ED0 01000424 */  addiu       $4, $0, 0x1
/* 076FD4 00176ED4 C08F838F */  lw          $3, -0x7040($28)
/* 076FD8 00176ED8 400064AC */  sw          $4, 0x40($3)
/* 076FDC 00176EDC 0800E003 */  jr          $31
/* 076FE0 00176EE0 00000000 */   nop
/* 076FE4 00176EE4 00000000 */  nop
/* 076FE8 00176EE8 00000000 */  nop
/* 076FEC 00176EEC 00000000 */  nop
