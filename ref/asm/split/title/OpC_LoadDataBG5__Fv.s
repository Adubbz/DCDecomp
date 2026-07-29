.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel OpC_LoadDataBG5__Fv
/* 0102E0 01DBBFE0 F0FFBD27 */  addiu       $29, $29, -0x10
/* 0102E4 01DBBFE4 0000BF7F */  sq          $31, 0x0($29)
.L01DBBFE8_2C17E8:
/* 0102E8 01DBBFE8 8CFB040C */  jal         ReadBGSync__Fv
/* 0102EC 01DBBFEC 00000000 */   nop
/* 0102F0 01DBBFF0 FDFF4014 */  bnez        $2, .L01DBBFE8_2C17E8
/* 0102F4 01DBBFF4 00000000 */   nop
/* 0102F8 01DBBFF8 948B858F */  lw          $5, -0x746C($28)
/* 0102FC 01DBBFFC DE01023C */  lui         $2, %hi(LIT_387__5)
/* 010300 01DBC000 30EC4424 */  addiu       $4, $2, %lo(LIT_387__5)
/* 010304 01DBC004 28360070 */  paddub      $6, $0, $0
/* 010308 01DBC008 ACFA040C */  jal         LoadFileBG__FPcP1Pi
/* 01030C 01DBC00C 00000000 */   nop
/* 010310 01DBC010 FFFF0324 */  addiu       $3, $0, -0x1
/* 010314 01DBC014 DE01013C */  lui         $1, %hi(CScript__2 + 0x1C)
/* 010318 01DBC018 1C1B23AC */  sw          $3, %lo(CScript__2 + 0x1C)($1)
/* 01031C 01DBC01C 0000BF7B */  lq          $31, 0x0($29)
/* 010320 01DBC020 1000BD27 */  addiu       $29, $29, 0x10
/* 010324 01DBC024 0800E003 */  jr          $31
/* 010328 01DBC028 00000000 */   nop
/* 01032C 01DBC02C 00000000 */  nop
