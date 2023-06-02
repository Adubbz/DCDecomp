.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel CommandSIZE__FPPv
/* 3FC80 0013FB80 0000838C */  lw         $3, 0x0($4)
/* 3FC84 0013FB84 0000658C */  lw         $5, 0x0($3)
/* 3FC88 0013FB88 0400838C */  lw         $3, 0x4($4)
/* 3FC8C 0013FB8C 0000648C */  lw         $4, 0x0($3)
/* 3FC90 0013FB90 0200A01C */  bgtz       $5, .L0013FB9C
/* 3FC94 0013FB94 00000000 */   nop
/* 3FC98 0013FB98 01000524 */  addiu      $5, $0, 0x1
.L0013FB9C:
/* 3FC9C 0013FB9C 1100A128 */  slti       $at, $5, 0x11
/* 3FCA0 0013FBA0 02002014 */  bnez       $at, .L0013FBAC
/* 3FCA4 0013FBA4 00000000 */   nop
/* 3FCA8 0013FBA8 10000524 */  addiu      $5, $0, 0x10
.L0013FBAC:
/* 3FCAC 0013FBAC 0200801C */  bgtz       $4, .L0013FBB8
/* 3FCB0 0013FBB0 00000000 */   nop
/* 3FCB4 0013FBB4 01000424 */  addiu      $4, $0, 0x1
.L0013FBB8:
/* 3FCB8 0013FBB8 11008128 */  slti       $at, $4, 0x11
/* 3FCBC 0013FBBC 02002014 */  bnez       $at, .L0013FBC8
/* 3FCC0 0013FBC0 00000000 */   nop
/* 3FCC4 0013FBC4 10000424 */  addiu      $4, $0, 0x10
.L0013FBC8:
/* 3FCC8 0013FBC8 0C8D838F */  lw         $3, -0x72F4($gp)
/* 3FCCC 0013FBCC 2C0065AC */  sw         $5, 0x2C($3)
/* 3FCD0 0013FBD0 0C8D838F */  lw         $3, -0x72F4($gp)
/* 3FCD4 0013FBD4 300064AC */  sw         $4, 0x30($3)
/* 3FCD8 0013FBD8 0800E003 */  jr         $31
/* 3FCDC 0013FBDC 00000000 */   nop
