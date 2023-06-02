.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel SetTAG__18CScriptInterpreterFP9TAG_PARAMi
/* 5F350 0015F250 180485AC */  sw         $5, 0x418($4)
/* 5F354 0015F254 140086AC */  sw         $6, 0x14($4)
/* 5F358 0015F258 0800E003 */  jr         $31
/* 5F35C 0015F25C 00000000 */   nop
