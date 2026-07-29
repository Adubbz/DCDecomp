.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel _INIT_FISH__FP12RS_STACKDATAi
/* 096D00 00196C00 D0FFBD27 */  addiu       $29, $29, -0x30
/* 096D04 00196C04 0000BF7F */  sq          $31, 0x0($29)
/* 096D08 00196C08 08008524 */  addiu       $5, $4, 0x8
/* 096D0C 00196C0C E828060C */  jal         GetStackFloat__FP12RS_STACKDATA
/* 096D10 00196C10 00000000 */   nop
/* 096D14 00196C14 2000A0E7 */  swc1        $f0, 0x20($29)
/* 096D18 00196C18 2400A327 */  addiu       $3, $29, 0x24
/* 096D1C 00196C1C 000060AC */  sw          $0, 0x0($3)
/* 096D20 00196C20 2826A070 */  paddub      $4, $5, $0
/* 096D24 00196C24 08008524 */  addiu       $5, $4, 0x8
/* 096D28 00196C28 E828060C */  jal         GetStackFloat__FP12RS_STACKDATA
/* 096D2C 00196C2C 00000000 */   nop
/* 096D30 00196C30 2800A0E7 */  swc1        $f0, 0x28($29)
/* 096D34 00196C34 2826A070 */  paddub      $4, $5, $0
/* 096D38 00196C38 08008524 */  addiu       $5, $4, 0x8
/* 096D3C 00196C3C E828060C */  jal         GetStackFloat__FP12RS_STACKDATA
/* 096D40 00196C40 00000000 */   nop
/* 096D44 00196C44 1000A0E7 */  swc1        $f0, 0x10($29)
/* 096D48 00196C48 000060AC */  sw          $0, 0x0($3)
/* 096D4C 00196C4C 2826A070 */  paddub      $4, $5, $0
/* 096D50 00196C50 E828060C */  jal         GetStackFloat__FP12RS_STACKDATA
/* 096D54 00196C54 00000000 */   nop
/* 096D58 00196C58 1800A0E7 */  swc1        $f0, 0x18($29)
/* 096D5C 00196C5C 1000A427 */  addiu       $4, $29, 0x10
/* 096D60 00196C60 18A5060C */  jal         FishingInitFish__F7CBoxVu0
/* 096D64 00196C64 00000000 */   nop
/* 096D68 00196C68 01000224 */  addiu       $2, $0, 0x1
/* 096D6C 00196C6C 0000BF7B */  lq          $31, 0x0($29)
/* 096D70 00196C70 3000BD27 */  addiu       $29, $29, 0x30
/* 096D74 00196C74 0800E003 */  jr          $31
/* 096D78 00196C78 00000000 */   nop
/* 096D7C 00196C7C 00000000 */  nop
