.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel SaveMenuKeyFadeIn__Fv
/* 120E90 00220D90 DB01013C */  lui        $at, (0x1DB0000 >> 16)
/* 120E94 00220D94 F88A228C */  lw         $2, -0x7508($at)
/* 120E98 00220D98 0F004128 */  slti       $at, $2, 0xF
/* 120E9C 00220D9C 06002014 */  bnez       $at, .L00220DB8
/* 120EA0 00220DA0 00000000 */   nop
/* 120EA4 00220DA4 07000224 */  addiu      $2, $0, 0x7
/* 120EA8 00220DA8 DB01013C */  lui        $at, (0x1DB0000 >> 16)
/* 120EAC 00220DAC D48A22AC */  sw         $2, -0x752C($at)
/* 120EB0 00220DB0 DB01013C */  lui        $at, (0x1DB0000 >> 16)
/* 120EB4 00220DB4 F88A20AC */  sw         $0, -0x7508($at)
.L00220DB8:
/* 120EB8 00220DB8 01000224 */  addiu      $2, $0, 0x1
/* 120EBC 00220DBC 0800E003 */  jr         $31
/* 120EC0 00220DC0 00000000 */   nop
/* 120EC4 00220DC4 00000000 */  nop
/* 120EC8 00220DC8 00000000 */  nop
/* 120ECC 00220DCC 00000000 */  nop
