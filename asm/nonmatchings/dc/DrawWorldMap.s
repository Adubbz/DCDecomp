.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel DrawWorldMap__Fi
/* 10A4E0 0020A3E0 E0FFBD27 */  addiu      $sp, $sp, -0x20
/* 10A4E4 0020A3E4 1000BF7F */  sq         $31, 0x10($sp)
/* 10A4E8 0020A3E8 0000B07F */  sq         $16, 0x0($sp)
/* 10A4EC 0020A3EC 28868070 */  paddub     $16, $4, $0
/* 10A4F0 0020A3F0 DA01013C */  lui        $at, (0x1DA0000 >> 16)
/* 10A4F4 0020A3F4 C4ED248C */  lw         $4, -0x123C($at)
/* 10A4F8 0020A3F8 38B4080C */  jal        MenuTextureReload__Fi
/* 10A4FC 0020A3FC 00000000 */   nop
/* 10A500 0020A400 28260072 */  paddub     $4, $16, $0
/* 10A504 0020A404 2100023C */  lui        $2, %hi(LocalDrawWorldMap__Fv)
/* 10A508 0020A408 70A34524 */  addiu      $5, $2, %lo(LocalDrawWorldMap__Fv)
/* 10A50C 0020A40C A4AF080C */  jal        MenuPolygonDraw__FiPFv_v
/* 10A510 0020A410 00000000 */   nop
/* 10A514 0020A414 1000BF7B */  lq         $31, 0x10($sp)
/* 10A518 0020A418 0000B07B */  lq         $16, 0x0($sp)
/* 10A51C 0020A41C 2000BD27 */  addiu      $sp, $sp, 0x20
/* 10A520 0020A420 0800E003 */  jr         $31
/* 10A524 0020A424 00000000 */   nop
/* 10A528 0020A428 00000000 */  nop
/* 10A52C 0020A42C 00000000 */  nop
