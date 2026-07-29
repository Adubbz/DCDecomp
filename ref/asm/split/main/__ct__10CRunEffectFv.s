.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel __ct__10CRunEffectFv
/* 063AF0 001639F0 281E0070 */  paddub      $3, $0, $0
/* 063AF4 001639F4 06000010 */  b           .L00163A10
/* 063AF8 001639F8 00000000 */   nop
.L001639FC:
/* 063AFC 001639FC 80100300 */  sll         $2, $3, 2
/* 063B00 00163A00 21104400 */  addu        $2, $2, $4
/* 063B04 00163A04 900040AC */  sw          $0, 0x90($2)
/* 063B08 00163A08 B00040AC */  sw          $0, 0xB0($2)
/* 063B0C 00163A0C 01006324 */  addiu       $3, $3, 0x1
.L00163A10:
/* 063B10 00163A10 08006228 */  slti        $2, $3, 0x8
/* 063B14 00163A14 F9FF4014 */  bnez        $2, .L001639FC
/* 063B18 00163A18 00000000 */   nop
/* 063B1C 00163A1C 000080AC */  sw          $0, 0x0($4)
/* 063B20 00163A20 28168070 */  paddub      $2, $4, $0
/* 063B24 00163A24 0800E003 */  jr          $31
/* 063B28 00163A28 00000000 */   nop
/* 063B2C 00163A2C 00000000 */  nop
