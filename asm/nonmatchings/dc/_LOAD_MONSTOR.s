.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel _LOAD_MONSTOR__FP12RS_STACKDATAi
/* BC650 001BC550 F0FFBD27 */  addiu      $sp, $sp, -0x10
/* BC654 001BC554 0000BF7F */  sq         $31, 0x0($sp)
/* BC658 001BC558 28260070 */  paddub     $4, $0, $0
/* BC65C 001BC55C CCE4760C */  jal        func_1DB9330
/* BC660 001BC560 00000000 */   nop
/* BC664 001BC564 B8E4760C */  jal        func_1DB92E0
/* BC668 001BC568 00000000 */   nop
/* BC66C 001BC56C 01000224 */  addiu      $2, $0, 0x1
/* BC670 001BC570 0000BF7B */  lq         $31, 0x0($sp)
/* BC674 001BC574 1000BD27 */  addiu      $sp, $sp, 0x10
/* BC678 001BC578 0800E003 */  jr         $31
/* BC67C 001BC57C 00000000 */   nop
