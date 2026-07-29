.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel SetGetAtra__14CDngStatusDataFiii
/* 0BF970 001BF870 06000224 */  addiu       $2, $0, 0x6
/* 0BF974 001BF874 0400A214 */  bne         $5, $2, .L001BF888
/* 0BF978 001BF878 00000000 */   nop
/* 0BF97C 001BF87C 28160070 */  paddub      $2, $0, $0
/* 0BF980 001BF880 19000010 */  b           .L001BF8E8
/* 0BF984 001BF884 00000000 */   nop
.L001BF888:
/* 0BF988 001BF888 28160070 */  paddub      $2, $0, $0
/* 0BF98C 001BF88C 12000010 */  b           .L001BF8D8
/* 0BF990 001BF890 00000000 */   nop
.L001BF894:
/* 0BF994 001BF894 80180500 */  sll         $3, $5, 2
/* 0BF998 001BF898 21186500 */  addu        $3, $3, $5
/* 0BF99C 001BF89C 001A0300 */  sll         $3, $3, 8
/* 0BF9A0 001BF8A0 21406400 */  addu        $8, $3, $4
/* 0BF9A4 001BF8A4 40190600 */  sll         $3, $6, 5
/* 0BF9A8 001BF8A8 21406800 */  addu        $8, $3, $8
/* 0BF9AC 001BF8AC 80180200 */  sll         $3, $2, 2
/* 0BF9B0 001BF8B0 21186800 */  addu        $3, $3, $8
/* 0BF9B4 001BF8B4 78026924 */  addiu       $9, $3, 0x278
/* 0BF9B8 001BF8B8 7802688C */  lw          $8, 0x278($3)
/* 0BF9BC 001BF8BC FFFF0324 */  addiu       $3, $0, -0x1
/* 0BF9C0 001BF8C0 04000315 */  bne         $8, $3, .L001BF8D4
/* 0BF9C4 001BF8C4 00000000 */   nop
/* 0BF9C8 001BF8C8 000027AD */  sw          $7, 0x0($9)
/* 0BF9CC 001BF8CC 06000010 */  b           .L001BF8E8
/* 0BF9D0 001BF8D0 00000000 */   nop
.L001BF8D4:
/* 0BF9D4 001BF8D4 01004224 */  addiu       $2, $2, 0x1
.L001BF8D8:
/* 0BF9D8 001BF8D8 08004328 */  slti        $3, $2, 0x8
/* 0BF9DC 001BF8DC EDFF6014 */  bnez        $3, .L001BF894
/* 0BF9E0 001BF8E0 00000000 */   nop
/* 0BF9E4 001BF8E4 FFFF0224 */  addiu       $2, $0, -0x1
.L001BF8E8:
/* 0BF9E8 001BF8E8 0800E003 */  jr          $31
/* 0BF9EC 001BF8EC 00000000 */   nop
