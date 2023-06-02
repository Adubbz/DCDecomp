.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel sceMcFormat
/* 1ECD0 0011EBD0 D0FFBD27 */  addiu      $sp, $sp, -0x30
/* 1ECD4 0011EBD4 1000B0FF */  sd         $16, 0x10($sp)
/* 1ECD8 0011EBD8 2500103C */  lui        $16, (0x250A38 >> 16)
/* 1ECDC 0011EBDC 2000BFFF */  sd         $31, 0x20($sp)
/* 1ECE0 0011EBE0 380A028E */  lw         $2, (0x250A38 & 0xFFFF)($16)
/* 1ECE4 0011EBE4 1A004014 */  bnez       $2, .L0011EC50
/* 1ECE8 0011EBE8 2D308000 */   daddu     $6, $4, $0
/* 1ECEC 0011EBEC 2B00023C */  lui        $2, %hi(D_002A8640)
/* 1ECF0 0011EBF0 40864424 */  addiu      $4, $2, %lo(D_002A8640)
/* 1ECF4 0011EBF4 2400838C */  lw         $3, 0x24($4)
/* 1ECF8 0011EBF8 15006010 */  beqz       $3, .L0011EC50
/* 1ECFC 0011EBFC 9CFF0224 */   addiu     $2, $0, -0x64
/* 1ED00 0011EC00 2B00023C */  lui        $2, %hi(D_002A86C0)
/* 1ED04 0011EC04 2B00093C */  lui        $9, %hi(D_002A9C00)
/* 1ED08 0011EC08 C0864224 */  addiu      $2, $2, %lo(D_002A86C0)
/* 1ED0C 0011EC0C 009C2925 */  addiu      $9, $9, %lo(D_002A9C00)
/* 1ED10 0011EC10 040046AC */  sw         $6, 0x4($2)
/* 1ED14 0011EC14 2D384000 */  daddu      $7, $2, $0
/* 1ED18 0011EC18 080045AC */  sw         $5, 0x8($2)
/* 1ED1C 0011EC1C 01000624 */  addiu      $6, $0, 0x1
/* 1ED20 0011EC20 0000A0AF */  sw         $0, 0x0($sp)
/* 1ED24 0011EC24 10000524 */  addiu      $5, $0, 0x10
/* 1ED28 0011EC28 30000824 */  addiu      $8, $0, 0x30
/* 1ED2C 0011EC2C 04000A24 */  addiu      $10, $0, 0x4
/* 1ED30 0011EC30 2A5D040C */  jal        sceSifCallRpc
/* 1ED34 0011EC34 2D580000 */   daddu     $11, $0, $0
/* 1ED38 0011EC38 2D184000 */  daddu      $3, $2, $0
/* 1ED3C 0011EC3C 04006014 */  bnez       $3, .L0011EC50
/* 1ED40 0011EC40 2D106000 */   daddu     $2, $3, $0
/* 1ED44 0011EC44 10000224 */  addiu      $2, $0, 0x10
/* 1ED48 0011EC48 380A02AE */  sw         $2, (0x250A38 & 0xFFFF)($16)
/* 1ED4C 0011EC4C 2D106000 */  daddu      $2, $3, $0
.L0011EC50:
/* 1ED50 0011EC50 2000BFDF */  ld         $31, 0x20($sp)
/* 1ED54 0011EC54 1000B0DF */  ld         $16, 0x10($sp)
/* 1ED58 0011EC58 0800E003 */  jr         $31
/* 1ED5C 0011EC5C 3000BD27 */   addiu     $sp, $sp, 0x30
