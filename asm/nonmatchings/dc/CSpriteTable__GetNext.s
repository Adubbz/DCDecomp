.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel GetNext__12CSpriteTableFv
/* 2C1C0 0012C0C0 28160070 */  paddub     $2, $0, $0
/* 2C1C4 0012C0C4 8C00858C */  lw         $5, 0x8C($4)
/* 2C1C8 0012C0C8 9000838C */  lw         $3, 0x90($4)
/* 2C1CC 0012C0CC 2B08A300 */  sltu       $at, $5, $3
/* 2C1D0 0012C0D0 04002010 */  beqz       $at, .L0012C0E4
/* 2C1D4 0012C0D4 00000000 */   nop
/* 2C1D8 0012C0D8 2816A070 */  paddub     $2, $5, $0
/* 2C1DC 0012C0DC 3800A324 */  addiu      $3, $5, 0x38
/* 2C1E0 0012C0E0 8C0083AC */  sw         $3, 0x8C($4)
.L0012C0E4:
/* 2C1E4 0012C0E4 0800E003 */  jr         $31
/* 2C1E8 0012C0E8 00000000 */   nop
/* 2C1EC 0012C0EC 00000000 */  nop
