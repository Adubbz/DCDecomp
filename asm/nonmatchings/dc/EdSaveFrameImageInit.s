.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel EdSaveFrameImageInit__Fv
/* 73FD0 00173ED0 F0FFBD27 */  addiu      $sp, $sp, -0x10
/* 73FD4 00173ED4 0000BF7F */  sq         $31, 0x0($sp)
/* 73FD8 00173ED8 D201023C */  lui        $2, %hi(frame_image_tex)
/* 73FDC 00173EDC A09A4424 */  addiu      $4, $2, %lo(frame_image_tex)
/* 73FE0 00173EE0 C8C3040C */  jal        Initialize__8CTextureFv
/* 73FE4 00173EE4 00000000 */   nop
/* 73FE8 00173EE8 BC8F80AF */  sw         $0, -0x7044($gp)
/* 73FEC 00173EEC 0000BF7B */  lq         $31, 0x0($sp)
/* 73FF0 00173EF0 1000BD27 */  addiu      $sp, $sp, 0x10
/* 73FF4 00173EF4 0800E003 */  jr         $31
/* 73FF8 00173EF8 00000000 */   nop
/* 73FFC 00173EFC 00000000 */  nop
