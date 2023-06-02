.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel sceSdCallBack
/* 21470 00121370 2500023C */  lui        $2, (0x250A98 >> 16)
/* 21474 00121374 0800E003 */  jr         $31
/* 21478 00121378 980A44AC */   sw        $4, (0x250A98 & 0xFFFF)($2)
/* 2147C 0012137C 00000000 */  nop
