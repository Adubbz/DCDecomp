.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel GetPolygon__13CCollisionMDTFiPA4_fPA4_fPA4_f
/* 024FC0 00124EC0 3000838C */  lw          $3, 0x30($4)
/* 024FC4 00124EC4 04006014 */  bnez        $3, .L00124ED8
/* 024FC8 00124EC8 00000000 */   nop
/* 024FCC 00124ECC 28160070 */  paddub      $2, $0, $0
/* 024FD0 00124ED0 0B000010 */  b           .L00124F00
/* 024FD4 00124ED4 00000000 */   nop
.L00124ED8:
/* 024FD8 00124ED8 2800628C */  lw          $2, 0x28($3)
/* 024FDC 00124EDC 21106200 */  addu        $2, $3, $2
/* 024FE0 00124EE0 1400428C */  lw          $2, 0x14($2)
/* 024FE4 00124EE4 2B10A200 */  sltu        $2, $5, $2
/* 024FE8 00124EE8 04004014 */  bnez        $2, .L00124EFC
/* 024FEC 00124EEC 00000000 */   nop
/* 024FF0 00124EF0 28160070 */  paddub      $2, $0, $0
/* 024FF4 00124EF4 02000010 */  b           .L00124F00
/* 024FF8 00124EF8 00000000 */   nop
.L00124EFC:
/* 024FFC 00124EFC 01000224 */  addiu       $2, $0, 0x1
.L00124F00:
/* 025000 00124F00 0800E003 */  jr          $31
/* 025004 00124F04 00000000 */   nop
/* 025008 00124F08 00000000 */  nop
/* 02500C 00124F0C 00000000 */  nop
