.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel MGGetPLight__FPA4_fPA4_f
/* 02DDB0 0012DCB0 E0FFBD27 */  addiu       $29, $29, -0x20
/* 02DDB4 0012DCB4 1000BF7F */  sq          $31, 0x10($29)
/* 02DDB8 0012DCB8 0000B07F */  sq          $16, 0x0($29)
/* 02DDBC 0012DCBC 2886A070 */  paddub      $16, $5, $0
/* 02DDC0 0012DCC0 C701023C */  lui         $2, %hi(mgRenderInfo + 0x110)
/* 02DDC4 0012DCC4 30564524 */  addiu       $5, $2, %lo(mgRenderInfo + 0x110)
/* 02DDC8 0012DCC8 1086040C */  jal         sceVu0CopyMatrix
/* 02DDCC 0012DCCC 00000000 */   nop
/* 02DDD0 0012DCD0 28260072 */  paddub      $4, $16, $0
/* 02DDD4 0012DCD4 C701023C */  lui         $2, %hi(mgRenderInfo + 0x150)
/* 02DDD8 0012DCD8 70564524 */  addiu       $5, $2, %lo(mgRenderInfo + 0x150)
/* 02DDDC 0012DCDC 1086040C */  jal         sceVu0CopyMatrix
/* 02DDE0 0012DCE0 00000000 */   nop
/* 02DDE4 0012DCE4 1000BF7B */  lq          $31, 0x10($29)
/* 02DDE8 0012DCE8 0000B07B */  lq          $16, 0x0($29)
/* 02DDEC 0012DCEC 2000BD27 */  addiu       $29, $29, 0x20
/* 02DDF0 0012DCF0 0800E003 */  jr          $31
/* 02DDF4 0012DCF4 00000000 */   nop
/* 02DDF8 0012DCF8 00000000 */  nop
/* 02DDFC 0012DCFC 00000000 */  nop
