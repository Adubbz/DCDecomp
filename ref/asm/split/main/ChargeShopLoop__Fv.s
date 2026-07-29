.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel ChargeShopLoop__Fv
/* 0E89C0 001E88C0 E0FFBD27 */  addiu       $29, $29, -0x20
/* 0E89C4 001E88C4 1000BF7F */  sq          $31, 0x10($29)
/* 0E89C8 001E88C8 0000B07F */  sq          $16, 0x0($29)
/* 0E89CC 001E88CC 38FB040C */  jal         ReadBG__Fv
/* 0E89D0 001E88D0 00000000 */   nop
/* 0E89D4 001E88D4 44A2070C */  jal         ChargeShopKey__Fv
/* 0E89D8 001E88D8 00000000 */   nop
/* 0E89DC 001E88DC 28864070 */  paddub      $16, $2, $0
/* 0E89E0 001E88E0 E8A9070C */  jal         DrawChargeShop__Fv
/* 0E89E4 001E88E4 00000000 */   nop
/* 0E89E8 001E88E8 03000012 */  beqz        $16, .L001E88F8
/* 0E89EC 001E88EC 00000000 */   nop
/* 0E89F0 001E88F0 28A2070C */  jal         ExitChargeShop__Fv
/* 0E89F4 001E88F4 00000000 */   nop
.L001E88F8:
/* 0E89F8 001E88F8 28160072 */  paddub      $2, $16, $0
/* 0E89FC 001E88FC 1000BF7B */  lq          $31, 0x10($29)
/* 0E8A00 001E8900 0000B07B */  lq          $16, 0x0($29)
/* 0E8A04 001E8904 2000BD27 */  addiu       $29, $29, 0x20
/* 0E8A08 001E8908 0800E003 */  jr          $31
/* 0E8A0C 001E890C 00000000 */   nop
