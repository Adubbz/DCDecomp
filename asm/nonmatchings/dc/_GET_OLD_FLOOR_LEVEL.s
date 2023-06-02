.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel _GET_OLD_FLOOR_LEVEL__FP12RS_STACKDATAi
/* BBB70 001BBA70 F0FFBD27 */  addiu      $sp, $sp, -0x10
/* BBB74 001BBA74 0000BF7F */  sq         $31, 0x0($sp)
/* BBB78 001BBA78 789C828F */  lw         $2, -0x6388($gp)
/* BBB7C 001BBA7C 03004580 */  lb         $5, 0x3($2)
/* BBB80 001BBA80 70EE060C */  jal        SetStack__FP12RS_STACKDATAi_2
/* BBB84 001BBA84 00000000 */   nop
/* BBB88 001BBA88 01000224 */  addiu      $2, $0, 0x1
/* BBB8C 001BBA8C 0000BF7B */  lq         $31, 0x0($sp)
/* BBB90 001BBA90 1000BD27 */  addiu      $sp, $sp, 0x10
/* BBB94 001BBA94 0800E003 */  jr         $31
/* BBB98 001BBA98 00000000 */   nop
/* BBB9C 001BBA9C 00000000 */  nop
