.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel SndAmbientInit__Fv
/* 5B1F0 0015B0F0 FFFF0224 */  addiu      $2, $0, -0x1
/* 5B1F4 0015B0F4 208E82AF */  sw         $2, -0x71E0($gp)
/* 5B1F8 0015B0F8 288E80AF */  sw         $0, -0x71D8($gp)
/* 5B1FC 0015B0FC 248E80AF */  sw         $0, -0x71DC($gp)
/* 5B200 0015B100 01000224 */  addiu      $2, $0, 0x1
/* 5B204 0015B104 0800E003 */  jr         $31
/* 5B208 0015B108 00000000 */   nop
/* 5B20C 0015B10C 00000000 */  nop
