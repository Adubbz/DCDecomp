.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel Down__8CGamePadFi
/* 02B970 0012B870 5C04828C */  lw          $2, 0x45C($4)
/* 02B974 0012B874 04004010 */  beqz        $2, .L0012B888
/* 02B978 0012B878 00000000 */   nop
/* 02B97C 0012B87C 28160070 */  paddub      $2, $0, $0
/* 02B980 0012B880 07000010 */  b           .L0012B8A0
/* 02B984 0012B884 00000000 */   nop
.L0012B888:
/* 02B988 0012B888 9C00828C */  lw          $2, 0x9C($4)
/* 02B98C 0012B88C 27184000 */  not         $3, $2
/* 02B990 0012B890 0400828C */  lw          $2, 0x4($4)
/* 02B994 0012B894 24104300 */  and         $2, $2, $3
/* 02B998 0012B898 2410A200 */  and         $2, $5, $2
/* 02B99C 0012B89C 2B100200 */  sltu        $2, $0, $2
.L0012B8A0:
/* 02B9A0 0012B8A0 0800E003 */  jr          $31
/* 02B9A4 0012B8A4 00000000 */   nop
/* 02B9A8 0012B8A8 00000000 */  nop
/* 02B9AC 0012B8AC 00000000 */  nop
