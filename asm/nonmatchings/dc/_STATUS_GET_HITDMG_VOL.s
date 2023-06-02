.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel _STATUS_GET_HITDMG_VOL__FP12RS_STACKDATAi
/* E3660 001E3560 F0FFBD27 */  addiu      $sp, $sp, -0x10
/* E3664 001E3564 0000BF7F */  sq         $31, 0x0($sp)
/* E3668 001E3568 E09C858F */  lw         $5, -0x6320($gp)
/* E366C 001E356C 9000A38C */  lw         $3, 0x90($5)
/* E3670 001E3570 80100300 */  sll        $2, $3, 2
/* E3674 001E3574 21184300 */  addu       $3, $2, $3
/* E3678 001E3578 80100300 */  sll        $2, $3, 2
/* E367C 001E357C 21106200 */  addu       $2, $3, $2
/* E3680 001E3580 00110200 */  sll        $2, $2, 4
/* E3684 001E3584 21104500 */  addu       $2, $2, $5
/* E3688 001E3588 0200013C */  lui        $at, (0x20000 >> 16)
/* E368C 001E358C 21084100 */  addu       $at, $2, $at
/* E3690 001E3590 90E4258C */  lw         $5, -0x1B70($at)
/* E3694 001E3594 B485070C */  jal        SetStack__FP12RS_STACKDATAi_3
/* E3698 001E3598 00000000 */   nop
/* E369C 001E359C 01000224 */  addiu      $2, $0, 0x1
/* E36A0 001E35A0 0000BF7B */  lq         $31, 0x0($sp)
/* E36A4 001E35A4 1000BD27 */  addiu      $sp, $sp, 0x10
/* E36A8 001E35A8 0800E003 */  jr         $31
/* E36AC 001E35AC 00000000 */   nop
