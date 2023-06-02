.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel MGGetPLight__FPA4_fPA4_f
/* 2DDB0 0012DCB0 E0FFBD27 */  addiu      $sp, $sp, -0x20
/* 2DDB4 0012DCB4 1000BF7F */  sq         $31, 0x10($sp)
/* 2DDB8 0012DCB8 0000B07F */  sq         $16, 0x0($sp)
/* 2DDBC 0012DCBC 2886A070 */  paddub     $16, $5, $0
/* 2DDC0 0012DCC0 C701023C */  lui        $2, %hi(D_1C75630)
/* 2DDC4 0012DCC4 30564524 */  addiu      $5, $2, %lo(D_1C75630)
/* 2DDC8 0012DCC8 1086040C */  jal        sceVu0CopyMatrix
/* 2DDCC 0012DCCC 00000000 */   nop
/* 2DDD0 0012DCD0 28260072 */  paddub     $4, $16, $0
/* 2DDD4 0012DCD4 C701023C */  lui        $2, %hi(D_1C75670)
/* 2DDD8 0012DCD8 70564524 */  addiu      $5, $2, %lo(D_1C75670)
/* 2DDDC 0012DCDC 1086040C */  jal        sceVu0CopyMatrix
/* 2DDE0 0012DCE0 00000000 */   nop
/* 2DDE4 0012DCE4 1000BF7B */  lq         $31, 0x10($sp)
/* 2DDE8 0012DCE8 0000B07B */  lq         $16, 0x0($sp)
/* 2DDEC 0012DCEC 2000BD27 */  addiu      $sp, $sp, 0x20
/* 2DDF0 0012DCF0 0800E003 */  jr         $31
/* 2DDF4 0012DCF4 00000000 */   nop
/* 2DDF8 0012DCF8 00000000 */  nop
/* 2DDFC 0012DCFC 00000000 */  nop
