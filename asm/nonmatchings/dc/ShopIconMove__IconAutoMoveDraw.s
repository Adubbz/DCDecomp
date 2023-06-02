.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel IconAutoMoveDraw__12ShopIconMoveFv
/* E6F00 001E6E00 B0FFBD27 */  addiu      $sp, $sp, -0x50
/* E6F04 001E6E04 4000BF7F */  sq         $31, 0x40($sp)
/* E6F08 001E6E08 3000B37F */  sq         $19, 0x30($sp)
/* E6F0C 001E6E0C 2000B27F */  sq         $18, 0x20($sp)
/* E6F10 001E6E10 1000B17F */  sq         $17, 0x10($sp)
/* E6F14 001E6E14 0000B07F */  sq         $16, 0x0($sp)
/* E6F18 001E6E18 28868070 */  paddub     $16, $4, $0
/* E6F1C 001E6E1C 10008484 */  lh         $4, 0x10($4)
/* E6F20 001E6E20 51008328 */  slti       $3, $4, 0x51
/* E6F24 001E6E24 28006014 */  bnez       $3, .L001E6EC8
/* E6F28 001E6E28 00000000 */   nop
/* E6F2C 001E6E2C 88C7080C */  jal        WhatIsKindofItem__Fi
/* E6F30 001E6E30 00000000 */   nop
/* E6F34 001E6E34 D901013C */  lui        $at, (0x1D900DC >> 16)
/* E6F38 001E6E38 DC00238C */  lw         $3, (0x1D900DC & 0xFFFF)($at)
/* E6F3C 001E6E3C 22006214 */  bne        $3, $2, .L001E6EC8
/* E6F40 001E6E40 00000000 */   nop
/* E6F44 001E6E44 28960070 */  paddub     $18, $0, $0
/* E6F48 001E6E48 10001386 */  lh         $19, 0x10($16)
/* E6F4C 001E6E4C 5A000224 */  addiu      $2, $0, 0x5A
/* E6F50 001E6E50 03006216 */  bne        $19, $2, .L001E6E60
/* E6F54 001E6E54 00000000 */   nop
/* E6F58 001E6E58 16001286 */  lh         $18, 0x16($16)
/* E6F5C 001E6E5C 00000000 */  nop
.L001E6E60:
/* E6F60 001E6E60 5B00622A */  slti       $2, $19, 0x5B
/* E6F64 001E6E64 08004014 */  bnez       $2, .L001E6E88
/* E6F68 001E6E68 00000000 */   nop
/* E6F6C 001E6E6C 5F00612A */  slti       $at, $19, 0x5F
/* E6F70 001E6E70 05002010 */  beqz       $at, .L001E6E88
/* E6F74 001E6E74 00000000 */   nop
/* E6F78 001E6E78 40101300 */  sll        $2, $19, 1
/* E6F7C 001E6E7C 21105000 */  addu       $2, $2, $16
/* E6F80 001E6E80 66FF5284 */  lh         $18, -0x9A($2)
/* E6F84 001E6E84 00000000 */  nop
.L001E6E88:
/* E6F88 001E6E88 08000CC6 */  lwc1       $f12, 0x8($16)
/* E6F8C 001E6E8C 2C44040C */  jal        fptosi
/* E6F90 001E6E90 00000000 */   nop
/* E6F94 001E6E94 288E4070 */  paddub     $17, $2, $0
/* E6F98 001E6E98 0C000CC6 */  lwc1       $f12, 0xC($16)
/* E6F9C 001E6E9C 2C44040C */  jal        fptosi
/* E6FA0 001E6EA0 00000000 */   nop
/* E6FA4 001E6EA4 28266072 */  paddub     $4, $19, $0
/* E6FA8 001E6EA8 282E2072 */  paddub     $5, $17, $0
/* E6FAC 001E6EAC 28364070 */  paddub     $6, $2, $0
/* E6FB0 001E6EB0 283E0070 */  paddub     $7, $0, $0
/* E6FB4 001E6EB4 80020824 */  addiu      $8, $0, 0x280
/* E6FB8 001E6EB8 80000924 */  addiu      $9, $0, 0x80
/* E6FBC 001E6EBC 28564072 */  paddub     $10, $18, $0
/* E6FC0 001E6EC0 68B5080C */  jal        DrawIconParts__Fiiiiiii
/* E6FC4 001E6EC4 00000000 */   nop
.L001E6EC8:
/* E6FC8 001E6EC8 4000BF7B */  lq         $31, 0x40($sp)
/* E6FCC 001E6ECC 3000B37B */  lq         $19, 0x30($sp)
/* E6FD0 001E6ED0 2000B27B */  lq         $18, 0x20($sp)
/* E6FD4 001E6ED4 1000B17B */  lq         $17, 0x10($sp)
/* E6FD8 001E6ED8 0000B07B */  lq         $16, 0x0($sp)
/* E6FDC 001E6EDC 5000BD27 */  addiu      $sp, $sp, 0x50
/* E6FE0 001E6EE0 0800E003 */  jr         $31
/* E6FE4 001E6EE4 00000000 */   nop
/* E6FE8 001E6EE8 00000000 */  nop
/* E6FEC 001E6EEC 00000000 */  nop
