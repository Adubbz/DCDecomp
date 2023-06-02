.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel _dpfne
/* 1F0 001000F0 F0FFBD27 */  addiu      $sp, $sp, -0x10
/* 1F4 001000F4 0000BF7F */  sq         $31, 0x0($sp)
/* 1F8 001000F8 E840040C */  jal        dpcmp
/* 1FC 001000FC 00000000 */   nop
/* 200 00100100 0000BF7B */  lq         $31, 0x0($sp)
/* 204 00100104 2B100200 */  sltu       $2, $0, $2
/* 208 00100108 0800E003 */  jr         $31
/* 20C 0010010C 1000BD27 */   addiu     $sp, $sp, 0x10
