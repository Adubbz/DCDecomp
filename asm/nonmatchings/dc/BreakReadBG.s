.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel BreakReadBG__Fv
/* 3EFC0 0013EEC0 F0FFBD27 */  addiu      $sp, $sp, -0x10
/* 3EFC4 0013EEC4 0000BF7F */  sq         $31, 0x0($sp)
/* 3EFC8 0013EEC8 3C2D040C */  jal        sceCdBreak
/* 3EFCC 0013EECC 00000000 */   nop
/* 3EFD0 0013EED0 94FA040C */  jal        InitReadBG__Fv
/* 3EFD4 0013EED4 00000000 */   nop
/* 3EFD8 0013EED8 0000BF7B */  lq         $31, 0x0($sp)
/* 3EFDC 0013EEDC 1000BD27 */  addiu      $sp, $sp, 0x10
/* 3EFE0 0013EEE0 0800E003 */  jr         $31
/* 3EFE4 0013EEE4 00000000 */   nop
/* 3EFE8 0013EEE8 00000000 */  nop
/* 3EFEC 0013EEEC 00000000 */  nop
