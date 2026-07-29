.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel _init_signal
/* 005020 00104F20 2500023C */  lui         $2, %hi(_impure_ptr)
/* 005024 00104F24 F0FFBD27 */  addiu       $29, $29, -0x10
/* 005028 00104F28 ECFD448C */  lw          $4, %lo(_impure_ptr)($2)
/* 00502C 00104F2C 0000BFFF */  sd          $31, 0x0($29)
/* 005030 00104F30 0813040C */  jal         _init_signal_r
/* 005034 00104F34 00000000 */   nop
/* 005038 00104F38 0000BFDF */  ld          $31, 0x0($29)
/* 00503C 00104F3C 0800E003 */  jr          $31
/* 005040 00104F40 1000BD27 */   addiu      $29, $29, 0x10
/* 005044 00104F44 00000000 */  nop
