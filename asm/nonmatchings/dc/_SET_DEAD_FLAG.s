.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel _SET_DEAD_FLAG__FP12RS_STACKDATAi
/* BD070 001BCF70 F0FFBD27 */  addiu      $sp, $sp, -0x10
/* BD074 001BCF74 0000BF7F */  sq         $31, 0x0($sp)
/* BD078 001BCF78 789C848F */  lw         $4, -0x6388($gp)
/* BD07C 001BCF7C BCFB060C */  jal        SetDead__14CDngStatusDataFv
/* BD080 001BCF80 00000000 */   nop
/* BD084 001BCF84 01000224 */  addiu      $2, $0, 0x1
/* BD088 001BCF88 0000BF7B */  lq         $31, 0x0($sp)
/* BD08C 001BCF8C 1000BD27 */  addiu      $sp, $sp, 0x10
/* BD090 001BCF90 0800E003 */  jr         $31
/* BD094 001BCF94 00000000 */   nop
/* BD098 001BCF98 00000000 */  nop
/* BD09C 001BCF9C 00000000 */  nop
