.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel _dpfeq
/* 1C0 001000C0 F0FFBD27 */  addiu      $sp, $sp, -0x10
/* 1C4 001000C4 0000BF7F */  sq         $31, 0x0($sp)
/* 1C8 001000C8 E840040C */  jal        dpcmp
/* 1CC 001000CC 00000000 */   nop
/* 1D0 001000D0 0000BF7B */  lq         $31, 0x0($sp)
/* 1D4 001000D4 26104000 */  xor        $2, $2, $0
/* 1D8 001000D8 0100422C */  sltiu      $2, $2, 0x1
/* 1DC 001000DC 0800E003 */  jr         $31
/* 1E0 001000E0 1000BD27 */   addiu     $sp, $sp, 0x10
/* 1E4 001000E4 00000000 */  nop
/* 1E8 001000E8 00000000 */  nop
/* 1EC 001000EC 00000000 */  nop
