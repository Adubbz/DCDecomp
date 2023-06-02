.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel _DELETE_ITEM__FP12RS_STACKDATAi
/* 8DEB0 0018DDB0 F0FFBD27 */  addiu      $sp, $sp, -0x10
/* 8DEB4 0018DDB4 0000BF7F */  sq         $31, 0x0($sp)
/* 8DEB8 0018DDB8 D428060C */  jal        GetStackInt__FP12RS_STACKDATA
/* 8DEBC 0018DDBC 00000000 */   nop
/* 8DEC0 0018DDC0 28264070 */  paddub     $4, $2, $0
/* 8DEC4 0018DDC4 B02C060C */  jal        DeleteItemFrame__Fi
/* 8DEC8 0018DDC8 00000000 */   nop
/* 8DECC 0018DDCC C701023C */  lui        $2, %hi(TexManager)
/* 8DED0 0018DDD0 70584424 */  addiu      $4, $2, %lo(TexManager)
/* 8DED4 0018DDD4 28000524 */  addiu      $5, $0, 0x28
/* 8DED8 0018DDD8 C0CD040C */  jal        DeleteTextureBlock__15CTextureManagerFi
/* 8DEDC 0018DDDC 00000000 */   nop
/* 8DEE0 0018DDE0 01000224 */  addiu      $2, $0, 0x1
/* 8DEE4 0018DDE4 0000BF7B */  lq         $31, 0x0($sp)
/* 8DEE8 0018DDE8 1000BD27 */  addiu      $sp, $sp, 0x10
/* 8DEEC 0018DDEC 0800E003 */  jr         $31
/* 8DEF0 0018DDF0 00000000 */   nop
/* 8DEF4 0018DDF4 00000000 */  nop
/* 8DEF8 0018DDF8 00000000 */  nop
/* 8DEFC 0018DDFC 00000000 */  nop
