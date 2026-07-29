.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel _ALL_DRAW_FLAG__FP12RS_STACKDATAi
/* 0BD0A0 001BCFA0 F0FFBD27 */  addiu       $29, $29, -0x10
/* 0BD0A4 001BCFA4 0000BF7F */  sq          $31, 0x0($29)
/* 0BD0A8 001BCFA8 01000224 */  addiu       $2, $0, 0x1
/* 0BD0AC 001BCFAC 0400A214 */  bne         $5, $2, .L001BCFC0
/* 0BD0B0 001BCFB0 00000000 */   nop
/* 0BD0B4 001BCFB4 4CEE060C */  jal         GetStackInt__FP12RS_STACKDATA__2
/* 0BD0B8 001BCFB8 00000000 */   nop
/* 0BD0BC 001BCFBC 709D82AF */  sw          $2, -0x6290($28)
.L001BCFC0:
/* 0BD0C0 001BCFC0 01000224 */  addiu       $2, $0, 0x1
/* 0BD0C4 001BCFC4 0000BF7B */  lq          $31, 0x0($29)
/* 0BD0C8 001BCFC8 1000BD27 */  addiu       $29, $29, 0x10
/* 0BD0CC 001BCFCC 0800E003 */  jr          $31
/* 0BD0D0 001BCFD0 00000000 */   nop
/* 0BD0D4 001BCFD4 00000000 */  nop
/* 0BD0D8 001BCFD8 00000000 */  nop
/* 0BD0DC 001BCFDC 00000000 */  nop
