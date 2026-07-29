.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel On__8CGamePadFi
/* 02B910 0012B810 5C04828C */  lw          $2, 0x45C($4)
/* 02B914 0012B814 04004010 */  beqz        $2, .L0012B828
/* 02B918 0012B818 00000000 */   nop
/* 02B91C 0012B81C 28160070 */  paddub      $2, $0, $0
/* 02B920 0012B820 04000010 */  b           .L0012B834
/* 02B924 0012B824 00000000 */   nop
.L0012B828:
/* 02B928 0012B828 0400828C */  lw          $2, 0x4($4)
/* 02B92C 0012B82C 24104500 */  and         $2, $2, $5
/* 02B930 0012B830 2B100200 */  sltu        $2, $0, $2
.L0012B834:
/* 02B934 0012B834 0800E003 */  jr          $31
/* 02B938 0012B838 00000000 */   nop
/* 02B93C 0012B83C 00000000 */  nop
