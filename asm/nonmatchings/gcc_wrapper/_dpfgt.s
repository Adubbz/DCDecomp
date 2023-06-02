.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel _dpfgt
/* 260 00100160 F0FFBD27 */  addiu      $sp, $sp, -0x10
/* 264 00100164 0000BF7F */  sq         $31, 0x0($sp)
/* 268 00100168 E840040C */  jal        dpcmp
/* 26C 0010016C 00000000 */   nop
/* 270 00100170 0000BF7B */  lq         $31, 0x0($sp)
/* 274 00100174 2A100200 */  slt        $2, $0, $2
/* 278 00100178 0800E003 */  jr         $31
/* 27C 0010017C 1000BD27 */   addiu     $sp, $sp, 0x10
