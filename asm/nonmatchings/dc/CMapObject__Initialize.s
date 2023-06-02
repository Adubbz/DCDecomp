.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel Initialize__10CMapObjectFv
/* 57A10 00157910 E0FFBD27 */  addiu      $sp, $sp, -0x20
/* 57A14 00157914 1000BF7F */  sq         $31, 0x10($sp)
/* 57A18 00157918 0000B07F */  sq         $16, 0x0($sp)
/* 57A1C 0015791C 28868070 */  paddub     $16, $4, $0
/* 57A20 00157920 282E0070 */  paddub     $5, $0, $0
/* 57A24 00157924 185D050C */  jal        Initialize__12CObjectFrameFP9CFrameVu1
/* 57A28 00157928 00000000 */   nop
/* 57A2C 0015792C FFFF0324 */  addiu      $3, $0, -0x1
/* 57A30 00157930 E80003AE */  sw         $3, 0xE8($16)
/* 57A34 00157934 E40003AE */  sw         $3, 0xE4($16)
/* 57A38 00157938 D40000AE */  sw         $0, 0xD4($16)
/* 57A3C 0015793C D80000AE */  sw         $0, 0xD8($16)
/* 57A40 00157940 D00000AE */  sw         $0, 0xD0($16)
/* 57A44 00157944 DC0000AE */  sw         $0, 0xDC($16)
/* 57A48 00157948 00C1033C */  lui        $3, (0xC1000000 >> 16)
/* 57A4C 0015794C E00003AE */  sw         $3, 0xE0($16)
/* 57A50 00157950 1000BF7B */  lq         $31, 0x10($sp)
/* 57A54 00157954 0000B07B */  lq         $16, 0x0($sp)
/* 57A58 00157958 2000BD27 */  addiu      $sp, $sp, 0x20
/* 57A5C 0015795C 0800E003 */  jr         $31
/* 57A60 00157960 00000000 */   nop
/* 57A64 00157964 00000000 */  nop
/* 57A68 00157968 00000000 */  nop
/* 57A6C 0015796C 00000000 */  nop
