.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel PrevOptionSetFunc__Fv
/* 11EA60 0021E960 282E0070 */  paddub     $5, $0, $0
/* 11EA64 0021E964 0B000010 */  b          .L0021E994
/* 11EA68 0021E968 00000000 */   nop
.L0021E96C:
/* 11EA6C 0021E96C 80300500 */  sll        $6, $5, 2
/* 11EA70 0021E970 DB01033C */  lui        $3, %hi(D_1DA8A94)
/* 11EA74 0021E974 948A6324 */  addiu      $3, $3, %lo(D_1DA8A94)
/* 11EA78 0021E978 21186600 */  addu       $3, $3, $6
/* 11EA7C 0021E97C 0000648C */  lw         $4, 0x0($3)
/* 11EA80 0021E980 DB01033C */  lui        $3, %hi(D_1DA8A64)
/* 11EA84 0021E984 648A6324 */  addiu      $3, $3, %lo(D_1DA8A64)
/* 11EA88 0021E988 21186600 */  addu       $3, $3, $6
/* 11EA8C 0021E98C 000064AC */  sw         $4, 0x0($3)
/* 11EA90 0021E990 0100A524 */  addiu      $5, $5, 0x1
.L0021E994:
/* 11EA94 0021E994 0C00A328 */  slti       $3, $5, 0xC
/* 11EA98 0021E998 F4FF6014 */  bnez       $3, .L0021E96C
/* 11EA9C 0021E99C 00000000 */   nop
/* 11EAA0 0021E9A0 0800E003 */  jr         $31
/* 11EAA4 0021E9A4 00000000 */   nop
/* 11EAA8 0021E9A8 00000000 */  nop
/* 11EAAC 0021E9AC 00000000 */  nop
