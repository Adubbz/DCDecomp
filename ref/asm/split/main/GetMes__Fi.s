.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel GetMes__Fi
/* 08FA90 0018F990 04008004 */  bltz        $4, .L0018F9A4
/* 08FA94 0018F994 00000000 */   nop
/* 08FA98 0018F998 08008228 */  slti        $2, $4, 0x8
/* 08FA9C 0018F99C 04004014 */  bnez        $2, .L0018F9B0
/* 08FAA0 0018F9A0 00000000 */   nop
.L0018F9A4:
/* 08FAA4 0018F9A4 28160070 */  paddub      $2, $0, $0
/* 08FAA8 0018F9A8 07000010 */  b           .L0018F9C8
/* 08FAAC 0018F9AC 00000000 */   nop
.L0018F9B0:
/* 08FAB0 0018F9B0 80180400 */  sll         $3, $4, 2
/* 08FAB4 0018F9B4 D401023C */  lui         $2, %hi(EdEventInfo + 0x200)
/* 08FAB8 0018F9B8 D0D34224 */  addiu       $2, $2, %lo(EdEventInfo + 0x200)
/* 08FABC 0018F9BC 21104300 */  addu        $2, $2, $3
/* 08FAC0 0018F9C0 0000428C */  lw          $2, 0x0($2)
/* 08FAC4 0018F9C4 00000000 */  nop
.L0018F9C8:
/* 08FAC8 0018F9C8 0800E003 */  jr          $31
/* 08FACC 0018F9CC 00000000 */   nop
