.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel _GET_FLOOR_LEVEL__FP12RS_STACKDATAi
/* BBB00 001BBA00 F0FFBD27 */  addiu      $sp, $sp, -0x10
/* BBB04 001BBA04 0000BF7F */  sq         $31, 0x0($sp)
/* BBB08 001BBA08 789C828F */  lw         $2, -0x6388($gp)
/* BBB0C 001BBA0C 02004580 */  lb         $5, 0x2($2)
/* BBB10 001BBA10 70EE060C */  jal        SetStack__FP12RS_STACKDATAi_2
/* BBB14 001BBA14 00000000 */   nop
/* BBB18 001BBA18 01000224 */  addiu      $2, $0, 0x1
/* BBB1C 001BBA1C 0000BF7B */  lq         $31, 0x0($sp)
/* BBB20 001BBA20 1000BD27 */  addiu      $sp, $sp, 0x10
/* BBB24 001BBA24 0800E003 */  jr         $31
/* BBB28 001BBA28 00000000 */   nop
/* BBB2C 001BBA2C 00000000 */  nop
