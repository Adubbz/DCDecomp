.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel GetStackString__FP12RS_STACKDATA_3
/* E17C0 001E16C0 0400828C */  lw         $2, 0x4($4)
/* E17C4 001E16C4 0800E003 */  jr         $31
/* E17C8 001E16C8 00000000 */   nop
/* E17CC 001E16CC 00000000 */  nop
