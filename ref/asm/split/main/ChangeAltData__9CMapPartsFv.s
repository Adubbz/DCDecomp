.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel ChangeAltData__9CMapPartsFv
/* 09AD40 0019AC40 0801858C */  lw          $5, 0x108($4)
/* 09AD44 0019AC44 0400A014 */  bnez        $5, .L0019AC58
/* 09AD48 0019AC48 00000000 */   nop
/* 09AD4C 0019AC4C 28160070 */  paddub      $2, $0, $0
/* 09AD50 0019AC50 1F000010 */  b           .L0019ACD0
/* 09AD54 0019AC54 00000000 */   nop
.L0019AC58:
/* 09AD58 0019AC58 E400A68C */  lw          $6, 0xE4($5)
/* 09AD5C 0019AC5C 0400C014 */  bnez        $6, .L0019AC70
/* 09AD60 0019AC60 00000000 */   nop
/* 09AD64 0019AC64 28160070 */  paddub      $2, $0, $0
/* 09AD68 0019AC68 19000010 */  b           .L0019ACD0
/* 09AD6C 0019AC6C 00000000 */   nop
.L0019AC70:
/* 09AD70 0019AC70 28260070 */  paddub      $4, $0, $0
/* 09AD74 0019AC74 0F000010 */  b           .L0019ACB4
/* 09AD78 0019AC78 00000000 */   nop
.L0019AC7C:
/* 09AD7C 0019AC7C 3C00C28C */  lw          $2, 0x3C($6)
/* 09AD80 0019AC80 21104400 */  addu        $2, $2, $4
/* 09AD84 0019AC84 00004290 */  lbu         $2, 0x0($2)
/* 09AD88 0019AC88 3C140200 */  dsll32      $2, $2, 16
/* 09AD8C 0019AC8C 3F140200 */  dsra32      $2, $2, 16
/* 09AD90 0019AC90 07004010 */  beqz        $2, .L0019ACB0
/* 09AD94 0019AC94 00000000 */   nop
/* 09AD98 0019AC98 80004128 */  slti        $1, $2, 0x80
/* 09AD9C 0019AC9C 04002010 */  beqz        $1, .L0019ACB0
/* 09ADA0 0019ACA0 00000000 */   nop
/* 09ADA4 0019ACA4 01000224 */  addiu       $2, $0, 0x1
/* 09ADA8 0019ACA8 09000010 */  b           .L0019ACD0
/* 09ADAC 0019ACAC 00000000 */   nop
.L0019ACB0:
/* 09ADB0 0019ACB0 01008424 */  addiu       $4, $4, 0x1
.L0019ACB4:
/* 09ADB4 0019ACB4 1C00A38C */  lw          $3, 0x1C($5)
/* 09ADB8 0019ACB8 2000A28C */  lw          $2, 0x20($5)
/* 09ADBC 0019ACBC 18106200 */  mult        $2, $3, $2
/* 09ADC0 0019ACC0 2A108200 */  slt         $2, $4, $2
/* 09ADC4 0019ACC4 EDFF4014 */  bnez        $2, .L0019AC7C
/* 09ADC8 0019ACC8 00000000 */   nop
/* 09ADCC 0019ACCC 28160070 */  paddub      $2, $0, $0
.L0019ACD0:
/* 09ADD0 0019ACD0 0800E003 */  jr          $31
/* 09ADD4 0019ACD4 00000000 */   nop
/* 09ADD8 0019ACD8 00000000 */  nop
/* 09ADDC 0019ACDC 00000000 */  nop
