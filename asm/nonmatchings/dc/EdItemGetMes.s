.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel EdItemGetMes__Fiiii
/* 73B70 00173A70 F0FFBD27 */  addiu      $sp, $sp, -0x10
/* 73B74 00173A74 0000BF7F */  sq         $31, 0x0($sp)
/* 73B78 00173A78 282EC070 */  paddub     $5, $6, $0
/* 73B7C 00173A7C 2836E070 */  paddub     $6, $7, $0
/* 73B80 00173A80 01000724 */  addiu      $7, $0, 0x1
/* 73B84 00173A84 A480050C */  jal        ItemGetMes__Fiiii
/* 73B88 00173A88 00000000 */   nop
/* 73B8C 00173A8C 0000BF7B */  lq         $31, 0x0($sp)
/* 73B90 00173A90 1000BD27 */  addiu      $sp, $sp, 0x10
/* 73B94 00173A94 0800E003 */  jr         $31
/* 73B98 00173A98 00000000 */   nop
/* 73B9C 00173A9C 00000000 */  nop
