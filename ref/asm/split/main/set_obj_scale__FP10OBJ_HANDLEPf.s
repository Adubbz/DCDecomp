.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel set_obj_scale__FP10OBJ_HANDLEPf
/* 08AD50 0018AC50 C0FFBD27 */  addiu       $29, $29, -0x40
/* 08AD54 0018AC54 3000BF7F */  sq          $31, 0x30($29)
/* 08AD58 0018AC58 2000B27F */  sq          $18, 0x20($29)
/* 08AD5C 0018AC5C 1000B17F */  sq          $17, 0x10($29)
/* 08AD60 0018AC60 0000B07F */  sq          $16, 0x0($29)
/* 08AD64 0018AC64 28968070 */  paddub      $18, $4, $0
/* 08AD68 0018AC68 288EA070 */  paddub      $17, $5, $0
/* 08AD6C 0018AC6C 0000848C */  lw          $4, 0x0($4)
/* 08AD70 0018AC70 07008010 */  beqz        $4, .L0018AC90
/* 08AD74 0018AC74 00000000 */   nop
/* 08AD78 0018AC78 A000998C */  lw          $25, 0xA0($4)
/* 08AD7C 0018AC7C 8800398F */  lw          $25, 0x88($25)
/* 08AD80 0018AC80 09F82003 */  jalr        $25
/* 08AD84 0018AC84 00000000 */   nop
/* 08AD88 0018AC88 19000010 */  b           .L0018ACF0
/* 08AD8C 0018AC8C 00000000 */   nop
.L0018AC90:
/* 08AD90 0018AC90 0400448E */  lw          $4, 0x4($18)
/* 08AD94 0018AC94 07008010 */  beqz        $4, .L0018ACB4
/* 08AD98 0018AC98 00000000 */   nop
/* 08AD9C 0018AC9C A000998C */  lw          $25, 0xA0($4)
/* 08ADA0 0018ACA0 8800398F */  lw          $25, 0x88($25)
/* 08ADA4 0018ACA4 09F82003 */  jalr        $25
/* 08ADA8 0018ACA8 00000000 */   nop
/* 08ADAC 0018ACAC 10000010 */  b           .L0018ACF0
/* 08ADB0 0018ACB0 00000000 */   nop
.L0018ACB4:
/* 08ADB4 0018ACB4 28860070 */  paddub      $16, $0, $0
/* 08ADB8 0018ACB8 0A000010 */  b           .L0018ACE4
/* 08ADBC 0018ACBC 00000000 */   nop
.L0018ACC0:
/* 08ADC0 0018ACC0 80181000 */  sll         $3, $16, 2
/* 08ADC4 0018ACC4 21187200 */  addu        $3, $3, $18
/* 08ADC8 0018ACC8 0800648C */  lw          $4, 0x8($3)
/* 08ADCC 0018ACCC 04008010 */  beqz        $4, .L0018ACE0
/* 08ADD0 0018ACD0 00000000 */   nop
/* 08ADD4 0018ACD4 282E2072 */  paddub      $5, $17, $0
/* 08ADD8 0018ACD8 EC9F040C */  jal         SetScale__6CFrameFPf
/* 08ADDC 0018ACDC 00000000 */   nop
.L0018ACE0:
/* 08ADE0 0018ACE0 01001026 */  addiu       $16, $16, 0x1
.L0018ACE4:
/* 08ADE4 0018ACE4 0C00032A */  slti        $3, $16, 0xC
/* 08ADE8 0018ACE8 F5FF6014 */  bnez        $3, .L0018ACC0
/* 08ADEC 0018ACEC 00000000 */   nop
.L0018ACF0:
/* 08ADF0 0018ACF0 3000BF7B */  lq          $31, 0x30($29)
/* 08ADF4 0018ACF4 2000B27B */  lq          $18, 0x20($29)
/* 08ADF8 0018ACF8 1000B17B */  lq          $17, 0x10($29)
/* 08ADFC 0018ACFC 0000B07B */  lq          $16, 0x0($29)
/* 08AE00 0018AD00 4000BD27 */  addiu       $29, $29, 0x40
/* 08AE04 0018AD04 0800E003 */  jr          $31
/* 08AE08 0018AD08 00000000 */   nop
/* 08AE0C 0018AD0C 00000000 */  nop
