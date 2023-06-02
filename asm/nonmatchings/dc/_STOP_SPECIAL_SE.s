.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel _STOP_SPECIAL_SE__FP12RS_STACKDATAi
/* 96400 00196300 F0FFBD27 */  addiu      $sp, $sp, -0x10
/* 96404 00196304 0000BF7F */  sq         $31, 0x0($sp)
/* 96408 00196308 D428060C */  jal        GetStackInt__FP12RS_STACKDATA
/* 9640C 0019630C 00000000 */   nop
/* 96410 00196310 28264070 */  paddub     $4, $2, $0
/* 96414 00196314 406E050C */  jal        SndSPSeStop__Fi
/* 96418 00196318 00000000 */   nop
/* 9641C 0019631C 01000224 */  addiu      $2, $0, 0x1
/* 96420 00196320 0000BF7B */  lq         $31, 0x0($sp)
/* 96424 00196324 1000BD27 */  addiu      $sp, $sp, 0x10
/* 96428 00196328 0800E003 */  jr         $31
/* 9642C 0019632C 00000000 */   nop
