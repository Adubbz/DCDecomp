.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel Down2__8CGamePadFi
/* 2B9B0 0012B8B0 5C04828C */  lw         $2, 0x45C($4)
/* 2B9B4 0012B8B4 04004010 */  beqz       $2, .L0012B8C8
/* 2B9B8 0012B8B8 00000000 */   nop
/* 2B9BC 0012B8BC 28160070 */  paddub     $2, $0, $0
/* 2B9C0 0012B8C0 07000010 */  b          .L0012B8E0
/* 2B9C4 0012B8C4 00000000 */   nop
.L0012B8C8:
/* 2B9C8 0012B8C8 E800828C */  lw         $2, 0xE8($4)
/* 2B9CC 0012B8CC 27184000 */  not        $3, $2
/* 2B9D0 0012B8D0 5000828C */  lw         $2, 0x50($4)
/* 2B9D4 0012B8D4 24104300 */  and        $2, $2, $3
/* 2B9D8 0012B8D8 2410A200 */  and        $2, $5, $2
/* 2B9DC 0012B8DC 2B100200 */  sltu       $2, $0, $2
.L0012B8E0:
/* 2B9E0 0012B8E0 0800E003 */  jr         $31
/* 2B9E4 0012B8E4 00000000 */   nop
/* 2B9E8 0012B8E8 00000000 */  nop
/* 2B9EC 0012B8EC 00000000 */  nop
