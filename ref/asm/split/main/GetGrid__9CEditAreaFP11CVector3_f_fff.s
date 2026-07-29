.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel GetGrid__9CEditAreaFP11CVector3_f_fff
/* 06ED90 0016EC90 C0FFBD27 */  addiu       $29, $29, -0x40
/* 06ED94 0016EC94 2000BF7F */  sq          $31, 0x20($29)
/* 06ED98 0016EC98 1000B17F */  sq          $17, 0x10($29)
/* 06ED9C 0016EC9C 0000B07F */  sq          $16, 0x0($29)
/* 06EDA0 0016ECA0 288E8070 */  paddub      $17, $4, $0
/* 06EDA4 0016ECA4 2886A070 */  paddub      $16, $5, $0
/* 06EDA8 0016ECA8 3000A527 */  addiu       $5, $29, 0x30
/* 06EDAC 0016ECAC 20B6050C */  jal         GetPos__9CEditAreaFP11CVector3_i_fff
/* 06EDB0 0016ECB0 00000000 */   nop
/* 06EDB4 0016ECB4 28262072 */  paddub      $4, $17, $0
/* 06EDB8 0016ECB8 282E0072 */  paddub      $5, $16, $0
/* 06EDBC 0016ECBC 3000A68F */  lw          $6, 0x30($29)
/* 06EDC0 0016ECC0 3400A78F */  lw          $7, 0x34($29)
/* 06EDC4 0016ECC4 3800A88F */  lw          $8, 0x38($29)
/* 06EDC8 0016ECC8 48B6050C */  jal         GetPos__9CEditAreaFP11CVector3_f_iii
/* 06EDCC 0016ECCC 00000000 */   nop
/* 06EDD0 0016ECD0 2000BF7B */  lq          $31, 0x20($29)
/* 06EDD4 0016ECD4 1000B17B */  lq          $17, 0x10($29)
/* 06EDD8 0016ECD8 0000B07B */  lq          $16, 0x0($29)
/* 06EDDC 0016ECDC 4000BD27 */  addiu       $29, $29, 0x40
/* 06EDE0 0016ECE0 0800E003 */  jr          $31
/* 06EDE4 0016ECE4 00000000 */   nop
/* 06EDE8 0016ECE8 00000000 */  nop
/* 06EDEC 0016ECEC 00000000 */  nop
