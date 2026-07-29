.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel GetNext__12CSpriteTableFv
/* 02C1C0 0012C0C0 28160070 */  paddub      $2, $0, $0
/* 02C1C4 0012C0C4 8C00858C */  lw          $5, 0x8C($4)
/* 02C1C8 0012C0C8 9000838C */  lw          $3, 0x90($4)
/* 02C1CC 0012C0CC 2B08A300 */  sltu        $1, $5, $3
/* 02C1D0 0012C0D0 04002010 */  beqz        $1, .L0012C0E4
/* 02C1D4 0012C0D4 00000000 */   nop
/* 02C1D8 0012C0D8 2816A070 */  paddub      $2, $5, $0
/* 02C1DC 0012C0DC 3800A324 */  addiu       $3, $5, 0x38
/* 02C1E0 0012C0E0 8C0083AC */  sw          $3, 0x8C($4)
.L0012C0E4:
/* 02C1E4 0012C0E4 0800E003 */  jr          $31
/* 02C1E8 0012C0E8 00000000 */   nop
/* 02C1EC 0012C0EC 00000000 */  nop
