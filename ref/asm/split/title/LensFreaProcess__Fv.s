.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel LensFreaProcess__Fv
/* 01B090 01DC6D90 C0FFBD27 */  addiu       $29, $29, -0x40
/* 01B094 01DC6D94 0000BF7F */  sq          $31, 0x0($29)
/* 01B098 01DC6D98 DE01023C */  lui         $2, %hi(LIT_1004__4)
/* 01B09C 01DC6D9C C0B04224 */  addiu       $2, $2, %lo(LIT_1004__4)
/* 01B0A0 01DC6DA0 3000A327 */  addiu       $3, $29, 0x30
/* 01B0A4 01DC6DA4 00004278 */  lq          $2, 0x0($2)
/* 01B0A8 01DC6DA8 0000627C */  sq          $2, 0x0($3)
/* 01B0AC 01DC6DAC 849A848F */  lw          $4, -0x657C($28)
/* 01B0B0 01DC6DB0 DE01023C */  lui         $2, %hi(LIT_1012__2)
/* 01B0B4 01DC6DB4 20FE4524 */  addiu       $5, $2, %lo(LIT_1012__2)
/* 01B0B8 01DC6DB8 C0A1040C */  jal         SearchFrame__6CFrameFPc
/* 01B0BC 01DC6DBC 00000000 */   nop
/* 01B0C0 01DC6DC0 28264070 */  paddub      $4, $2, $0
/* 01B0C4 01DC6DC4 23008010 */  beqz        $4, .L01DC6E54_2CC654
/* 01B0C8 01DC6DC8 00000000 */   nop
/* 01B0CC 01DC6DCC 1000A527 */  addiu       $5, $29, 0x10
/* 01B0D0 01DC6DD0 3000A627 */  addiu       $6, $29, 0x30
/* 01B0D4 01DC6DD4 58A3040C */  jal         GetWorldPosition__6CFrameFPfPf
/* 01B0D8 01DC6DD8 00000000 */   nop
/* 01B0DC 01DC6DDC 2000A427 */  addiu       $4, $29, 0x20
/* 01B0E0 01DC6DE0 1000A527 */  addiu       $5, $29, 0x10
/* 01B0E4 01DC6DE4 28360070 */  paddub      $6, $0, $0
/* 01B0E8 01DC6DE8 38B9040C */  jal         MGRotTransPers2D__FPiPfi
/* 01B0EC 01DC6DEC 00000000 */   nop
/* 01B0F0 01DC6DF0 18004010 */  beqz        $2, .L01DC6E54_2CC654
/* 01B0F4 01DC6DF4 00000000 */   nop
/* 01B0F8 01DC6DF8 C701023C */  lui         $2, %hi(TexManager)
/* 01B0FC 01DC6DFC 70584424 */  addiu       $4, $2, %lo(TexManager)
/* 01B100 01DC6E00 DE01023C */  lui         $2, %hi(LIT_1013__2)
/* 01B104 01DC6E04 28FE4524 */  addiu       $5, $2, %lo(LIT_1013__2)
/* 01B108 01DC6E08 FFFF0624 */  addiu       $6, $0, -0x1
/* 01B10C 01DC6E0C B4C4040C */  jal         GetTexture__15CTextureManagerFPci
/* 01B110 01DC6E10 00000000 */   nop
/* 01B114 01DC6E14 0F004010 */  beqz        $2, .L01DC6E54_2CC654
/* 01B118 01DC6E18 00000000 */   nop
/* 01B11C 01DC6E1C C701023C */  lui         $2, %hi(TexManager)
/* 01B120 01DC6E20 70584424 */  addiu       $4, $2, %lo(TexManager)
/* 01B124 01DC6E24 DE01023C */  lui         $2, %hi(LIT_1013__2)
/* 01B128 01DC6E28 28FE4524 */  addiu       $5, $2, %lo(LIT_1013__2)
/* 01B12C 01DC6E2C FFFF0624 */  addiu       $6, $0, -0x1
/* 01B130 01DC6E30 B4C4040C */  jal         GetTexture__15CTextureManagerFPci
/* 01B134 01DC6E34 00000000 */   nop
/* 01B138 01DC6E38 28264070 */  paddub      $4, $2, $0
/* 01B13C 01DC6E3C 1000A527 */  addiu       $5, $29, 0x10
/* 01B140 01DC6E40 FF000624 */  addiu       $6, $0, 0xFF
/* 01B144 01DC6E44 283EC070 */  paddub      $7, $6, $0
/* 01B148 01DC6E48 2846C070 */  paddub      $8, $6, $0
/* 01B14C 01DC6E4C AC63050C */  jal         LensFlare__FP8CTexturePfUcUcUc
/* 01B150 01DC6E50 00000000 */   nop
.L01DC6E54_2CC654:
/* 01B154 01DC6E54 0000BF7B */  lq          $31, 0x0($29)
/* 01B158 01DC6E58 4000BD27 */  addiu       $29, $29, 0x40
/* 01B15C 01DC6E5C 0800E003 */  jr          $31
/* 01B160 01DC6E60 00000000 */   nop
/* 01B164 01DC6E64 00000000 */  nop
/* 01B168 01DC6E68 00000000 */  nop
/* 01B16C 01DC6E6C 00000000 */  nop
