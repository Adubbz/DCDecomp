.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel _STATUS_GET_DMG_ID__FP12RS_STACKDATAi
/* E3700 001E3600 F0FFBD27 */  addiu      $sp, $sp, -0x10
/* E3704 001E3604 0000BF7F */  sq         $31, 0x0($sp)
/* E3708 001E3608 E09C858F */  lw         $5, -0x6320($gp)
/* E370C 001E360C 9000A38C */  lw         $3, 0x90($5)
/* E3710 001E3610 80100300 */  sll        $2, $3, 2
/* E3714 001E3614 21184300 */  addu       $3, $2, $3
/* E3718 001E3618 80100300 */  sll        $2, $3, 2
/* E371C 001E361C 21106200 */  addu       $2, $3, $2
/* E3720 001E3620 00110200 */  sll        $2, $2, 4
/* E3724 001E3624 21104500 */  addu       $2, $2, $5
/* E3728 001E3628 0200013C */  lui        $at, (0x20000 >> 16)
/* E372C 001E362C 21084100 */  addu       $at, $2, $at
/* E3730 001E3630 94E4258C */  lw         $5, -0x1B6C($at)
/* E3734 001E3634 B485070C */  jal        SetStack__FP12RS_STACKDATAi_3
/* E3738 001E3638 00000000 */   nop
/* E373C 001E363C 01000224 */  addiu      $2, $0, 0x1
/* E3740 001E3640 0000BF7B */  lq         $31, 0x0($sp)
/* E3744 001E3644 1000BD27 */  addiu      $sp, $sp, 0x10
/* E3748 001E3648 0800E003 */  jr         $31
/* E374C 001E364C 00000000 */   nop
