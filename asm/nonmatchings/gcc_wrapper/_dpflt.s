.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel _dpflt
/* 210 00100110 F0FFBD27 */  addiu      $sp, $sp, -0x10
/* 214 00100114 0000BF7F */  sq         $31, 0x0($sp)
/* 218 00100118 E840040C */  jal        dpcmp
/* 21C 0010011C 00000000 */   nop
/* 220 00100120 0000BF7B */  lq         $31, 0x0($sp)
/* 224 00100124 2A104000 */  slt        $2, $2, $0
/* 228 00100128 0800E003 */  jr         $31
/* 22C 0010012C 1000BD27 */   addiu     $sp, $sp, 0x10
