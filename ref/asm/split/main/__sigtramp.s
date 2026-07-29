.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel __sigtramp
/* 005048 00104F48 2D288000 */  daddu       $5, $4, $0
/* 00504C 00104F4C 2500023C */  lui         $2, %hi(_impure_ptr)
/* 005050 00104F50 F0FFBD27 */  addiu       $29, $29, -0x10
/* 005054 00104F54 ECFD448C */  lw          $4, %lo(_impure_ptr)($2)
/* 005058 00104F58 0000BFFF */  sd          $31, 0x0($29)
/* 00505C 00104F5C 8413040C */  jal         __sigtramp_r
/* 005060 00104F60 00000000 */   nop
/* 005064 00104F64 0000BFDF */  ld          $31, 0x0($29)
/* 005068 00104F68 0800E003 */  jr          $31
/* 00506C 00104F6C 1000BD27 */   addiu      $29, $29, 0x10
