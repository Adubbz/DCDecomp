.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel DrawMenuObjectVibe__Fiiii
/* 117040 00216F40 90FFBD27 */  addiu      $sp, $sp, -0x70
/* 117044 00216F44 5000BF7F */  sq         $31, 0x50($sp)
/* 117048 00216F48 4000B47F */  sq         $20, 0x40($sp)
/* 11704C 00216F4C 3000B37F */  sq         $19, 0x30($sp)
/* 117050 00216F50 2000B27F */  sq         $18, 0x20($sp)
/* 117054 00216F54 1000B17F */  sq         $17, 0x10($sp)
/* 117058 00216F58 0000B07F */  sq         $16, 0x0($sp)
/* 11705C 00216F5C 28968070 */  paddub     $18, $4, $0
/* 117060 00216F60 288EA070 */  paddub     $17, $5, $0
/* 117064 00216F64 2886C070 */  paddub     $16, $6, $0
/* 117068 00216F68 28A6E070 */  paddub     $20, $7, $0
/* 11706C 00216F6C C701023C */  lui        $2, %hi(TexManager)
/* 117070 00216F70 70584424 */  addiu      $4, $2, %lo(TexManager)
/* 117074 00216F74 2A00023C */  lui        $2, %hi(_594_2)
/* 117078 00216F78 F0E94524 */  addiu      $5, $2, %lo(_594_2)
/* 11707C 00216F7C FFFF0624 */  addiu      $6, $0, -0x1
/* 117080 00216F80 B4C4040C */  jal        GetTexture__15CTextureManagerFPci
/* 117084 00216F84 00000000 */   nop
/* 117088 00216F88 289E4070 */  paddub     $19, $2, $0
/* 11708C 00216F8C 6000B4AF */  sw         $20, 0x60($sp)
/* 117090 00216F90 28000224 */  addiu      $2, $0, 0x28
/* 117094 00216F94 6400A2AF */  sw         $2, 0x64($sp)
/* 117098 00216F98 20000224 */  addiu      $2, $0, 0x20
/* 11709C 00216F9C 6800A2AF */  sw         $2, 0x68($sp)
/* 1170A0 00216FA0 6C00A2AF */  sw         $2, 0x6C($sp)
/* 1170A4 00216FA4 09000012 */  beqz       $16, .L00216FCC
/* 1170A8 00216FA8 00000000 */   nop
/* 1170AC 00216FAC 05004426 */  addiu      $4, $18, 0x5
/* 1170B0 00216FB0 03002526 */  addiu      $5, $17, 0x3
/* 1170B4 00216FB4 28366072 */  paddub     $6, $19, $0
/* 1170B8 00216FB8 6000A727 */  addiu      $7, $sp, 0x60
/* 1170BC 00216FBC 28460070 */  paddub     $8, $0, $0
/* 1170C0 00216FC0 64000924 */  addiu      $9, $0, 0x64
/* 1170C4 00216FC4 645B080C */  jal        DrawObjectVibe__FiiP8CTexture8CRect_i_Uci
/* 1170C8 00216FC8 00000000 */   nop
.L00216FCC:
/* 1170CC 00216FCC 28264072 */  paddub     $4, $18, $0
/* 1170D0 00216FD0 282E2072 */  paddub     $5, $17, $0
/* 1170D4 00216FD4 28366072 */  paddub     $6, $19, $0
/* 1170D8 00216FD8 6000A727 */  addiu      $7, $sp, 0x60
/* 1170DC 00216FDC 80000824 */  addiu      $8, $0, 0x80
/* 1170E0 00216FE0 284E0071 */  paddub     $9, $8, $0
/* 1170E4 00216FE4 645B080C */  jal        DrawObjectVibe__FiiP8CTexture8CRect_i_Uci
/* 1170E8 00216FE8 00000000 */   nop
/* 1170EC 00216FEC 5000BF7B */  lq         $31, 0x50($sp)
/* 1170F0 00216FF0 4000B47B */  lq         $20, 0x40($sp)
/* 1170F4 00216FF4 3000B37B */  lq         $19, 0x30($sp)
/* 1170F8 00216FF8 2000B27B */  lq         $18, 0x20($sp)
/* 1170FC 00216FFC 1000B17B */  lq         $17, 0x10($sp)
/* 117100 00217000 0000B07B */  lq         $16, 0x0($sp)
/* 117104 00217004 7000BD27 */  addiu      $sp, $sp, 0x70
/* 117108 00217008 0800E003 */  jr         $31
/* 11710C 0021700C 00000000 */   nop
