.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel Down2__8CGamePadFi
/* 02B9B0 0012B8B0 5C04828C */  lw          $2, 0x45C($4)
/* 02B9B4 0012B8B4 04004010 */  beqz        $2, .L0012B8C8
/* 02B9B8 0012B8B8 00000000 */   nop
/* 02B9BC 0012B8BC 28160070 */  paddub      $2, $0, $0
/* 02B9C0 0012B8C0 07000010 */  b           .L0012B8E0
/* 02B9C4 0012B8C4 00000000 */   nop
.L0012B8C8:
/* 02B9C8 0012B8C8 E800828C */  lw          $2, 0xE8($4)
/* 02B9CC 0012B8CC 27184000 */  not         $3, $2
/* 02B9D0 0012B8D0 5000828C */  lw          $2, 0x50($4)
/* 02B9D4 0012B8D4 24104300 */  and         $2, $2, $3
/* 02B9D8 0012B8D8 2410A200 */  and         $2, $5, $2
/* 02B9DC 0012B8DC 2B100200 */  sltu        $2, $0, $2
.L0012B8E0:
/* 02B9E0 0012B8E0 0800E003 */  jr          $31
/* 02B9E4 0012B8E4 00000000 */   nop
/* 02B9E8 0012B8E8 00000000 */  nop
/* 02B9EC 0012B8EC 00000000 */  nop
