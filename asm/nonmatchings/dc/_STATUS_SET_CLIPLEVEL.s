.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel _STATUS_SET_CLIPLEVEL__FP12RS_STACKDATAi
/* E3600 001E3500 F0FFBD27 */  addiu      $sp, $sp, -0x10
/* E3604 001E3504 0000BF7F */  sq         $31, 0x0($sp)
/* E3608 001E3508 E09C828F */  lw         $2, -0x6320($gp)
/* E360C 001E350C 9000438C */  lw         $3, 0x90($2)
/* E3610 001E3510 A485070C */  jal        GetStackFloat__FP12RS_STACKDATA_3
/* E3614 001E3514 00000000 */   nop
/* E3618 001E3518 E09C848F */  lw         $4, -0x6320($gp)
/* E361C 001E351C 80100300 */  sll        $2, $3, 2
/* E3620 001E3520 21184300 */  addu       $3, $2, $3
/* E3624 001E3524 80100300 */  sll        $2, $3, 2
/* E3628 001E3528 21106200 */  addu       $2, $3, $2
/* E362C 001E352C 00110200 */  sll        $2, $2, 4
/* E3630 001E3530 21104400 */  addu       $2, $2, $4
/* E3634 001E3534 0200013C */  lui        $at, (0x20000 >> 16)
/* E3638 001E3538 21084100 */  addu       $at, $2, $at
/* E363C 001E353C 74E420E4 */  swc1       $f0, -0x1B8C($at)
/* E3640 001E3540 01000224 */  addiu      $2, $0, 0x1
/* E3644 001E3544 0000BF7B */  lq         $31, 0x0($sp)
/* E3648 001E3548 1000BD27 */  addiu      $sp, $sp, 0x10
/* E364C 001E354C 0800E003 */  jr         $31
/* E3650 001E3550 00000000 */   nop
/* E3654 001E3554 00000000 */  nop
/* E3658 001E3558 00000000 */  nop
/* E365C 001E355C 00000000 */  nop
