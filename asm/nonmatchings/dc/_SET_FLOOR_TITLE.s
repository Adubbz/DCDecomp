.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel _SET_FLOOR_TITLE__FP12RS_STACKDATAi
/* BD0E0 001BCFE0 F0FFBD27 */  addiu      $sp, $sp, -0x10
/* BD0E4 001BCFE4 0000BF7F */  sq         $31, 0x0($sp)
/* BD0E8 001BCFE8 A404770C */  jal        func_1DC1290
/* BD0EC 001BCFEC 00000000 */   nop
/* BD0F0 001BCFF0 01000224 */  addiu      $2, $0, 0x1
/* BD0F4 001BCFF4 0000BF7B */  lq         $31, 0x0($sp)
/* BD0F8 001BCFF8 1000BD27 */  addiu      $sp, $sp, 0x10
/* BD0FC 001BCFFC 0800E003 */  jr         $31
/* BD100 001BD000 00000000 */   nop
/* BD104 001BD004 00000000 */  nop
/* BD108 001BD008 00000000 */  nop
/* BD10C 001BD00C 00000000 */  nop
