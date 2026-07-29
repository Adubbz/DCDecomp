.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel MGInitVSyncCallBack__FPFi_i
MGInitVSyncCallBack__FPFi_i$b:
/* 02C800 0012C700 1C8C838F */  lw          $3, -0x73E4($28)
/* 02C804 0012C704 FEFF6014 */  bnez        $3, MGInitVSyncCallBack__FPFi_i$b
/* 02C808 0012C708 00000000 */   nop
/* 02C80C 0012C70C 188C84AF */  sw          $4, -0x73E8($28)
/* 02C810 0012C710 0800E003 */  jr          $31
/* 02C814 0012C714 00000000 */   nop
/* 02C818 0012C718 00000000 */  nop
/* 02C81C 0012C71C 00000000 */  nop
