.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel Draw__8CHitMarkFv
/* B32A0 001B31A0 10FFBD27 */  addiu      $sp, $sp, -0xF0
/* B32A4 001B31A4 3000BF7F */  sq         $31, 0x30($sp)
/* B32A8 001B31A8 2000B27F */  sq         $18, 0x20($sp)
/* B32AC 001B31AC 1000B17F */  sq         $17, 0x10($sp)
/* B32B0 001B31B0 0000B07F */  sq         $16, 0x0($sp)
/* B32B4 001B31B4 28968070 */  paddub     $18, $4, $0
/* B32B8 001B31B8 5406838C */  lw         $3, 0x654($4)
/* B32BC 001B31BC AC006010 */  beqz       $3, .L001B3470
/* B32C0 001B31C0 00000000 */   nop
/* B32C4 001B31C4 8000A427 */  addiu      $4, $sp, 0x80
/* B32C8 001B31C8 10004526 */  addiu      $5, $18, 0x10
/* B32CC 001B31CC 0C86040C */  jal        sceVu0CopyVector
/* B32D0 001B31D0 00000000 */   nop
/* B32D4 001B31D4 C701023C */  lui        $2, %hi(TexManager)
/* B32D8 001B31D8 70584424 */  addiu      $4, $2, %lo(TexManager)
/* B32DC 001B31DC 2A00023C */  lui        $2, %hi(_1430)
/* B32E0 001B31E0 F8B64524 */  addiu      $5, $2, %lo(_1430)
/* B32E4 001B31E4 FFFF0624 */  addiu      $6, $0, -0x1
/* B32E8 001B31E8 B4C4040C */  jal        GetTexture__15CTextureManagerFPci
/* B32EC 001B31EC 00000000 */   nop
/* B32F0 001B31F0 28864070 */  paddub     $16, $2, $0
/* B32F4 001B31F4 288E0070 */  paddub     $17, $0, $0
/* B32F8 001B31F8 99000010 */  b          .L001B3460
/* B32FC 001B31FC 00000000 */   nop
.L001B3200:
/* B3300 001B3200 80181100 */  sll        $3, $17, 2
/* B3304 001B3204 21207200 */  addu       $4, $3, $18
/* B3308 001B3208 D405838C */  lw         $3, 0x5D4($4)
/* B330C 001B320C 93006010 */  beqz       $3, .L001B345C
/* B3310 001B3210 00000000 */   nop
/* B3314 001B3214 00111100 */  sll        $2, $17, 4
/* B3318 001B3218 21105200 */  addu       $2, $2, $18
/* B331C 001B321C B00041C4 */  lwc1       $f1, 0xB0($2)
/* B3320 001B3220 8000A0C7 */  lwc1       $f0, 0x80($sp)
/* B3324 001B3224 00000146 */  add.s      $f0, $f0, $f1
/* B3328 001B3228 9000A0E7 */  swc1       $f0, 0x90($sp)
/* B332C 001B322C B40041C4 */  lwc1       $f1, 0xB4($2)
/* B3330 001B3230 8400A0C7 */  lwc1       $f0, 0x84($sp)
/* B3334 001B3234 00000146 */  add.s      $f0, $f0, $f1
/* B3338 001B3238 9400A0E7 */  swc1       $f0, 0x94($sp)
/* B333C 001B323C B80041C4 */  lwc1       $f1, 0xB8($2)
/* B3340 001B3240 8800A0C7 */  lwc1       $f0, 0x88($sp)
/* B3344 001B3244 00000146 */  add.s      $f0, $f0, $f1
/* B3348 001B3248 9800A0E7 */  swc1       $f0, 0x98($sp)
/* B334C 001B324C 803F023C */  lui        $2, (0x3F800000 >> 16)
/* B3350 001B3250 9C00A2AF */  sw         $2, 0x9C($sp)
/* B3354 001B3254 B0048CC4 */  lwc1       $f12, 0x4B0($4)
/* B3358 001B3258 0040023C */  lui        $2, (0x40000000 >> 16)
/* B335C 001B325C 00008244 */  mtc1       $2, $f0
/* B3360 001B3260 00000000 */  nop
/* B3364 001B3264 43630046 */  div.s      $f13, $f12, $f0
/* B3368 001B3268 4000A427 */  addiu      $4, $sp, 0x40
/* B336C 001B326C 7000A527 */  addiu      $5, $sp, 0x70
/* B3370 001B3270 9000A627 */  addiu      $6, $sp, 0x90
/* B3374 001B3274 283E0070 */  paddub     $7, $0, $0
/* B3378 001B3278 D0B9040C */  jal        MGRotTransPers3DSprite__FPiPiPfffi
/* B337C 001B327C 00000000 */   nop
/* B3380 001B3280 01000524 */  addiu      $5, $0, 0x1
/* B3384 001B3284 75004514 */  bne        $2, $5, .L001B345C
/* B3388 001B3288 00000000 */   nop
/* B338C 001B328C 7000A38F */  lw         $3, 0x70($sp)
/* B3390 001B3290 5000A3AF */  sw         $3, 0x50($sp)
/* B3394 001B3294 4400A38F */  lw         $3, 0x44($sp)
/* B3398 001B3298 5400A3AF */  sw         $3, 0x54($sp)
/* B339C 001B329C 4800A38F */  lw         $3, 0x48($sp)
/* B33A0 001B32A0 5800A3AF */  sw         $3, 0x58($sp)
/* B33A4 001B32A4 4000A38F */  lw         $3, 0x40($sp)
/* B33A8 001B32A8 6000A3AF */  sw         $3, 0x60($sp)
/* B33AC 001B32AC 7400A38F */  lw         $3, 0x74($sp)
/* B33B0 001B32B0 6400A3AF */  sw         $3, 0x64($sp)
/* B33B4 001B32B4 7800A38F */  lw         $3, 0x78($sp)
/* B33B8 001B32B8 6800A3AF */  sw         $3, 0x68($sp)
/* B33BC 001B32BC 5806448E */  lw         $4, 0x658($18)
/* B33C0 001B32C0 04000324 */  addiu      $3, $0, 0x4
/* B33C4 001B32C4 54008310 */  beq        $4, $3, .L001B3418
/* B33C8 001B32C8 00000000 */   nop
/* B33CC 001B32CC 03000324 */  addiu      $3, $0, 0x3
/* B33D0 001B32D0 3F008310 */  beq        $4, $3, .L001B33D0
/* B33D4 001B32D4 00000000 */   nop
/* B33D8 001B32D8 02000324 */  addiu      $3, $0, 0x2
/* B33DC 001B32DC 2A008310 */  beq        $4, $3, .L001B3388
/* B33E0 001B32E0 00000000 */   nop
/* B33E4 001B32E4 16008510 */  beq        $4, $5, .L001B3340
/* B33E8 001B32E8 00000000 */   nop
/* B33EC 001B32EC 03008010 */  beqz       $4, .L001B32FC
/* B33F0 001B32F0 00000000 */   nop
/* B33F4 001B32F4 59000010 */  b          .L001B345C
/* B33F8 001B32F8 00000000 */   nop
.L001B32FC:
/* B33FC 001B32FC A000A0AF */  sw         $0, 0xA0($sp)
/* B3400 001B3300 A400A0AF */  sw         $0, 0xA4($sp)
/* B3404 001B3304 10000224 */  addiu      $2, $0, 0x10
/* B3408 001B3308 A800A2AF */  sw         $2, 0xA8($sp)
/* B340C 001B330C AC00A2AF */  sw         $2, 0xAC($sp)
/* B3410 001B3310 D48B848F */  lw         $4, -0x742C($gp)
/* B3414 001B3314 282E0072 */  paddub     $5, $16, $0
/* B3418 001B3318 A000A627 */  addiu      $6, $sp, 0xA0
/* B341C 001B331C 4000A727 */  addiu      $7, $sp, 0x40
/* B3420 001B3320 5000A827 */  addiu      $8, $sp, 0x50
/* B3424 001B3324 6000A927 */  addiu      $9, $sp, 0x60
/* B3428 001B3328 7000AA27 */  addiu      $10, $sp, 0x70
/* B342C 001B332C 80000B24 */  addiu      $11, $0, 0x80
/* B3430 001B3330 1C75050C */  jal        set3DSprite__FP13sceVif1PacketP8CTextureRC8CRect_i_PiPiPiPiUc
/* B3434 001B3334 00000000 */   nop
/* B3438 001B3338 48000010 */  b          .L001B345C
/* B343C 001B333C 00000000 */   nop
.L001B3340:
/* B3440 001B3340 30000224 */  addiu      $2, $0, 0x30
/* B3444 001B3344 B000A2AF */  sw         $2, 0xB0($sp)
/* B3448 001B3348 10000224 */  addiu      $2, $0, 0x10
/* B344C 001B334C B400A2AF */  sw         $2, 0xB4($sp)
/* B3450 001B3350 B800A2AF */  sw         $2, 0xB8($sp)
/* B3454 001B3354 BC00A2AF */  sw         $2, 0xBC($sp)
/* B3458 001B3358 D48B848F */  lw         $4, -0x742C($gp)
/* B345C 001B335C 282E0072 */  paddub     $5, $16, $0
/* B3460 001B3360 B000A627 */  addiu      $6, $sp, 0xB0
/* B3464 001B3364 4000A727 */  addiu      $7, $sp, 0x40
/* B3468 001B3368 5000A827 */  addiu      $8, $sp, 0x50
/* B346C 001B336C 6000A927 */  addiu      $9, $sp, 0x60
/* B3470 001B3370 7000AA27 */  addiu      $10, $sp, 0x70
/* B3474 001B3374 80000B24 */  addiu      $11, $0, 0x80
/* B3478 001B3378 1C75050C */  jal        set3DSprite__FP13sceVif1PacketP8CTextureRC8CRect_i_PiPiPiPiUc
/* B347C 001B337C 00000000 */   nop
/* B3480 001B3380 36000010 */  b          .L001B345C
/* B3484 001B3384 00000000 */   nop
.L001B3388:
/* B3488 001B3388 40000224 */  addiu      $2, $0, 0x40
/* B348C 001B338C C000A2AF */  sw         $2, 0xC0($sp)
/* B3490 001B3390 C400A0AF */  sw         $0, 0xC4($sp)
/* B3494 001B3394 10000224 */  addiu      $2, $0, 0x10
/* B3498 001B3398 C800A2AF */  sw         $2, 0xC8($sp)
/* B349C 001B339C CC00A2AF */  sw         $2, 0xCC($sp)
/* B34A0 001B33A0 D48B848F */  lw         $4, -0x742C($gp)
/* B34A4 001B33A4 282E0072 */  paddub     $5, $16, $0
/* B34A8 001B33A8 C000A627 */  addiu      $6, $sp, 0xC0
/* B34AC 001B33AC 4000A727 */  addiu      $7, $sp, 0x40
/* B34B0 001B33B0 5000A827 */  addiu      $8, $sp, 0x50
/* B34B4 001B33B4 6000A927 */  addiu      $9, $sp, 0x60
/* B34B8 001B33B8 7000AA27 */  addiu      $10, $sp, 0x70
/* B34BC 001B33BC 80000B24 */  addiu      $11, $0, 0x80
/* B34C0 001B33C0 1C75050C */  jal        set3DSprite__FP13sceVif1PacketP8CTextureRC8CRect_i_PiPiPiPiUc
/* B34C4 001B33C4 00000000 */   nop
/* B34C8 001B33C8 24000010 */  b          .L001B345C
/* B34CC 001B33CC 00000000 */   nop
.L001B33D0:
/* B34D0 001B33D0 10000224 */  addiu      $2, $0, 0x10
/* B34D4 001B33D4 D000A2AF */  sw         $2, 0xD0($sp)
/* B34D8 001B33D8 D400A0AF */  sw         $0, 0xD4($sp)
/* B34DC 001B33DC 20000224 */  addiu      $2, $0, 0x20
/* B34E0 001B33E0 D800A2AF */  sw         $2, 0xD8($sp)
/* B34E4 001B33E4 DC00A2AF */  sw         $2, 0xDC($sp)
/* B34E8 001B33E8 D48B848F */  lw         $4, -0x742C($gp)
/* B34EC 001B33EC 282E0072 */  paddub     $5, $16, $0
/* B34F0 001B33F0 D000A627 */  addiu      $6, $sp, 0xD0
/* B34F4 001B33F4 4000A727 */  addiu      $7, $sp, 0x40
/* B34F8 001B33F8 5000A827 */  addiu      $8, $sp, 0x50
/* B34FC 001B33FC 6000A927 */  addiu      $9, $sp, 0x60
/* B3500 001B3400 7000AA27 */  addiu      $10, $sp, 0x70
/* B3504 001B3404 40000B24 */  addiu      $11, $0, 0x40
/* B3508 001B3408 1C75050C */  jal        set3DSprite__FP13sceVif1PacketP8CTextureRC8CRect_i_PiPiPiPiUc
/* B350C 001B340C 00000000 */   nop
/* B3510 001B3410 12000010 */  b          .L001B345C
/* B3514 001B3414 00000000 */   nop
.L001B3418:
/* B3518 001B3418 68000224 */  addiu      $2, $0, 0x68
/* B351C 001B341C E000A2AF */  sw         $2, 0xE0($sp)
/* B3520 001B3420 20000224 */  addiu      $2, $0, 0x20
/* B3524 001B3424 E400A2AF */  sw         $2, 0xE4($sp)
/* B3528 001B3428 18000224 */  addiu      $2, $0, 0x18
/* B352C 001B342C E800A2AF */  sw         $2, 0xE8($sp)
/* B3530 001B3430 EC00A2AF */  sw         $2, 0xEC($sp)
/* B3534 001B3434 D48B848F */  lw         $4, -0x742C($gp)
/* B3538 001B3438 282E0072 */  paddub     $5, $16, $0
/* B353C 001B343C E000A627 */  addiu      $6, $sp, 0xE0
/* B3540 001B3440 4000A727 */  addiu      $7, $sp, 0x40
/* B3544 001B3444 5000A827 */  addiu      $8, $sp, 0x50
/* B3548 001B3448 6000A927 */  addiu      $9, $sp, 0x60
/* B354C 001B344C 7000AA27 */  addiu      $10, $sp, 0x70
/* B3550 001B3450 80000B24 */  addiu      $11, $0, 0x80
/* B3554 001B3454 1C75050C */  jal        set3DSprite__FP13sceVif1PacketP8CTextureRC8CRect_i_PiPiPiPiUc
/* B3558 001B3458 00000000 */   nop
.L001B345C:
/* B355C 001B345C 01003126 */  addiu      $17, $17, 0x1
.L001B3460:
/* B3560 001B3460 5406438E */  lw         $3, 0x654($18)
/* B3564 001B3464 2A182302 */  slt        $3, $17, $3
/* B3568 001B3468 65FF6014 */  bnez       $3, .L001B3200
/* B356C 001B346C 00000000 */   nop
.L001B3470:
/* B3570 001B3470 3000BF7B */  lq         $31, 0x30($sp)
/* B3574 001B3474 2000B27B */  lq         $18, 0x20($sp)
/* B3578 001B3478 1000B17B */  lq         $17, 0x10($sp)
/* B357C 001B347C 0000B07B */  lq         $16, 0x0($sp)
/* B3580 001B3480 F000BD27 */  addiu      $sp, $sp, 0xF0
/* B3584 001B3484 0800E003 */  jr         $31
/* B3588 001B3488 00000000 */   nop
/* B358C 001B348C 00000000 */  nop
