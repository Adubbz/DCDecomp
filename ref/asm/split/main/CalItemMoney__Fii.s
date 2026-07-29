.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel CalItemMoney__Fii
/* 0EB3D0 001EB2D0 F0FFBD27 */  addiu       $29, $29, -0x10
/* 0EB3D4 001EB2D4 0000BF7F */  sq          $31, 0x0($29)
/* 0EB3D8 001EB2D8 51008128 */  slti        $1, $4, 0x51
/* 0EB3DC 001EB2DC 04002010 */  beqz        $1, .L001EB2F0
/* 0EB3E0 001EB2E0 00000000 */   nop
/* 0EB3E4 001EB2E4 28160070 */  paddub      $2, $0, $0
/* 0EB3E8 001EB2E8 05000010 */  b           .L001EB300
/* 0EB3EC 001EB2EC 00000000 */   nop
.L001EB2F0:
/* 0EB3F0 001EB2F0 BC9B070C */  jal         GetItemMoney__Fii
/* 0EB3F4 001EB2F4 00000000 */   nop
/* 0EB3F8 001EB2F8 3C140200 */  dsll32      $2, $2, 16
/* 0EB3FC 001EB2FC 3F140200 */  dsra32      $2, $2, 16
.L001EB300:
/* 0EB400 001EB300 0000BF7B */  lq          $31, 0x0($29)
/* 0EB404 001EB304 1000BD27 */  addiu       $29, $29, 0x10
/* 0EB408 001EB308 0800E003 */  jr          $31
/* 0EB40C 001EB30C 00000000 */   nop
