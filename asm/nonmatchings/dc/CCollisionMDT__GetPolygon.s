.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel GetPolygon__13CCollisionMDTFiPA4_fPA4_fPA4_f
/* 24FC0 00124EC0 3000838C */  lw         $3, 0x30($4)
/* 24FC4 00124EC4 04006014 */  bnez       $3, .L00124ED8
/* 24FC8 00124EC8 00000000 */   nop
/* 24FCC 00124ECC 28160070 */  paddub     $2, $0, $0
/* 24FD0 00124ED0 0B000010 */  b          .L00124F00
/* 24FD4 00124ED4 00000000 */   nop
.L00124ED8:
/* 24FD8 00124ED8 2800628C */  lw         $2, 0x28($3)
/* 24FDC 00124EDC 21106200 */  addu       $2, $3, $2
/* 24FE0 00124EE0 1400428C */  lw         $2, 0x14($2)
/* 24FE4 00124EE4 2B10A200 */  sltu       $2, $5, $2
/* 24FE8 00124EE8 04004014 */  bnez       $2, .L00124EFC
/* 24FEC 00124EEC 00000000 */   nop
/* 24FF0 00124EF0 28160070 */  paddub     $2, $0, $0
/* 24FF4 00124EF4 02000010 */  b          .L00124F00
/* 24FF8 00124EF8 00000000 */   nop
.L00124EFC:
/* 24FFC 00124EFC 01000224 */  addiu      $2, $0, 0x1
.L00124F00:
/* 25000 00124F00 0800E003 */  jr         $31
/* 25004 00124F04 00000000 */   nop
/* 25008 00124F08 00000000 */  nop
/* 2500C 00124F0C 00000000 */  nop
