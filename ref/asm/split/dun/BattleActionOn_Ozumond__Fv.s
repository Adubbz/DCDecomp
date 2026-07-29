.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel BattleActionOn_Ozumond__Fv
/* 011E40 01DBDB40 F0FFBD27 */  addiu       $29, $29, -0x10
/* 011E44 01DBDB44 0000BF7F */  sq          $31, 0x0($29)
/* 011E48 01DBDB48 DC01013C */  lui         $1, %hi(BtActStatus + 0x10)
/* 011E4C 01DBDB4C 9044238C */  lw          $3, %lo(BtActStatus + 0x10)($1)
/* 011E50 01DBDB50 1A006014 */  bnez        $3, .L01DBDBBC_2F91BC
/* 011E54 01DBDB54 00000000 */   nop
/* 011E58 01DBDB58 DC01013C */  lui         $1, %hi(BtActStatus + 0xA4)
/* 011E5C 01DBDB5C 2445238C */  lw          $3, %lo(BtActStatus + 0xA4)($1)
/* 011E60 01DBDB60 16006014 */  bnez        $3, .L01DBDBBC_2F91BC
/* 011E64 01DBDB64 00000000 */   nop
/* 011E68 01DBDB68 0B000224 */  addiu       $2, $0, 0xB
/* 011E6C 01DBDB6C DC01013C */  lui         $1, %hi(BtActStatus + 0x14)
/* 011E70 01DBDB70 944422AC */  sw          $2, %lo(BtActStatus + 0x14)($1)
/* 011E74 01DBDB74 01000324 */  addiu       $3, $0, 0x1
/* 011E78 01DBDB78 DC01013C */  lui         $1, %hi(BtActStatus + 0x10)
/* 011E7C 01DBDB7C 904423AC */  sw          $3, %lo(BtActStatus + 0x10)($1)
/* 011E80 01DBDB80 DC01013C */  lui         $1, %hi(BtActStatus + 0x18)
/* 011E84 01DBDB84 984420AC */  sw          $0, %lo(BtActStatus + 0x18)($1)
/* 011E88 01DBDB88 DC01013C */  lui         $1, %hi(BtActStatus + 0x5C)
/* 011E8C 01DBDB8C DC4420AC */  sw          $0, %lo(BtActStatus + 0x5C)($1)
/* 011E90 01DBDB90 803F023C */  lui         $2, (0x3F800000 >> 16)
/* 011E94 01DBDB94 DC01013C */  lui         $1, %hi(BtActStatus + 0x1C)
/* 011E98 01DBDB98 9C4422AC */  sw          $2, %lo(BtActStatus + 0x1C)($1)
/* 011E9C 01DBDB9C 7C9D83AF */  sw          $3, -0x6284($28)
/* 011EA0 01DBDBA0 A4010424 */  addiu       $4, $0, 0x1A4
/* 011EA4 01DBDBA4 FFFF0524 */  addiu       $5, $0, -0x1
/* 011EA8 01DBDBA8 28360070 */  paddub      $6, $0, $0
/* 011EAC 01DBDBAC AC69050C */  jal         SndSePlay__Fiii
/* 011EB0 01DBDBB0 00000000 */   nop
/* 011EB4 01DBDBB4 1E000324 */  addiu       $3, $0, 0x1E
/* 011EB8 01DBDBB8 AC9E83AF */  sw          $3, -0x6154($28)
.L01DBDBBC_2F91BC:
/* 011EBC 01DBDBBC 0000BF7B */  lq          $31, 0x0($29)
/* 011EC0 01DBDBC0 1000BD27 */  addiu       $29, $29, 0x10
/* 011EC4 01DBDBC4 0800E003 */  jr          $31
/* 011EC8 01DBDBC8 00000000 */   nop
/* 011ECC 01DBDBCC 00000000 */  nop
