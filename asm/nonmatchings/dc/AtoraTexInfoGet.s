.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel AtoraTexInfoGet__Fv
/* 11AA60 0021A960 F0FFBD27 */  addiu      $sp, $sp, -0x10
/* 11AA64 0021A964 0000BF7F */  sq         $31, 0x0($sp)
/* 11AA68 0021A968 C701023C */  lui        $2, %hi(TexManager)
/* 11AA6C 0021A96C 70584424 */  addiu      $4, $2, %lo(TexManager)
/* 11AA70 0021A970 2A00023C */  lui        $2, %hi(_1410)
/* 11AA74 0021A974 08EA4524 */  addiu      $5, $2, %lo(_1410)
/* 11AA78 0021A978 FFFF0624 */  addiu      $6, $0, -0x1
/* 11AA7C 0021A97C B4C4040C */  jal        GetTexture__15CTextureManagerFPci
/* 11AA80 0021A980 00000000 */   nop
/* 11AA84 0021A984 C89682AF */  sw         $2, -0x6938($gp)
/* 11AA88 0021A988 C701023C */  lui        $2, %hi(TexManager)
/* 11AA8C 0021A98C 70584424 */  addiu      $4, $2, %lo(TexManager)
/* 11AA90 0021A990 2A00023C */  lui        $2, %hi(_1411)
/* 11AA94 0021A994 18EA4524 */  addiu      $5, $2, %lo(_1411)
/* 11AA98 0021A998 F096868F */  lw         $6, -0x6910($gp)
/* 11AA9C 0021A99C B4C4040C */  jal        GetTexture__15CTextureManagerFPci
/* 11AAA0 0021A9A0 00000000 */   nop
/* 11AAA4 0021A9A4 B49682AF */  sw         $2, -0x694C($gp)
/* 11AAA8 0021A9A8 C701023C */  lui        $2, %hi(TexManager)
/* 11AAAC 0021A9AC 70584424 */  addiu      $4, $2, %lo(TexManager)
/* 11AAB0 0021A9B0 2A00023C */  lui        $2, %hi(_1412)
/* 11AAB4 0021A9B4 20EA4524 */  addiu      $5, $2, %lo(_1412)
/* 11AAB8 0021A9B8 F096868F */  lw         $6, -0x6910($gp)
/* 11AABC 0021A9BC B4C4040C */  jal        GetTexture__15CTextureManagerFPci
/* 11AAC0 0021A9C0 00000000 */   nop
/* 11AAC4 0021A9C4 B89682AF */  sw         $2, -0x6948($gp)
/* 11AAC8 0021A9C8 C701023C */  lui        $2, %hi(TexManager)
/* 11AACC 0021A9CC 70584424 */  addiu      $4, $2, %lo(TexManager)
/* 11AAD0 0021A9D0 2A00023C */  lui        $2, %hi(_1413)
/* 11AAD4 0021A9D4 30EA4524 */  addiu      $5, $2, %lo(_1413)
/* 11AAD8 0021A9D8 F096868F */  lw         $6, -0x6910($gp)
/* 11AADC 0021A9DC B4C4040C */  jal        GetTexture__15CTextureManagerFPci
/* 11AAE0 0021A9E0 00000000 */   nop
/* 11AAE4 0021A9E4 BC9682AF */  sw         $2, -0x6944($gp)
/* 11AAE8 0021A9E8 C701023C */  lui        $2, %hi(TexManager)
/* 11AAEC 0021A9EC 70584424 */  addiu      $4, $2, %lo(TexManager)
/* 11AAF0 0021A9F0 2A00023C */  lui        $2, %hi(_1414_2)
/* 11AAF4 0021A9F4 40EA4524 */  addiu      $5, $2, %lo(_1414_2)
/* 11AAF8 0021A9F8 F096868F */  lw         $6, -0x6910($gp)
/* 11AAFC 0021A9FC B4C4040C */  jal        GetTexture__15CTextureManagerFPci
/* 11AB00 0021AA00 00000000 */   nop
/* 11AB04 0021AA04 C09682AF */  sw         $2, -0x6940($gp)
/* 11AB08 0021AA08 C701023C */  lui        $2, %hi(TexManager)
/* 11AB0C 0021AA0C 70584424 */  addiu      $4, $2, %lo(TexManager)
/* 11AB10 0021AA10 2A00023C */  lui        $2, %hi(_1415_2)
/* 11AB14 0021AA14 48EA4524 */  addiu      $5, $2, %lo(_1415_2)
/* 11AB18 0021AA18 F096868F */  lw         $6, -0x6910($gp)
/* 11AB1C 0021AA1C B4C4040C */  jal        GetTexture__15CTextureManagerFPci
/* 11AB20 0021AA20 00000000 */   nop
/* 11AB24 0021AA24 C49682AF */  sw         $2, -0x693C($gp)
/* 11AB28 0021AA28 C701023C */  lui        $2, %hi(TexManager)
/* 11AB2C 0021AA2C 70584424 */  addiu      $4, $2, %lo(TexManager)
/* 11AB30 0021AA30 2A00023C */  lui        $2, %hi(_1416)
/* 11AB34 0021AA34 58EA4524 */  addiu      $5, $2, %lo(_1416)
/* 11AB38 0021AA38 EC96868F */  lw         $6, -0x6914($gp)
/* 11AB3C 0021AA3C B4C4040C */  jal        GetTexture__15CTextureManagerFPci
/* 11AB40 0021AA40 00000000 */   nop
/* 11AB44 0021AA44 CC9682AF */  sw         $2, -0x6934($gp)
/* 11AB48 0021AA48 C701023C */  lui        $2, %hi(TexManager)
/* 11AB4C 0021AA4C 70584424 */  addiu      $4, $2, %lo(TexManager)
/* 11AB50 0021AA50 2A00023C */  lui        $2, %hi(_1417)
/* 11AB54 0021AA54 60EA4524 */  addiu      $5, $2, %lo(_1417)
/* 11AB58 0021AA58 EC96868F */  lw         $6, -0x6914($gp)
/* 11AB5C 0021AA5C B4C4040C */  jal        GetTexture__15CTextureManagerFPci
/* 11AB60 0021AA60 00000000 */   nop
/* 11AB64 0021AA64 D09682AF */  sw         $2, -0x6930($gp)
/* 11AB68 0021AA68 0000BF7B */  lq         $31, 0x0($sp)
/* 11AB6C 0021AA6C 1000BD27 */  addiu      $sp, $sp, 0x10
/* 11AB70 0021AA70 0800E003 */  jr         $31
/* 11AB74 0021AA74 00000000 */   nop
/* 11AB78 0021AA78 00000000 */  nop
/* 11AB7C 0021AA7C 00000000 */  nop
