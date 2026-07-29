.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel GetNowSelectWeapon__Fv
/* 0F4000 001F3F00 DA01013C */  lui         $1, %hi(WepMenu + 0x5)
/* 0F4004 001F3F04 75EA2380 */  lb          $3, %lo(WepMenu + 0x5)($1)
/* 0F4008 001F3F08 D494848F */  lw          $4, -0x6B2C($28)
/* 0F400C 001F3F0C A80A0224 */  addiu       $2, $0, 0xAA8
/* 0F4010 001F3F10 18106200 */  mult        $2, $3, $2
/* 0F4014 001F3F14 21108200 */  addu        $2, $4, $2
/* 0F4018 001F3F18 0C454424 */  addiu       $4, $2, 0x450C
/* 0F401C 001F3F1C DA01013C */  lui         $1, %hi(WepMenu + 0x4)
/* 0F4020 001F3F20 74EA2380 */  lb          $3, %lo(WepMenu + 0x4)($1)
/* 0F4024 001F3F24 40110300 */  sll         $2, $3, 5
/* 0F4028 001F3F28 23104300 */  subu        $2, $2, $3
/* 0F402C 001F3F2C C0100200 */  sll         $2, $2, 3
/* 0F4030 001F3F30 21108200 */  addu        $2, $4, $2
/* 0F4034 001F3F34 0800E003 */  jr          $31
/* 0F4038 001F3F38 00000000 */   nop
/* 0F403C 001F3F3C 00000000 */  nop
