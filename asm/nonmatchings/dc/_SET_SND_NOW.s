.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel _SET_SND_NOW__FP12RS_STACKDATAi
/* E48F0 001E47F0 F0FFBD27 */  addiu      $sp, $sp, -0x10
/* E48F4 001E47F4 0000BF7F */  sq         $31, 0x0($sp)
/* E48F8 001E47F8 9085070C */  jal        GetStackInt__FP12RS_STACKDATA_3
/* E48FC 001E47FC 00000000 */   nop
/* E4900 001E4800 28264070 */  paddub     $4, $2, $0
/* E4904 001E4804 FFFF0524 */  addiu      $5, $0, -0x1
/* E4908 001E4808 28360070 */  paddub     $6, $0, $0
/* E490C 001E480C AC69050C */  jal        SndSePlay__Fiii
/* E4910 001E4810 00000000 */   nop
/* E4914 001E4814 01000224 */  addiu      $2, $0, 0x1
/* E4918 001E4818 0000BF7B */  lq         $31, 0x0($sp)
/* E491C 001E481C 1000BD27 */  addiu      $sp, $sp, 0x10
/* E4920 001E4820 0800E003 */  jr         $31
/* E4924 001E4824 00000000 */   nop
/* E4928 001E4828 00000000 */  nop
/* E492C 001E482C 00000000 */  nop
