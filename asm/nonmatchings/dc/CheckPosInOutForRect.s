.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel CheckPosInOutForRect__FP4RECTii
/* 4C980 0014C880 0000838C */  lw         $3, 0x0($4)
/* 4C984 0014C884 2A08A300 */  slt        $at, $5, $3
/* 4C988 0014C888 04002010 */  beqz       $at, .L0014C89C
/* 4C98C 0014C88C 00000000 */   nop
/* 4C990 0014C890 28160070 */  paddub     $2, $0, $0
/* 4C994 0014C894 17000010 */  b          .L0014C8F4
/* 4C998 0014C898 00000000 */   nop
.L0014C89C:
/* 4C99C 0014C89C 0800828C */  lw         $2, 0x8($4)
/* 4C9A0 0014C8A0 21106200 */  addu       $2, $3, $2
/* 4C9A4 0014C8A4 2A084500 */  slt        $at, $2, $5
/* 4C9A8 0014C8A8 04002010 */  beqz       $at, .L0014C8BC
/* 4C9AC 0014C8AC 00000000 */   nop
/* 4C9B0 0014C8B0 28160070 */  paddub     $2, $0, $0
/* 4C9B4 0014C8B4 0F000010 */  b          .L0014C8F4
/* 4C9B8 0014C8B8 00000000 */   nop
.L0014C8BC:
/* 4C9BC 0014C8BC 0400838C */  lw         $3, 0x4($4)
/* 4C9C0 0014C8C0 2A08C300 */  slt        $at, $6, $3
/* 4C9C4 0014C8C4 04002010 */  beqz       $at, .L0014C8D8
/* 4C9C8 0014C8C8 00000000 */   nop
/* 4C9CC 0014C8CC 28160070 */  paddub     $2, $0, $0
/* 4C9D0 0014C8D0 08000010 */  b          .L0014C8F4
/* 4C9D4 0014C8D4 00000000 */   nop
.L0014C8D8:
/* 4C9D8 0014C8D8 0C00828C */  lw         $2, 0xC($4)
/* 4C9DC 0014C8DC 21106200 */  addu       $2, $3, $2
/* 4C9E0 0014C8E0 2A084600 */  slt        $at, $2, $6
/* 4C9E4 0014C8E4 01000224 */  addiu      $2, $0, 0x1
/* 4C9E8 0014C8E8 0B100100 */  movn       $2, $0, $at
/* 4C9EC 0014C8EC 01000010 */  b          .L0014C8F4
/* 4C9F0 0014C8F0 00000000 */   nop
.L0014C8F4:
/* 4C9F4 0014C8F4 0800E003 */  jr         $31
/* 4C9F8 0014C8F8 00000000 */   nop
/* 4C9FC 0014C8FC 00000000 */  nop
