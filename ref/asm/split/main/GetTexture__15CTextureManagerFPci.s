.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel GetTexture__15CTextureManagerFPci
/* 0313D0 001312D0 E0FFBD27 */  addiu       $29, $29, -0x20
/* 0313D4 001312D4 1000BF7F */  sq          $31, 0x10($29)
/* 0313D8 001312D8 0000B07F */  sq          $16, 0x0($29)
/* 0313DC 001312DC 28868070 */  paddub      $16, $4, $0
/* 0313E0 001312E0 94C4040C */  jal         GetTextureHandle__15CTextureManagerFPci
/* 0313E4 001312E4 00000000 */   nop
/* 0313E8 001312E8 04004104 */  bgez        $2, .L001312FC
/* 0313EC 001312EC 00000000 */   nop
/* 0313F0 001312F0 28160070 */  paddub      $2, $0, $0
/* 0313F4 001312F4 05000010 */  b           .L0013130C
/* 0313F8 001312F8 00000000 */   nop
.L001312FC:
/* 0313FC 001312FC 28260072 */  paddub      $4, $16, $0
/* 031400 00131300 282E4070 */  paddub      $5, $2, $0
/* 031404 00131304 A4C4040C */  jal         GetTexture__15CTextureManagerFi
/* 031408 00131308 00000000 */   nop
.L0013130C:
/* 03140C 0013130C 1000BF7B */  lq          $31, 0x10($29)
/* 031410 00131310 0000B07B */  lq          $16, 0x0($29)
/* 031414 00131314 2000BD27 */  addiu       $29, $29, 0x20
/* 031418 00131318 0800E003 */  jr          $31
/* 03141C 0013131C 00000000 */   nop
