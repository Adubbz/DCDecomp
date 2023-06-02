.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel GetNowSelectWeapon__Fv
/* F4000 001F3F00 DA01013C */  lui        $at, (0x1DA0000 >> 16)
/* F4004 001F3F04 75EA2380 */  lb         $3, -0x158B($at)
/* F4008 001F3F08 D494848F */  lw         $4, -0x6B2C($gp)
/* F400C 001F3F0C A80A0224 */  addiu      $2, $0, 0xAA8
/* F4010 001F3F10 18106200 */  mult       $2, $3, $2
/* F4014 001F3F14 21108200 */  addu       $2, $4, $2
/* F4018 001F3F18 0C454424 */  addiu      $4, $2, 0x450C
/* F401C 001F3F1C DA01013C */  lui        $at, (0x1DA0000 >> 16)
/* F4020 001F3F20 74EA2380 */  lb         $3, -0x158C($at)
/* F4024 001F3F24 40110300 */  sll        $2, $3, 5
/* F4028 001F3F28 23104300 */  subu       $2, $2, $3
/* F402C 001F3F2C C0100200 */  sll        $2, $2, 3
/* F4030 001F3F30 21108200 */  addu       $2, $4, $2
/* F4034 001F3F34 0800E003 */  jr         $31
/* F4038 001F3F38 00000000 */   nop
/* F403C 001F3F3C 00000000 */  nop
