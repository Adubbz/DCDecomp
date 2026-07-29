.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel EdNowTalkCharaInfoID__Fv
/* 099180 00199080 7892828F */  lw          $2, -0x6D88($28)
/* 099184 00199084 0800E003 */  jr          $31
/* 099188 00199088 00000000 */   nop
/* 09918C 0019908C 00000000 */  nop
