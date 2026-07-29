.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel EdAmbientPlay__Ff
/* 0716D0 001715D0 F0FFBD27 */  addiu       $29, $29, -0x10
/* 0716D4 001715D4 0000BF7F */  sq          $31, 0x0($29)
/* 0716D8 001715D8 981F060C */  jal         EdGetTime__Ff
/* 0716DC 001715DC 00000000 */   nop
/* 0716E0 001715E0 01004224 */  addiu       $2, $2, 0x1
/* 0716E4 001715E4 04004328 */  slti        $3, $2, 0x4
/* 0716E8 001715E8 02006014 */  bnez        $3, .L001715F4
/* 0716EC 001715EC 00000000 */   nop
/* 0716F0 001715F0 28160070 */  paddub      $2, $0, $0
.L001715F4:
/* 0716F4 001715F4 28264070 */  paddub      $4, $2, $0
/* 0716F8 001715F8 446C050C */  jal         SndAmbientPlay__Fi
/* 0716FC 001715FC 00000000 */   nop
/* 071700 00171600 0000BF7B */  lq          $31, 0x0($29)
/* 071704 00171604 1000BD27 */  addiu       $29, $29, 0x10
/* 071708 00171608 0800E003 */  jr          $31
/* 07170C 0017160C 00000000 */   nop
