.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel SetScript__18CScriptInterpreterFPci
/* 5F370 0015F270 F0FFBD27 */  addiu      $sp, $sp, -0x10
/* 5F374 0015F274 0000BF7F */  sq         $31, 0x0($sp)
/* 5F378 0015F278 000085AC */  sw         $5, 0x0($4)
/* 5F37C 0015F27C 040086AC */  sw         $6, 0x4($4)
/* 5F380 0015F280 080080AC */  sw         $0, 0x8($4)
/* 5F384 0015F284 100080AC */  sw         $0, 0x10($4)
/* 5F388 0015F288 FFFF0224 */  addiu      $2, $0, -0x1
/* 5F38C 0015F28C 0C0082AC */  sw         $2, 0xC($4)
/* 5F390 0015F290 8C7F050C */  jal        PreProcess__FR9input_str_2
/* 5F394 0015F294 00000000 */   nop
/* 5F398 0015F298 0000BF7B */  lq         $31, 0x0($sp)
/* 5F39C 0015F29C 1000BD27 */  addiu      $sp, $sp, 0x10
/* 5F3A0 0015F2A0 0800E003 */  jr         $31
/* 5F3A4 0015F2A4 00000000 */   nop
/* 5F3A8 0015F2A8 00000000 */  nop
/* 5F3AC 0015F2AC 00000000 */  nop
