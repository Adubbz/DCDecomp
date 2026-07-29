.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel BattleActionOn_Ozumond_F__Fv
/* 011F70 01DBDC70 F0FFBD27 */  addiu       $29, $29, -0x10
/* 011F74 01DBDC74 0000BF7F */  sq          $31, 0x0($29)
/* 011F78 01DBDC78 DC01013C */  lui         $1, %hi(BtActStatus + 0x10)
/* 011F7C 01DBDC7C 9044238C */  lw          $3, %lo(BtActStatus + 0x10)($1)
/* 011F80 01DBDC80 17006014 */  bnez        $3, .L01DBDCE0_2F92E0
/* 011F84 01DBDC84 00000000 */   nop
/* 011F88 01DBDC88 DC01013C */  lui         $1, %hi(BtActStatus + 0xA4)
/* 011F8C 01DBDC8C 2445238C */  lw          $3, %lo(BtActStatus + 0xA4)($1)
/* 011F90 01DBDC90 13006014 */  bnez        $3, .L01DBDCE0_2F92E0
/* 011F94 01DBDC94 00000000 */   nop
/* 011F98 01DBDC98 DC01013C */  lui         $1, %hi(BtActStatus + 0x14)
/* 011F9C 01DBDC9C 944420AC */  sw          $0, %lo(BtActStatus + 0x14)($1)
/* 011FA0 01DBDCA0 01000224 */  addiu       $2, $0, 0x1
/* 011FA4 01DBDCA4 DC01013C */  lui         $1, %hi(BtActStatus + 0x10)
/* 011FA8 01DBDCA8 904422AC */  sw          $2, %lo(BtActStatus + 0x10)($1)
/* 011FAC 01DBDCAC DC01013C */  lui         $1, %hi(BtActStatus + 0x18)
/* 011FB0 01DBDCB0 984420AC */  sw          $0, %lo(BtActStatus + 0x18)($1)
/* 011FB4 01DBDCB4 DC01013C */  lui         $1, %hi(BtActStatus + 0x5C)
/* 011FB8 01DBDCB8 DC4420AC */  sw          $0, %lo(BtActStatus + 0x5C)($1)
/* 011FBC 01DBDCBC 7C9D82AF */  sw          $2, -0x6284($28)
/* 011FC0 01DBDCC0 B09E80AF */  sw          $0, -0x6150($28)
/* 011FC4 01DBDCC4 A4010424 */  addiu       $4, $0, 0x1A4
/* 011FC8 01DBDCC8 FFFF0524 */  addiu       $5, $0, -0x1
/* 011FCC 01DBDCCC 28360070 */  paddub      $6, $0, $0
/* 011FD0 01DBDCD0 AC69050C */  jal         SndSePlay__Fiii
/* 011FD4 01DBDCD4 00000000 */   nop
/* 011FD8 01DBDCD8 1E000324 */  addiu       $3, $0, 0x1E
/* 011FDC 01DBDCDC AC9E83AF */  sw          $3, -0x6154($28)
.L01DBDCE0_2F92E0:
/* 011FE0 01DBDCE0 0000BF7B */  lq          $31, 0x0($29)
/* 011FE4 01DBDCE4 1000BD27 */  addiu       $29, $29, 0x10
/* 011FE8 01DBDCE8 0800E003 */  jr          $31
/* 011FEC 01DBDCEC 00000000 */   nop
