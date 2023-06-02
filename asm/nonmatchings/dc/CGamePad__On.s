.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel On__8CGamePadFi
/* 2B910 0012B810 5C04828C */  lw         $2, 0x45C($4)
/* 2B914 0012B814 04004010 */  beqz       $2, .L0012B828
/* 2B918 0012B818 00000000 */   nop
/* 2B91C 0012B81C 28160070 */  paddub     $2, $0, $0
/* 2B920 0012B820 04000010 */  b          .L0012B834
/* 2B924 0012B824 00000000 */   nop
.L0012B828:
/* 2B928 0012B828 0400828C */  lw         $2, 0x4($4)
/* 2B92C 0012B82C 24104500 */  and        $2, $2, $5
/* 2B930 0012B830 2B100200 */  sltu       $2, $0, $2
.L0012B834:
/* 2B934 0012B834 0800E003 */  jr         $31
/* 2B938 0012B838 00000000 */   nop
/* 2B93C 0012B83C 00000000 */  nop
