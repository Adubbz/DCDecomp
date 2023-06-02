.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel GetStackFloat__FP12RS_STACKDATA_3
/* E1790 001E1690 0000828C */  lw         $2, 0x0($4)
/* E1794 001E1694 05004014 */  bnez       $2, .L001E16AC
/* E1798 001E1698 00000000 */   nop
/* E179C 001E169C 040080C4 */  lwc1       $f0, 0x4($4)
/* E17A0 001E16A0 20008046 */  cvt.s.w    $f0, $f0
/* E17A4 001E16A4 03000010 */  b          .L001E16B4
/* E17A8 001E16A8 00000000 */   nop
.L001E16AC:
/* E17AC 001E16AC 040080C4 */  lwc1       $f0, 0x4($4)
/* E17B0 001E16B0 00000000 */  nop
.L001E16B4:
/* E17B4 001E16B4 0800E003 */  jr         $31
/* E17B8 001E16B8 00000000 */   nop
/* E17BC 001E16BC 00000000 */  nop
