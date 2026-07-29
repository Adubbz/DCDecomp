.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel InitReadBG__Fv
/* 03EB50 0013EA50 282E0070 */  paddub      $5, $0, $0
/* 03EB54 0013EA54 0B000010 */  b           .L0013EA84
/* 03EB58 0013EA58 00000000 */   nop
.L0013EA5C:
/* 03EB5C 0013EA5C 80180500 */  sll         $3, $5, 2
/* 03EB60 0013EA60 21186500 */  addu        $3, $3, $5
/* 03EB64 0013EA64 C0180300 */  sll         $3, $3, 3
/* 03EB68 0013EA68 23186500 */  subu        $3, $3, $5
/* 03EB6C 0013EA6C 80200300 */  sll         $4, $3, 2
/* 03EB70 0013EA70 CC01033C */  lui         $3, %hi(bg_read_info)
/* 03EB74 0013EA74 C0B06324 */  addiu       $3, $3, %lo(bg_read_info)
/* 03EB78 0013EA78 21186400 */  addu        $3, $3, $4
/* 03EB7C 0013EA7C 000060AC */  sw          $0, 0x0($3)
/* 03EB80 0013EA80 0100A524 */  addiu       $5, $5, 0x1
.L0013EA84:
/* 03EB84 0013EA84 2000A328 */  slti        $3, $5, 0x20
/* 03EB88 0013EA88 F4FF6014 */  bnez        $3, .L0013EA5C
/* 03EB8C 0013EA8C 00000000 */   nop
/* 03EB90 0013EA90 FFFF0324 */  addiu       $3, $0, -0x1
/* 03EB94 0013EA94 048D83AF */  sw          $3, -0x72FC($28)
/* 03EB98 0013EA98 088D80AF */  sw          $0, -0x72F8($28)
/* 03EB9C 0013EA9C 0800E003 */  jr          $31
/* 03EBA0 0013EAA0 00000000 */   nop
/* 03EBA4 0013EAA4 00000000 */  nop
/* 03EBA8 0013EAA8 00000000 */  nop
/* 03EBAC 0013EAAC 00000000 */  nop
