.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel MGInitVSyncCallBack__FPFi_i
/* 2C800 0012C700 1C8C838F */  lw         $3, -0x73E4($gp)
/* 2C804 0012C704 FEFF6014 */  bnez       $3, MGInitVSyncCallBack__FPFi_i
/* 2C808 0012C708 00000000 */   nop
/* 2C80C 0012C70C 188C84AF */  sw         $4, -0x73E8($gp)
/* 2C810 0012C710 0800E003 */  jr         $31
/* 2C814 0012C714 00000000 */   nop
/* 2C818 0012C718 00000000 */  nop
/* 2C81C 0012C71C 00000000 */  nop
