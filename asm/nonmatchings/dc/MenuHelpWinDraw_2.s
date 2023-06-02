.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel MenuHelpWinDraw__Fiiffi
/* 117B60 00217A60 B0FFBD27 */  addiu      $sp, $sp, -0x50
/* 117B64 00217A64 4000BF7F */  sq         $31, 0x40($sp)
/* 117B68 00217A68 3000B27F */  sq         $18, 0x30($sp)
/* 117B6C 00217A6C 2000B17F */  sq         $17, 0x20($sp)
/* 117B70 00217A70 1000B07F */  sq         $16, 0x10($sp)
/* 117B74 00217A74 0400B5E7 */  swc1       $f21, 0x4($sp)
/* 117B78 00217A78 0000B4E7 */  swc1       $f20, 0x0($sp)
/* 117B7C 00217A7C 28968070 */  paddub     $18, $4, $0
/* 117B80 00217A80 288EA070 */  paddub     $17, $5, $0
/* 117B84 00217A84 46650046 */  mov.s      $f21, $f12
/* 117B88 00217A88 066D0046 */  mov.s      $f20, $f13
/* 117B8C 00217A8C 2886C070 */  paddub     $16, $6, $0
/* 117B90 00217A90 C701023C */  lui        $2, %hi(TexManager)
/* 117B94 00217A94 70584424 */  addiu      $4, $2, %lo(TexManager)
/* 117B98 00217A98 2A00023C */  lui        $2, %hi(_594_2)
/* 117B9C 00217A9C F0E94524 */  addiu      $5, $2, %lo(_594_2)
/* 117BA0 00217AA0 FFFF0624 */  addiu      $6, $0, -0x1
/* 117BA4 00217AA4 B4C4040C */  jal        GetTexture__15CTextureManagerFPci
/* 117BA8 00217AA8 00000000 */   nop
/* 117BAC 00217AAC A09682AF */  sw         $2, -0x6960($gp)
/* 117BB0 00217AB0 28264072 */  paddub     $4, $18, $0
/* 117BB4 00217AB4 282E2072 */  paddub     $5, $17, $0
/* 117BB8 00217AB8 06AB0046 */  mov.s      $f12, $f21
/* 117BBC 00217ABC 46A30046 */  mov.s      $f13, $f20
/* 117BC0 00217AC0 28360072 */  paddub     $6, $16, $0
/* 117BC4 00217AC4 283E0070 */  paddub     $7, $0, $0
/* 117BC8 00217AC8 28460070 */  paddub     $8, $0, $0
/* 117BCC 00217ACC A096898F */  lw         $9, -0x6960($gp)
/* 117BD0 00217AD0 E85C080C */  jal        MenuHelpWinDraw__FiiffiiiP8CTexture
/* 117BD4 00217AD4 00000000 */   nop
/* 117BD8 00217AD8 4000BF7B */  lq         $31, 0x40($sp)
/* 117BDC 00217ADC 3000B27B */  lq         $18, 0x30($sp)
/* 117BE0 00217AE0 2000B17B */  lq         $17, 0x20($sp)
/* 117BE4 00217AE4 1000B07B */  lq         $16, 0x10($sp)
/* 117BE8 00217AE8 0400B5C7 */  lwc1       $f21, 0x4($sp)
/* 117BEC 00217AEC 0000B4C7 */  lwc1       $f20, 0x0($sp)
/* 117BF0 00217AF0 5000BD27 */  addiu      $sp, $sp, 0x50
/* 117BF4 00217AF4 0800E003 */  jr         $31
/* 117BF8 00217AF8 00000000 */   nop
/* 117BFC 00217AFC 00000000 */  nop
