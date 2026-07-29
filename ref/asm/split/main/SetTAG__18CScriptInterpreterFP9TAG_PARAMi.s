.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel SetTAG__18CScriptInterpreterFP9TAG_PARAMi
/* 05F350 0015F250 180485AC */  sw          $5, 0x418($4)
/* 05F354 0015F254 140086AC */  sw          $6, 0x14($4)
/* 05F358 0015F258 0800E003 */  jr          $31
/* 05F35C 0015F25C 00000000 */   nop
