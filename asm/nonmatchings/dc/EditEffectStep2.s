.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel EditEffectStep2__Fv
/* 66EE0 00166DE0 F0FFBD27 */  addiu      $sp, $sp, -0x10
/* 66EE4 00166DE4 0000BF7F */  sq         $31, 0x0($sp)
/* 66EE8 00166DE8 D201023C */  lui        $2, %hi(Fire)
/* 66EEC 00166DEC F08E4424 */  addiu      $4, $2, %lo(Fire)
/* 66EF0 00166DF0 F085050C */  jal        FireCreate__9CFireOmniFv
/* 66EF4 00166DF4 00000000 */   nop
/* 66EF8 00166DF8 0000BF7B */  lq         $31, 0x0($sp)
/* 66EFC 00166DFC 1000BD27 */  addiu      $sp, $sp, 0x10
/* 66F00 00166E00 0800E003 */  jr         $31
/* 66F04 00166E04 00000000 */   nop
/* 66F08 00166E08 00000000 */  nop
/* 66F0C 00166E0C 00000000 */  nop
