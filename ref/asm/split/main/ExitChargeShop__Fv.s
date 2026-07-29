.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel ExitChargeShop__Fv
/* 0E89A0 001E88A0 F0FFBD27 */  addiu       $29, $29, -0x10
/* 0E89A4 001E88A4 0000BF7F */  sq          $31, 0x0($29)
/* 0E89A8 001E88A8 E89E070C */  jal         ShopMenuExit__Fv
/* 0E89AC 001E88AC 00000000 */   nop
/* 0E89B0 001E88B0 0000BF7B */  lq          $31, 0x0($29)
/* 0E89B4 001E88B4 1000BD27 */  addiu       $29, $29, 0x10
/* 0E89B8 001E88B8 0800E003 */  jr          $31
/* 0E89BC 001E88BC 00000000 */   nop
