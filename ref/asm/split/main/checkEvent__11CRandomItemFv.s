.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel checkEvent__11CRandomItemFv
/* 0D6FF0 001D6EF0 282E0070 */  paddub      $5, $0, $0
/* 0D6FF4 001D6EF4 0C000010 */  b           .L001D6F28
/* 0D6FF8 001D6EF8 00000000 */   nop
.L001D6EFC:
/* 0D6FFC 001D6EFC 80100500 */  sll         $2, $5, 2
/* 0D7000 001D6F00 21104400 */  addu        $2, $2, $4
/* 0D7004 001D6F04 94044624 */  addiu       $6, $2, 0x494
/* 0D7008 001D6F08 9404428C */  lw          $2, 0x494($2)
/* 0D700C 001D6F0C FFFF0324 */  addiu       $3, $0, -0x1
/* 0D7010 001D6F10 04004310 */  beq         $2, $3, .L001D6F24
/* 0D7014 001D6F14 00000000 */   nop
/* 0D7018 001D6F18 0000C3AC */  sw          $3, 0x0($6)
/* 0D701C 001D6F1C 06000010 */  b           .L001D6F38
/* 0D7020 001D6F20 00000000 */   nop
.L001D6F24:
/* 0D7024 001D6F24 0100A524 */  addiu       $5, $5, 0x1
.L001D6F28:
/* 0D7028 001D6F28 2000A228 */  slti        $2, $5, 0x20
/* 0D702C 001D6F2C F3FF4014 */  bnez        $2, .L001D6EFC
/* 0D7030 001D6F30 00000000 */   nop
/* 0D7034 001D6F34 FFFF0224 */  addiu       $2, $0, -0x1
.L001D6F38:
/* 0D7038 001D6F38 0800E003 */  jr          $31
/* 0D703C 001D6F3C 00000000 */   nop
