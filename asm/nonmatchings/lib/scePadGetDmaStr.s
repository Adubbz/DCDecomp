.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel scePadGetDmaStr
/* 1FB30 0011FA30 1C000224 */  addiu      $2, $0, 0x1C
/* 1FB34 0011FA34 70000324 */  addiu      $3, $0, 0x70
/* 1FB38 0011FA38 1828A200 */  mult       $5, $5, $2
/* 1FB3C 0011FA3C 18208370 */  mult1      $4, $4, $3
/* 1FB40 0011FA40 E0FFBD27 */  addiu      $sp, $sp, -0x20
/* 1FB44 0011FA44 2B00023C */  lui        $2, %hi(D_002A9C90)
/* 1FB48 0011FA48 1000BFFF */  sd         $31, 0x10($sp)
/* 1FB4C 0011FA4C 909C4224 */  addiu      $2, $2, %lo(D_002A9C90)
/* 1FB50 0011FA50 0000B0FF */  sd         $16, 0x0($sp)
/* 1FB54 0011FA54 2128A400 */  addu       $5, $5, $4
/* 1FB58 0011FA58 2128A200 */  addu       $5, $5, $2
/* 1FB5C 0011FA5C 0000B08C */  lw         $16, 0x0($5)
/* 1FB60 0011FA60 2D200002 */  daddu      $4, $16, $0
/* 1FB64 0011FA64 F652040C */  jal        SyncDCache
/* 1FB68 0011FA68 00010526 */   addiu     $5, $16, 0x100
/* 1FB6C 0011FA6C 5800028E */  lw         $2, 0x58($16)
/* 1FB70 0011FA70 D800038E */  lw         $3, 0xD8($16)
/* 1FB74 0011FA74 1000BFDF */  ld         $31, 0x10($sp)
/* 1FB78 0011FA78 2A104300 */  slt        $2, $2, $3
/* 1FB7C 0011FA7C C0110200 */  sll        $2, $2, 7
/* 1FB80 0011FA80 21100202 */  addu       $2, $16, $2
/* 1FB84 0011FA84 0000B0DF */  ld         $16, 0x0($sp)
/* 1FB88 0011FA88 0800E003 */  jr         $31
/* 1FB8C 0011FA8C 2000BD27 */   addiu     $sp, $sp, 0x20
