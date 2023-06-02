.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel EBInitialize__Fv
/* 68200 00168100 9C8E80AF */  sw         $0, -0x7164($gp)
/* 68204 00168104 0800E003 */  jr         $31
/* 68208 00168108 00000000 */   nop
/* 6820C 0016810C 00000000 */  nop
