.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel BattleActionOn_Ozumond_H__Fv
/* 011ED0 01DBDBD0 F0FFBD27 */  addiu       $29, $29, -0x10
/* 011ED4 01DBDBD4 0000BF7F */  sq          $31, 0x0($29)
/* 011ED8 01DBDBD8 DC01013C */  lui         $1, %hi(BtActStatus + 0x10)
/* 011EDC 01DBDBDC 9044238C */  lw          $3, %lo(BtActStatus + 0x10)($1)
/* 011EE0 01DBDBE0 1F006014 */  bnez        $3, .L01DBDC60_2F9260
/* 011EE4 01DBDBE4 00000000 */   nop
/* 011EE8 01DBDBE8 DC01013C */  lui         $1, %hi(BtActStatus + 0x48)
/* 011EEC 01DBDBEC C8442CC4 */  lwc1        $f12, %lo(BtActStatus + 0x48)($1)
/* 011EF0 01DBDBF0 2C44040C */  jal         fptosi
/* 011EF4 01DBDBF4 00000000 */   nop
/* 011EF8 01DBDBF8 64000324 */  addiu       $3, $0, 0x64
/* 011EFC 01DBDBFC 18004314 */  bne         $2, $3, .L01DBDC60_2F9260
/* 011F00 01DBDC00 00000000 */   nop
/* 011F04 01DBDC04 0B000224 */  addiu       $2, $0, 0xB
/* 011F08 01DBDC08 DC01013C */  lui         $1, %hi(BtActStatus + 0x14)
/* 011F0C 01DBDC0C 944422AC */  sw          $2, %lo(BtActStatus + 0x14)($1)
/* 011F10 01DBDC10 01000324 */  addiu       $3, $0, 0x1
/* 011F14 01DBDC14 DC01013C */  lui         $1, %hi(BtActStatus + 0x10)
/* 011F18 01DBDC18 904423AC */  sw          $3, %lo(BtActStatus + 0x10)($1)
/* 011F1C 01DBDC1C DC01013C */  lui         $1, %hi(BtActStatus + 0x18)
/* 011F20 01DBDC20 984420AC */  sw          $0, %lo(BtActStatus + 0x18)($1)
/* 011F24 01DBDC24 DC01013C */  lui         $1, %hi(BtActStatus + 0x5C)
/* 011F28 01DBDC28 DC4420AC */  sw          $0, %lo(BtActStatus + 0x5C)($1)
/* 011F2C 01DBDC2C DC01013C */  lui         $1, %hi(BtActStatus + 0x48)
/* 011F30 01DBDC30 C84420AC */  sw          $0, %lo(BtActStatus + 0x48)($1)
/* 011F34 01DBDC34 F041023C */  lui         $2, (0x41F00000 >> 16)
/* 011F38 01DBDC38 DC01013C */  lui         $1, %hi(BtActStatus + 0x1C)
/* 011F3C 01DBDC3C 9C4422AC */  sw          $2, %lo(BtActStatus + 0x1C)($1)
/* 011F40 01DBDC40 7C9D83AF */  sw          $3, -0x6284($28)
/* 011F44 01DBDC44 A4010424 */  addiu       $4, $0, 0x1A4
/* 011F48 01DBDC48 FFFF0524 */  addiu       $5, $0, -0x1
/* 011F4C 01DBDC4C 28360070 */  paddub      $6, $0, $0
/* 011F50 01DBDC50 AC69050C */  jal         SndSePlay__Fiii
/* 011F54 01DBDC54 00000000 */   nop
/* 011F58 01DBDC58 1E000324 */  addiu       $3, $0, 0x1E
/* 011F5C 01DBDC5C AC9E83AF */  sw          $3, -0x6154($28)
.L01DBDC60_2F9260:
/* 011F60 01DBDC60 0000BF7B */  lq          $31, 0x0($29)
/* 011F64 01DBDC64 1000BD27 */  addiu       $29, $29, 0x10
/* 011F68 01DBDC68 0800E003 */  jr          $31
/* 011F6C 01DBDC6C 00000000 */   nop
