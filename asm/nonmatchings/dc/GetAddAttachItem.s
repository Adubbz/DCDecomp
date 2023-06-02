.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel GetAddAttachItem__Fi
/* 1256D0 002255D0 28160070 */  paddub     $2, $0, $0
/* 1256D4 002255D4 5B008328 */  slti       $3, $4, 0x5B
/* 1256D8 002255D8 05006014 */  bnez       $3, .L002255F0
/* 1256DC 002255DC 00000000 */   nop
/* 1256E0 002255E0 5F008128 */  slti       $at, $4, 0x5F
/* 1256E4 002255E4 02002010 */  beqz       $at, .L002255F0
/* 1256E8 002255E8 00000000 */   nop
/* 1256EC 002255EC 01000224 */  addiu      $2, $0, 0x1
.L002255F0:
/* 1256F0 002255F0 0800E003 */  jr         $31
/* 1256F4 002255F4 00000000 */   nop
/* 1256F8 002255F8 00000000 */  nop
/* 1256FC 002255FC 00000000 */  nop
