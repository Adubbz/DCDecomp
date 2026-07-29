.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel GetItemShopList__Fi
/* 0E69D0 001E68D0 80100400 */  sll         $2, $4, 2
/* 0E69D4 001E68D4 21104400 */  addu        $2, $2, $4
/* 0E69D8 001E68D8 C0180200 */  sll         $3, $2, 3
/* 0E69DC 001E68DC 2900023C */  lui         $2, %hi(ItemShopList2)
/* 0E69E0 001E68E0 20204224 */  addiu       $2, $2, %lo(ItemShopList2)
/* 0E69E4 001E68E4 21104300 */  addu        $2, $2, $3
/* 0E69E8 001E68E8 0800E003 */  jr          $31
/* 0E69EC 001E68EC 00000000 */   nop
