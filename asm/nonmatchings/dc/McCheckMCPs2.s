.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel McCheckMCPs2__FP12MC_CARD_INFO
/* 116E50 00216D50 0000828C */  lw         $2, 0x0($4)
/* 116E54 00216D54 05004010 */  beqz       $2, .L00216D6C
/* 116E58 00216D58 00000000 */   nop
/* 116E5C 00216D5C 0400838C */  lw         $3, 0x4($4)
/* 116E60 00216D60 02000224 */  addiu      $2, $0, 0x2
/* 116E64 00216D64 04006210 */  beq        $3, $2, .L00216D78
/* 116E68 00216D68 00000000 */   nop
.L00216D6C:
/* 116E6C 00216D6C 28160070 */  paddub     $2, $0, $0
/* 116E70 00216D70 02000010 */  b          .L00216D7C
/* 116E74 00216D74 00000000 */   nop
.L00216D78:
/* 116E78 00216D78 01000224 */  addiu      $2, $0, 0x1
.L00216D7C:
/* 116E7C 00216D7C 0800E003 */  jr         $31
/* 116E80 00216D80 00000000 */   nop
/* 116E84 00216D84 00000000 */  nop
/* 116E88 00216D88 00000000 */  nop
/* 116E8C 00216D8C 00000000 */  nop
