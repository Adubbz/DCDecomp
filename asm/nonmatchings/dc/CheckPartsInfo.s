.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel CheckPartsInfo__FP14EDITPARTS_INFO
/* 9A090 00199F90 0800828C */  lw         $2, 0x8($4)
/* 9A094 00199F94 04004014 */  bnez       $2, .L00199FA8
/* 9A098 00199F98 00000000 */   nop
/* 9A09C 00199F9C 28160070 */  paddub     $2, $0, $0
/* 9A0A0 00199FA0 08000010 */  b          .L00199FC4
/* 9A0A4 00199FA4 00000000 */   nop
.L00199FA8:
/* 9A0A8 00199FA8 1800828C */  lw         $2, 0x18($4)
/* 9A0AC 00199FAC 0400401C */  bgtz       $2, .L00199FC0
/* 9A0B0 00199FB0 00000000 */   nop
/* 9A0B4 00199FB4 28160070 */  paddub     $2, $0, $0
/* 9A0B8 00199FB8 02000010 */  b          .L00199FC4
/* 9A0BC 00199FBC 00000000 */   nop
.L00199FC0:
/* 9A0C0 00199FC0 01000224 */  addiu      $2, $0, 0x1
.L00199FC4:
/* 9A0C4 00199FC4 0800E003 */  jr         $31
/* 9A0C8 00199FC8 00000000 */   nop
/* 9A0CC 00199FCC 00000000 */  nop
