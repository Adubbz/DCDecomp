.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel Stay__13CCameraFollowFv
/* 024B50 00124A50 E0FFBD27 */  addiu       $29, $29, -0x20
/* 024B54 00124A54 1000BF7F */  sq          $31, 0x10($29)
/* 024B58 00124A58 0000B07F */  sq          $16, 0x0($29)
/* 024B5C 00124A5C 28868070 */  paddub      $16, $4, $0
/* 024B60 00124A60 8490040C */  jal         Stay__7CCameraFv
/* 024B64 00124A64 00000000 */   nop
/* 024B68 00124A68 E002038E */  lw          $3, 0x2E0($16)
/* 024B6C 00124A6C 07006010 */  beqz        $3, .L00124A8C
/* 024B70 00124A70 00000000 */   nop
/* 024B74 00124A74 C0020426 */  addiu       $4, $16, 0x2C0
/* 024B78 00124A78 90020526 */  addiu       $5, $16, 0x290
/* 024B7C 00124A7C 0C86040C */  jal         sceVu0CopyVector
/* 024B80 00124A80 00000000 */   nop
/* 024B84 00124A84 DC0200C6 */  lwc1        $f0, 0x2DC($16)
/* 024B88 00124A88 D80200E6 */  swc1        $f0, 0x2D8($16)
.L00124A8C:
/* 024B8C 00124A8C 1000BF7B */  lq          $31, 0x10($29)
/* 024B90 00124A90 0000B07B */  lq          $16, 0x0($29)
/* 024B94 00124A94 2000BD27 */  addiu       $29, $29, 0x20
/* 024B98 00124A98 0800E003 */  jr          $31
/* 024B9C 00124A9C 00000000 */   nop
