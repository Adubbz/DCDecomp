.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel RemakeGrid__11CEditGroundFv
/* 0A5AB0 001A59B0 282E0070 */  paddub      $5, $0, $0
/* 0A5AB4 001A59B4 09000010 */  b           .L001A59DC
/* 0A5AB8 001A59B8 00000000 */   nop
.L001A59BC:
/* 0A5ABC 001A59BC 80180500 */  sll         $3, $5, 2
/* 0A5AC0 001A59C0 21186400 */  addu        $3, $3, $4
/* 0A5AC4 001A59C4 0400668C */  lw          $6, 0x4($3)
/* 0A5AC8 001A59C8 0300C010 */  beqz        $6, .L001A59D8
/* 0A5ACC 001A59CC 00000000 */   nop
/* 0A5AD0 001A59D0 01000324 */  addiu       $3, $0, 0x1
/* 0A5AD4 001A59D4 5020C3AC */  sw          $3, 0x2050($6)
.L001A59D8:
/* 0A5AD8 001A59D8 0100A524 */  addiu       $5, $5, 0x1
.L001A59DC:
/* 0A5ADC 001A59DC 0400A328 */  slti        $3, $5, 0x4
/* 0A5AE0 001A59E0 F6FF6014 */  bnez        $3, .L001A59BC
/* 0A5AE4 001A59E4 00000000 */   nop
/* 0A5AE8 001A59E8 0800E003 */  jr          $31
/* 0A5AEC 001A59EC 00000000 */   nop
