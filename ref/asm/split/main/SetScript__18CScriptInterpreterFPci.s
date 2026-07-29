.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel SetScript__18CScriptInterpreterFPci
/* 05F370 0015F270 F0FFBD27 */  addiu       $29, $29, -0x10
/* 05F374 0015F274 0000BF7F */  sq          $31, 0x0($29)
/* 05F378 0015F278 000085AC */  sw          $5, 0x0($4)
/* 05F37C 0015F27C 040086AC */  sw          $6, 0x4($4)
/* 05F380 0015F280 080080AC */  sw          $0, 0x8($4)
/* 05F384 0015F284 100080AC */  sw          $0, 0x10($4)
/* 05F388 0015F288 FFFF0224 */  addiu       $2, $0, -0x1
/* 05F38C 0015F28C 0C0082AC */  sw          $2, 0xC($4)
/* 05F390 0015F290 8C7F050C */  jal         PreProcess__FR9input_str__2
/* 05F394 0015F294 00000000 */   nop
/* 05F398 0015F298 0000BF7B */  lq          $31, 0x0($29)
/* 05F39C 0015F29C 1000BD27 */  addiu       $29, $29, 0x10
/* 05F3A0 0015F2A0 0800E003 */  jr          $31
/* 05F3A4 0015F2A4 00000000 */   nop
/* 05F3A8 0015F2A8 00000000 */  nop
/* 05F3AC 0015F2AC 00000000 */  nop
