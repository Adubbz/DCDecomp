.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel GetAlt_i__9CEditAreaFfff
/* 06DF40 0016DE40 D0FFBD27 */  addiu       $29, $29, -0x30
/* 06DF44 0016DE44 1000BF7F */  sq          $31, 0x10($29)
/* 06DF48 0016DE48 0000B07F */  sq          $16, 0x0($29)
/* 06DF4C 0016DE4C 28868070 */  paddub      $16, $4, $0
/* 06DF50 0016DE50 2000A527 */  addiu       $5, $29, 0x20
/* 06DF54 0016DE54 20B6050C */  jal         GetPos__9CEditAreaFP11CVector3_i_fff
/* 06DF58 0016DE58 00000000 */   nop
/* 06DF5C 0016DE5C 28260072 */  paddub      $4, $16, $0
/* 06DF60 0016DE60 2000A58F */  lw          $5, 0x20($29)
/* 06DF64 0016DE64 2800A68F */  lw          $6, 0x28($29)
/* 06DF68 0016DE68 38B7050C */  jal         GetAlt_i__9CEditAreaFii
/* 06DF6C 0016DE6C 00000000 */   nop
/* 06DF70 0016DE70 1000BF7B */  lq          $31, 0x10($29)
/* 06DF74 0016DE74 0000B07B */  lq          $16, 0x0($29)
/* 06DF78 0016DE78 3000BD27 */  addiu       $29, $29, 0x30
/* 06DF7C 0016DE7C 0800E003 */  jr          $31
/* 06DF80 0016DE80 00000000 */   nop
/* 06DF84 0016DE84 00000000 */  nop
/* 06DF88 0016DE88 00000000 */  nop
/* 06DF8C 0016DE8C 00000000 */  nop
