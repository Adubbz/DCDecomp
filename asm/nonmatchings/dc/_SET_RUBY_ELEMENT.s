.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel _SET_RUBY_ELEMENT__FP12RS_STACKDATAi
/* BD140 001BD040 F0FFBD27 */  addiu      $sp, $sp, -0x10
/* BD144 001BD044 0000BF7F */  sq         $31, 0x0($sp)
/* BD148 001BD048 4CEE060C */  jal        GetStackInt__FP12RS_STACKDATA_2
/* BD14C 001BD04C 00000000 */   nop
/* BD150 001BD050 01000224 */  addiu      $2, $0, 0x1
/* BD154 001BD054 0000BF7B */  lq         $31, 0x0($sp)
/* BD158 001BD058 1000BD27 */  addiu      $sp, $sp, 0x10
/* BD15C 001BD05C 0800E003 */  jr         $31
/* BD160 001BD060 00000000 */   nop
/* BD164 001BD064 00000000 */  nop
/* BD168 001BD068 00000000 */  nop
/* BD16C 001BD06C 00000000 */  nop
