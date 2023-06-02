.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel _STATUS_SET_COL_OFF__FP12RS_STACKDATAi
/* E2FF0 001E2EF0 E0FFBD27 */  addiu      $sp, $sp, -0x20
/* E2FF4 001E2EF4 1000BF7F */  sq         $31, 0x10($sp)
/* E2FF8 001E2EF8 0000B07F */  sq         $16, 0x0($sp)
/* E2FFC 001E2EFC E09C828F */  lw         $2, -0x6320($gp)
/* E3000 001E2F00 9000508C */  lw         $16, 0x90($2)
/* E3004 001E2F04 9085070C */  jal        GetStackInt__FP12RS_STACKDATA_3
/* E3008 001E2F08 00000000 */   nop
/* E300C 001E2F0C E09C858F */  lw         $5, -0x6320($gp)
/* E3010 001E2F10 80181000 */  sll        $3, $16, 2
/* E3014 001E2F14 21207000 */  addu       $4, $3, $16
/* E3018 001E2F18 80180400 */  sll        $3, $4, 2
/* E301C 001E2F1C 21188300 */  addu       $3, $4, $3
/* E3020 001E2F20 00190300 */  sll        $3, $3, 4
/* E3024 001E2F24 21186500 */  addu       $3, $3, $5
/* E3028 001E2F28 0200013C */  lui        $at, (0x20000 >> 16)
/* E302C 001E2F2C 21086100 */  addu       $at, $3, $at
/* E3030 001E2F30 78E422AC */  sw         $2, -0x1B88($at)
/* E3034 001E2F34 01000224 */  addiu      $2, $0, 0x1
/* E3038 001E2F38 1000BF7B */  lq         $31, 0x10($sp)
/* E303C 001E2F3C 0000B07B */  lq         $16, 0x0($sp)
/* E3040 001E2F40 2000BD27 */  addiu      $sp, $sp, 0x20
/* E3044 001E2F44 0800E003 */  jr         $31
/* E3048 001E2F48 00000000 */   nop
/* E304C 001E2F4C 00000000 */  nop
