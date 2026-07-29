.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel _STATUS_GET_DMG_ID__FP12RS_STACKDATAi
/* 0E3700 001E3600 F0FFBD27 */  addiu       $29, $29, -0x10
/* 0E3704 001E3604 0000BF7F */  sq          $31, 0x0($29)
/* 0E3708 001E3608 E09C858F */  lw          $5, -0x6320($28)
/* 0E370C 001E360C 9000A38C */  lw          $3, 0x90($5)
/* 0E3710 001E3610 80100300 */  sll         $2, $3, 2
/* 0E3714 001E3614 21184300 */  addu        $3, $2, $3
/* 0E3718 001E3618 80100300 */  sll         $2, $3, 2
/* 0E371C 001E361C 21106200 */  addu        $2, $3, $2
/* 0E3720 001E3620 00110200 */  sll         $2, $2, 4
/* 0E3724 001E3624 21104500 */  addu        $2, $2, $5
/* 0E3728 001E3628 0200013C */  lui         $1, (0x20000 >> 16)
/* 0E372C 001E362C 21084100 */  addu        $1, $2, $1
/* 0E3730 001E3630 94E4258C */  lw          $5, -0x1B6C($1)
/* 0E3734 001E3634 B485070C */  jal         SetStack__FP12RS_STACKDATAi__3
/* 0E3738 001E3638 00000000 */   nop
/* 0E373C 001E363C 01000224 */  addiu       $2, $0, 0x1
/* 0E3740 001E3640 0000BF7B */  lq          $31, 0x0($29)
/* 0E3744 001E3644 1000BD27 */  addiu       $29, $29, 0x10
/* 0E3748 001E3648 0800E003 */  jr          $31
/* 0E374C 001E364C 00000000 */   nop
