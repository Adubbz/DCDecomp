.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel EdSaveFrameImageInit__Fv
/* 073FD0 00173ED0 F0FFBD27 */  addiu       $29, $29, -0x10
/* 073FD4 00173ED4 0000BF7F */  sq          $31, 0x0($29)
/* 073FD8 00173ED8 D201023C */  lui         $2, %hi(frame_image_tex)
/* 073FDC 00173EDC A09A4424 */  addiu       $4, $2, %lo(frame_image_tex)
/* 073FE0 00173EE0 C8C3040C */  jal         Initialize__8CTextureFv
/* 073FE4 00173EE4 00000000 */   nop
/* 073FE8 00173EE8 BC8F80AF */  sw          $0, -0x7044($28)
/* 073FEC 00173EEC 0000BF7B */  lq          $31, 0x0($29)
/* 073FF0 00173EF0 1000BD27 */  addiu       $29, $29, 0x10
/* 073FF4 00173EF4 0800E003 */  jr          $31
/* 073FF8 00173EF8 00000000 */   nop
/* 073FFC 00173EFC 00000000 */  nop
