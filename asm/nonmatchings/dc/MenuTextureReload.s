.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel MenuTextureReload__Fi
/* 12D1E0 0022D0E0 E0FFBD27 */  addiu      $sp, $sp, -0x20
/* 12D1E4 0022D0E4 1000BF7F */  sq         $31, 0x10($sp)
/* 12D1E8 0022D0E8 0000B07F */  sq         $16, 0x0($sp)
/* 12D1EC 0022D0EC 28868070 */  paddub     $16, $4, $0
/* 12D1F0 0022D0F0 A0B8040C */  jal        GetVif1Packet__Fv
/* 12D1F4 0022D0F4 00000000 */   nop
/* 12D1F8 0022D0F8 C701033C */  lui        $3, %hi(TexManager)
/* 12D1FC 0022D0FC 70586424 */  addiu      $4, $3, %lo(TexManager)
/* 12D200 0022D100 282E4070 */  paddub     $5, $2, $0
/* 12D204 0022D104 28360072 */  paddub     $6, $16, $0
/* 12D208 0022D108 1CCC040C */  jal        ReloadTexture__15CTextureManagerFP13sceVif1Packeti
/* 12D20C 0022D10C 00000000 */   nop
/* 12D210 0022D110 1000BF7B */  lq         $31, 0x10($sp)
/* 12D214 0022D114 0000B07B */  lq         $16, 0x0($sp)
/* 12D218 0022D118 2000BD27 */  addiu      $sp, $sp, 0x20
/* 12D21C 0022D11C 0800E003 */  jr         $31
/* 12D220 0022D120 00000000 */   nop
/* 12D224 0022D124 00000000 */  nop
/* 12D228 0022D128 00000000 */  nop
/* 12D22C 0022D12C 00000000 */  nop
