.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel InitShopItemListData__FP13SHOP_ITEMLIST
/* E69F0 001E68F0 F0FFBD27 */  addiu      $sp, $sp, -0x10
/* E69F4 001E68F4 0000BF7F */  sq         $31, 0x0($sp)
/* E69F8 001E68F8 07008010 */  beqz       $4, .L001E6918
/* E69FC 001E68FC 00000000 */   nop
/* E6A00 001E6900 000080A4 */  sh         $0, 0x0($4)
/* E6A04 001E6904 04008424 */  addiu      $4, $4, 0x4
/* E6A08 001E6908 282E0070 */  paddub     $5, $0, $0
/* E6A0C 001E690C F8000624 */  addiu      $6, $0, 0xF8
/* E6A10 001E6910 5A0D040C */  jal        memset
/* E6A14 001E6914 00000000 */   nop
.L001E6918:
/* E6A18 001E6918 0000BF7B */  lq         $31, 0x0($sp)
/* E6A1C 001E691C 1000BD27 */  addiu      $sp, $sp, 0x10
/* E6A20 001E6920 0800E003 */  jr         $31
/* E6A24 001E6924 00000000 */   nop
/* E6A28 001E6928 00000000 */  nop
/* E6A2C 001E692C 00000000 */  nop
