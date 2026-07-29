.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel SkipSpace__FR9input_str__3
/* 05FE30 0015FD30 C0FFBD27 */  addiu       $29, $29, -0x40
/* 05FE34 0015FD34 3000BF7F */  sq          $31, 0x30($29)
/* 05FE38 0015FD38 2000B27F */  sq          $18, 0x20($29)
/* 05FE3C 0015FD3C 1000B17F */  sq          $17, 0x10($29)
/* 05FE40 0015FD40 0000B07F */  sq          $16, 0x0($29)
/* 05FE44 0015FD44 28968070 */  paddub      $18, $4, $0
/* 05FE48 0015FD48 0000908C */  lw          $16, 0x0($4)
/* 05FE4C 0015FD4C 0800918C */  lw          $17, 0x8($4)
/* 05FE50 0015FD50 08000010 */  b           .L0015FD74
/* 05FE54 0015FD54 00000000 */   nop
.L0015FD58:
/* 05FE58 0015FD58 21101102 */  addu        $2, $16, $17
/* 05FE5C 0015FD5C 00004480 */  lb          $4, 0x0($2)
/* 05FE60 0015FD60 747F050C */  jal         CheckChar__Fc__3
/* 05FE64 0015FD64 00000000 */   nop
/* 05FE68 0015FD68 06004014 */  bnez        $2, .L0015FD84
/* 05FE6C 0015FD6C 00000000 */   nop
/* 05FE70 0015FD70 01003126 */  addiu       $17, $17, 0x1
.L0015FD74:
/* 05FE74 0015FD74 0400428E */  lw          $2, 0x4($18)
/* 05FE78 0015FD78 2A102202 */  slt         $2, $17, $2
/* 05FE7C 0015FD7C F6FF4014 */  bnez        $2, .L0015FD58
/* 05FE80 0015FD80 00000000 */   nop
.L0015FD84:
/* 05FE84 0015FD84 080051AE */  sw          $17, 0x8($18)
/* 05FE88 0015FD88 0400428E */  lw          $2, 0x4($18)
/* 05FE8C 0015FD8C 2A102202 */  slt         $2, $17, $2
/* 05FE90 0015FD90 04004014 */  bnez        $2, .L0015FDA4
/* 05FE94 0015FD94 00000000 */   nop
/* 05FE98 0015FD98 28160070 */  paddub      $2, $0, $0
/* 05FE9C 0015FD9C 02000010 */  b           .L0015FDA8
/* 05FEA0 0015FDA0 00000000 */   nop
.L0015FDA4:
/* 05FEA4 0015FDA4 01000224 */  addiu       $2, $0, 0x1
.L0015FDA8:
/* 05FEA8 0015FDA8 3000BF7B */  lq          $31, 0x30($29)
/* 05FEAC 0015FDAC 2000B27B */  lq          $18, 0x20($29)
/* 05FEB0 0015FDB0 1000B17B */  lq          $17, 0x10($29)
/* 05FEB4 0015FDB4 0000B07B */  lq          $16, 0x0($29)
/* 05FEB8 0015FDB8 4000BD27 */  addiu       $29, $29, 0x40
/* 05FEBC 0015FDBC 0800E003 */  jr          $31
/* 05FEC0 0015FDC0 00000000 */   nop
/* 05FEC4 0015FDC4 00000000 */  nop
/* 05FEC8 0015FDC8 00000000 */  nop
/* 05FECC 0015FDCC 00000000 */  nop
