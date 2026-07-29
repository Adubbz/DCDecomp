.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel _COS_DEG__FP12RS_STACKDATAi
/* 0E33C0 001E32C0 E0FFBD27 */  addiu       $29, $29, -0x20
/* 0E33C4 001E32C4 1000BF7F */  sq          $31, 0x10($29)
/* 0E33C8 001E32C8 0000B07F */  sq          $16, 0x0($29)
/* 0E33CC 001E32CC 08009024 */  addiu       $16, $4, 0x8
/* 0E33D0 001E32D0 A485070C */  jal         GetStackFloat__FP12RS_STACKDATA__3
/* 0E33D4 001E32D4 00000000 */   nop
/* 0E33D8 001E32D8 788181C7 */  lwc1        $f1, -0x7E88($28)
/* 0E33DC 001E32DC 02080046 */  mul.s       $f0, $f1, $f0
/* 0E33E0 001E32E0 06030046 */  mov.s       $f12, $f0
/* 0E33E4 001E32E4 AC75040C */  jal         cosf
/* 0E33E8 001E32E8 00000000 */   nop
/* 0E33EC 001E32EC 28260072 */  paddub      $4, $16, $0
/* 0E33F0 001E32F0 06030046 */  mov.s       $f12, $f0
/* 0E33F4 001E32F4 BC85070C */  jal         SetStack__FP12RS_STACKDATAf__3
/* 0E33F8 001E32F8 00000000 */   nop
/* 0E33FC 001E32FC 01000224 */  addiu       $2, $0, 0x1
/* 0E3400 001E3300 1000BF7B */  lq          $31, 0x10($29)
/* 0E3404 001E3304 0000B07B */  lq          $16, 0x0($29)
/* 0E3408 001E3308 2000BD27 */  addiu       $29, $29, 0x20
/* 0E340C 001E330C 0800E003 */  jr          $31
/* 0E3410 001E3310 00000000 */   nop
/* 0E3414 001E3314 00000000 */  nop
/* 0E3418 001E3318 00000000 */  nop
/* 0E341C 001E331C 00000000 */  nop
