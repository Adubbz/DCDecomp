.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel _STATUS_SET_LOCKON_DIST__FP12RS_STACKDATAi
/* 0E3750 001E3650 F0FFBD27 */  addiu       $29, $29, -0x10
/* 0E3754 001E3654 0000BF7F */  sq          $31, 0x0($29)
/* 0E3758 001E3658 E09C828F */  lw          $2, -0x6320($28)
/* 0E375C 001E365C 9000438C */  lw          $3, 0x90($2)
/* 0E3760 001E3660 A485070C */  jal         GetStackFloat__FP12RS_STACKDATA__3
/* 0E3764 001E3664 00000000 */   nop
/* 0E3768 001E3668 E09C848F */  lw          $4, -0x6320($28)
/* 0E376C 001E366C 80100300 */  sll         $2, $3, 2
/* 0E3770 001E3670 21184300 */  addu        $3, $2, $3
/* 0E3774 001E3674 80100300 */  sll         $2, $3, 2
/* 0E3778 001E3678 21106200 */  addu        $2, $3, $2
/* 0E377C 001E367C 00110200 */  sll         $2, $2, 4
/* 0E3780 001E3680 21104400 */  addu        $2, $2, $4
/* 0E3784 001E3684 0200013C */  lui         $1, (0x20000 >> 16)
/* 0E3788 001E3688 21084100 */  addu        $1, $2, $1
/* 0E378C 001E368C E8E420E4 */  swc1        $f0, -0x1B18($1)
/* 0E3790 001E3690 01000224 */  addiu       $2, $0, 0x1
/* 0E3794 001E3694 0000BF7B */  lq          $31, 0x0($29)
/* 0E3798 001E3698 1000BD27 */  addiu       $29, $29, 0x10
/* 0E379C 001E369C 0800E003 */  jr          $31
/* 0E37A0 001E36A0 00000000 */   nop
/* 0E37A4 001E36A4 00000000 */  nop
/* 0E37A8 001E36A8 00000000 */  nop
/* 0E37AC 001E36AC 00000000 */  nop
