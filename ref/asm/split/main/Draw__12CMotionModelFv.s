.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel Draw__12CMotionModelFv
/* 0B6E40 001B6D40 F0FFBD27 */  addiu       $29, $29, -0x10
/* 0B6E44 001B6D44 0000BF7F */  sq          $31, 0x0($29)
/* 0B6E48 001B6D48 0000848C */  lw          $4, 0x0($4)
/* 0B6E4C 001B6D4C 03008010 */  beqz        $4, .L001B6D5C
/* 0B6E50 001B6D50 00000000 */   nop
/* 0B6E54 001B6D54 60BB040C */  jal         MGDraw__FP6CFrame
/* 0B6E58 001B6D58 00000000 */   nop
.L001B6D5C:
/* 0B6E5C 001B6D5C 0000BF7B */  lq          $31, 0x0($29)
/* 0B6E60 001B6D60 1000BD27 */  addiu       $29, $29, 0x10
/* 0B6E64 001B6D64 0800E003 */  jr          $31
/* 0B6E68 001B6D68 00000000 */   nop
/* 0B6E6C 001B6D6C 00000000 */  nop
