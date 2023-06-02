.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel SetStack__FP12RS_STACKDATAi_2
/* BBAC0 001BB9C0 0000868C */  lw         $6, 0x0($4)
/* BBAC4 001BB9C4 03000324 */  addiu      $3, $0, 0x3
/* BBAC8 001BB9C8 0300C314 */  bne        $6, $3, .L001BB9D8
/* BBACC 001BB9CC 00000000 */   nop
/* BBAD0 001BB9D0 0400838C */  lw         $3, 0x4($4)
/* BBAD4 001BB9D4 040065AC */  sw         $5, 0x4($3)
.L001BB9D8:
/* BBAD8 001BB9D8 0800E003 */  jr         $31
/* BBADC 001BB9DC 00000000 */   nop
