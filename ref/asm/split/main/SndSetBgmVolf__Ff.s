.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel SndSetBgmVolf__Ff
/* 059E90 00159D90 E0FFBD27 */  addiu       $29, $29, -0x20
/* 059E94 00159D94 1000BF7F */  sq          $31, 0x10($29)
/* 059E98 00159D98 0000B4E7 */  swc1        $f20, 0x0($29)
/* 059E9C 00159D9C 06650046 */  mov.s       $f20, $f12
/* 059EA0 00159DA0 7C67050C */  jal         SndGetDefaultBgmVol__Fv
/* 059EA4 00159DA4 00000000 */   nop
/* 059EA8 00159DA8 00008244 */  mtc1        $2, $f0
/* 059EAC 00159DAC 00000000 */  nop
/* 059EB0 00159DB0 20008046 */  cvt.s.w     $f0, $f0
/* 059EB4 00159DB4 02A30046 */  mul.s       $f12, $f20, $f0
/* 059EB8 00159DB8 2C44040C */  jal         fptosi
/* 059EBC 00159DBC 00000000 */   nop
/* 059EC0 00159DC0 28264070 */  paddub      $4, $2, $0
/* 059EC4 00159DC4 4867050C */  jal         SndSetBgmVol__Fi
/* 059EC8 00159DC8 00000000 */   nop
/* 059ECC 00159DCC 1000BF7B */  lq          $31, 0x10($29)
/* 059ED0 00159DD0 0000B4C7 */  lwc1        $f20, 0x0($29)
/* 059ED4 00159DD4 2000BD27 */  addiu       $29, $29, 0x20
/* 059ED8 00159DD8 0800E003 */  jr          $31
/* 059EDC 00159DDC 00000000 */   nop
