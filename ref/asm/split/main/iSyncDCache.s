.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel iSyncDCache
/* 014D50 00114C50 FFFF023C */  lui         $2, (0xFFFFFFC0 >> 16)
/* 014D54 00114C54 C0FF4234 */  ori         $2, $2, (0xFFFFFFC0 & 0xFFFF)
/* 014D58 00114C58 2428A200 */  and         $5, $5, $2
/* 014D5C 00114C5C CC520408 */  j           _sceSDC
/* 014D60 00114C60 24208200 */   and        $4, $4, $2
/* 014D64 00114C64 00000000 */  nop
