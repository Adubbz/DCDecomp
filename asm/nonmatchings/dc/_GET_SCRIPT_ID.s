.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel _GET_SCRIPT_ID__FP12RS_STACKDATAi
/* E49F0 001E48F0 F0FFBD27 */  addiu      $sp, $sp, -0x10
/* E49F4 001E48F4 0000BF7F */  sq         $31, 0x0($sp)
/* E49F8 001E48F8 E09C828F */  lw         $2, -0x6320($gp)
/* E49FC 001E48FC 9000458C */  lw         $5, 0x90($2)
/* E4A00 001E4900 B485070C */  jal        SetStack__FP12RS_STACKDATAi_3
/* E4A04 001E4904 00000000 */   nop
/* E4A08 001E4908 01000224 */  addiu      $2, $0, 0x1
/* E4A0C 001E490C 0000BF7B */  lq         $31, 0x0($sp)
/* E4A10 001E4910 1000BD27 */  addiu      $sp, $sp, 0x10
/* E4A14 001E4914 0800E003 */  jr         $31
/* E4A18 001E4918 00000000 */   nop
/* E4A1C 001E491C 00000000 */  nop
