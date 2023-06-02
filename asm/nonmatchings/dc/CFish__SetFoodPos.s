.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel SetFoodPos__5CFishFiPff
/* 140DD0 00240CD0 D0FFBD27 */  addiu      $sp, $sp, -0x30
/* 140DD4 00240CD4 2000BF7F */  sq         $31, 0x20($sp)
/* 140DD8 00240CD8 1000B07F */  sq         $16, 0x10($sp)
/* 140DDC 00240CDC 0000B4E7 */  swc1       $f20, 0x0($sp)
/* 140DE0 00240CE0 28868070 */  paddub     $16, $4, $0
/* 140DE4 00240CE4 06650046 */  mov.s      $f20, $f12
/* 140DE8 00240CE8 880085AC */  sw         $5, 0x88($4)
/* 140DEC 00240CEC 90000426 */  addiu      $4, $16, 0x90
/* 140DF0 00240CF0 282EC070 */  paddub     $5, $6, $0
/* 140DF4 00240CF4 0C86040C */  jal        sceVu0CopyVector
/* 140DF8 00240CF8 00000000 */   nop
/* 140DFC 00240CFC 8C0014E6 */  swc1       $f20, 0x8C($16)
/* 140E00 00240D00 2000BF7B */  lq         $31, 0x20($sp)
/* 140E04 00240D04 1000B07B */  lq         $16, 0x10($sp)
/* 140E08 00240D08 0000B4C7 */  lwc1       $f20, 0x0($sp)
/* 140E0C 00240D0C 3000BD27 */  addiu      $sp, $sp, 0x30
/* 140E10 00240D10 0800E003 */  jr         $31
/* 140E14 00240D14 00000000 */   nop
/* 140E18 00240D18 00000000 */  nop
/* 140E1C 00240D1C 00000000 */  nop
