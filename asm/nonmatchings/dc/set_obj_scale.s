.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel set_obj_scale__FP10OBJ_HANDLEPf
/* 8AD50 0018AC50 C0FFBD27 */  addiu      $sp, $sp, -0x40
/* 8AD54 0018AC54 3000BF7F */  sq         $31, 0x30($sp)
/* 8AD58 0018AC58 2000B27F */  sq         $18, 0x20($sp)
/* 8AD5C 0018AC5C 1000B17F */  sq         $17, 0x10($sp)
/* 8AD60 0018AC60 0000B07F */  sq         $16, 0x0($sp)
/* 8AD64 0018AC64 28968070 */  paddub     $18, $4, $0
/* 8AD68 0018AC68 288EA070 */  paddub     $17, $5, $0
/* 8AD6C 0018AC6C 0000848C */  lw         $4, 0x0($4)
/* 8AD70 0018AC70 07008010 */  beqz       $4, .L0018AC90
/* 8AD74 0018AC74 00000000 */   nop
/* 8AD78 0018AC78 A000998C */  lw         $25, 0xA0($4)
/* 8AD7C 0018AC7C 8800398F */  lw         $25, 0x88($25)
/* 8AD80 0018AC80 09F82003 */  jalr       $25
/* 8AD84 0018AC84 00000000 */   nop
/* 8AD88 0018AC88 19000010 */  b          .L0018ACF0
/* 8AD8C 0018AC8C 00000000 */   nop
.L0018AC90:
/* 8AD90 0018AC90 0400448E */  lw         $4, 0x4($18)
/* 8AD94 0018AC94 07008010 */  beqz       $4, .L0018ACB4
/* 8AD98 0018AC98 00000000 */   nop
/* 8AD9C 0018AC9C A000998C */  lw         $25, 0xA0($4)
/* 8ADA0 0018ACA0 8800398F */  lw         $25, 0x88($25)
/* 8ADA4 0018ACA4 09F82003 */  jalr       $25
/* 8ADA8 0018ACA8 00000000 */   nop
/* 8ADAC 0018ACAC 10000010 */  b          .L0018ACF0
/* 8ADB0 0018ACB0 00000000 */   nop
.L0018ACB4:
/* 8ADB4 0018ACB4 28860070 */  paddub     $16, $0, $0
/* 8ADB8 0018ACB8 0A000010 */  b          .L0018ACE4
/* 8ADBC 0018ACBC 00000000 */   nop
.L0018ACC0:
/* 8ADC0 0018ACC0 80181000 */  sll        $3, $16, 2
/* 8ADC4 0018ACC4 21187200 */  addu       $3, $3, $18
/* 8ADC8 0018ACC8 0800648C */  lw         $4, 0x8($3)
/* 8ADCC 0018ACCC 04008010 */  beqz       $4, .L0018ACE0
/* 8ADD0 0018ACD0 00000000 */   nop
/* 8ADD4 0018ACD4 282E2072 */  paddub     $5, $17, $0
/* 8ADD8 0018ACD8 EC9F040C */  jal        SetScale__6CFrameFPf
/* 8ADDC 0018ACDC 00000000 */   nop
.L0018ACE0:
/* 8ADE0 0018ACE0 01001026 */  addiu      $16, $16, 0x1
.L0018ACE4:
/* 8ADE4 0018ACE4 0C00032A */  slti       $3, $16, 0xC
/* 8ADE8 0018ACE8 F5FF6014 */  bnez       $3, .L0018ACC0
/* 8ADEC 0018ACEC 00000000 */   nop
.L0018ACF0:
/* 8ADF0 0018ACF0 3000BF7B */  lq         $31, 0x30($sp)
/* 8ADF4 0018ACF4 2000B27B */  lq         $18, 0x20($sp)
/* 8ADF8 0018ACF8 1000B17B */  lq         $17, 0x10($sp)
/* 8ADFC 0018ACFC 0000B07B */  lq         $16, 0x0($sp)
/* 8AE00 0018AD00 4000BD27 */  addiu      $sp, $sp, 0x40
/* 8AE04 0018AD04 0800E003 */  jr         $31
/* 8AE08 0018AD08 00000000 */   nop
/* 8AE0C 0018AD0C 00000000 */  nop
