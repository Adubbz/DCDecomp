.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel InitOptionFlag__Fv
/* 11EA10 0021E910 282E0070 */  paddub     $5, $0, $0
/* 11EA14 0021E914 07000010 */  b          .L0021E934
/* 11EA18 0021E918 00000000 */   nop
.L0021E91C:
/* 11EA1C 0021E91C 80200500 */  sll        $4, $5, 2
/* 11EA20 0021E920 DB01033C */  lui        $3, %hi(D_1DA8A64)
/* 11EA24 0021E924 648A6324 */  addiu      $3, $3, %lo(D_1DA8A64)
/* 11EA28 0021E928 21186400 */  addu       $3, $3, $4
/* 11EA2C 0021E92C 000060AC */  sw         $0, 0x0($3)
/* 11EA30 0021E930 0100A524 */  addiu      $5, $5, 0x1
.L0021E934:
/* 11EA34 0021E934 0C00A328 */  slti       $3, $5, 0xC
/* 11EA38 0021E938 F8FF6014 */  bnez       $3, .L0021E91C
/* 11EA3C 0021E93C 00000000 */   nop
/* 11EA40 0021E940 01000324 */  addiu      $3, $0, 0x1
/* 11EA44 0021E944 DB01013C */  lui        $at, (0x1DB0000 >> 16)
/* 11EA48 0021E948 7C8A23AC */  sw         $3, -0x7584($at)
/* 11EA4C 0021E94C 0800E003 */  jr         $31
/* 11EA50 0021E950 00000000 */   nop
/* 11EA54 0021E954 00000000 */  nop
/* 11EA58 0021E958 00000000 */  nop
/* 11EA5C 0021E95C 00000000 */  nop
