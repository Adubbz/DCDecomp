.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel _FADEOUT_TO_EVENT__FP12RS_STACKDATAi
/* 8C1F0 0018C0F0 F0FFBD27 */  addiu      $sp, $sp, -0x10
/* 8C1F4 0018C0F4 0000BF7F */  sq         $31, 0x0($sp)
/* 8C1F8 0018C0F8 D428060C */  jal        GetStackInt__FP12RS_STACKDATA
/* 8C1FC 0018C0FC 00000000 */   nop
/* 8C200 0018C100 D401013C */  lui        $at, (0x1D40000 >> 16)
/* 8C204 0018C104 10D622AC */  sw         $2, -0x29F0($at)
/* 8C208 0018C108 01000224 */  addiu      $2, $0, 0x1
/* 8C20C 0018C10C 0000BF7B */  lq         $31, 0x0($sp)
/* 8C210 0018C110 1000BD27 */  addiu      $sp, $sp, 0x10
/* 8C214 0018C114 0800E003 */  jr         $31
/* 8C218 0018C118 00000000 */   nop
/* 8C21C 0018C11C 00000000 */  nop
