.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel GetTexture__15CTextureManagerFPci
/* 313D0 001312D0 E0FFBD27 */  addiu      $sp, $sp, -0x20
/* 313D4 001312D4 1000BF7F */  sq         $31, 0x10($sp)
/* 313D8 001312D8 0000B07F */  sq         $16, 0x0($sp)
/* 313DC 001312DC 28868070 */  paddub     $16, $4, $0
/* 313E0 001312E0 94C4040C */  jal        GetTextureHandle__15CTextureManagerFPci
/* 313E4 001312E4 00000000 */   nop
/* 313E8 001312E8 04004104 */  bgez       $2, .L001312FC
/* 313EC 001312EC 00000000 */   nop
/* 313F0 001312F0 28160070 */  paddub     $2, $0, $0
/* 313F4 001312F4 05000010 */  b          .L0013130C
/* 313F8 001312F8 00000000 */   nop
.L001312FC:
/* 313FC 001312FC 28260072 */  paddub     $4, $16, $0
/* 31400 00131300 282E4070 */  paddub     $5, $2, $0
/* 31404 00131304 A4C4040C */  jal        GetTexture__15CTextureManagerFi
/* 31408 00131308 00000000 */   nop
.L0013130C:
/* 3140C 0013130C 1000BF7B */  lq         $31, 0x10($sp)
/* 31410 00131310 0000B07B */  lq         $16, 0x0($sp)
/* 31414 00131314 2000BD27 */  addiu      $sp, $sp, 0x20
/* 31418 00131318 0800E003 */  jr         $31
/* 3141C 0013131C 00000000 */   nop
