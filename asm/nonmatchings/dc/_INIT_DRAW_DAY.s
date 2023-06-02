.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel _INIT_DRAW_DAY__FP12RS_STACKDATAi
/* 94040 00193F40 F0FFBD27 */  addiu      $sp, $sp, -0x10
/* 94044 00193F44 0000BF7F */  sq         $31, 0x0($sp)
/* 94048 00193F48 0CF4050C */  jal        EdInitDrawDay__Fv
/* 9404C 00193F4C 00000000 */   nop
/* 94050 00193F50 01000224 */  addiu      $2, $0, 0x1
/* 94054 00193F54 0000BF7B */  lq         $31, 0x0($sp)
/* 94058 00193F58 1000BD27 */  addiu      $sp, $sp, 0x10
/* 9405C 00193F5C 0800E003 */  jr         $31
/* 94060 00193F60 00000000 */   nop
/* 94064 00193F64 00000000 */  nop
/* 94068 00193F68 00000000 */  nop
/* 9406C 00193F6C 00000000 */  nop
