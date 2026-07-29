.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel CommandALLOC_MDT__FPPv
/* 03AA10 0013A910 F0FFBD27 */  addiu       $29, $29, -0x10
/* 03AA14 0013A914 0000BF7F */  sq          $31, 0x0($29)
/* 03AA18 0013A918 D48C838F */  lw          $3, -0x732C($28)
/* 03AA1C 0013A91C 08006128 */  slti        $1, $3, 0x8
/* 03AA20 0013A920 0B002010 */  beqz        $1, .L0013A950
/* 03AA24 0013A924 00000000 */   nop
/* 03AA28 0013A928 01006224 */  addiu       $2, $3, 0x1
/* 03AA2C 0013A92C D48C82AF */  sw          $2, -0x732C($28)
/* 03AA30 0013A930 00190300 */  sll         $3, $3, 4
/* 03AA34 0013A934 C801023C */  lui         $2, %hi(alloc_mdt)
/* 03AA38 0013A938 70AE4224 */  addiu       $2, $2, %lo(alloc_mdt)
/* 03AA3C 0013A93C 21104300 */  addu        $2, $2, $3
/* 03AA40 0013A940 0000858C */  lw          $5, 0x0($4)
/* 03AA44 0013A944 28264070 */  paddub      $4, $2, $0
/* 03AA48 0013A948 5A15040C */  jal         strcpy
/* 03AA4C 0013A94C 00000000 */   nop
.L0013A950:
/* 03AA50 0013A950 0000BF7B */  lq          $31, 0x0($29)
/* 03AA54 0013A954 1000BD27 */  addiu       $29, $29, 0x10
/* 03AA58 0013A958 0800E003 */  jr          $31
/* 03AA5C 0013A95C 00000000 */   nop
