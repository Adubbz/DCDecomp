.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel _DELETE_ITEM__FP12RS_STACKDATAi
/* 08DEB0 0018DDB0 F0FFBD27 */  addiu       $29, $29, -0x10
/* 08DEB4 0018DDB4 0000BF7F */  sq          $31, 0x0($29)
/* 08DEB8 0018DDB8 D428060C */  jal         GetStackInt__FP12RS_STACKDATA
/* 08DEBC 0018DDBC 00000000 */   nop
/* 08DEC0 0018DDC0 28264070 */  paddub      $4, $2, $0
/* 08DEC4 0018DDC4 B02C060C */  jal         DeleteItemFrame__Fi
/* 08DEC8 0018DDC8 00000000 */   nop
/* 08DECC 0018DDCC C701023C */  lui         $2, %hi(TexManager)
/* 08DED0 0018DDD0 70584424 */  addiu       $4, $2, %lo(TexManager)
/* 08DED4 0018DDD4 28000524 */  addiu       $5, $0, 0x28
/* 08DED8 0018DDD8 C0CD040C */  jal         DeleteTextureBlock__15CTextureManagerFi
/* 08DEDC 0018DDDC 00000000 */   nop
/* 08DEE0 0018DDE0 01000224 */  addiu       $2, $0, 0x1
/* 08DEE4 0018DDE4 0000BF7B */  lq          $31, 0x0($29)
/* 08DEE8 0018DDE8 1000BD27 */  addiu       $29, $29, 0x10
/* 08DEEC 0018DDEC 0800E003 */  jr          $31
/* 08DEF0 0018DDF0 00000000 */   nop
/* 08DEF4 0018DDF4 00000000 */  nop
/* 08DEF8 0018DDF8 00000000 */  nop
/* 08DEFC 0018DDFC 00000000 */  nop
