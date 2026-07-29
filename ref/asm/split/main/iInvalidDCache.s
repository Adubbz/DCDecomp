.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel iInvalidDCache
/* 014E88 00114D88 FFFF023C */  lui         $2, (0xFFFFFFC0 >> 16)
/* 014E8C 00114D8C C0FF4234 */  ori         $2, $2, (0xFFFFFFC0 & 0xFFFF)
/* 014E90 00114D90 2428A200 */  and         $5, $5, $2
/* 014E94 00114D94 1A530408 */  j           _sceIDC
/* 014E98 00114D98 24208200 */   and        $4, $4, $2
/* 014E9C 00114D9C 00000000 */  nop
