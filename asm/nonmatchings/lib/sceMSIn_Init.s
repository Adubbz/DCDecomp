.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel sceMSIn_Init
/* 1F268 0011F168 1D008010 */  beqz       $4, .L0011F1E0
/* 1F26C 0011F16C 00000000 */   nop
/* 1F270 0011F170 0000828C */  lw         $2, 0x0($4)
/* 1F274 0011F174 02004228 */  slti       $2, $2, 0x2
/* 1F278 0011F178 19004014 */  bnez       $2, .L0011F1E0
/* 1F27C 0011F17C 0400848C */   lw        $4, 0x4($4)
/* 1F280 0011F180 17008010 */  beqz       $4, .L0011F1E0
/* 1F284 0011F184 00000000 */   nop
/* 1F288 0011F188 0800838C */  lw         $3, 0x8($4)
/* 1F28C 0011F18C 14006010 */  beqz       $3, .L0011F1E0
/* 1F290 0011F190 0C00828C */   lw        $2, 0xC($4)
/* 1F294 0011F194 12004010 */  beqz       $2, .L0011F1E0
/* 1F298 0011F198 00000000 */   nop
/* 1F29C 0011F19C 0C006018 */  blez       $3, .L0011F1D0
/* 1F2A0 0011F1A0 2D280000 */   daddu     $5, $0, $0
/* 1F2A4 0011F1A4 04004424 */  addiu      $4, $2, 0x4
.L0011F1A8:
/* 1F2A8 0011F1A8 0000828C */  lw         $2, 0x0($4)
/* 1F2AC 0011F1AC 0A004010 */  beqz       $2, .L0011F1D8
/* 1F2B0 0011F1B0 00000000 */   nop
/* 1F2B4 0011F1B4 0000428C */  lw         $2, 0x0($2)
/* 1F2B8 0011F1B8 0800422C */  sltiu      $2, $2, 0x8
/* 1F2BC 0011F1BC 06004014 */  bnez       $2, .L0011F1D8
/* 1F2C0 0011F1C0 0100A524 */   addiu     $5, $5, 0x1
/* 1F2C4 0011F1C4 2A10A300 */  slt        $2, $5, $3
/* 1F2C8 0011F1C8 F7FF4014 */  bnez       $2, .L0011F1A8
/* 1F2CC 0011F1CC 08008424 */   addiu     $4, $4, 0x8
.L0011F1D0:
/* 1F2D0 0011F1D0 0800E003 */  jr         $31
/* 1F2D4 0011F1D4 2D100000 */   daddu     $2, $0, $0
.L0011F1D8:
/* 1F2D8 0011F1D8 0800E003 */  jr         $31
/* 1F2DC 0011F1DC FFFF0224 */   addiu     $2, $0, -0x1
.L0011F1E0:
/* 1F2E0 0011F1E0 0800E003 */  jr         $31
/* 1F2E4 0011F1E4 FFFF0224 */   addiu     $2, $0, -0x1
