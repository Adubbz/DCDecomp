.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel OpC_LoadDataBG2__Fv
/* 0101F0 01DBBEF0 F0FFBD27 */  addiu       $29, $29, -0x10
/* 0101F4 01DBBEF4 0000BF7F */  sq          $31, 0x0($29)
.L01DBBEF8_2C16F8:
/* 0101F8 01DBBEF8 8CFB040C */  jal         ReadBGSync__Fv
/* 0101FC 01DBBEFC 00000000 */   nop
/* 010200 01DBBF00 FDFF4014 */  bnez        $2, .L01DBBEF8_2C16F8
/* 010204 01DBBF04 00000000 */   nop
/* 010208 01DBBF08 948B858F */  lw          $5, -0x746C($28)
/* 01020C 01DBBF0C DE01023C */  lui         $2, %hi(LIT_370__5)
/* 010210 01DBBF10 F0EB4424 */  addiu       $4, $2, %lo(LIT_370__5)
/* 010214 01DBBF14 28360070 */  paddub      $6, $0, $0
/* 010218 01DBBF18 ACFA040C */  jal         LoadFileBG__FPcP1Pi
/* 01021C 01DBBF1C 00000000 */   nop
/* 010220 01DBBF20 FFFF0324 */  addiu       $3, $0, -0x1
/* 010224 01DBBF24 DE01013C */  lui         $1, %hi(CScript__2 + 0x1C)
/* 010228 01DBBF28 1C1B23AC */  sw          $3, %lo(CScript__2 + 0x1C)($1)
/* 01022C 01DBBF2C 0000BF7B */  lq          $31, 0x0($29)
/* 010230 01DBBF30 1000BD27 */  addiu       $29, $29, 0x10
/* 010234 01DBBF34 0800E003 */  jr          $31
/* 010238 01DBBF38 00000000 */   nop
/* 01023C 01DBBF3C 00000000 */  nop
