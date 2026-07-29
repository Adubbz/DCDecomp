.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel OpD_LoadDataBG__Fv
/* 0183B0 01DC40B0 F0FFBD27 */  addiu       $29, $29, -0x10
/* 0183B4 01DC40B4 0000BF7F */  sq          $31, 0x0($29)
.L01DC40B8_2C98B8:
/* 0183B8 01DC40B8 8CFB040C */  jal         ReadBGSync__Fv
/* 0183BC 01DC40BC 00000000 */   nop
/* 0183C0 01DC40C0 FDFF4014 */  bnez        $2, .L01DC40B8_2C98B8
/* 0183C4 01DC40C4 00000000 */   nop
/* 0183C8 01DC40C8 948B858F */  lw          $5, -0x746C($28)
/* 0183CC 01DC40CC DE01023C */  lui         $2, %hi(LIT_365__7)
/* 0183D0 01DC40D0 40FA4424 */  addiu       $4, $2, %lo(LIT_365__7)
/* 0183D4 01DC40D4 28360070 */  paddub      $6, $0, $0
/* 0183D8 01DC40D8 ACFA040C */  jal         LoadFileBG__FPcP1Pi
/* 0183DC 01DC40DC 00000000 */   nop
/* 0183E0 01DC40E0 FFFF0324 */  addiu       $3, $0, -0x1
/* 0183E4 01DC40E4 DE01013C */  lui         $1, %hi(CScript__2 + 0x1C)
/* 0183E8 01DC40E8 1C1B23AC */  sw          $3, %lo(CScript__2 + 0x1C)($1)
/* 0183EC 01DC40EC 0000BF7B */  lq          $31, 0x0($29)
/* 0183F0 01DC40F0 1000BD27 */  addiu       $29, $29, 0x10
/* 0183F4 01DC40F4 0800E003 */  jr          $31
/* 0183F8 01DC40F8 00000000 */   nop
/* 0183FC 01DC40FC 00000000 */  nop
