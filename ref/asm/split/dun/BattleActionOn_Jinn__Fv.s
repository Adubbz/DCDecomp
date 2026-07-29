.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel BattleActionOn_Jinn__Fv
/* 010BA0 01DBC8A0 F0FFBD27 */  addiu       $29, $29, -0x10
/* 010BA4 01DBC8A4 0000BF7F */  sq          $31, 0x0($29)
/* 010BA8 01DBC8A8 DC01013C */  lui         $1, %hi(BtActStatus + 0x10)
/* 010BAC 01DBC8AC 9044238C */  lw          $3, %lo(BtActStatus + 0x10)($1)
/* 010BB0 01DBC8B0 1A006014 */  bnez        $3, .L01DBC91C_2F7F1C
/* 010BB4 01DBC8B4 00000000 */   nop
/* 010BB8 01DBC8B8 DC01013C */  lui         $1, %hi(BtActStatus + 0x48)
/* 010BBC 01DBC8BC C8442CC4 */  lwc1        $f12, %lo(BtActStatus + 0x48)($1)
/* 010BC0 01DBC8C0 2C44040C */  jal         fptosi
/* 010BC4 01DBC8C4 00000000 */   nop
/* 010BC8 01DBC8C8 64000324 */  addiu       $3, $0, 0x64
/* 010BCC 01DBC8CC 13004314 */  bne         $2, $3, .L01DBC91C_2F7F1C
/* 010BD0 01DBC8D0 00000000 */   nop
/* 010BD4 01DBC8D4 DC01013C */  lui         $1, %hi(BtActStatus + 0x18)
/* 010BD8 01DBC8D8 984420AC */  sw          $0, %lo(BtActStatus + 0x18)($1)
/* 010BDC 01DBC8DC DC01013C */  lui         $1, %hi(BtActStatus + 0x1C)
/* 010BE0 01DBC8E0 9C4420AC */  sw          $0, %lo(BtActStatus + 0x1C)($1)
/* 010BE4 01DBC8E4 0B000224 */  addiu       $2, $0, 0xB
/* 010BE8 01DBC8E8 DC01013C */  lui         $1, %hi(BtActStatus + 0x14)
/* 010BEC 01DBC8EC 944422AC */  sw          $2, %lo(BtActStatus + 0x14)($1)
/* 010BF0 01DBC8F0 01000224 */  addiu       $2, $0, 0x1
/* 010BF4 01DBC8F4 DC01013C */  lui         $1, %hi(BtActStatus + 0x10)
/* 010BF8 01DBC8F8 904422AC */  sw          $2, %lo(BtActStatus + 0x10)($1)
/* 010BFC 01DBC8FC DC01013C */  lui         $1, %hi(BtActStatus + 0x48)
/* 010C00 01DBC900 C84420AC */  sw          $0, %lo(BtActStatus + 0x48)($1)
/* 010C04 01DBC904 7C9D82AF */  sw          $2, -0x6284($28)
/* 010C08 01DBC908 90010424 */  addiu       $4, $0, 0x190
/* 010C0C 01DBC90C FFFF0524 */  addiu       $5, $0, -0x1
/* 010C10 01DBC910 28360070 */  paddub      $6, $0, $0
/* 010C14 01DBC914 AC69050C */  jal         SndSePlay__Fiii
/* 010C18 01DBC918 00000000 */   nop
.L01DBC91C_2F7F1C:
/* 010C1C 01DBC91C 0000BF7B */  lq          $31, 0x0($29)
/* 010C20 01DBC920 1000BD27 */  addiu       $29, $29, 0x10
/* 010C24 01DBC924 0800E003 */  jr          $31
/* 010C28 01DBC928 00000000 */   nop
/* 010C2C 01DBC92C 00000000 */  nop
