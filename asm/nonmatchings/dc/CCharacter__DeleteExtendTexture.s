.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel DeleteExtendTexture__10CCharacterFi
/* 399D0 001398D0 B0FFBD27 */  addiu      $sp, $sp, -0x50
/* 399D4 001398D4 2000BF7F */  sq         $31, 0x20($sp)
/* 399D8 001398D8 1000B17F */  sq         $17, 0x10($sp)
/* 399DC 001398DC 0000B07F */  sq         $16, 0x0($sp)
/* 399E0 001398E0 288E8070 */  paddub     $17, $4, $0
/* 399E4 001398E4 2886A070 */  paddub     $16, $5, $0
/* 399E8 001398E8 D400858C */  lw         $5, 0xD4($4)
/* 399EC 001398EC 0500A010 */  beqz       $5, .L00139904
/* 399F0 001398F0 00000000 */   nop
/* 399F4 001398F4 DC002426 */  addiu      $4, $17, 0xDC
/* 399F8 001398F8 D800268E */  lw         $6, 0xD8($17)
/* 399FC 001398FC F09E050C */  jal        LoadCFGFile__13CTextureAnimeFPci
/* 39A00 00139900 00000000 */   nop
.L00139904:
/* 39A04 00139904 C800238E */  lw         $3, 0xC8($17)
/* 39A08 00139908 07006014 */  bnez       $3, .L00139928
/* 39A0C 0013990C 00000000 */   nop
/* 39A10 00139910 CC00238E */  lw         $3, 0xCC($17)
/* 39A14 00139914 04006014 */  bnez       $3, .L00139928
/* 39A18 00139918 00000000 */   nop
/* 39A1C 0013991C D000238E */  lw         $3, 0xD0($17)
/* 39A20 00139920 13006010 */  beqz       $3, .L00139970
/* 39A24 00139924 00000000 */   nop
.L00139928:
/* 39A28 00139928 3400B0AF */  sw         $16, 0x34($sp)
/* 39A2C 0013992C 3800A0AF */  sw         $0, 0x38($sp)
/* 39A30 00139930 C400228E */  lw         $2, 0xC4($17)
/* 39A34 00139934 3000A2AF */  sw         $2, 0x30($sp)
/* 39A38 00139938 4000A0AF */  sw         $0, 0x40($sp)
/* 39A3C 0013993C 4400A0AF */  sw         $0, 0x44($sp)
/* 39A40 00139940 3C00A0AF */  sw         $0, 0x3C($sp)
/* 39A44 00139944 C701023C */  lui        $2, %hi(TexManager)
/* 39A48 00139948 70584424 */  addiu      $4, $2, %lo(TexManager)
/* 39A4C 0013994C 282E0072 */  paddub     $5, $16, $0
/* 39A50 00139950 C0CD040C */  jal        DeleteTextureBlock__15CTextureManagerFi
/* 39A54 00139954 00000000 */   nop
/* 39A58 00139958 C701023C */  lui        $2, %hi(TexManager)
/* 39A5C 0013995C 70584424 */  addiu      $4, $2, %lo(TexManager)
/* 39A60 00139960 282E0072 */  paddub     $5, $16, $0
/* 39A64 00139964 3000A627 */  addiu      $6, $sp, 0x30
/* 39A68 00139968 30D0040C */  jal        LoadTextureBlockEX__15CTextureManagerFiP17LOADTEXTURE_INFO2
/* 39A6C 0013996C 00000000 */   nop
.L00139970:
/* 39A70 00139970 2000BF7B */  lq         $31, 0x20($sp)
/* 39A74 00139974 1000B17B */  lq         $17, 0x10($sp)
/* 39A78 00139978 0000B07B */  lq         $16, 0x0($sp)
/* 39A7C 0013997C 5000BD27 */  addiu      $sp, $sp, 0x50
/* 39A80 00139980 0800E003 */  jr         $31
/* 39A84 00139984 00000000 */   nop
/* 39A88 00139988 00000000 */  nop
/* 39A8C 0013998C 00000000 */  nop
