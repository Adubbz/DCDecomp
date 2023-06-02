.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel InitHaveAttach__FP11ATTACH_LIST
/* 12E5B0 0022E4B0 F0FFBD27 */  addiu      $sp, $sp, -0x10
/* 12E5B4 0022E4B4 0000BF7F */  sq         $31, 0x0($sp)
/* 12E5B8 0022E4B8 282E0070 */  paddub     $5, $0, $0
/* 12E5BC 0022E4BC 20000624 */  addiu      $6, $0, 0x20
/* 12E5C0 0022E4C0 5A0D040C */  jal        memset
/* 12E5C4 0022E4C4 00000000 */   nop
/* 12E5C8 0022E4C8 0000BF7B */  lq         $31, 0x0($sp)
/* 12E5CC 0022E4CC 1000BD27 */  addiu      $sp, $sp, 0x10
/* 12E5D0 0022E4D0 0800E003 */  jr         $31
/* 12E5D4 0022E4D4 00000000 */   nop
/* 12E5D8 0022E4D8 00000000 */  nop
/* 12E5DC 0022E4DC 00000000 */  nop
