.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel iSyncDCache
/* 14D50 00114C50 FFFF023C */  lui        $2, (0xFFFFFFC0 >> 16)
/* 14D54 00114C54 C0FF4234 */  ori        $2, $2, (0xFFFFFFC0 & 0xFFFF)
/* 14D58 00114C58 2428A200 */  and        $5, $5, $2
/* 14D5C 00114C5C CC520408 */  j          _sceSDC
/* 14D60 00114C60 24208200 */   and       $4, $4, $2
/* 14D64 00114C64 00000000 */  nop
