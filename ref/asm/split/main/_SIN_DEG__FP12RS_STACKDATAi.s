.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel _SIN_DEG__FP12RS_STACKDATAi
/* 0E3360 001E3260 E0FFBD27 */  addiu       $29, $29, -0x20
/* 0E3364 001E3264 1000BF7F */  sq          $31, 0x10($29)
/* 0E3368 001E3268 0000B07F */  sq          $16, 0x0($29)
/* 0E336C 001E326C 08009024 */  addiu       $16, $4, 0x8
/* 0E3370 001E3270 A485070C */  jal         GetStackFloat__FP12RS_STACKDATA__3
/* 0E3374 001E3274 00000000 */   nop
/* 0E3378 001E3278 788181C7 */  lwc1        $f1, -0x7E88($28)
/* 0E337C 001E327C 02080046 */  mul.s       $f0, $f1, $f0
/* 0E3380 001E3280 06030046 */  mov.s       $f12, $f0
/* 0E3384 001E3284 2876040C */  jal         sinf
/* 0E3388 001E3288 00000000 */   nop
/* 0E338C 001E328C 28260072 */  paddub      $4, $16, $0
/* 0E3390 001E3290 06030046 */  mov.s       $f12, $f0
/* 0E3394 001E3294 BC85070C */  jal         SetStack__FP12RS_STACKDATAf__3
/* 0E3398 001E3298 00000000 */   nop
/* 0E339C 001E329C 01000224 */  addiu       $2, $0, 0x1
/* 0E33A0 001E32A0 1000BF7B */  lq          $31, 0x10($29)
/* 0E33A4 001E32A4 0000B07B */  lq          $16, 0x0($29)
/* 0E33A8 001E32A8 2000BD27 */  addiu       $29, $29, 0x20
/* 0E33AC 001E32AC 0800E003 */  jr          $31
/* 0E33B0 001E32B0 00000000 */   nop
/* 0E33B4 001E32B4 00000000 */  nop
/* 0E33B8 001E32B8 00000000 */  nop
/* 0E33BC 001E32BC 00000000 */  nop
