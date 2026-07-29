.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel CheckPosInOutForRect__FP4RECTii
/* 04C980 0014C880 0000838C */  lw          $3, 0x0($4)
/* 04C984 0014C884 2A08A300 */  slt         $1, $5, $3
/* 04C988 0014C888 04002010 */  beqz        $1, .L0014C89C
/* 04C98C 0014C88C 00000000 */   nop
/* 04C990 0014C890 28160070 */  paddub      $2, $0, $0
/* 04C994 0014C894 17000010 */  b           .L0014C8F4
/* 04C998 0014C898 00000000 */   nop
.L0014C89C:
/* 04C99C 0014C89C 0800828C */  lw          $2, 0x8($4)
/* 04C9A0 0014C8A0 21106200 */  addu        $2, $3, $2
/* 04C9A4 0014C8A4 2A084500 */  slt         $1, $2, $5
/* 04C9A8 0014C8A8 04002010 */  beqz        $1, .L0014C8BC
/* 04C9AC 0014C8AC 00000000 */   nop
/* 04C9B0 0014C8B0 28160070 */  paddub      $2, $0, $0
/* 04C9B4 0014C8B4 0F000010 */  b           .L0014C8F4
/* 04C9B8 0014C8B8 00000000 */   nop
.L0014C8BC:
/* 04C9BC 0014C8BC 0400838C */  lw          $3, 0x4($4)
/* 04C9C0 0014C8C0 2A08C300 */  slt         $1, $6, $3
/* 04C9C4 0014C8C4 04002010 */  beqz        $1, .L0014C8D8
/* 04C9C8 0014C8C8 00000000 */   nop
/* 04C9CC 0014C8CC 28160070 */  paddub      $2, $0, $0
/* 04C9D0 0014C8D0 08000010 */  b           .L0014C8F4
/* 04C9D4 0014C8D4 00000000 */   nop
.L0014C8D8:
/* 04C9D8 0014C8D8 0C00828C */  lw          $2, 0xC($4)
/* 04C9DC 0014C8DC 21106200 */  addu        $2, $3, $2
/* 04C9E0 0014C8E0 2A084600 */  slt         $1, $2, $6
/* 04C9E4 0014C8E4 01000224 */  addiu       $2, $0, 0x1
/* 04C9E8 0014C8E8 0B100100 */  movn        $2, $0, $1
/* 04C9EC 0014C8EC 01000010 */  b           .L0014C8F4
/* 04C9F0 0014C8F0 00000000 */   nop
.L0014C8F4:
/* 04C9F4 0014C8F4 0800E003 */  jr          $31
/* 04C9F8 0014C8F8 00000000 */   nop
/* 04C9FC 0014C8FC 00000000 */  nop
