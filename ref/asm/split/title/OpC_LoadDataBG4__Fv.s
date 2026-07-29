.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel OpC_LoadDataBG4__Fv
/* 010290 01DBBF90 F0FFBD27 */  addiu       $29, $29, -0x10
/* 010294 01DBBF94 0000BF7F */  sq          $31, 0x0($29)
.L01DBBF98_2C1798:
/* 010298 01DBBF98 8CFB040C */  jal         ReadBGSync__Fv
/* 01029C 01DBBF9C 00000000 */   nop
/* 0102A0 01DBBFA0 FDFF4014 */  bnez        $2, .L01DBBF98_2C1798
/* 0102A4 01DBBFA4 00000000 */   nop
/* 0102A8 01DBBFA8 948B858F */  lw          $5, -0x746C($28)
/* 0102AC 01DBBFAC DE01023C */  lui         $2, %hi(LIT_364__3)
/* 0102B0 01DBBFB0 D0EB4424 */  addiu       $4, $2, %lo(LIT_364__3)
/* 0102B4 01DBBFB4 28360070 */  paddub      $6, $0, $0
/* 0102B8 01DBBFB8 ACFA040C */  jal         LoadFileBG__FPcP1Pi
/* 0102BC 01DBBFBC 00000000 */   nop
/* 0102C0 01DBBFC0 FFFF0324 */  addiu       $3, $0, -0x1
/* 0102C4 01DBBFC4 DE01013C */  lui         $1, %hi(CScript__2 + 0x1C)
/* 0102C8 01DBBFC8 1C1B23AC */  sw          $3, %lo(CScript__2 + 0x1C)($1)
/* 0102CC 01DBBFCC 0000BF7B */  lq          $31, 0x0($29)
/* 0102D0 01DBBFD0 1000BD27 */  addiu       $29, $29, 0x10
/* 0102D4 01DBBFD4 0800E003 */  jr          $31
/* 0102D8 01DBBFD8 00000000 */   nop
/* 0102DC 01DBBFDC 00000000 */  nop
