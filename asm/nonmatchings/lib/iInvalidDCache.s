.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel iInvalidDCache
/* 14E88 00114D88 FFFF023C */  lui        $2, (0xFFFFFFC0 >> 16)
/* 14E8C 00114D8C C0FF4234 */  ori        $2, $2, (0xFFFFFFC0 & 0xFFFF)
/* 14E90 00114D90 2428A200 */  and        $5, $5, $2
/* 14E94 00114D94 1A530408 */  j          _sceIDC
/* 14E98 00114D98 24208200 */   and       $4, $4, $2
/* 14E9C 00114D9C 00000000 */  nop
