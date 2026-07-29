.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel On2__8CGamePadFi
/* 02B940 0012B840 5C04828C */  lw          $2, 0x45C($4)
/* 02B944 0012B844 04004010 */  beqz        $2, .L0012B858
/* 02B948 0012B848 00000000 */   nop
/* 02B94C 0012B84C 28160070 */  paddub      $2, $0, $0
/* 02B950 0012B850 04000010 */  b           .L0012B864
/* 02B954 0012B854 00000000 */   nop
.L0012B858:
/* 02B958 0012B858 5000828C */  lw          $2, 0x50($4)
/* 02B95C 0012B85C 24104500 */  and         $2, $2, $5
/* 02B960 0012B860 2B100200 */  sltu        $2, $0, $2
.L0012B864:
/* 02B964 0012B864 0800E003 */  jr          $31
/* 02B968 0012B868 00000000 */   nop
/* 02B96C 0012B86C 00000000 */  nop
