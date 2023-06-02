.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel sceCdStSeekF
/* C018 0010BF18 F0FFBD27 */  addiu      $sp, $sp, -0x10
/* C01C 0010BF1C 2500083C */  lui        $8, %hi(dum_mode)
/* C020 0010BF20 0000BFFF */  sd         $31, 0x0($sp)
/* C024 0010BF24 C8020825 */  addiu      $8, $8, %lo(dum_mode)
/* C028 0010BF28 2D280000 */  daddu      $5, $0, $0
/* C02C 0010BF2C 2D300000 */  daddu      $6, $0, $0
/* C030 0010BF30 8430040C */  jal        sceCdStream
/* C034 0010BF34 09000724 */   addiu     $7, $0, 0x9
/* C038 0010BF38 0000BFDF */  ld         $31, 0x0($sp)
/* C03C 0010BF3C 0800E003 */  jr         $31
/* C040 0010BF40 1000BD27 */   addiu     $sp, $sp, 0x10
/* C044 0010BF44 00000000 */  nop
