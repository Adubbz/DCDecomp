.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel BreakReadBG__Fv
/* 03EFC0 0013EEC0 F0FFBD27 */  addiu       $29, $29, -0x10
/* 03EFC4 0013EEC4 0000BF7F */  sq          $31, 0x0($29)
/* 03EFC8 0013EEC8 3C2D040C */  jal         sceCdBreak
/* 03EFCC 0013EECC 00000000 */   nop
/* 03EFD0 0013EED0 94FA040C */  jal         InitReadBG__Fv
/* 03EFD4 0013EED4 00000000 */   nop
/* 03EFD8 0013EED8 0000BF7B */  lq          $31, 0x0($29)
/* 03EFDC 0013EEDC 1000BD27 */  addiu       $29, $29, 0x10
/* 03EFE0 0013EEE0 0800E003 */  jr          $31
/* 03EFE4 0013EEE4 00000000 */   nop
/* 03EFE8 0013EEE8 00000000 */  nop
/* 03EFEC 0013EEEC 00000000 */  nop
