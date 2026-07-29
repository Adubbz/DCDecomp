.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel GetNextSeq__10CActionSeqFv
/* 054D20 00154C20 C800828C */  lw          $2, 0xC8($4)
/* 054D24 00154C24 282E0070 */  paddub      $5, $0, $0
/* 054D28 00154C28 09000010 */  b           .L00154C50
/* 054D2C 00154C2C 00000000 */   nop
.L00154C30:
/* 054D30 00154C30 0000438C */  lw          $3, 0x0($2)
/* 054D34 00154C34 04006014 */  bnez        $3, .L00154C48
/* 054D38 00154C38 00000000 */   nop
/* 054D3C 00154C3C 0C0040AC */  sw          $0, 0xC($2)
/* 054D40 00154C40 08000010 */  b           .L00154C64
/* 054D44 00154C44 00000000 */   nop
.L00154C48:
/* 054D48 00154C48 0100A524 */  addiu       $5, $5, 0x1
/* 054D4C 00154C4C 20004224 */  addiu       $2, $2, 0x20
.L00154C50:
/* 054D50 00154C50 C400838C */  lw          $3, 0xC4($4)
/* 054D54 00154C54 2A18A300 */  slt         $3, $5, $3
/* 054D58 00154C58 F5FF6014 */  bnez        $3, .L00154C30
/* 054D5C 00154C5C 00000000 */   nop
/* 054D60 00154C60 28160070 */  paddub      $2, $0, $0
.L00154C64:
/* 054D64 00154C64 0800E003 */  jr          $31
/* 054D68 00154C68 00000000 */   nop
/* 054D6C 00154C6C 00000000 */  nop
