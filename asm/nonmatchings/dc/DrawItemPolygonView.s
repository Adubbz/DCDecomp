.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel DrawItemPolygonView__Fv
/* 12B2B0 0022B1B0 F0FFBD27 */  addiu      $sp, $sp, -0x10
/* 12B2B4 0022B1B4 0000BF7F */  sq         $31, 0x0($sp)
/* 12B2B8 0022B1B8 F894848F */  lw         $4, -0x6B08($gp)
/* 12B2BC 0022B1BC 38B4080C */  jal        MenuTextureReload__Fi
/* 12B2C0 0022B1C0 00000000 */   nop
/* 12B2C4 0022B1C4 80000424 */  addiu      $4, $0, 0x80
/* 12B2C8 0022B1C8 2300023C */  lui        $2, %hi(LocalDrawItemPolygonView__Fv)
/* 12B2CC 0022B1CC 40AF4524 */  addiu      $5, $2, %lo(LocalDrawItemPolygonView__Fv)
/* 12B2D0 0022B1D0 A4AF080C */  jal        MenuPolygonDraw__FiPFv_v
/* 12B2D4 0022B1D4 00000000 */   nop
/* 12B2D8 0022B1D8 0000BF7B */  lq         $31, 0x0($sp)
/* 12B2DC 0022B1DC 1000BD27 */  addiu      $sp, $sp, 0x10
/* 12B2E0 0022B1E0 0800E003 */  jr         $31
/* 12B2E4 0022B1E4 00000000 */   nop
/* 12B2E8 0022B1E8 00000000 */  nop
/* 12B2EC 0022B1EC 00000000 */  nop
