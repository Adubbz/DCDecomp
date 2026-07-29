.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel _INIT_DRAW_DAY__FP12RS_STACKDATAi
/* 094040 00193F40 F0FFBD27 */  addiu       $29, $29, -0x10
/* 094044 00193F44 0000BF7F */  sq          $31, 0x0($29)
/* 094048 00193F48 0CF4050C */  jal         EdInitDrawDay__Fv
/* 09404C 00193F4C 00000000 */   nop
/* 094050 00193F50 01000224 */  addiu       $2, $0, 0x1
/* 094054 00193F54 0000BF7B */  lq          $31, 0x0($29)
/* 094058 00193F58 1000BD27 */  addiu       $29, $29, 0x10
/* 09405C 00193F5C 0800E003 */  jr          $31
/* 094060 00193F60 00000000 */   nop
/* 094064 00193F64 00000000 */  nop
/* 094068 00193F68 00000000 */  nop
/* 09406C 00193F6C 00000000 */  nop
