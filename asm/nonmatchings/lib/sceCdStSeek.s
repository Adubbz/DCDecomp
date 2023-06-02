.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel sceCdStSeek
/* C048 0010BF48 F0FFBD27 */  addiu      $sp, $sp, -0x10
/* C04C 0010BF4C 2500083C */  lui        $8, %hi(dum_mode)
/* C050 0010BF50 0000BFFF */  sd         $31, 0x0($sp)
/* C054 0010BF54 C8020825 */  addiu      $8, $8, %lo(dum_mode)
/* C058 0010BF58 2D280000 */  daddu      $5, $0, $0
/* C05C 0010BF5C 2D300000 */  daddu      $6, $0, $0
/* C060 0010BF60 8430040C */  jal        sceCdStream
/* C064 0010BF64 04000724 */   addiu     $7, $0, 0x4
/* C068 0010BF68 0000BFDF */  ld         $31, 0x0($sp)
/* C06C 0010BF6C 0800E003 */  jr         $31
/* C070 0010BF70 1000BD27 */   addiu     $sp, $sp, 0x10
/* C074 0010BF74 00000000 */  nop
