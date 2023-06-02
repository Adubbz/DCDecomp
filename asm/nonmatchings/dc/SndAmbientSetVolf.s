.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel SndAmbientSetVolf__Ff
/* 5B340 0015B240 E0FFBD27 */  addiu      $sp, $sp, -0x20
/* 5B344 0015B244 1000BF7F */  sq         $31, 0x10($sp)
/* 5B348 0015B248 0000B4E7 */  swc1       $f20, 0x0($sp)
/* 5B34C 0015B24C 06650046 */  mov.s      $f20, $f12
/* 5B350 0015B250 208E838F */  lw         $3, -0x71E0($gp)
/* 5B354 0015B254 0C006004 */  bltz       $3, .L0015B288
/* 5B358 0015B258 00000000 */   nop
/* 5B35C 0015B25C A86C050C */  jal        SndGetAmbientDefaultVol__Fv
/* 5B360 0015B260 00000000 */   nop
/* 5B364 0015B264 00008244 */  mtc1       $2, $f0
/* 5B368 0015B268 00000000 */  nop
/* 5B36C 0015B26C 20008046 */  cvt.s.w    $f0, $f0
/* 5B370 0015B270 02031446 */  mul.s      $f12, $f0, $f20
/* 5B374 0015B274 2C44040C */  jal        fptosi
/* 5B378 0015B278 00000000 */   nop
/* 5B37C 0015B27C 28264070 */  paddub     $4, $2, $0
/* 5B380 0015B280 786C050C */  jal        SndAmbientSetVol__Fi
/* 5B384 0015B284 00000000 */   nop
.L0015B288:
/* 5B388 0015B288 1000BF7B */  lq         $31, 0x10($sp)
/* 5B38C 0015B28C 0000B4C7 */  lwc1       $f20, 0x0($sp)
/* 5B390 0015B290 2000BD27 */  addiu      $sp, $sp, 0x20
/* 5B394 0015B294 0800E003 */  jr         $31
/* 5B398 0015B298 00000000 */   nop
/* 5B39C 0015B29C 00000000 */  nop
