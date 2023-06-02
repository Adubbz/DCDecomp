.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel GetItemMoney__Fii
/* E6FF0 001E6EF0 0800A010 */  beqz       $5, .L001E6F14
/* E6FF4 001E6EF4 00000000 */   nop
/* E6FF8 001E6EF8 80180400 */  sll        $3, $4, 2
/* E6FFC 001E6EFC 2900023C */  lui        $2, %hi(ext_func_info_3 + 0x19E)
/* E7000 001E6F00 3E1A4224 */  addiu      $2, $2, %lo(ext_func_info_3 + 0x19E)
/* E7004 001E6F04 21104300 */  addu       $2, $2, $3
/* E7008 001E6F08 00004284 */  lh         $2, 0x0($2)
/* E700C 001E6F0C 07000010 */  b          .L001E6F2C
/* E7010 001E6F10 00000000 */   nop
.L001E6F14:
/* E7014 001E6F14 80180400 */  sll        $3, $4, 2
/* E7018 001E6F18 2900023C */  lui        $2, %hi(ext_func_info_3 + 0x19C)
/* E701C 001E6F1C 3C1A4224 */  addiu      $2, $2, %lo(ext_func_info_3 + 0x19C)
/* E7020 001E6F20 21104300 */  addu       $2, $2, $3
/* E7024 001E6F24 00004284 */  lh         $2, 0x0($2)
/* E7028 001E6F28 00000000 */  nop
.L001E6F2C:
/* E702C 001E6F2C 0800E003 */  jr         $31
/* E7030 001E6F30 00000000 */   nop
/* E7034 001E6F34 00000000 */  nop
/* E7038 001E6F38 00000000 */  nop
/* E703C 001E6F3C 00000000 */  nop
