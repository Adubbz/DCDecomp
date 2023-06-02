.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel _dpfge
/* 280 00100180 F0FFBD27 */  addiu      $sp, $sp, -0x10
/* 284 00100184 0000BF7F */  sq         $31, 0x0($sp)
/* 288 00100188 E840040C */  jal        dpcmp
/* 28C 0010018C 00000000 */   nop
/* 290 00100190 0000BF7B */  lq         $31, 0x0($sp)
/* 294 00100194 2A104000 */  slt        $2, $2, $0
/* 298 00100198 01004238 */  xori       $2, $2, 0x1
/* 29C 0010019C 0800E003 */  jr         $31
/* 2A0 001001A0 1000BD27 */   addiu     $sp, $sp, 0x10
/* 2A4 001001A4 00000000 */  nop
