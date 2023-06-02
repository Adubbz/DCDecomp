.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel EdUseItemInit__Fv
/* 72CD0 00172BD0 64000324 */  addiu      $3, $0, 0x64
/* 72CD4 00172BD4 D201013C */  lui        $at, (0x1D20000 >> 16)
/* 72CD8 00172BD8 009A23AC */  sw         $3, -0x6600($at)
/* 72CDC 00172BDC FFFF0324 */  addiu      $3, $0, -0x1
/* 72CE0 00172BE0 D201013C */  lui        $at, (0x1D20000 >> 16)
/* 72CE4 00172BE4 049A23AC */  sw         $3, -0x65FC($at)
/* 72CE8 00172BE8 708F83AF */  sw         $3, -0x7090($gp)
/* 72CEC 00172BEC 0800E003 */  jr         $31
/* 72CF0 00172BF0 00000000 */   nop
/* 72CF4 00172BF4 00000000 */  nop
/* 72CF8 00172BF8 00000000 */  nop
/* 72CFC 00172BFC 00000000 */  nop
