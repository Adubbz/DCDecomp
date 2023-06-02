.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel SetStack__FP12RS_STACKDATAi_3
/* E17D0 001E16D0 0000868C */  lw         $6, 0x0($4)
/* E17D4 001E16D4 03000324 */  addiu      $3, $0, 0x3
/* E17D8 001E16D8 0300C314 */  bne        $6, $3, .L001E16E8
/* E17DC 001E16DC 00000000 */   nop
/* E17E0 001E16E0 0400838C */  lw         $3, 0x4($4)
/* E17E4 001E16E4 040065AC */  sw         $5, 0x4($3)
.L001E16E8:
/* E17E8 001E16E8 0800E003 */  jr         $31
/* E17EC 001E16EC 00000000 */   nop
