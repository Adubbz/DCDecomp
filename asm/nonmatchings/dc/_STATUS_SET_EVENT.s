.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel _STATUS_SET_EVENT__FP12RS_STACKDATAi
/* E2F80 001E2E80 F0FFBD27 */  addiu      $sp, $sp, -0x10
/* E2F84 001E2E84 0000BF7F */  sq         $31, 0x0($sp)
/* E2F88 001E2E88 9085070C */  jal        GetStackInt__FP12RS_STACKDATA_3
/* E2F8C 001E2E8C 00000000 */   nop
/* E2F90 001E2E90 E09C838F */  lw         $3, -0x6320($gp)
/* E2F94 001E2E94 940062AC */  sw         $2, 0x94($3)
/* E2F98 001E2E98 01000224 */  addiu      $2, $0, 0x1
/* E2F9C 001E2E9C 0000BF7B */  lq         $31, 0x0($sp)
/* E2FA0 001E2EA0 1000BD27 */  addiu      $sp, $sp, 0x10
/* E2FA4 001E2EA4 0800E003 */  jr         $31
/* E2FA8 001E2EA8 00000000 */   nop
/* E2FAC 001E2EAC 00000000 */  nop
