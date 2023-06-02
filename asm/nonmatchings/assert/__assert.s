.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel __assert
/* 2E0 001001E0 F0FFBD27 */  addiu      $sp, $sp, -0x10
/* 2E4 001001E4 2500023C */  lui        $2, (0x250000 >> 16)
/* 2E8 001001E8 0000BFFF */  sd         $31, 0x0($sp)
/* 2EC 001001EC 2D40A000 */  daddu      $8, $5, $0
/* 2F0 001001F0 ECFD438C */  lw         $3, -0x214($2)
/* 2F4 001001F4 2D388000 */  daddu      $7, $4, $0
/* 2F8 001001F8 2900053C */  lui        $5, %hi(D_00296780)
/* 2FC 001001FC 0C00648C */  lw         $4, 0xC($3)
/* 300 00100200 E006040C */  jal        fiprintf
/* 304 00100204 8067A524 */   addiu     $5, $5, %lo(D_00296780)
/* 308 00100208 0000BFDF */  ld         $31, 0x0($sp)
/* 30C 0010020C 6A000408 */  j          abort
/* 310 00100210 1000BD27 */   addiu     $sp, $sp, 0x10
/* 314 00100214 00000000 */  nop
