.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel ChargeShopLoop__Fv
/* E89C0 001E88C0 E0FFBD27 */  addiu      $sp, $sp, -0x20
/* E89C4 001E88C4 1000BF7F */  sq         $31, 0x10($sp)
/* E89C8 001E88C8 0000B07F */  sq         $16, 0x0($sp)
/* E89CC 001E88CC 38FB040C */  jal        ReadBG__Fv
/* E89D0 001E88D0 00000000 */   nop
/* E89D4 001E88D4 44A2070C */  jal        ChargeShopKey__Fv
/* E89D8 001E88D8 00000000 */   nop
/* E89DC 001E88DC 28864070 */  paddub     $16, $2, $0
/* E89E0 001E88E0 E8A9070C */  jal        DrawChargeShop__Fv
/* E89E4 001E88E4 00000000 */   nop
/* E89E8 001E88E8 03000012 */  beqz       $16, .L001E88F8
/* E89EC 001E88EC 00000000 */   nop
/* E89F0 001E88F0 28A2070C */  jal        ExitChargeShop__Fv
/* E89F4 001E88F4 00000000 */   nop
.L001E88F8:
/* E89F8 001E88F8 28160072 */  paddub     $2, $16, $0
/* E89FC 001E88FC 1000BF7B */  lq         $31, 0x10($sp)
/* E8A00 001E8900 0000B07B */  lq         $16, 0x0($sp)
/* E8A04 001E8904 2000BD27 */  addiu      $sp, $sp, 0x20
/* E8A08 001E8908 0800E003 */  jr         $31
/* E8A0C 001E890C 00000000 */   nop
