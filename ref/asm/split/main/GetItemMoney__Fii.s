.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel GetItemMoney__Fii
/* 0E6FF0 001E6EF0 0800A010 */  beqz        $5, .L001E6F14
/* 0E6FF4 001E6EF4 00000000 */   nop
/* 0E6FF8 001E6EF8 80180400 */  sll         $3, $4, 2
/* 0E6FFC 001E6EFC 2900023C */  lui         $2, %hi(ext_func_info__3 + 0x19E)
/* 0E7000 001E6F00 3E1A4224 */  addiu       $2, $2, %lo(ext_func_info__3 + 0x19E)
/* 0E7004 001E6F04 21104300 */  addu        $2, $2, $3
/* 0E7008 001E6F08 00004284 */  lh          $2, 0x0($2)
/* 0E700C 001E6F0C 07000010 */  b           .L001E6F2C
/* 0E7010 001E6F10 00000000 */   nop
.L001E6F14:
/* 0E7014 001E6F14 80180400 */  sll         $3, $4, 2
/* 0E7018 001E6F18 2900023C */  lui         $2, %hi(ext_func_info__3 + 0x19C)
/* 0E701C 001E6F1C 3C1A4224 */  addiu       $2, $2, %lo(ext_func_info__3 + 0x19C)
/* 0E7020 001E6F20 21104300 */  addu        $2, $2, $3
/* 0E7024 001E6F24 00004284 */  lh          $2, 0x0($2)
/* 0E7028 001E6F28 00000000 */  nop
.L001E6F2C:
/* 0E702C 001E6F2C 0800E003 */  jr          $31
/* 0E7030 001E6F30 00000000 */   nop
/* 0E7034 001E6F34 00000000 */  nop
/* 0E7038 001E6F38 00000000 */  nop
/* 0E703C 001E6F3C 00000000 */  nop
