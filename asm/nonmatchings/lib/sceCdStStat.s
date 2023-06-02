.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel sceCdStStat
/* C2C8 0010C1C8 2500023C */  lui        $2, (0x250270 >> 16)
/* C2CC 0010C1CC F0FFBD27 */  addiu      $sp, $sp, -0x10
/* C2D0 0010C1D0 7002438C */  lw         $3, (0x250270 & 0xFFFF)($2)
/* C2D4 0010C1D4 04006018 */  blez       $3, .L0010C1E8
/* C2D8 0010C1D8 0000BFFF */   sd        $31, 0x0($sp)
/* C2DC 0010C1DC 2900043C */  lui        $4, %hi(D_00297368)
/* C2E0 0010C1E0 A611040C */  jal        printf
/* C2E4 0010C1E4 68738424 */   addiu     $4, $4, %lo(D_00297368)
.L0010C1E8:
/* C2E8 0010C1E8 2500083C */  lui        $8, %hi(dum_mode)
/* C2EC 0010C1EC 2D200000 */  daddu      $4, $0, $0
/* C2F0 0010C1F0 C8020825 */  addiu      $8, $8, %lo(dum_mode)
/* C2F4 0010C1F4 2D280000 */  daddu      $5, $0, $0
/* C2F8 0010C1F8 2D300000 */  daddu      $6, $0, $0
/* C2FC 0010C1FC 8430040C */  jal        sceCdStream
/* C300 0010C200 06000724 */   addiu     $7, $0, 0x6
/* C304 0010C204 0000BFDF */  ld         $31, 0x0($sp)
/* C308 0010C208 0800E003 */  jr         $31
/* C30C 0010C20C 1000BD27 */   addiu     $sp, $sp, 0x10
