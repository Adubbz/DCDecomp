.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel GetMaxAtraNum__14CDngStatusDataFii
/* BF8F0 001BF7F0 06000224 */  addiu      $2, $0, 0x6
/* BF8F4 001BF7F4 0400A214 */  bne        $5, $2, .L001BF808
/* BF8F8 001BF7F8 00000000 */   nop
/* BF8FC 001BF7FC 28160070 */  paddub     $2, $0, $0
/* BF900 001BF800 16000010 */  b          .L001BF85C
/* BF904 001BF804 00000000 */   nop
.L001BF808:
/* BF908 001BF808 28160070 */  paddub     $2, $0, $0
/* BF90C 001BF80C 28460070 */  paddub     $8, $0, $0
/* BF910 001BF810 0F000010 */  b          .L001BF850
/* BF914 001BF814 00000000 */   nop
.L001BF818:
/* BF918 001BF818 80180500 */  sll        $3, $5, 2
/* BF91C 001BF81C 21186500 */  addu       $3, $3, $5
/* BF920 001BF820 001A0300 */  sll        $3, $3, 8
/* BF924 001BF824 21386400 */  addu       $7, $3, $4
/* BF928 001BF828 40190600 */  sll        $3, $6, 5
/* BF92C 001BF82C 21386700 */  addu       $7, $3, $7
/* BF930 001BF830 80180800 */  sll        $3, $8, 2
/* BF934 001BF834 21186700 */  addu       $3, $3, $7
/* BF938 001BF838 7802678C */  lw         $7, 0x278($3)
/* BF93C 001BF83C FFFF0324 */  addiu      $3, $0, -0x1
/* BF940 001BF840 0200E310 */  beq        $7, $3, .L001BF84C
/* BF944 001BF844 00000000 */   nop
/* BF948 001BF848 01004224 */  addiu      $2, $2, 0x1
.L001BF84C:
/* BF94C 001BF84C 01000825 */  addiu      $8, $8, 0x1
.L001BF850:
/* BF950 001BF850 08000329 */  slti       $3, $8, 0x8
/* BF954 001BF854 F0FF6014 */  bnez       $3, .L001BF818
/* BF958 001BF858 00000000 */   nop
.L001BF85C:
/* BF95C 001BF85C 0800E003 */  jr         $31
/* BF960 001BF860 00000000 */   nop
/* BF964 001BF864 00000000 */  nop
/* BF968 001BF868 00000000 */  nop
/* BF96C 001BF86C 00000000 */  nop
