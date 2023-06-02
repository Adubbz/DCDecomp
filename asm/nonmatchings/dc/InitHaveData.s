.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel InitHaveData__FP9IHAVEITEM
/* 12E540 0022E440 F0FFBD27 */  addiu      $sp, $sp, -0x10
/* 12E544 0022E444 0000BF7F */  sq         $31, 0x0($sp)
/* 12E548 0022E448 FFFF0524 */  addiu      $5, $0, -0x1
/* 12E54C 0022E44C 14000624 */  addiu      $6, $0, 0x14
/* 12E550 0022E450 5A0D040C */  jal        memset
/* 12E554 0022E454 00000000 */   nop
/* 12E558 0022E458 0000BF7B */  lq         $31, 0x0($sp)
/* 12E55C 0022E45C 1000BD27 */  addiu      $sp, $sp, 0x10
/* 12E560 0022E460 0800E003 */  jr         $31
/* 12E564 0022E464 00000000 */   nop
/* 12E568 0022E468 00000000 */  nop
/* 12E56C 0022E46C 00000000 */  nop
