.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel On2__8CGamePadFi
/* 2B940 0012B840 5C04828C */  lw         $2, 0x45C($4)
/* 2B944 0012B844 04004010 */  beqz       $2, .L0012B858
/* 2B948 0012B848 00000000 */   nop
/* 2B94C 0012B84C 28160070 */  paddub     $2, $0, $0
/* 2B950 0012B850 04000010 */  b          .L0012B864
/* 2B954 0012B854 00000000 */   nop
.L0012B858:
/* 2B958 0012B858 5000828C */  lw         $2, 0x50($4)
/* 2B95C 0012B85C 24104500 */  and        $2, $2, $5
/* 2B960 0012B860 2B100200 */  sltu       $2, $0, $2
.L0012B864:
/* 2B964 0012B864 0800E003 */  jr         $31
/* 2B968 0012B868 00000000 */   nop
/* 2B96C 0012B86C 00000000 */  nop
