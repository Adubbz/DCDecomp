.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel _SET_FLOOR_LEVEL__FP12RS_STACKDATAi
/* BBB30 001BBA30 F0FFBD27 */  addiu      $sp, $sp, -0x10
/* BBB34 001BBA34 0000BF7F */  sq         $31, 0x0($sp)
/* BBB38 001BBA38 4CEE060C */  jal        GetStackInt__FP12RS_STACKDATA_2
/* BBB3C 001BBA3C 00000000 */   nop
/* BBB40 001BBA40 789C848F */  lw         $4, -0x6388($gp)
/* BBB44 001BBA44 282E4070 */  paddub     $5, $2, $0
/* BBB48 001BBA48 40F6060C */  jal        SetNowFloor__14CDngStatusDataFi
/* BBB4C 001BBA4C 00000000 */   nop
/* BBB50 001BBA50 01000224 */  addiu      $2, $0, 0x1
/* BBB54 001BBA54 0000BF7B */  lq         $31, 0x0($sp)
/* BBB58 001BBA58 1000BD27 */  addiu      $sp, $sp, 0x10
/* BBB5C 001BBA5C 0800E003 */  jr         $31
/* BBB60 001BBA60 00000000 */   nop
/* BBB64 001BBA64 00000000 */  nop
/* BBB68 001BBA68 00000000 */  nop
/* BBB6C 001BBA6C 00000000 */  nop
