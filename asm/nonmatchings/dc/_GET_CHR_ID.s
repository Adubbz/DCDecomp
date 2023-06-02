.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel _GET_CHR_ID__FP12RS_STACKDATAi
/* E4970 001E4870 F0FFBD27 */  addiu      $sp, $sp, -0x10
/* E4974 001E4874 0000BF7F */  sq         $31, 0x0($sp)
/* E4978 001E4878 789C828F */  lw         $2, -0x6388($gp)
/* E497C 001E487C 04004580 */  lb         $5, 0x4($2)
/* E4980 001E4880 B485070C */  jal        SetStack__FP12RS_STACKDATAi_3
/* E4984 001E4884 00000000 */   nop
/* E4988 001E4888 01000224 */  addiu      $2, $0, 0x1
/* E498C 001E488C 0000BF7B */  lq         $31, 0x0($sp)
/* E4990 001E4890 1000BD27 */  addiu      $sp, $sp, 0x10
/* E4994 001E4894 0800E003 */  jr         $31
/* E4998 001E4898 00000000 */   nop
/* E499C 001E489C 00000000 */  nop
