.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel GetStackString__FP12RS_STACKDATA
/* 08A4D0 0018A3D0 0400828C */  lw          $2, 0x4($4)
/* 08A4D4 0018A3D4 0800E003 */  jr          $31
/* 08A4D8 0018A3D8 00000000 */   nop
/* 08A4DC 0018A3DC 00000000 */  nop
