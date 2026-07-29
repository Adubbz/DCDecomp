.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel CommandALLOC_DBUFF__FPPv
/* 03AA60 0013A960 F0FFBD27 */  addiu       $29, $29, -0x10
/* 03AA64 0013A964 0000BF7F */  sq          $31, 0x0($29)
/* 03AA68 0013A968 D88C838F */  lw          $3, -0x7328($28)
/* 03AA6C 0013A96C 08006128 */  slti        $1, $3, 0x8
/* 03AA70 0013A970 0B002010 */  beqz        $1, .L0013A9A0
/* 03AA74 0013A974 00000000 */   nop
/* 03AA78 0013A978 01006224 */  addiu       $2, $3, 0x1
/* 03AA7C 0013A97C D88C82AF */  sw          $2, -0x7328($28)
/* 03AA80 0013A980 00190300 */  sll         $3, $3, 4
/* 03AA84 0013A984 C801023C */  lui         $2, %hi(alloc_dbuff)
/* 03AA88 0013A988 00AF4224 */  addiu       $2, $2, %lo(alloc_dbuff)
/* 03AA8C 0013A98C 21104300 */  addu        $2, $2, $3
/* 03AA90 0013A990 0000858C */  lw          $5, 0x0($4)
/* 03AA94 0013A994 28264070 */  paddub      $4, $2, $0
/* 03AA98 0013A998 5A15040C */  jal         strcpy
/* 03AA9C 0013A99C 00000000 */   nop
.L0013A9A0:
/* 03AAA0 0013A9A0 0000BF7B */  lq          $31, 0x0($29)
/* 03AAA4 0013A9A4 1000BD27 */  addiu       $29, $29, 0x10
/* 03AAA8 0013A9A8 0800E003 */  jr          $31
/* 03AAAC 0013A9AC 00000000 */   nop
