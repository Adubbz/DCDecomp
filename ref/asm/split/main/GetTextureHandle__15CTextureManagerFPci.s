.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel GetTextureHandle__15CTextureManagerFPci
/* 031350 00131250 F0FFBD27 */  addiu       $29, $29, -0x10
/* 031354 00131254 0000BF7F */  sq          $31, 0x0($29)
/* 031358 00131258 60C4040C */  jal         SearchTextureName__15CTextureManagerFPci
/* 03135C 0013125C 00000000 */   nop
/* 031360 00131260 04004104 */  bgez        $2, .L00131274
/* 031364 00131264 00000000 */   nop
/* 031368 00131268 FFFF0224 */  addiu       $2, $0, -0x1
/* 03136C 0013126C 01000010 */  b           .L00131274
/* 031370 00131270 00000000 */   nop
.L00131274:
/* 031374 00131274 0000BF7B */  lq          $31, 0x0($29)
/* 031378 00131278 1000BD27 */  addiu       $29, $29, 0x10
/* 03137C 0013127C 0800E003 */  jr          $31
/* 031380 00131280 00000000 */   nop
/* 031384 00131284 00000000 */  nop
/* 031388 00131288 00000000 */  nop
/* 03138C 0013128C 00000000 */  nop
