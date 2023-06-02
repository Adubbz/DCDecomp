.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel GetAtraNum__14CDngStatusDataFii
/* BF870 001BF770 06000224 */  addiu      $2, $0, 0x6
/* BF874 001BF774 0400A214 */  bne        $5, $2, .L001BF788
/* BF878 001BF778 00000000 */   nop
/* BF87C 001BF77C 28160070 */  paddub     $2, $0, $0
/* BF880 001BF780 16000010 */  b          .L001BF7DC
/* BF884 001BF784 00000000 */   nop
.L001BF788:
/* BF888 001BF788 28160070 */  paddub     $2, $0, $0
/* BF88C 001BF78C 28460070 */  paddub     $8, $0, $0
/* BF890 001BF790 0F000010 */  b          .L001BF7D0
/* BF894 001BF794 00000000 */   nop
.L001BF798:
/* BF898 001BF798 80180500 */  sll        $3, $5, 2
/* BF89C 001BF79C 21186500 */  addu       $3, $3, $5
/* BF8A0 001BF7A0 001A0300 */  sll        $3, $3, 8
/* BF8A4 001BF7A4 21386400 */  addu       $7, $3, $4
/* BF8A8 001BF7A8 40190600 */  sll        $3, $6, 5
/* BF8AC 001BF7AC 21386700 */  addu       $7, $3, $7
/* BF8B0 001BF7B0 80180800 */  sll        $3, $8, 2
/* BF8B4 001BF7B4 21186700 */  addu       $3, $3, $7
/* BF8B8 001BF7B8 7802678C */  lw         $7, 0x278($3)
/* BF8BC 001BF7BC FDFF0324 */  addiu      $3, $0, -0x3
/* BF8C0 001BF7C0 0200E314 */  bne        $7, $3, .L001BF7CC
/* BF8C4 001BF7C4 00000000 */   nop
/* BF8C8 001BF7C8 01004224 */  addiu      $2, $2, 0x1
.L001BF7CC:
/* BF8CC 001BF7CC 01000825 */  addiu      $8, $8, 0x1
.L001BF7D0:
/* BF8D0 001BF7D0 08000329 */  slti       $3, $8, 0x8
/* BF8D4 001BF7D4 F0FF6014 */  bnez       $3, .L001BF798
/* BF8D8 001BF7D8 00000000 */   nop
.L001BF7DC:
/* BF8DC 001BF7DC 0800E003 */  jr         $31
/* BF8E0 001BF7E0 00000000 */   nop
/* BF8E4 001BF7E4 00000000 */  nop
/* BF8E8 001BF7E8 00000000 */  nop
/* BF8EC 001BF7EC 00000000 */  nop
