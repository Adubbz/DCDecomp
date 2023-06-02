.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel InitReadBG__Fv
/* 3EB50 0013EA50 282E0070 */  paddub     $5, $0, $0
/* 3EB54 0013EA54 0B000010 */  b          .L0013EA84
/* 3EB58 0013EA58 00000000 */   nop
.L0013EA5C:
/* 3EB5C 0013EA5C 80180500 */  sll        $3, $5, 2
/* 3EB60 0013EA60 21186500 */  addu       $3, $3, $5
/* 3EB64 0013EA64 C0180300 */  sll        $3, $3, 3
/* 3EB68 0013EA68 23186500 */  subu       $3, $3, $5
/* 3EB6C 0013EA6C 80200300 */  sll        $4, $3, 2
/* 3EB70 0013EA70 CC01033C */  lui        $3, %hi(bg_read_info)
/* 3EB74 0013EA74 C0B06324 */  addiu      $3, $3, %lo(bg_read_info)
/* 3EB78 0013EA78 21186400 */  addu       $3, $3, $4
/* 3EB7C 0013EA7C 000060AC */  sw         $0, 0x0($3)
/* 3EB80 0013EA80 0100A524 */  addiu      $5, $5, 0x1
.L0013EA84:
/* 3EB84 0013EA84 2000A328 */  slti       $3, $5, 0x20
/* 3EB88 0013EA88 F4FF6014 */  bnez       $3, .L0013EA5C
/* 3EB8C 0013EA8C 00000000 */   nop
/* 3EB90 0013EA90 FFFF0324 */  addiu      $3, $0, -0x1
/* 3EB94 0013EA94 048D83AF */  sw         $3, -0x72FC($gp)
/* 3EB98 0013EA98 088D80AF */  sw         $0, -0x72F8($gp)
/* 3EB9C 0013EA9C 0800E003 */  jr         $31
/* 3EBA0 0013EAA0 00000000 */   nop
/* 3EBA4 0013EAA4 00000000 */  nop
/* 3EBA8 0013EAA8 00000000 */  nop
/* 3EBAC 0013EAAC 00000000 */  nop
