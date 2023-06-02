.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel GetAlt__9CEditAreaFfff
/* 6DEF0 0016DDF0 D0FFBD27 */  addiu      $sp, $sp, -0x30
/* 6DEF4 0016DDF4 1000BF7F */  sq         $31, 0x10($sp)
/* 6DEF8 0016DDF8 0000B07F */  sq         $16, 0x0($sp)
/* 6DEFC 0016DDFC 28868070 */  paddub     $16, $4, $0
/* 6DF00 0016DE00 2000A527 */  addiu      $5, $sp, 0x20
/* 6DF04 0016DE04 20B6050C */  jal        GetPos__9CEditAreaFP11CVector3_i_fff
/* 6DF08 0016DE08 00000000 */   nop
/* 6DF0C 0016DE0C 28260072 */  paddub     $4, $16, $0
/* 6DF10 0016DE10 2000A58F */  lw         $5, 0x20($sp)
/* 6DF14 0016DE14 2800A68F */  lw         $6, 0x28($sp)
/* 6DF18 0016DE18 58B7050C */  jal        GetAlt__9CEditAreaFii
/* 6DF1C 0016DE1C 00000000 */   nop
/* 6DF20 0016DE20 1000BF7B */  lq         $31, 0x10($sp)
/* 6DF24 0016DE24 0000B07B */  lq         $16, 0x0($sp)
/* 6DF28 0016DE28 3000BD27 */  addiu      $sp, $sp, 0x30
/* 6DF2C 0016DE2C 0800E003 */  jr         $31
/* 6DF30 0016DE30 00000000 */   nop
/* 6DF34 0016DE34 00000000 */  nop
/* 6DF38 0016DE38 00000000 */  nop
/* 6DF3C 0016DE3C 00000000 */  nop
