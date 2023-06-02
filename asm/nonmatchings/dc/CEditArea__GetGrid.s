.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel GetGrid__9CEditAreaFP11CVector3_f_fff
/* 6ED90 0016EC90 C0FFBD27 */  addiu      $sp, $sp, -0x40
/* 6ED94 0016EC94 2000BF7F */  sq         $31, 0x20($sp)
/* 6ED98 0016EC98 1000B17F */  sq         $17, 0x10($sp)
/* 6ED9C 0016EC9C 0000B07F */  sq         $16, 0x0($sp)
/* 6EDA0 0016ECA0 288E8070 */  paddub     $17, $4, $0
/* 6EDA4 0016ECA4 2886A070 */  paddub     $16, $5, $0
/* 6EDA8 0016ECA8 3000A527 */  addiu      $5, $sp, 0x30
/* 6EDAC 0016ECAC 20B6050C */  jal        GetPos__9CEditAreaFP11CVector3_i_fff
/* 6EDB0 0016ECB0 00000000 */   nop
/* 6EDB4 0016ECB4 28262072 */  paddub     $4, $17, $0
/* 6EDB8 0016ECB8 282E0072 */  paddub     $5, $16, $0
/* 6EDBC 0016ECBC 3000A68F */  lw         $6, 0x30($sp)
/* 6EDC0 0016ECC0 3400A78F */  lw         $7, 0x34($sp)
/* 6EDC4 0016ECC4 3800A88F */  lw         $8, 0x38($sp)
/* 6EDC8 0016ECC8 48B6050C */  jal        GetPos__9CEditAreaFP11CVector3_f_iii
/* 6EDCC 0016ECCC 00000000 */   nop
/* 6EDD0 0016ECD0 2000BF7B */  lq         $31, 0x20($sp)
/* 6EDD4 0016ECD4 1000B17B */  lq         $17, 0x10($sp)
/* 6EDD8 0016ECD8 0000B07B */  lq         $16, 0x0($sp)
/* 6EDDC 0016ECDC 4000BD27 */  addiu      $sp, $sp, 0x40
/* 6EDE0 0016ECE0 0800E003 */  jr         $31
/* 6EDE4 0016ECE4 00000000 */   nop
/* 6EDE8 0016ECE8 00000000 */  nop
/* 6EDEC 0016ECEC 00000000 */  nop
