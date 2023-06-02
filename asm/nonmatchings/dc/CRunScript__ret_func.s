.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel ret_func__10CRunScriptFv
/* 13DDC0 0023DCC0 2000828C */  lw         $2, 0x20($4)
/* 13DDC4 0023DCC4 F4FF4224 */  addiu      $2, $2, -0xC
/* 13DDC8 0023DCC8 200082AC */  sw         $2, 0x20($4)
/* 13DDCC 0023DCCC 2000828C */  lw         $2, 0x20($4)
/* 13DDD0 0023DCD0 0400428C */  lw         $2, 0x4($2)
/* 13DDD4 0023DCD4 280082AC */  sw         $2, 0x28($4)
/* 13DDD8 0023DCD8 2000828C */  lw         $2, 0x20($4)
/* 13DDDC 0023DCDC 0800428C */  lw         $2, 0x8($2)
/* 13DDE0 0023DCE0 2C0082AC */  sw         $2, 0x2C($4)
/* 13DDE4 0023DCE4 2000828C */  lw         $2, 0x20($4)
/* 13DDE8 0023DCE8 0000428C */  lw         $2, 0x0($2)
/* 13DDEC 0023DCEC 0800E003 */  jr         $31
/* 13DDF0 0023DCF0 00000000 */   nop
/* 13DDF4 0023DCF4 00000000 */  nop
/* 13DDF8 0023DCF8 00000000 */  nop
/* 13DDFC 0023DCFC 00000000 */  nop
