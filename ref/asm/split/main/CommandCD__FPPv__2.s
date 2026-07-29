.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel CommandCD__FPPv__2
/* 09FFD0 0019FED0 E0FFBD27 */  addiu       $29, $29, -0x20
/* 09FFD4 0019FED4 1000BF7F */  sq          $31, 0x10($29)
/* 09FFD8 0019FED8 0000B07F */  sq          $16, 0x0($29)
/* 09FFDC 0019FEDC 28868070 */  paddub      $16, $4, $0
/* 09FFE0 0019FEE0 D501023C */  lui         $2, %hi(CurrentDir__5)
/* 09FFE4 0019FEE4 50494424 */  addiu       $4, $2, %lo(CurrentDir__5)
/* 09FFE8 0019FEE8 F4DD050C */  jal         GetEditDataDir__FPc
/* 09FFEC 0019FEEC 00000000 */   nop
/* 09FFF0 0019FEF0 D501023C */  lui         $2, %hi(CurrentDir__5)
/* 09FFF4 0019FEF4 50494424 */  addiu       $4, $2, %lo(CurrentDir__5)
/* 09FFF8 0019FEF8 2A00023C */  lui         $2, %hi(LIT_1627__2)
/* 09FFFC 0019FEFC 20B44524 */  addiu       $5, $2, %lo(LIT_1627__2)
/* 0A0000 0019FF00 BC14040C */  jal         strcat
/* 0A0004 0019FF04 00000000 */   nop
/* 0A0008 0019FF08 0000058E */  lw          $5, 0x0($16)
/* 0A000C 0019FF0C D501023C */  lui         $2, %hi(CurrentDir__5)
/* 0A0010 0019FF10 50494424 */  addiu       $4, $2, %lo(CurrentDir__5)
/* 0A0014 0019FF14 BC14040C */  jal         strcat
/* 0A0018 0019FF18 00000000 */   nop
/* 0A001C 0019FF1C 1000BF7B */  lq          $31, 0x10($29)
/* 0A0020 0019FF20 0000B07B */  lq          $16, 0x0($29)
/* 0A0024 0019FF24 2000BD27 */  addiu       $29, $29, 0x20
/* 0A0028 0019FF28 0800E003 */  jr          $31
/* 0A002C 0019FF2C 00000000 */   nop
