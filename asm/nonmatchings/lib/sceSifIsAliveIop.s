.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel sceSifIsAliveIop
/* 195E8 001194E8 F0FFBD27 */  addiu      $sp, $sp, -0x10
/* 195EC 001194EC 0000BFFF */  sd         $31, 0x0($sp)
/* 195F0 001194F0 CC51040C */  jal        sceSifGetReg
/* 195F4 001194F4 04000424 */   addiu     $4, $0, 0x4
/* 195F8 001194F8 0100033C */  lui        $3, (0x10000 >> 16)
/* 195FC 001194FC 0000BFDF */  ld         $31, 0x0($sp)
/* 19600 00119500 24104300 */  and        $2, $2, $3
/* 19604 00119504 2B100200 */  sltu       $2, $0, $2
/* 19608 00119508 0800E003 */  jr         $31
/* 1960C 0011950C 1000BD27 */   addiu     $sp, $sp, 0x10
