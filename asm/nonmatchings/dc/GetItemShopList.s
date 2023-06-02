.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel GetItemShopList__Fi
/* E69D0 001E68D0 80100400 */  sll        $2, $4, 2
/* E69D4 001E68D4 21104400 */  addu       $2, $2, $4
/* E69D8 001E68D8 C0180200 */  sll        $3, $2, 3
/* E69DC 001E68DC 2900023C */  lui        $2, %hi(ItemShopList2)
/* E69E0 001E68E0 20204224 */  addiu      $2, $2, %lo(ItemShopList2)
/* E69E4 001E68E4 21104300 */  addu       $2, $2, $3
/* E69E8 001E68E8 0800E003 */  jr         $31
/* E69EC 001E68EC 00000000 */   nop
