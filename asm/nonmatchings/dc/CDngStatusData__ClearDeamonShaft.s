.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel ClearDeamonShaft__14CDngStatusDataFv
/* BE150 001BE050 FFFF0324 */  addiu      $3, $0, -0x1
/* BE154 001BE054 C54283A0 */  sb         $3, 0x42C5($4)
/* BE158 001BE058 0800E003 */  jr         $31
/* BE15C 001BE05C 00000000 */   nop
