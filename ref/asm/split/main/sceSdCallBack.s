.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel sceSdCallBack
/* 021470 00121370 2500023C */  lui         $2, %hi(gEnd_func)
/* 021474 00121374 0800E003 */  jr          $31
/* 021478 00121378 980A44AC */   sw         $4, %lo(gEnd_func)($2)
/* 02147C 0012137C 00000000 */  nop
