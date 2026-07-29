.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel GetAlt__9CEditAreaFfff
/* 06DEF0 0016DDF0 D0FFBD27 */  addiu       $29, $29, -0x30
/* 06DEF4 0016DDF4 1000BF7F */  sq          $31, 0x10($29)
/* 06DEF8 0016DDF8 0000B07F */  sq          $16, 0x0($29)
/* 06DEFC 0016DDFC 28868070 */  paddub      $16, $4, $0
/* 06DF00 0016DE00 2000A527 */  addiu       $5, $29, 0x20
/* 06DF04 0016DE04 20B6050C */  jal         GetPos__9CEditAreaFP11CVector3_i_fff
/* 06DF08 0016DE08 00000000 */   nop
/* 06DF0C 0016DE0C 28260072 */  paddub      $4, $16, $0
/* 06DF10 0016DE10 2000A58F */  lw          $5, 0x20($29)
/* 06DF14 0016DE14 2800A68F */  lw          $6, 0x28($29)
/* 06DF18 0016DE18 58B7050C */  jal         GetAlt__9CEditAreaFii
/* 06DF1C 0016DE1C 00000000 */   nop
/* 06DF20 0016DE20 1000BF7B */  lq          $31, 0x10($29)
/* 06DF24 0016DE24 0000B07B */  lq          $16, 0x0($29)
/* 06DF28 0016DE28 3000BD27 */  addiu       $29, $29, 0x30
/* 06DF2C 0016DE2C 0800E003 */  jr          $31
/* 06DF30 0016DE30 00000000 */   nop
/* 06DF34 0016DE34 00000000 */  nop
/* 06DF38 0016DE38 00000000 */  nop
/* 06DF3C 0016DE3C 00000000 */  nop
