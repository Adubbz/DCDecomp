.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel BattleActionOn_Ruby__Fv
/* 011200 01DBCF00 F0FFBD27 */  addiu       $29, $29, -0x10
/* 011204 01DBCF04 0000BF7F */  sq          $31, 0x0($29)
/* 011208 01DBCF08 DC01013C */  lui         $1, %hi(BtActStatus + 0x10)
/* 01120C 01DBCF0C 9044238C */  lw          $3, %lo(BtActStatus + 0x10)($1)
/* 011210 01DBCF10 15006014 */  bnez        $3, .L01DBCF68_2F8568
/* 011214 01DBCF14 00000000 */   nop
/* 011218 01DBCF18 DC01013C */  lui         $1, %hi(BtActStatus + 0x48)
/* 01121C 01DBCF1C C8442CC4 */  lwc1        $f12, %lo(BtActStatus + 0x48)($1)
/* 011220 01DBCF20 2C44040C */  jal         fptosi
/* 011224 01DBCF24 00000000 */   nop
/* 011228 01DBCF28 64000324 */  addiu       $3, $0, 0x64
/* 01122C 01DBCF2C 0E004314 */  bne         $2, $3, .L01DBCF68_2F8568
/* 011230 01DBCF30 00000000 */   nop
/* 011234 01DBCF34 DC01013C */  lui         $1, %hi(BtActStatus + 0x18)
/* 011238 01DBCF38 984420AC */  sw          $0, %lo(BtActStatus + 0x18)($1)
/* 01123C 01DBCF3C 0B000324 */  addiu       $3, $0, 0xB
/* 011240 01DBCF40 DC01013C */  lui         $1, %hi(BtActStatus + 0x14)
/* 011244 01DBCF44 944423AC */  sw          $3, %lo(BtActStatus + 0x14)($1)
/* 011248 01DBCF48 01000324 */  addiu       $3, $0, 0x1
/* 01124C 01DBCF4C DC01013C */  lui         $1, %hi(BtActStatus + 0x10)
/* 011250 01DBCF50 904423AC */  sw          $3, %lo(BtActStatus + 0x10)($1)
/* 011254 01DBCF54 DC01013C */  lui         $1, %hi(BtActStatus + 0x48)
/* 011258 01DBCF58 C84420AC */  sw          $0, %lo(BtActStatus + 0x48)($1)
/* 01125C 01DBCF5C DC01013C */  lui         $1, %hi(BtActStatus + 0x1C)
/* 011260 01DBCF60 9C4420AC */  sw          $0, %lo(BtActStatus + 0x1C)($1)
/* 011264 01DBCF64 7C9D83AF */  sw          $3, -0x6284($28)
.L01DBCF68_2F8568:
/* 011268 01DBCF68 0000BF7B */  lq          $31, 0x0($29)
/* 01126C 01DBCF6C 1000BD27 */  addiu       $29, $29, 0x10
/* 011270 01DBCF70 0800E003 */  jr          $31
/* 011274 01DBCF74 00000000 */   nop
/* 011278 01DBCF78 00000000 */  nop
/* 01127C 01DBCF7C 00000000 */  nop
