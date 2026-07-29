.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel ShisaiShadow__Fv
/* 00BCB0 01DB79B0 80FFBD27 */  addiu       $29, $29, -0x80
/* 00BCB4 01DB79B4 3000BF7F */  sq          $31, 0x30($29)
/* 00BCB8 01DB79B8 2000B27F */  sq          $18, 0x20($29)
/* 00BCBC 01DB79BC 1000B17F */  sq          $17, 0x10($29)
/* 00BCC0 01DB79C0 0000B07F */  sq          $16, 0x0($29)
/* 00BCC4 01DB79C4 C701023C */  lui         $2, %hi(TexManager)
/* 00BCC8 01DB79C8 70584424 */  addiu       $4, $2, %lo(TexManager)
/* 00BCCC 01DB79CC D48B858F */  lw          $5, -0x742C($28)
/* 00BCD0 01DB79D0 06000624 */  addiu       $6, $0, 0x6
/* 00BCD4 01DB79D4 1CCC040C */  jal         ReloadTexture__15CTextureManagerFP13sceVif1Packeti
/* 00BCD8 01DB79D8 00000000 */   nop
/* 00BCDC 01DB79DC DF01013C */  lui         $1, %hi(Chara__3 + 0x241C)
/* 00BCE0 01DB79E0 FC22248C */  lw          $4, %lo(Chara__3 + 0x241C)($1)
/* 00BCE4 01DB79E4 DE01023C */  lui         $2, %hi(LIT_903__3)
/* 00BCE8 01DB79E8 40DF4524 */  addiu       $5, $2, %lo(LIT_903__3)
/* 00BCEC 01DB79EC C0A1040C */  jal         SearchFrame__6CFrameFPc
/* 00BCF0 01DB79F0 00000000 */   nop
/* 00BCF4 01DB79F4 28264070 */  paddub      $4, $2, $0
/* 00BCF8 01DB79F8 4000A527 */  addiu       $5, $29, 0x40
/* 00BCFC 01DB79FC 6CA0040C */  jal         GetLWMatrix__6CFrameFPA4_f
/* 00BD00 01DB7A00 00000000 */   nop
/* 00BD04 01DB7A04 7000B227 */  addiu       $18, $29, 0x70
/* 00BD08 01DB7A08 00004CC6 */  lwc1        $f12, 0x0($18)
/* 00BD0C 01DB7A0C 7400B127 */  addiu       $17, $29, 0x74
/* 00BD10 01DB7A10 00002DC6 */  lwc1        $f13, 0x0($17)
/* 00BD14 01DB7A14 7800B027 */  addiu       $16, $29, 0x78
/* 00BD18 01DB7A18 00000EC6 */  lwc1        $f14, 0x0($16)
/* 00BD1C 01DB7A1C A0DE760C */  jal         DrawShadow__Ffff
/* 00BD20 01DB7A20 00000000 */   nop
/* 00BD24 01DB7A24 DF01013C */  lui         $1, %hi(Chara__3 + 0x241C)
/* 00BD28 01DB7A28 FC22248C */  lw          $4, %lo(Chara__3 + 0x241C)($1)
/* 00BD2C 01DB7A2C DE01023C */  lui         $2, %hi(LIT_904__3)
/* 00BD30 01DB7A30 48DF4524 */  addiu       $5, $2, %lo(LIT_904__3)
/* 00BD34 01DB7A34 C0A1040C */  jal         SearchFrame__6CFrameFPc
/* 00BD38 01DB7A38 00000000 */   nop
/* 00BD3C 01DB7A3C 28264070 */  paddub      $4, $2, $0
/* 00BD40 01DB7A40 4000A527 */  addiu       $5, $29, 0x40
/* 00BD44 01DB7A44 6CA0040C */  jal         GetLWMatrix__6CFrameFPA4_f
/* 00BD48 01DB7A48 00000000 */   nop
/* 00BD4C 01DB7A4C 00004CC6 */  lwc1        $f12, 0x0($18)
/* 00BD50 01DB7A50 00002DC6 */  lwc1        $f13, 0x0($17)
/* 00BD54 01DB7A54 00000EC6 */  lwc1        $f14, 0x0($16)
/* 00BD58 01DB7A58 A0DE760C */  jal         DrawShadow__Ffff
/* 00BD5C 01DB7A5C 00000000 */   nop
/* 00BD60 01DB7A60 3000BF7B */  lq          $31, 0x30($29)
/* 00BD64 01DB7A64 2000B27B */  lq          $18, 0x20($29)
/* 00BD68 01DB7A68 1000B17B */  lq          $17, 0x10($29)
/* 00BD6C 01DB7A6C 0000B07B */  lq          $16, 0x0($29)
/* 00BD70 01DB7A70 8000BD27 */  addiu       $29, $29, 0x80
/* 00BD74 01DB7A74 0800E003 */  jr          $31
/* 00BD78 01DB7A78 00000000 */   nop
/* 00BD7C 01DB7A7C 00000000 */  nop
