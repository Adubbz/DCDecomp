.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel SearchPartsExtra__9CEditAreaFfff
/* 06ED40 0016EC40 D0FFBD27 */  addiu       $29, $29, -0x30
/* 06ED44 0016EC44 1000BF7F */  sq          $31, 0x10($29)
/* 06ED48 0016EC48 0000B07F */  sq          $16, 0x0($29)
/* 06ED4C 0016EC4C 28868070 */  paddub      $16, $4, $0
/* 06ED50 0016EC50 2000A527 */  addiu       $5, $29, 0x20
/* 06ED54 0016EC54 20B6050C */  jal         GetPos__9CEditAreaFP11CVector3_i_fff
/* 06ED58 0016EC58 00000000 */   nop
/* 06ED5C 0016EC5C 28260072 */  paddub      $4, $16, $0
/* 06ED60 0016EC60 2000A58F */  lw          $5, 0x20($29)
/* 06ED64 0016EC64 2800A68F */  lw          $6, 0x28($29)
/* 06ED68 0016EC68 A4B7050C */  jal         GetPartsExtra__9CEditAreaFii
/* 06ED6C 0016EC6C 00000000 */   nop
/* 06ED70 0016EC70 1000BF7B */  lq          $31, 0x10($29)
/* 06ED74 0016EC74 0000B07B */  lq          $16, 0x0($29)
/* 06ED78 0016EC78 3000BD27 */  addiu       $29, $29, 0x30
/* 06ED7C 0016EC7C 0800E003 */  jr          $31
/* 06ED80 0016EC80 00000000 */   nop
/* 06ED84 0016EC84 00000000 */  nop
/* 06ED88 0016EC88 00000000 */  nop
/* 06ED8C 0016EC8C 00000000 */  nop
