.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel OpC_LoadDataBG__Fv
/* 0101A0 01DBBEA0 F0FFBD27 */  addiu       $29, $29, -0x10
/* 0101A4 01DBBEA4 0000BF7F */  sq          $31, 0x0($29)
.L01DBBEA8_2C16A8:
/* 0101A8 01DBBEA8 8CFB040C */  jal         ReadBGSync__Fv
/* 0101AC 01DBBEAC 00000000 */   nop
/* 0101B0 01DBBEB0 FDFF4014 */  bnez        $2, .L01DBBEA8_2C16A8
/* 0101B4 01DBBEB4 00000000 */   nop
/* 0101B8 01DBBEB8 948B858F */  lw          $5, -0x746C($28)
/* 0101BC 01DBBEBC DE01023C */  lui         $2, %hi(LIT_364__3)
/* 0101C0 01DBBEC0 D0EB4424 */  addiu       $4, $2, %lo(LIT_364__3)
/* 0101C4 01DBBEC4 28360070 */  paddub      $6, $0, $0
/* 0101C8 01DBBEC8 ACFA040C */  jal         LoadFileBG__FPcP1Pi
/* 0101CC 01DBBECC 00000000 */   nop
/* 0101D0 01DBBED0 FFFF0324 */  addiu       $3, $0, -0x1
/* 0101D4 01DBBED4 DE01013C */  lui         $1, %hi(CScript__2 + 0x1C)
/* 0101D8 01DBBED8 1C1B23AC */  sw          $3, %lo(CScript__2 + 0x1C)($1)
/* 0101DC 01DBBEDC 0000BF7B */  lq          $31, 0x0($29)
/* 0101E0 01DBBEE0 1000BD27 */  addiu       $29, $29, 0x10
/* 0101E4 01DBBEE4 0800E003 */  jr          $31
/* 0101E8 01DBBEE8 00000000 */   nop
/* 0101EC 01DBBEEC 00000000 */  nop
