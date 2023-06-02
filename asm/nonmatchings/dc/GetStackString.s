.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel GetStackString__FP12RS_STACKDATA
/* 8A4D0 0018A3D0 0400828C */  lw         $2, 0x4($4)
/* 8A4D4 0018A3D4 0800E003 */  jr         $31
/* 8A4D8 0018A3D8 00000000 */   nop
/* 8A4DC 0018A3DC 00000000 */  nop
