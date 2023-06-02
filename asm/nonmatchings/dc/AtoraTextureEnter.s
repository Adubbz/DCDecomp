.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel AtoraTextureEnter__Fv
/* 11BF70 0021BE70 A0FFBD27 */  addiu      $sp, $sp, -0x60
/* 11BF74 0021BE74 1000BF7F */  sq         $31, 0x10($sp)
/* 11BF78 0021BE78 0000B07F */  sq         $16, 0x0($sp)
/* 11BF7C 0021BE7C 2900023C */  lui        $2, %hi(_1665_2)
/* 11BF80 0021BE80 703E4524 */  addiu      $5, $2, %lo(_1665_2)
/* 11BF84 0021BE84 2000A427 */  addiu      $4, $sp, 0x20
/* 11BF88 0021BE88 02000324 */  addiu      $3, $0, 0x2
.L0021BE8C:
/* 11BF8C 0021BE8C 0000A278 */  lq         $2, 0x0($5)
/* 11BF90 0021BE90 1000A524 */  addiu      $5, $5, 0x10
/* 11BF94 0021BE94 FFFF6324 */  addiu      $3, $3, -0x1
/* 11BF98 0021BE98 0000827C */  sq         $2, 0x0($4)
/* 11BF9C 0021BE9C 10008424 */  addiu      $4, $4, 0x10
/* 11BFA0 0021BEA0 FAFF601C */  bgtz       $3, .L0021BE8C
/* 11BFA4 0021BEA4 00000000 */   nop
/* 11BFA8 0021BEA8 0000A2C4 */  lwc1       $f2, 0x0($5)
/* 11BFAC 0021BEAC 000082E4 */  swc1       $f2, 0x0($4)
/* 11BFB0 0021BEB0 F096828F */  lw         $2, -0x6910($gp)
/* 11BFB4 0021BEB4 2400A2AF */  sw         $2, 0x24($sp)
/* 11BFB8 0021BEB8 3000A2AF */  sw         $2, 0x30($sp)
/* 11BFBC 0021BEBC 28260070 */  paddub     $4, $0, $0
/* 11BFC0 0021BEC0 18FB040C */  jal        GetReadBGFile__Fi
/* 11BFC4 0021BEC4 00000000 */   nop
/* 11BFC8 0021BEC8 28864070 */  paddub     $16, $2, $0
/* 11BFCC 0021BECC 2900023C */  lui        $2, %hi(_1666_2)
/* 11BFD0 0021BED0 A03E4224 */  addiu      $2, $2, %lo(_1666_2)
/* 11BFD4 0021BED4 5000A427 */  addiu      $4, $sp, 0x50
/* 11BFD8 0021BED8 00004278 */  lq         $2, 0x0($2)
/* 11BFDC 0021BEDC 0000827C */  sq         $2, 0x0($4)
/* 11BFE0 0021BEE0 DB01013C */  lui        $at, (0x1DB0000 >> 16)
/* 11BFE4 0021BEE4 DC802284 */  lh         $2, -0x7F24($at)
/* 11BFE8 0021BEE8 01004624 */  addiu      $6, $2, 0x1
/* 11BFEC 0021BEEC 282E8070 */  paddub     $5, $4, $0
/* 11BFF0 0021BEF0 1614040C */  jal        sprintf
/* 11BFF4 0021BEF4 00000000 */   nop
/* 11BFF8 0021BEF8 8C00048E */  lw         $4, 0x8C($16)
/* 11BFFC 0021BEFC 5000A527 */  addiu      $5, $sp, 0x50
/* 11C000 0021BF00 28360070 */  paddub     $6, $0, $0
/* 11C004 0021BF04 C8FD040C */  jal        GetPackFile__FPUiPcPi
/* 11C008 0021BF08 00000000 */   nop
/* 11C00C 0021BF0C 2C00A2AF */  sw         $2, 0x2C($sp)
/* 11C010 0021BF10 C701023C */  lui        $2, %hi(TexManager)
/* 11C014 0021BF14 70584424 */  addiu      $4, $2, %lo(TexManager)
/* 11C018 0021BF18 F096858F */  lw         $5, -0x6910($gp)
/* 11C01C 0021BF1C C0CD040C */  jal        DeleteTextureBlock__15CTextureManagerFi
/* 11C020 0021BF20 00000000 */   nop
/* 11C024 0021BF24 C701023C */  lui        $2, %hi(TexManager)
/* 11C028 0021BF28 70584424 */  addiu      $4, $2, %lo(TexManager)
/* 11C02C 0021BF2C FFFF0524 */  addiu      $5, $0, -0x1
/* 11C030 0021BF30 2000A627 */  addiu      $6, $sp, 0x20
/* 11C034 0021BF34 30D0040C */  jal        LoadTextureBlockEX__15CTextureManagerFiP17LOADTEXTURE_INFO2
/* 11C038 0021BF38 00000000 */   nop
/* 11C03C 0021BF3C C701023C */  lui        $2, %hi(TexManager)
/* 11C040 0021BF40 70584424 */  addiu      $4, $2, %lo(TexManager)
/* 11C044 0021BF44 2A00023C */  lui        $2, %hi(_1410)
/* 11C048 0021BF48 08EA4524 */  addiu      $5, $2, %lo(_1410)
/* 11C04C 0021BF4C FFFF0624 */  addiu      $6, $0, -0x1
/* 11C050 0021BF50 B4C4040C */  jal        GetTexture__15CTextureManagerFPci
/* 11C054 0021BF54 00000000 */   nop
/* 11C058 0021BF58 C89682AF */  sw         $2, -0x6938($gp)
/* 11C05C 0021BF5C C701023C */  lui        $2, %hi(TexManager)
/* 11C060 0021BF60 70584424 */  addiu      $4, $2, %lo(TexManager)
/* 11C064 0021BF64 2A00023C */  lui        $2, %hi(_1411)
/* 11C068 0021BF68 18EA4524 */  addiu      $5, $2, %lo(_1411)
/* 11C06C 0021BF6C F096868F */  lw         $6, -0x6910($gp)
/* 11C070 0021BF70 B4C4040C */  jal        GetTexture__15CTextureManagerFPci
/* 11C074 0021BF74 00000000 */   nop
/* 11C078 0021BF78 B49682AF */  sw         $2, -0x694C($gp)
/* 11C07C 0021BF7C C701023C */  lui        $2, %hi(TexManager)
/* 11C080 0021BF80 70584424 */  addiu      $4, $2, %lo(TexManager)
/* 11C084 0021BF84 2A00023C */  lui        $2, %hi(_1412)
/* 11C088 0021BF88 20EA4524 */  addiu      $5, $2, %lo(_1412)
/* 11C08C 0021BF8C F096868F */  lw         $6, -0x6910($gp)
/* 11C090 0021BF90 B4C4040C */  jal        GetTexture__15CTextureManagerFPci
/* 11C094 0021BF94 00000000 */   nop
/* 11C098 0021BF98 B89682AF */  sw         $2, -0x6948($gp)
/* 11C09C 0021BF9C C701023C */  lui        $2, %hi(TexManager)
/* 11C0A0 0021BFA0 70584424 */  addiu      $4, $2, %lo(TexManager)
/* 11C0A4 0021BFA4 2A00023C */  lui        $2, %hi(_1413)
/* 11C0A8 0021BFA8 30EA4524 */  addiu      $5, $2, %lo(_1413)
/* 11C0AC 0021BFAC F096868F */  lw         $6, -0x6910($gp)
/* 11C0B0 0021BFB0 B4C4040C */  jal        GetTexture__15CTextureManagerFPci
/* 11C0B4 0021BFB4 00000000 */   nop
/* 11C0B8 0021BFB8 BC9682AF */  sw         $2, -0x6944($gp)
/* 11C0BC 0021BFBC C701023C */  lui        $2, %hi(TexManager)
/* 11C0C0 0021BFC0 70584424 */  addiu      $4, $2, %lo(TexManager)
/* 11C0C4 0021BFC4 2A00023C */  lui        $2, %hi(_1414_2)
/* 11C0C8 0021BFC8 40EA4524 */  addiu      $5, $2, %lo(_1414_2)
/* 11C0CC 0021BFCC F096868F */  lw         $6, -0x6910($gp)
/* 11C0D0 0021BFD0 B4C4040C */  jal        GetTexture__15CTextureManagerFPci
/* 11C0D4 0021BFD4 00000000 */   nop
/* 11C0D8 0021BFD8 C09682AF */  sw         $2, -0x6940($gp)
/* 11C0DC 0021BFDC C701023C */  lui        $2, %hi(TexManager)
/* 11C0E0 0021BFE0 70584424 */  addiu      $4, $2, %lo(TexManager)
/* 11C0E4 0021BFE4 2A00023C */  lui        $2, %hi(_1415_2)
/* 11C0E8 0021BFE8 48EA4524 */  addiu      $5, $2, %lo(_1415_2)
/* 11C0EC 0021BFEC F096868F */  lw         $6, -0x6910($gp)
/* 11C0F0 0021BFF0 B4C4040C */  jal        GetTexture__15CTextureManagerFPci
/* 11C0F4 0021BFF4 00000000 */   nop
/* 11C0F8 0021BFF8 C49682AF */  sw         $2, -0x693C($gp)
/* 11C0FC 0021BFFC 01000224 */  addiu      $2, $0, 0x1
/* 11C100 0021C000 1000BF7B */  lq         $31, 0x10($sp)
/* 11C104 0021C004 0000B07B */  lq         $16, 0x0($sp)
/* 11C108 0021C008 6000BD27 */  addiu      $sp, $sp, 0x60
/* 11C10C 0021C00C 0800E003 */  jr         $31
/* 11C110 0021C010 00000000 */   nop
/* 11C114 0021C014 00000000 */  nop
/* 11C118 0021C018 00000000 */  nop
/* 11C11C 0021C01C 00000000 */  nop
