.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel SetFunction__18CScriptInterpreterFP14SPI_FUNC_PARAMi
/* 5F360 0015F260 1C0485AC */  sw         $5, 0x41C($4)
/* 5F364 0015F264 200486AC */  sw         $6, 0x420($4)
/* 5F368 0015F268 0800E003 */  jr         $31
/* 5F36C 0015F26C 00000000 */   nop
