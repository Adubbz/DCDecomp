.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel _SET_FISHING_ESA__FP12RS_STACKDATAi
/* 096DB0 00196CB0 F0FFBD27 */  addiu       $29, $29, -0x10
/* 096DB4 00196CB4 0000BF7F */  sq          $31, 0x0($29)
/* 096DB8 00196CB8 D428060C */  jal         GetStackInt__FP12RS_STACKDATA
/* 096DBC 00196CBC 00000000 */   nop
/* 096DC0 00196CC0 28264070 */  paddub      $4, $2, $0
/* 096DC4 00196CC4 D401013C */  lui         $1, %hi(EdEventInfo + 0x25C)
/* 096DC8 00196CC8 2CD4258C */  lw          $5, %lo(EdEventInfo + 0x25C)($1)
/* 096DCC 00196CCC 28000624 */  addiu       $6, $0, 0x28
/* 096DD0 00196CD0 D4A3060C */  jal         FishingLoadEsa__FiP9CFrameVu1i
/* 096DD4 00196CD4 00000000 */   nop
/* 096DD8 00196CD8 01000224 */  addiu       $2, $0, 0x1
/* 096DDC 00196CDC 0000BF7B */  lq          $31, 0x0($29)
/* 096DE0 00196CE0 1000BD27 */  addiu       $29, $29, 0x10
/* 096DE4 00196CE4 0800E003 */  jr          $31
/* 096DE8 00196CE8 00000000 */   nop
/* 096DEC 00196CEC 00000000 */  nop
