.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel InitMes__10MenuClsMesFv
/* 10B680 0020B580 DB01033C */  lui        $3, %hi(EastKingMsgCls)
/* 10B684 0020B584 80906324 */  addiu      $3, $3, %lo(EastKingMsgCls)
/* 10B688 0020B588 1C0083AC */  sw         $3, 0x1C($4)
/* 10B68C 0020B58C 0800E003 */  jr         $31
/* 10B690 0020B590 00000000 */   nop
/* 10B694 0020B594 00000000 */  nop
/* 10B698 0020B598 00000000 */  nop
/* 10B69C 0020B59C 00000000 */  nop
