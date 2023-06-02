.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel CommandMOTION_PARTS__FPPv
/* 77360 00177260 D0FFBD27 */  addiu      $sp, $sp, -0x30
/* 77364 00177264 2000BF7F */  sq         $31, 0x20($sp)
/* 77368 00177268 1000B17F */  sq         $17, 0x10($sp)
/* 7736C 0017726C 0000B07F */  sq         $16, 0x0($sp)
/* 77370 00177270 288E8070 */  paddub     $17, $4, $0
/* 77374 00177274 1890848F */  lw         $4, -0x6FE8($gp)
/* 77378 00177278 04008128 */  slti       $at, $4, 0x4
/* 7737C 0017727C 23002010 */  beqz       $at, .L0017730C
/* 77380 00177280 00000000 */   nop
/* 77384 00177284 80100400 */  sll        $2, $4, 2
/* 77388 00177288 21184400 */  addu       $3, $2, $4
/* 7738C 0017728C 80100300 */  sll        $2, $3, 2
/* 77390 00177290 21106200 */  addu       $2, $3, $2
/* 77394 00177294 80180200 */  sll        $3, $2, 2
/* 77398 00177298 C08F828F */  lw         $2, -0x7040($gp)
/* 7739C 0017729C 21104300 */  addu       $2, $2, $3
/* 773A0 001772A0 0100013C */  lui        $at, (0x17B40 >> 16)
/* 773A4 001772A4 407B2134 */  ori        $at, $at, (0x17B40 & 0xFFFF)
/* 773A8 001772A8 21804100 */  addu       $16, $2, $at
/* 773AC 001772AC 01008224 */  addiu      $2, $4, 0x1
/* 773B0 001772B0 189082AF */  sw         $2, -0x6FE8($gp)
/* 773B4 001772B4 0000258E */  lw         $5, 0x0($17)
/* 773B8 001772B8 28260072 */  paddub     $4, $16, $0
/* 773BC 001772BC 5A15040C */  jal        strcpy
/* 773C0 001772C0 00000000 */   nop
/* 773C4 001772C4 0400238E */  lw         $3, 0x4($17)
/* 773C8 001772C8 000060C4 */  lwc1       $f0, 0x0($3)
/* 773CC 001772CC 400000E6 */  swc1       $f0, 0x40($16)
/* 773D0 001772D0 0800238E */  lw         $3, 0x8($17)
/* 773D4 001772D4 000060C4 */  lwc1       $f0, 0x0($3)
/* 773D8 001772D8 440000E6 */  swc1       $f0, 0x44($16)
/* 773DC 001772DC 0C00238E */  lw         $3, 0xC($17)
/* 773E0 001772E0 000060C4 */  lwc1       $f0, 0x0($3)
/* 773E4 001772E4 480000E6 */  swc1       $f0, 0x48($16)
/* 773E8 001772E8 1000238E */  lw         $3, 0x10($17)
/* 773EC 001772EC 000060C4 */  lwc1       $f0, 0x0($3)
/* 773F0 001772F0 4C0000E6 */  swc1       $f0, 0x4C($16)
/* 773F4 001772F4 1400238E */  lw         $3, 0x14($17)
/* 773F8 001772F8 000060C4 */  lwc1       $f0, 0x0($3)
/* 773FC 001772FC 500000E6 */  swc1       $f0, 0x50($16)
/* 77400 00177300 1800238E */  lw         $3, 0x18($17)
/* 77404 00177304 000060C4 */  lwc1       $f0, 0x0($3)
/* 77408 00177308 540000E6 */  swc1       $f0, 0x54($16)
.L0017730C:
/* 7740C 0017730C 2000BF7B */  lq         $31, 0x20($sp)
/* 77410 00177310 1000B17B */  lq         $17, 0x10($sp)
/* 77414 00177314 0000B07B */  lq         $16, 0x0($sp)
/* 77418 00177318 3000BD27 */  addiu      $sp, $sp, 0x30
/* 7741C 0017731C 0800E003 */  jr         $31
/* 77420 00177320 00000000 */   nop
/* 77424 00177324 00000000 */  nop
/* 77428 00177328 00000000 */  nop
/* 7742C 0017732C 00000000 */  nop