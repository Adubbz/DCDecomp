.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel Down__8CGamePadFi
/* 2B970 0012B870 5C04828C */  lw         $2, 0x45C($4)
/* 2B974 0012B874 04004010 */  beqz       $2, .L0012B888
/* 2B978 0012B878 00000000 */   nop
/* 2B97C 0012B87C 28160070 */  paddub     $2, $0, $0
/* 2B980 0012B880 07000010 */  b          .L0012B8A0
/* 2B984 0012B884 00000000 */   nop
.L0012B888:
/* 2B988 0012B888 9C00828C */  lw         $2, 0x9C($4)
/* 2B98C 0012B88C 27184000 */  not        $3, $2
/* 2B990 0012B890 0400828C */  lw         $2, 0x4($4)
/* 2B994 0012B894 24104300 */  and        $2, $2, $3
/* 2B998 0012B898 2410A200 */  and        $2, $5, $2
/* 2B99C 0012B89C 2B100200 */  sltu       $2, $0, $2
.L0012B8A0:
/* 2B9A0 0012B8A0 0800E003 */  jr         $31
/* 2B9A4 0012B8A4 00000000 */   nop
/* 2B9A8 0012B8A8 00000000 */  nop
/* 2B9AC 0012B8AC 00000000 */  nop
