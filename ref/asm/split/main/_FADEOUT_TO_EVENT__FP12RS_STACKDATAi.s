.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel _FADEOUT_TO_EVENT__FP12RS_STACKDATAi
/* 08C1F0 0018C0F0 F0FFBD27 */  addiu       $29, $29, -0x10
/* 08C1F4 0018C0F4 0000BF7F */  sq          $31, 0x0($29)
/* 08C1F8 0018C0F8 D428060C */  jal         GetStackInt__FP12RS_STACKDATA
/* 08C1FC 0018C0FC 00000000 */   nop
/* 08C200 0018C100 D401013C */  lui         $1, %hi(EdEventInfo + 0x440)
/* 08C204 0018C104 10D622AC */  sw          $2, %lo(EdEventInfo + 0x440)($1)
/* 08C208 0018C108 01000224 */  addiu       $2, $0, 0x1
/* 08C20C 0018C10C 0000BF7B */  lq          $31, 0x0($29)
/* 08C210 0018C110 1000BD27 */  addiu       $29, $29, 0x10
/* 08C214 0018C114 0800E003 */  jr          $31
/* 08C218 0018C118 00000000 */   nop
/* 08C21C 0018C11C 00000000 */  nop
