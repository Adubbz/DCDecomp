.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel GetParts__9CSaveDataFiPi
/* 58160 00158060 0400A004 */  bltz       $5, .L00158074
/* 58164 00158064 00000000 */   nop
/* 58168 00158068 0600A228 */  slti       $2, $5, 0x6
/* 5816C 0015806C 04004014 */  bnez       $2, .L00158080
/* 58170 00158070 00000000 */   nop
.L00158074:
/* 58174 00158074 28160070 */  paddub     $2, $0, $0
/* 58178 00158078 12000010 */  b          .L001580C4
/* 5817C 0015807C 00000000 */   nop
.L00158080:
/* 58180 00158080 B80B0224 */  addiu      $2, $0, 0xBB8
/* 58184 00158084 1810A200 */  mult       $2, $5, $2
/* 58188 00158088 21108200 */  addu       $2, $4, $2
/* 5818C 0015808C 24094224 */  addiu      $2, $2, 0x924
/* 58190 00158090 28260070 */  paddub     $4, $0, $0
/* 58194 00158094 07000010 */  b          .L001580B4
/* 58198 00158098 00000000 */   nop
.L0015809C:
/* 5819C 0015809C 00190400 */  sll        $3, $4, 4
/* 581A0 001580A0 21184300 */  addu       $3, $2, $3
/* 581A4 001580A4 00006384 */  lh         $3, 0x0($3)
/* 581A8 001580A8 05006004 */  bltz       $3, .L001580C0
/* 581AC 001580AC 00000000 */   nop
/* 581B0 001580B0 01008424 */  addiu      $4, $4, 0x1
.L001580B4:
/* 581B4 001580B4 82008328 */  slti       $3, $4, 0x82
/* 581B8 001580B8 F8FF6014 */  bnez       $3, .L0015809C
/* 581BC 001580BC 00000000 */   nop
.L001580C0:
/* 581C0 001580C0 0000C4AC */  sw         $4, 0x0($6)
.L001580C4:
/* 581C4 001580C4 0800E003 */  jr         $31
/* 581C8 001580C8 00000000 */   nop
/* 581CC 001580CC 00000000 */  nop
