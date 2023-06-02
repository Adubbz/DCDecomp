.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel DrawStatusNumberNowAndMax__FPiiiii
/* 10B2B0 0020B1B0 70FFBD27 */  addiu      $sp, $sp, -0x90
/* 10B2B4 0020B1B4 5000BF7F */  sq         $31, 0x50($sp)
/* 10B2B8 0020B1B8 4000B47F */  sq         $20, 0x40($sp)
/* 10B2BC 0020B1BC 3000B37F */  sq         $19, 0x30($sp)
/* 10B2C0 0020B1C0 2000B27F */  sq         $18, 0x20($sp)
/* 10B2C4 0020B1C4 1000B17F */  sq         $17, 0x10($sp)
/* 10B2C8 0020B1C8 0000B07F */  sq         $16, 0x0($sp)
/* 10B2CC 0020B1CC 28A68070 */  paddub     $20, $4, $0
/* 10B2D0 0020B1D0 289EC070 */  paddub     $19, $6, $0
/* 10B2D4 0020B1D4 2896E070 */  paddub     $18, $7, $0
/* 10B2D8 0020B1D8 288E0071 */  paddub     $17, $8, $0
/* 10B2DC 0020B1DC 2900023C */  lui        $2, %hi(NumberSprite)
/* 10B2E0 0020B1E0 102B4224 */  addiu      $2, $2, %lo(NumberSprite)
/* 10B2E4 0020B1E4 6000A327 */  addiu      $3, $sp, 0x60
/* 10B2E8 0020B1E8 00004278 */  lq         $2, 0x0($2)
/* 10B2EC 0020B1EC 0000627C */  sq         $2, 0x0($3)
/* 10B2F0 0020B1F0 040080C4 */  lwc1       $f0, 0x4($4)
/* 10B2F4 0020B1F4 60008046 */  cvt.s.w    $f1, $f0
/* 10B2F8 0020B1F8 908280C7 */  lwc1       $f0, -0x7D70($gp)
/* 10B2FC 0020B1FC 42000146 */  mul.s      $f1, $f0, $f1
/* 10B300 0020B200 000080C4 */  lwc1       $f0, 0x0($4)
/* 10B304 0020B204 20008046 */  cvt.s.w    $f0, $f0
/* 10B308 0020B208 34000146 */  c.lt.s     $f0, $f1
/* 10B30C 0020B20C 00000000 */  nop
/* 10B310 0020B210 04000045 */  bc1f       .L0020B224
/* 10B314 0020B214 00000000 */   nop
/* 10B318 0020B218 6400A28F */  lw         $2, 0x64($sp)
/* 10B31C 0020B21C 0C004224 */  addiu      $2, $2, 0xC
/* 10B320 0020B220 6400A2AF */  sw         $2, 0x64($sp)
.L0020B224:
/* 10B324 0020B224 0400848E */  lw         $4, 0x4($20)
/* 10B328 0020B228 28366072 */  paddub     $6, $19, $0
/* 10B32C 0020B22C A096878F */  lw         $7, -0x6960($gp)
/* 10B330 0020B230 6000A827 */  addiu      $8, $sp, 0x60
/* 10B334 0020B234 284E4072 */  paddub     $9, $18, $0
/* 10B338 0020B238 28562072 */  paddub     $10, $17, $0
/* 10B33C 0020B23C 705F080C */  jal        DrawMenuNumber__FiiiP8CTexture4RECTii
/* 10B340 0020B240 00000000 */   nop
/* 10B344 0020B244 28864070 */  paddub     $16, $2, $0
/* 10B348 0020B248 6400A38F */  lw         $3, 0x64($sp)
/* 10B34C 0020B24C 78000224 */  addiu      $2, $0, 0x78
/* 10B350 0020B250 8000A2AF */  sw         $2, 0x80($sp)
/* 10B354 0020B254 8400A3AF */  sw         $3, 0x84($sp)
/* 10B358 0020B258 0C000324 */  addiu      $3, $0, 0xC
/* 10B35C 0020B25C 8800A3AF */  sw         $3, 0x88($sp)
/* 10B360 0020B260 8C00A3AF */  sw         $3, 0x8C($sp)
/* 10B364 0020B264 F5FF0226 */  addiu      $2, $16, -0xB
/* 10B368 0020B268 7000A2AF */  sw         $2, 0x70($sp)
/* 10B36C 0020B26C 7400B3AF */  sw         $19, 0x74($sp)
/* 10B370 0020B270 7800A3AF */  sw         $3, 0x78($sp)
/* 10B374 0020B274 7C00A3AF */  sw         $3, 0x7C($sp)
/* 10B378 0020B278 A096848F */  lw         $4, -0x6960($gp)
/* 10B37C 0020B27C 7000A527 */  addiu      $5, $sp, 0x70
/* 10B380 0020B280 8000A627 */  addiu      $6, $sp, 0x80
/* 10B384 0020B284 283E2072 */  paddub     $7, $17, $0
/* 10B388 0020B288 C8B3080C */  jal        DrawMenu2DSprite__FP8CTexture8CRect_i_8CRect_i_i
/* 10B38C 0020B28C 00000000 */   nop
/* 10B390 0020B290 F5FF0526 */  addiu      $5, $16, -0xB
/* 10B394 0020B294 0000848E */  lw         $4, 0x0($20)
/* 10B398 0020B298 28366072 */  paddub     $6, $19, $0
/* 10B39C 0020B29C A096878F */  lw         $7, -0x6960($gp)
/* 10B3A0 0020B2A0 6000A827 */  addiu      $8, $sp, 0x60
/* 10B3A4 0020B2A4 284E4072 */  paddub     $9, $18, $0
/* 10B3A8 0020B2A8 28562072 */  paddub     $10, $17, $0
/* 10B3AC 0020B2AC 705F080C */  jal        DrawMenuNumber__FiiiP8CTexture4RECTii
/* 10B3B0 0020B2B0 00000000 */   nop
/* 10B3B4 0020B2B4 5000BF7B */  lq         $31, 0x50($sp)
/* 10B3B8 0020B2B8 4000B47B */  lq         $20, 0x40($sp)
/* 10B3BC 0020B2BC 3000B37B */  lq         $19, 0x30($sp)
/* 10B3C0 0020B2C0 2000B27B */  lq         $18, 0x20($sp)
/* 10B3C4 0020B2C4 1000B17B */  lq         $17, 0x10($sp)
/* 10B3C8 0020B2C8 0000B07B */  lq         $16, 0x0($sp)
/* 10B3CC 0020B2CC 9000BD27 */  addiu      $sp, $sp, 0x90
/* 10B3D0 0020B2D0 0800E003 */  jr         $31
/* 10B3D4 0020B2D4 00000000 */   nop
/* 10B3D8 0020B2D8 00000000 */  nop
/* 10B3DC 0020B2DC 00000000 */  nop
