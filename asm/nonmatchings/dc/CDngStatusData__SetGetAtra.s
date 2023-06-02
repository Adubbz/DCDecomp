.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel SetGetAtra__14CDngStatusDataFiii
/* BF970 001BF870 06000224 */  addiu      $2, $0, 0x6
/* BF974 001BF874 0400A214 */  bne        $5, $2, .L001BF888
/* BF978 001BF878 00000000 */   nop
/* BF97C 001BF87C 28160070 */  paddub     $2, $0, $0
/* BF980 001BF880 19000010 */  b          .L001BF8E8
/* BF984 001BF884 00000000 */   nop
.L001BF888:
/* BF988 001BF888 28160070 */  paddub     $2, $0, $0
/* BF98C 001BF88C 12000010 */  b          .L001BF8D8
/* BF990 001BF890 00000000 */   nop
.L001BF894:
/* BF994 001BF894 80180500 */  sll        $3, $5, 2
/* BF998 001BF898 21186500 */  addu       $3, $3, $5
/* BF99C 001BF89C 001A0300 */  sll        $3, $3, 8
/* BF9A0 001BF8A0 21406400 */  addu       $8, $3, $4
/* BF9A4 001BF8A4 40190600 */  sll        $3, $6, 5
/* BF9A8 001BF8A8 21406800 */  addu       $8, $3, $8
/* BF9AC 001BF8AC 80180200 */  sll        $3, $2, 2
/* BF9B0 001BF8B0 21186800 */  addu       $3, $3, $8
/* BF9B4 001BF8B4 78026924 */  addiu      $9, $3, 0x278
/* BF9B8 001BF8B8 7802688C */  lw         $8, 0x278($3)
/* BF9BC 001BF8BC FFFF0324 */  addiu      $3, $0, -0x1
/* BF9C0 001BF8C0 04000315 */  bne        $8, $3, .L001BF8D4
/* BF9C4 001BF8C4 00000000 */   nop
/* BF9C8 001BF8C8 000027AD */  sw         $7, 0x0($9)
/* BF9CC 001BF8CC 06000010 */  b          .L001BF8E8
/* BF9D0 001BF8D0 00000000 */   nop
.L001BF8D4:
/* BF9D4 001BF8D4 01004224 */  addiu      $2, $2, 0x1
.L001BF8D8:
/* BF9D8 001BF8D8 08004328 */  slti       $3, $2, 0x8
/* BF9DC 001BF8DC EDFF6014 */  bnez       $3, .L001BF894
/* BF9E0 001BF8E0 00000000 */   nop
/* BF9E4 001BF8E4 FFFF0224 */  addiu      $2, $0, -0x1
.L001BF8E8:
/* BF9E8 001BF8E8 0800E003 */  jr         $31
/* BF9EC 001BF8EC 00000000 */   nop
