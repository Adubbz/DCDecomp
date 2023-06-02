.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel _SET_FISHING_ESA__FP12RS_STACKDATAi
/* 96DB0 00196CB0 F0FFBD27 */  addiu      $sp, $sp, -0x10
/* 96DB4 00196CB4 0000BF7F */  sq         $31, 0x0($sp)
/* 96DB8 00196CB8 D428060C */  jal        GetStackInt__FP12RS_STACKDATA
/* 96DBC 00196CBC 00000000 */   nop
/* 96DC0 00196CC0 28264070 */  paddub     $4, $2, $0
/* 96DC4 00196CC4 D401013C */  lui        $at, (0x1D40000 >> 16)
/* 96DC8 00196CC8 2CD4258C */  lw         $5, -0x2BD4($at)
/* 96DCC 00196CCC 28000624 */  addiu      $6, $0, 0x28
/* 96DD0 00196CD0 D4A3060C */  jal        FishingLoadEsa__FiP9CFrameVu1i
/* 96DD4 00196CD4 00000000 */   nop
/* 96DD8 00196CD8 01000224 */  addiu      $2, $0, 0x1
/* 96DDC 00196CDC 0000BF7B */  lq         $31, 0x0($sp)
/* 96DE0 00196CE0 1000BD27 */  addiu      $sp, $sp, 0x10
/* 96DE4 00196CE4 0800E003 */  jr         $31
/* 96DE8 00196CE8 00000000 */   nop
/* 96DEC 00196CEC 00000000 */  nop
