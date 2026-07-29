.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel _GET_BGM_VOL__FP12RS_STACKDATAi
/* 095EB0 00195DB0 E0FFBD27 */  addiu       $29, $29, -0x20
/* 095EB4 00195DB4 1000BF7F */  sq          $31, 0x10($29)
/* 095EB8 00195DB8 0000B07F */  sq          $16, 0x0($29)
/* 095EBC 00195DBC 28868070 */  paddub      $16, $4, $0
/* 095EC0 00195DC0 7867050C */  jal         SndGetBgmVol__Fv
/* 095EC4 00195DC4 00000000 */   nop
/* 095EC8 00195DC8 28260072 */  paddub      $4, $16, $0
/* 095ECC 00195DCC 282E4070 */  paddub      $5, $2, $0
/* 095ED0 00195DD0 F828060C */  jal         SetStack__FP12RS_STACKDATAi
/* 095ED4 00195DD4 00000000 */   nop
/* 095ED8 00195DD8 01000224 */  addiu       $2, $0, 0x1
/* 095EDC 00195DDC 1000BF7B */  lq          $31, 0x10($29)
/* 095EE0 00195DE0 0000B07B */  lq          $16, 0x0($29)
/* 095EE4 00195DE4 2000BD27 */  addiu       $29, $29, 0x20
/* 095EE8 00195DE8 0800E003 */  jr          $31
/* 095EEC 00195DEC 00000000 */   nop
