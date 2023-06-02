.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel _RUN_SCRIPT__FP12RS_STACKDATAi
/* E2FB0 001E2EB0 F0FFBD27 */  addiu      $sp, $sp, -0x10
/* E2FB4 001E2EB4 0000BF7F */  sq         $31, 0x0($sp)
/* E2FB8 001E2EB8 9085070C */  jal        GetStackInt__FP12RS_STACKDATA_3
/* E2FBC 001E2EBC 00000000 */   nop
/* E2FC0 001E2EC0 E09C838F */  lw         $3, -0x6320($gp)
/* E2FC4 001E2EC4 940062AC */  sw         $2, 0x94($3)
/* E2FC8 001E2EC8 2A00023C */  lui        $2, %hi(_870)
/* E2FCC 001E2ECC 38D04424 */  addiu      $4, $2, %lo(_870)
/* E2FD0 001E2ED0 A611040C */  jal        printf
/* E2FD4 001E2ED4 00000000 */   nop
/* E2FD8 001E2ED8 01000224 */  addiu      $2, $0, 0x1
/* E2FDC 001E2EDC 0000BF7B */  lq         $31, 0x0($sp)
/* E2FE0 001E2EE0 1000BD27 */  addiu      $sp, $sp, 0x10
/* E2FE4 001E2EE4 0800E003 */  jr         $31
/* E2FE8 001E2EE8 00000000 */   nop
/* E2FEC 001E2EEC 00000000 */  nop
