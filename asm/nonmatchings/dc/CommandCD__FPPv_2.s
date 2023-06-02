.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel CommandCD__FPPv_2
/* 9FFD0 0019FED0 E0FFBD27 */  addiu      $sp, $sp, -0x20
/* 9FFD4 0019FED4 1000BF7F */  sq         $31, 0x10($sp)
/* 9FFD8 0019FED8 0000B07F */  sq         $16, 0x0($sp)
/* 9FFDC 0019FEDC 28868070 */  paddub     $16, $4, $0
/* 9FFE0 0019FEE0 D501023C */  lui        $2, %hi(CurrentDir_4)
/* 9FFE4 0019FEE4 50494424 */  addiu      $4, $2, %lo(CurrentDir_4)
/* 9FFE8 0019FEE8 F4DD050C */  jal        GetEditDataDir__FPc
/* 9FFEC 0019FEEC 00000000 */   nop
/* 9FFF0 0019FEF0 D501023C */  lui        $2, %hi(CurrentDir_4)
/* 9FFF4 0019FEF4 50494424 */  addiu      $4, $2, %lo(CurrentDir_4)
/* 9FFF8 0019FEF8 2A00023C */  lui        $2, %hi(_1627_2)
/* 9FFFC 0019FEFC 20B44524 */  addiu      $5, $2, %lo(_1627_2)
/* A0000 0019FF00 BC14040C */  jal        strcat
/* A0004 0019FF04 00000000 */   nop
/* A0008 0019FF08 0000058E */  lw         $5, 0x0($16)
/* A000C 0019FF0C D501023C */  lui        $2, %hi(CurrentDir_4)
/* A0010 0019FF10 50494424 */  addiu      $4, $2, %lo(CurrentDir_4)
/* A0014 0019FF14 BC14040C */  jal        strcat
/* A0018 0019FF18 00000000 */   nop
/* A001C 0019FF1C 1000BF7B */  lq         $31, 0x10($sp)
/* A0020 0019FF20 0000B07B */  lq         $16, 0x0($sp)
/* A0024 0019FF24 2000BD27 */  addiu      $sp, $sp, 0x20
/* A0028 0019FF28 0800E003 */  jr         $31
/* A002C 0019FF2C 00000000 */   nop
