.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel SystemMesDraw__Fv
/* 0602E0 001601E0 E0FFBD27 */  addiu       $29, $29, -0x20
/* 0602E4 001601E4 1000BF7F */  sq          $31, 0x10($29)
/* 0602E8 001601E8 0000B07F */  sq          $16, 0x0($29)
/* 0602EC 001601EC 708E838F */  lw          $3, -0x7190($28)
/* 0602F0 001601F0 2200601C */  bgtz        $3, .L0016027C
/* 0602F4 001601F4 00000000 */   nop
/* 0602F8 001601F8 0087838F */  lw          $3, -0x7900($28)
/* 0602FC 001601FC 1F006018 */  blez        $3, .L0016027C
/* 060300 00160200 00000000 */   nop
/* 060304 00160204 C701023C */  lui         $2, %hi(TexManager)
/* 060308 00160208 70584424 */  addiu       $4, $2, %lo(TexManager)
/* 06030C 0016020C D48B858F */  lw          $5, -0x742C($28)
/* 060310 00160210 D001013C */  lui         $1, %hi(SystemMessage + 0x174C)
/* 060314 00160214 7CCD268C */  lw          $6, %lo(SystemMessage + 0x174C)($1)
/* 060318 00160218 1CCC040C */  jal         ReloadTexture__15CTextureManagerFP13sceVif1Packeti
/* 06031C 0016021C 00000000 */   nop
/* 060320 00160220 D001013C */  lui         $1, %hi(SystemMessage + 0x18)
/* 060324 00160224 48B6238C */  lw          $3, %lo(SystemMessage + 0x18)($1)
/* 060328 00160228 40011024 */  addiu       $16, $0, 0x140
/* 06032C 0016022C C0100300 */  sll         $2, $3, 3
/* 060330 00160230 23104300 */  subu        $2, $2, $3
/* 060334 00160234 7C100200 */  dsll32      $2, $2, 1
/* 060338 00160238 7F100200 */  dsra32      $2, $2, 1
/* 06033C 0016023C 23800202 */  subu        $16, $16, $2
/* 060340 00160240 28260070 */  paddub      $4, $0, $0
/* 060344 00160244 046F050C */  jal         setbilinear__Fi
/* 060348 00160248 00000000 */   nop
/* 06034C 0016024C D001013C */  lui         $1, %hi(SystemMessage)
/* 060350 00160250 30B630AC */  sw          $16, %lo(SystemMessage)($1)
/* 060354 00160254 59010224 */  addiu       $2, $0, 0x159
/* 060358 00160258 D001013C */  lui         $1, %hi(SystemMessage + 0x4)
/* 06035C 0016025C 34B622AC */  sw          $2, %lo(SystemMessage + 0x4)($1)
/* 060360 00160260 0487828F */  lw          $2, -0x78FC($28)
/* 060364 00160264 D001013C */  lui         $1, %hi(SystemMessage + 0x54)
/* 060368 00160268 84B622AC */  sw          $2, %lo(SystemMessage + 0x54)($1)
/* 06036C 0016026C D001023C */  lui         $2, %hi(SystemMessage)
/* 060370 00160270 30B64424 */  addiu       $4, $2, %lo(SystemMessage)
/* 060374 00160274 C44C050C */  jal         DrawMesWin__6ClsMesFv
/* 060378 00160278 00000000 */   nop
.L0016027C:
/* 06037C 0016027C 1000BF7B */  lq          $31, 0x10($29)
/* 060380 00160280 0000B07B */  lq          $16, 0x0($29)
/* 060384 00160284 2000BD27 */  addiu       $29, $29, 0x20
/* 060388 00160288 0800E003 */  jr          $31
/* 06038C 0016028C 00000000 */   nop
