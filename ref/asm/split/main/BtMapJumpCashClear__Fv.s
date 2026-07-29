.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel BtMapJumpCashClear__Fv
/* 0B21C0 001B20C0 D501013C */  lui         $1, %hi(BtCfgCash)
/* 0B21C4 001B20C4 C06520A0 */  sb          $0, %lo(BtCfgCash)($1)
/* 0B21C8 001B20C8 DC9380AF */  sw          $0, -0x6C24($28)
/* 0B21CC 001B20CC FFFF0324 */  addiu       $3, $0, -0x1
/* 0B21D0 001B20D0 E09383AF */  sw          $3, -0x6C20($28)
/* 0B21D4 001B20D4 0800E003 */  jr          $31
/* 0B21D8 001B20D8 00000000 */   nop
/* 0B21DC 001B20DC 00000000 */  nop
