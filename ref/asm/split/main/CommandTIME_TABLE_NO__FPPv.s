.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel CommandTIME_TABLE_NO__FPPv
/* 076EF0 00176DF0 0000838C */  lw          $3, 0x0($4)
/* 076EF4 00176DF4 0000648C */  lw          $4, 0x0($3)
/* 076EF8 00176DF8 04008004 */  bltz        $4, .L00176E0C
/* 076EFC 00176DFC 00000000 */   nop
/* 076F00 00176E00 07008328 */  slti        $3, $4, 0x7
/* 076F04 00176E04 02006014 */  bnez        $3, .L00176E10
/* 076F08 00176E08 00000000 */   nop
.L00176E0C:
/* 076F0C 00176E0C 28260070 */  paddub      $4, $0, $0
.L00176E10:
/* 076F10 00176E10 F48F84AF */  sw          $4, -0x700C($28)
/* 076F14 00176E14 0800E003 */  jr          $31
/* 076F18 00176E18 00000000 */   nop
/* 076F1C 00176E1C 00000000 */  nop
