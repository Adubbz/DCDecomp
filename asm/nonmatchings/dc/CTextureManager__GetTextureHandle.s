.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel GetTextureHandle__15CTextureManagerFPci
/* 31350 00131250 F0FFBD27 */  addiu      $sp, $sp, -0x10
/* 31354 00131254 0000BF7F */  sq         $31, 0x0($sp)
/* 31358 00131258 60C4040C */  jal        SearchTextureName__15CTextureManagerFPci
/* 3135C 0013125C 00000000 */   nop
/* 31360 00131260 04004104 */  bgez       $2, .L00131274
/* 31364 00131264 00000000 */   nop
/* 31368 00131268 FFFF0224 */  addiu      $2, $0, -0x1
/* 3136C 0013126C 01000010 */  b          .L00131274
/* 31370 00131270 00000000 */   nop
.L00131274:
/* 31374 00131274 0000BF7B */  lq         $31, 0x0($sp)
/* 31378 00131278 1000BD27 */  addiu      $sp, $sp, 0x10
/* 3137C 0013127C 0800E003 */  jr         $31
/* 31380 00131280 00000000 */   nop
/* 31384 00131284 00000000 */  nop
/* 31388 00131288 00000000 */  nop
/* 3138C 0013128C 00000000 */  nop
