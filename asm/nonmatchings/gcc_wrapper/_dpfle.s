.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel _dpfle
/* 230 00100130 F0FFBD27 */  addiu      $sp, $sp, -0x10
/* 234 00100134 0000BF7F */  sq         $31, 0x0($sp)
/* 238 00100138 E840040C */  jal        dpcmp
/* 23C 0010013C 00000000 */   nop
/* 240 00100140 0000BF7B */  lq         $31, 0x0($sp)
/* 244 00100144 2A100200 */  slt        $2, $0, $2
/* 248 00100148 01004238 */  xori       $2, $2, 0x1
/* 24C 0010014C 0800E003 */  jr         $31
/* 250 00100150 1000BD27 */   addiu     $sp, $sp, 0x10
/* 254 00100154 00000000 */  nop
/* 258 00100158 00000000 */  nop
/* 25C 0010015C 00000000 */  nop
