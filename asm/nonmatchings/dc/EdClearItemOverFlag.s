.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel EdClearItemOverFlag__Fv
/* 73340 00173240 F0FFBD27 */  addiu      $sp, $sp, -0x10
/* 73344 00173244 0000BF7F */  sq         $31, 0x0($sp)
/* 73348 00173248 1C8D848F */  lw         $4, -0x72E4($gp)
/* 7334C 0017324C 7860050C */  jal        GetDngStatus__9CSaveDataFv
/* 73350 00173250 00000000 */   nop
/* 73354 00173254 1C4340AC */  sw         $0, 0x431C($2)
/* 73358 00173258 0000BF7B */  lq         $31, 0x0($sp)
/* 7335C 0017325C 1000BD27 */  addiu      $sp, $sp, 0x10
/* 73360 00173260 0800E003 */  jr         $31
/* 73364 00173264 00000000 */   nop
/* 73368 00173268 00000000 */  nop
/* 7336C 0017326C 00000000 */  nop
