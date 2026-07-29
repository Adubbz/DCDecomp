.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel GetCollision__FP6CCPolyP7CBoxVu0__2
/* 09EA20 0019E920 B0FFBD27 */  addiu       $29, $29, -0x50
/* 09EA24 0019E924 4000BF7F */  sq          $31, 0x40($29)
/* 09EA28 0019E928 3000B37F */  sq          $19, 0x30($29)
/* 09EA2C 0019E92C 2000B27F */  sq          $18, 0x20($29)
/* 09EA30 0019E930 1000B17F */  sq          $17, 0x10($29)
/* 09EA34 0019E934 0000B07F */  sq          $16, 0x0($29)
/* 09EA38 0019E938 289E8070 */  paddub      $19, $4, $0
/* 09EA3C 0019E93C 2896A070 */  paddub      $18, $5, $0
/* 09EA40 0019E940 28860070 */  paddub      $16, $0, $0
/* 09EA44 0019E944 288E0070 */  paddub      $17, $0, $0
/* 09EA48 0019E948 17000010 */  b           .L0019E9A8
/* 09EA4C 0019E94C 00000000 */   nop
.L0019E950:
/* 09EA50 0019E950 C0101100 */  sll         $2, $17, 3
/* 09EA54 0019E954 23185100 */  subu        $3, $2, $17
/* 09EA58 0019E958 80100300 */  sll         $2, $3, 2
/* 09EA5C 0019E95C 23104300 */  subu        $2, $2, $3
/* 09EA60 0019E960 40190200 */  sll         $3, $2, 5
/* 09EA64 0019E964 D501023C */  lui         $2, %hi(InteriorParts)
/* 09EA68 0019E968 F0D54224 */  addiu       $2, $2, %lo(InteriorParts)
/* 09EA6C 0019E96C 21204300 */  addu        $4, $2, $3
/* 09EA70 0019E970 3C5D050C */  jal         GetCollisionFrame__10CMapObjectFv
/* 09EA74 0019E974 00000000 */   nop
/* 09EA78 0019E978 0A004010 */  beqz        $2, .L0019E9A4
/* 09EA7C 0019E97C 00000000 */   nop
/* 09EA80 0019E980 80181000 */  sll         $3, $16, 2
/* 09EA84 0019E984 21187000 */  addu        $3, $3, $16
/* 09EA88 0019E988 00190300 */  sll         $3, $3, 4
/* 09EA8C 0019E98C 21286302 */  addu        $5, $19, $3
/* 09EA90 0019E990 28264070 */  paddub      $4, $2, $0
/* 09EA94 0019E994 28364072 */  paddub      $6, $18, $0
/* 09EA98 0019E998 E4A8040C */  jal         PickUpNearPoly__6CFrameFP6CCPolyRC7CBoxVu0
/* 09EA9C 0019E99C 00000000 */   nop
/* 09EAA0 0019E9A0 21800202 */  addu        $16, $16, $2
.L0019E9A4:
/* 09EAA4 0019E9A4 01003126 */  addiu       $17, $17, 0x1
.L0019E9A8:
/* 09EAA8 0019E9A8 BC92828F */  lw          $2, -0x6D44($28)
/* 09EAAC 0019E9AC 2A102202 */  slt         $2, $17, $2
/* 09EAB0 0019E9B0 E7FF4014 */  bnez        $2, .L0019E950
/* 09EAB4 0019E9B4 00000000 */   nop
/* 09EAB8 0019E9B8 28160072 */  paddub      $2, $16, $0
/* 09EABC 0019E9BC 4000BF7B */  lq          $31, 0x40($29)
/* 09EAC0 0019E9C0 3000B37B */  lq          $19, 0x30($29)
/* 09EAC4 0019E9C4 2000B27B */  lq          $18, 0x20($29)
/* 09EAC8 0019E9C8 1000B17B */  lq          $17, 0x10($29)
/* 09EACC 0019E9CC 0000B07B */  lq          $16, 0x0($29)
/* 09EAD0 0019E9D0 5000BD27 */  addiu       $29, $29, 0x50
/* 09EAD4 0019E9D4 0800E003 */  jr          $31
/* 09EAD8 0019E9D8 00000000 */   nop
/* 09EADC 0019E9DC 00000000 */  nop
