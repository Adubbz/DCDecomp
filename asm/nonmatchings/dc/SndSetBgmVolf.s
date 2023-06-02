.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel SndSetBgmVolf__Ff
/* 59E90 00159D90 E0FFBD27 */  addiu      $sp, $sp, -0x20
/* 59E94 00159D94 1000BF7F */  sq         $31, 0x10($sp)
/* 59E98 00159D98 0000B4E7 */  swc1       $f20, 0x0($sp)
/* 59E9C 00159D9C 06650046 */  mov.s      $f20, $f12
/* 59EA0 00159DA0 7C67050C */  jal        SndGetDefaultBgmVol__Fv
/* 59EA4 00159DA4 00000000 */   nop
/* 59EA8 00159DA8 00008244 */  mtc1       $2, $f0
/* 59EAC 00159DAC 00000000 */  nop
/* 59EB0 00159DB0 20008046 */  cvt.s.w    $f0, $f0
/* 59EB4 00159DB4 02A30046 */  mul.s      $f12, $f20, $f0
/* 59EB8 00159DB8 2C44040C */  jal        fptosi
/* 59EBC 00159DBC 00000000 */   nop
/* 59EC0 00159DC0 28264070 */  paddub     $4, $2, $0
/* 59EC4 00159DC4 4867050C */  jal        SndSetBgmVol__Fi
/* 59EC8 00159DC8 00000000 */   nop
/* 59ECC 00159DCC 1000BF7B */  lq         $31, 0x10($sp)
/* 59ED0 00159DD0 0000B4C7 */  lwc1       $f20, 0x0($sp)
/* 59ED4 00159DD4 2000BD27 */  addiu      $sp, $sp, 0x20
/* 59ED8 00159DD8 0800E003 */  jr         $31
/* 59EDC 00159DDC 00000000 */   nop
