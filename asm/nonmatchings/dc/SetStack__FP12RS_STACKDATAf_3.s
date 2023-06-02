.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel SetStack__FP12RS_STACKDATAf_3
/* E17F0 001E16F0 0000858C */  lw         $5, 0x0($4)
/* E17F4 001E16F4 03000324 */  addiu      $3, $0, 0x3
/* E17F8 001E16F8 0300A314 */  bne        $5, $3, .L001E1708
/* E17FC 001E16FC 00000000 */   nop
/* E1800 001E1700 0400838C */  lw         $3, 0x4($4)
/* E1804 001E1704 04006CE4 */  swc1       $f12, 0x4($3)
.L001E1708:
/* E1808 001E1708 0800E003 */  jr         $31
/* E180C 001E170C 00000000 */   nop
