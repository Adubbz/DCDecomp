.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel ExitChargeShop__Fv
/* E89A0 001E88A0 F0FFBD27 */  addiu      $sp, $sp, -0x10
/* E89A4 001E88A4 0000BF7F */  sq         $31, 0x0($sp)
/* E89A8 001E88A8 E89E070C */  jal        ShopMenuExit__Fv
/* E89AC 001E88AC 00000000 */   nop
/* E89B0 001E88B0 0000BF7B */  lq         $31, 0x0($sp)
/* E89B4 001E88B4 1000BD27 */  addiu      $sp, $sp, 0x10
/* E89B8 001E88B8 0800E003 */  jr         $31
/* E89BC 001E88BC 00000000 */   nop
