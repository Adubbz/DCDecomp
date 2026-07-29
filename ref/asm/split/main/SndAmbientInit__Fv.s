.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel SndAmbientInit__Fv
/* 05B1F0 0015B0F0 FFFF0224 */  addiu       $2, $0, -0x1
/* 05B1F4 0015B0F4 208E82AF */  sw          $2, -0x71E0($28)
/* 05B1F8 0015B0F8 288E80AF */  sw          $0, -0x71D8($28)
/* 05B1FC 0015B0FC 248E80AF */  sw          $0, -0x71DC($28)
/* 05B200 0015B100 01000224 */  addiu       $2, $0, 0x1
/* 05B204 0015B104 0800E003 */  jr          $31
/* 05B208 0015B108 00000000 */   nop
/* 05B20C 0015B10C 00000000 */  nop
