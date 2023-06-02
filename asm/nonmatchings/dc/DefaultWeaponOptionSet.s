.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel DefaultWeaponOptionSet__Fi
/* 10F8B0 0020F7B0 F0FFBD27 */  addiu      $sp, $sp, -0x10
/* 10F8B4 0020F7B4 0000BF7F */  sq         $31, 0x0($sp)
/* 10F8B8 0020F7B8 D443070C */  jal        GetWeaponData__Fi
/* 10F8BC 0020F7BC 00000000 */   nop
/* 10F8C0 0020F7C0 04004014 */  bnez       $2, .L0020F7D4
/* 10F8C4 0020F7C4 00000000 */   nop
/* 10F8C8 0020F7C8 01000224 */  addiu      $2, $0, 0x1
/* 10F8CC 0020F7CC 03000010 */  b          .L0020F7DC
/* 10F8D0 0020F7D0 00000000 */   nop
.L0020F7D4:
/* 10F8D4 0020F7D4 38004284 */  lh         $2, 0x38($2)
/* 10F8D8 0020F7D8 00000000 */  nop
.L0020F7DC:
/* 10F8DC 0020F7DC 0000BF7B */  lq         $31, 0x0($sp)
/* 10F8E0 0020F7E0 1000BD27 */  addiu      $sp, $sp, 0x10
/* 10F8E4 0020F7E4 0800E003 */  jr         $31
/* 10F8E8 0020F7E8 00000000 */   nop
/* 10F8EC 0020F7EC 00000000 */  nop
