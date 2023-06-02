.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel CommandALLOC_SHADOW_DBUFF__FPPv
/* 3AB00 0013AA00 F0FFBD27 */  addiu      $sp, $sp, -0x10
/* 3AB04 0013AA04 0000BF7F */  sq         $31, 0x0($sp)
/* 3AB08 0013AA08 E08C838F */  lw         $3, -0x7320($gp)
/* 3AB0C 0013AA0C 08006128 */  slti       $at, $3, 0x8
/* 3AB10 0013AA10 0B002010 */  beqz       $at, .L0013AA40
/* 3AB14 0013AA14 00000000 */   nop
/* 3AB18 0013AA18 01006224 */  addiu      $2, $3, 0x1
/* 3AB1C 0013AA1C E08C82AF */  sw         $2, -0x7320($gp)
/* 3AB20 0013AA20 00190300 */  sll        $3, $3, 4
/* 3AB24 0013AA24 C801023C */  lui        $2, %hi(alloc_sdbuff)
/* 3AB28 0013AA28 20B04224 */  addiu      $2, $2, %lo(alloc_sdbuff)
/* 3AB2C 0013AA2C 21104300 */  addu       $2, $2, $3
/* 3AB30 0013AA30 0000858C */  lw         $5, 0x0($4)
/* 3AB34 0013AA34 28264070 */  paddub     $4, $2, $0
/* 3AB38 0013AA38 5A15040C */  jal        strcpy
/* 3AB3C 0013AA3C 00000000 */   nop
.L0013AA40:
/* 3AB40 0013AA40 0000BF7B */  lq         $31, 0x0($sp)
/* 3AB44 0013AA44 1000BD27 */  addiu      $sp, $sp, 0x10
/* 3AB48 0013AA48 0800E003 */  jr         $31
/* 3AB4C 0013AA4C 00000000 */   nop
