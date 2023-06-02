.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel EdEventBackSpriteDraw__Fv
/* 98D70 00198C70 F0FFBD27 */  addiu      $sp, $sp, -0x10
/* 98D74 00198C74 0000BF7F */  sq         $31, 0x0($sp)
/* 98D78 00198C78 A0B8040C */  jal        GetVif1Packet__Fv
/* 98D7C 00198C7C 00000000 */   nop
/* 98D80 00198C80 C701033C */  lui        $3, %hi(TexManager)
/* 98D84 00198C84 70586424 */  addiu      $4, $3, %lo(TexManager)
/* 98D88 00198C88 282E4070 */  paddub     $5, $2, $0
/* 98D8C 00198C8C 2E000624 */  addiu      $6, $0, 0x2E
/* 98D90 00198C90 1CCC040C */  jal        ReloadTexture__15CTextureManagerFP13sceVif1Packeti
/* 98D94 00198C94 00000000 */   nop
/* 98D98 00198C98 D501023C */  lui        $2, %hi(SpriteTableBack)
/* 98D9C 00198C9C 108F4424 */  addiu      $4, $2, %lo(SpriteTableBack)
/* 98DA0 00198CA0 88AE040C */  jal        DrawTable__12CSpriteTableFv
/* 98DA4 00198CA4 00000000 */   nop
/* 98DA8 00198CA8 01000224 */  addiu      $2, $0, 0x1
/* 98DAC 00198CAC 0000BF7B */  lq         $31, 0x0($sp)
/* 98DB0 00198CB0 1000BD27 */  addiu      $sp, $sp, 0x10
/* 98DB4 00198CB4 0800E003 */  jr         $31
/* 98DB8 00198CB8 00000000 */   nop
/* 98DBC 00198CBC 00000000 */  nop
