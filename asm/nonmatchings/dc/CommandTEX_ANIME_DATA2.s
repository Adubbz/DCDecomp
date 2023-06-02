.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel CommandTEX_ANIME_DATA2__FPPv
/* 67F60 00167E60 70FFBD27 */  addiu      $sp, $sp, -0x90
/* 67F64 00167E64 2000BF7F */  sq         $31, 0x20($sp)
/* 67F68 00167E68 1000B17F */  sq         $17, 0x10($sp)
/* 67F6C 00167E6C 0000B07F */  sq         $16, 0x0($sp)
/* 67F70 00167E70 288E8070 */  paddub     $17, $4, $0
/* 67F74 00167E74 3000A427 */  addiu      $4, $sp, 0x30
/* 67F78 00167E78 289C050C */  jal        __ct__13CTexAnimeDataFv
/* 67F7C 00167E7C 00000000 */   nop
/* 67F80 00167E80 988E8287 */  lh         $2, -0x7168($gp)
/* 67F84 00167E84 3200A2A7 */  sh         $2, 0x32($sp)
/* 67F88 00167E88 3000A0A7 */  sh         $0, 0x30($sp)
/* 67F8C 00167E8C 0000258E */  lw         $5, 0x0($17)
/* 67F90 00167E90 0400228E */  lw         $2, 0x4($17)
/* 67F94 00167E94 00004284 */  lh         $2, 0x0($2)
/* 67F98 00167E98 6800A2A7 */  sh         $2, 0x68($sp)
/* 67F9C 00167E9C 0800228E */  lw         $2, 0x8($17)
/* 67FA0 00167EA0 00004284 */  lh         $2, 0x0($2)
/* 67FA4 00167EA4 6A00A2A7 */  sh         $2, 0x6A($sp)
/* 67FA8 00167EA8 0C00228E */  lw         $2, 0xC($17)
/* 67FAC 00167EAC 00004284 */  lh         $2, 0x0($2)
/* 67FB0 00167EB0 6C00A2A7 */  sh         $2, 0x6C($sp)
/* 67FB4 00167EB4 1000228E */  lw         $2, 0x10($17)
/* 67FB8 00167EB8 00004284 */  lh         $2, 0x0($2)
/* 67FBC 00167EBC 6E00A2A7 */  sh         $2, 0x6E($sp)
/* 67FC0 00167EC0 1400308E */  lw         $16, 0x14($17)
/* 67FC4 00167EC4 1800228E */  lw         $2, 0x18($17)
/* 67FC8 00167EC8 00004284 */  lh         $2, 0x0($2)
/* 67FCC 00167ECC 7000A2A7 */  sh         $2, 0x70($sp)
/* 67FD0 00167ED0 1C00228E */  lw         $2, 0x1C($17)
/* 67FD4 00167ED4 00004284 */  lh         $2, 0x0($2)
/* 67FD8 00167ED8 7200A2A7 */  sh         $2, 0x72($sp)
/* 67FDC 00167EDC 2000228E */  lw         $2, 0x20($17)
/* 67FE0 00167EE0 00004284 */  lh         $2, 0x0($2)
/* 67FE4 00167EE4 3400A427 */  addiu      $4, $sp, 0x34
/* 67FE8 00167EE8 000082A4 */  sh         $2, 0x0($4)
/* 67FEC 00167EEC 2400228E */  lw         $2, 0x24($17)
/* 67FF0 00167EF0 0000438C */  lw         $3, 0x0($2)
/* 67FF4 00167EF4 2800228E */  lw         $2, 0x28($17)
/* 67FF8 00167EF8 00004284 */  lh         $2, 0x0($2)
/* 67FFC 00167EFC 3600A2A7 */  sh         $2, 0x36($sp)
/* 68000 00167F00 03006010 */  beqz       $3, .L00167F10
/* 68004 00167F04 00000000 */   nop
/* 68008 00167F08 FFFF0224 */  addiu      $2, $0, -0x1
/* 6800C 00167F0C 000082A4 */  sh         $2, 0x0($4)
.L00167F10:
/* 68010 00167F10 C701023C */  lui        $2, %hi(TexManager)
/* 68014 00167F14 70584424 */  addiu      $4, $2, %lo(TexManager)
/* 68018 00167F18 FFFF0624 */  addiu      $6, $0, -0x1
/* 6801C 00167F1C B4C4040C */  jal        GetTexture__15CTextureManagerFPci
/* 68020 00167F20 00000000 */   nop
/* 68024 00167F24 288E4070 */  paddub     $17, $2, $0
/* 68028 00167F28 C701023C */  lui        $2, %hi(TexManager)
/* 6802C 00167F2C 70584424 */  addiu      $4, $2, %lo(TexManager)
/* 68030 00167F30 282E0072 */  paddub     $5, $16, $0
/* 68034 00167F34 FFFF0624 */  addiu      $6, $0, -0x1
/* 68038 00167F38 B4C4040C */  jal        GetTexture__15CTextureManagerFPci
/* 6803C 00167F3C 00000000 */   nop
/* 68040 00167F40 28864070 */  paddub     $16, $2, $0
/* 68044 00167F44 0F002012 */  beqz       $17, .L00167F84
/* 68048 00167F48 00000000 */   nop
/* 6804C 00167F4C 0D000012 */  beqz       $16, .L00167F84
/* 68050 00167F50 00000000 */   nop
/* 68054 00167F54 3800A427 */  addiu      $4, $sp, 0x38
/* 68058 00167F58 282E2072 */  paddub     $5, $17, $0
/* 6805C 00167F5C 189C050C */  jal        Copy__16CTextureTexAnimeFP8CTexture
/* 68060 00167F60 00000000 */   nop
/* 68064 00167F64 5000A427 */  addiu      $4, $sp, 0x50
/* 68068 00167F68 282E0072 */  paddub     $5, $16, $0
/* 6806C 00167F6C 189C050C */  jal        Copy__16CTextureTexAnimeFP8CTexture
/* 68070 00167F70 00000000 */   nop
/* 68074 00167F74 948E848F */  lw         $4, -0x716C($gp)
/* 68078 00167F78 3000A527 */  addiu      $5, $sp, 0x30
/* 6807C 00167F7C 789E050C */  jal        EnterTexAnime__13CTextureAnimeFP13CTexAnimeData
/* 68080 00167F80 00000000 */   nop
.L00167F84:
/* 68084 00167F84 2000BF7B */  lq         $31, 0x20($sp)
/* 68088 00167F88 1000B17B */  lq         $17, 0x10($sp)
/* 6808C 00167F8C 0000B07B */  lq         $16, 0x0($sp)
/* 68090 00167F90 9000BD27 */  addiu      $sp, $sp, 0x90
/* 68094 00167F94 0800E003 */  jr         $31
/* 68098 00167F98 00000000 */   nop
/* 6809C 00167F9C 00000000 */  nop
