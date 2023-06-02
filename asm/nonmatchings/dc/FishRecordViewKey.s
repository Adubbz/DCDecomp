.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel FishRecordViewKey__Fv
/* F32E0 001F31E0 D0FFBD27 */  addiu      $sp, $sp, -0x30
/* F32E4 001F31E4 2000BF7F */  sq         $31, 0x20($sp)
/* F32E8 001F31E8 1000B17F */  sq         $17, 0x10($sp)
/* F32EC 001F31EC 0000B07F */  sq         $16, 0x0($sp)
/* F32F0 001F31F0 38FB040C */  jal        ReadBG__Fv
/* F32F4 001F31F4 00000000 */   nop
/* F32F8 001F31F8 28860070 */  paddub     $16, $0, $0
/* F32FC 001F31FC D901013C */  lui        $at, (0x1D903CC >> 16)
/* F3300 001F3200 CC03248C */  lw         $4, (0x1D903CC & 0xFFFF)($at)
/* F3304 001F3204 02000324 */  addiu      $3, $0, 0x2
/* F3308 001F3208 2F008310 */  beq        $4, $3, .L001F32C8
/* F330C 001F320C 00000000 */   nop
/* F3310 001F3210 01000224 */  addiu      $2, $0, 0x1
/* F3314 001F3214 1D008210 */  beq        $4, $2, .L001F328C
/* F3318 001F3218 00000000 */   nop
/* F331C 001F321C 03008010 */  beqz       $4, .L001F322C
/* F3320 001F3220 00000000 */   nop
/* F3324 001F3224 EB000010 */  b          .L001F35D4
/* F3328 001F3228 00000000 */   nop
.L001F322C:
/* F332C 001F322C D901013C */  lui        $at, (0x1D903D0 >> 16)
/* F3330 001F3230 D003228C */  lw         $2, (0x1D903D0 & 0xFFFF)($at)
/* F3334 001F3234 01004224 */  addiu      $2, $2, 0x1
/* F3338 001F3238 D901013C */  lui        $at, (0x1D903D0 >> 16)
/* F333C 001F323C D00322AC */  sw         $2, (0x1D903D0 & 0xFFFF)($at)
/* F3340 001F3240 D901013C */  lui        $at, (0x1D903D8 >> 16)
/* F3344 001F3244 D803228C */  lw         $2, (0x1D903D8 & 0xFFFF)($at)
/* F3348 001F3248 05004014 */  bnez       $2, .L001F3260
/* F334C 001F324C 00000000 */   nop
/* F3350 001F3250 00CC070C */  jal        FishRecordTextureEnter__Fv
/* F3354 001F3254 00000000 */   nop
/* F3358 001F3258 DE000010 */  b          .L001F35D4
/* F335C 001F325C 00000000 */   nop
.L001F3260:
/* F3360 001F3260 D901013C */  lui        $at, (0x1D903D0 >> 16)
/* F3364 001F3264 D003228C */  lw         $2, (0x1D903D0 & 0xFFFF)($at)
/* F3368 001F3268 21004128 */  slti       $at, $2, 0x21
/* F336C 001F326C D9002014 */  bnez       $at, .L001F35D4
/* F3370 001F3270 00000000 */   nop
/* F3374 001F3274 D901013C */  lui        $at, (0x1D903CC >> 16)
/* F3378 001F3278 CC0323AC */  sw         $3, (0x1D903CC & 0xFFFF)($at)
/* F337C 001F327C D901013C */  lui        $at, (0x1D903D0 >> 16)
/* F3380 001F3280 D00320AC */  sw         $0, (0x1D903D0 & 0xFFFF)($at)
/* F3384 001F3284 D3000010 */  b          .L001F35D4
/* F3388 001F3288 00000000 */   nop
.L001F328C:
/* F338C 001F328C D901013C */  lui        $at, (0x1D903D0 >> 16)
/* F3390 001F3290 D003228C */  lw         $2, (0x1D903D0 & 0xFFFF)($at)
/* F3394 001F3294 01004224 */  addiu      $2, $2, 0x1
/* F3398 001F3298 D901013C */  lui        $at, (0x1D903D0 >> 16)
/* F339C 001F329C D00322AC */  sw         $2, (0x1D903D0 & 0xFFFF)($at)
/* F33A0 001F32A0 D901013C */  lui        $at, (0x1D903D0 >> 16)
/* F33A4 001F32A4 D003228C */  lw         $2, (0x1D903D0 & 0xFFFF)($at)
/* F33A8 001F32A8 21004128 */  slti       $at, $2, 0x21
/* F33AC 001F32AC C9002014 */  bnez       $at, .L001F35D4
/* F33B0 001F32B0 00000000 */   nop
/* F33B4 001F32B4 E8CB070C */  jal        ExitFishRecord__Fv
/* F33B8 001F32B8 00000000 */   nop
/* F33BC 001F32BC 01001024 */  addiu      $16, $0, 0x1
/* F33C0 001F32C0 C4000010 */  b          .L001F35D4
/* F33C4 001F32C4 00000000 */   nop
.L001F32C8:
/* F33C8 001F32C8 D901013C */  lui        $at, (0x1D903C0 >> 16)
/* F33CC 001F32CC C003318C */  lw         $17, (0x1D903C0 & 0xFFFF)($at)
/* F33D0 001F32D0 CC01023C */  lui        $2, %hi(GamePad)
/* F33D4 001F32D4 40C54424 */  addiu      $4, $2, %lo(GamePad)
/* F33D8 001F32D8 0A200524 */  addiu      $5, $0, 0x200A
/* F33DC 001F32DC 1CAE040C */  jal        Down__8CGamePadFi
/* F33E0 001F32E0 00000000 */   nop
/* F33E4 001F32E4 1B004010 */  beqz       $2, .L001F3354
/* F33E8 001F32E8 00000000 */   nop
/* F33EC 001F32EC D901013C */  lui        $at, (0x1D903C4 >> 16)
/* F33F0 001F32F0 C403228C */  lw         $2, (0x1D903C4 & 0xFFFF)($at)
/* F33F4 001F32F4 05004224 */  addiu      $2, $2, 0x5
/* F33F8 001F32F8 D901013C */  lui        $at, (0x1D903C4 >> 16)
/* F33FC 001F32FC C40322AC */  sw         $2, (0x1D903C4 & 0xFFFF)($at)
/* F3400 001F3300 D901013C */  lui        $at, (0x1D903C0 >> 16)
/* F3404 001F3304 C003228C */  lw         $2, (0x1D903C0 & 0xFFFF)($at)
/* F3408 001F3308 05004224 */  addiu      $2, $2, 0x5
/* F340C 001F330C D901013C */  lui        $at, (0x1D903C0 >> 16)
/* F3410 001F3310 C00322AC */  sw         $2, (0x1D903C0 & 0xFFFF)($at)
/* F3414 001F3314 D901013C */  lui        $at, (0x1D903C4 >> 16)
/* F3418 001F3318 C403228C */  lw         $2, (0x1D903C4 & 0xFFFF)($at)
/* F341C 001F331C 11004128 */  slti       $at, $2, 0x11
/* F3420 001F3320 04002014 */  bnez       $at, .L001F3334
/* F3424 001F3324 00000000 */   nop
/* F3428 001F3328 0F000224 */  addiu      $2, $0, 0xF
/* F342C 001F332C D901013C */  lui        $at, (0x1D903C4 >> 16)
/* F3430 001F3330 C40322AC */  sw         $2, (0x1D903C4 & 0xFFFF)($at)
.L001F3334:
/* F3434 001F3334 D901013C */  lui        $at, (0x1D903C0 >> 16)
/* F3438 001F3338 C003228C */  lw         $2, (0x1D903C0 & 0xFFFF)($at)
/* F343C 001F333C 13004228 */  slti       $2, $2, 0x13
/* F3440 001F3340 04004014 */  bnez       $2, .L001F3354
/* F3444 001F3344 00000000 */   nop
/* F3448 001F3348 13000224 */  addiu      $2, $0, 0x13
/* F344C 001F334C D901013C */  lui        $at, (0x1D903C0 >> 16)
/* F3450 001F3350 C00322AC */  sw         $2, (0x1D903C0 & 0xFFFF)($at)
.L001F3354:
/* F3454 001F3354 CC01023C */  lui        $2, %hi(GamePad)
/* F3458 001F3358 40C54424 */  addiu      $4, $2, %lo(GamePad)
/* F345C 001F335C 05800534 */  ori        $5, $0, 0x8005
/* F3460 001F3360 1CAE040C */  jal        Down__8CGamePadFi
/* F3464 001F3364 00000000 */   nop
/* F3468 001F3368 17004010 */  beqz       $2, .L001F33C8
/* F346C 001F336C 00000000 */   nop
/* F3470 001F3370 D901013C */  lui        $at, (0x1D903C4 >> 16)
/* F3474 001F3374 C403228C */  lw         $2, (0x1D903C4 & 0xFFFF)($at)
/* F3478 001F3378 FBFF4224 */  addiu      $2, $2, -0x5
/* F347C 001F337C D901013C */  lui        $at, (0x1D903C4 >> 16)
/* F3480 001F3380 C40322AC */  sw         $2, (0x1D903C4 & 0xFFFF)($at)
/* F3484 001F3384 D901013C */  lui        $at, (0x1D903C0 >> 16)
/* F3488 001F3388 C003228C */  lw         $2, (0x1D903C0 & 0xFFFF)($at)
/* F348C 001F338C FBFF4224 */  addiu      $2, $2, -0x5
/* F3490 001F3390 D901013C */  lui        $at, (0x1D903C0 >> 16)
/* F3494 001F3394 C00322AC */  sw         $2, (0x1D903C0 & 0xFFFF)($at)
/* F3498 001F3398 D901013C */  lui        $at, (0x1D903C0 >> 16)
/* F349C 001F339C C003228C */  lw         $2, (0x1D903C0 & 0xFFFF)($at)
/* F34A0 001F33A0 05004004 */  bltz       $2, .L001F33B8
/* F34A4 001F33A4 00000000 */   nop
/* F34A8 001F33A8 D901013C */  lui        $at, (0x1D903C4 >> 16)
/* F34AC 001F33AC C403228C */  lw         $2, (0x1D903C4 & 0xFFFF)($at)
/* F34B0 001F33B0 05004104 */  bgez       $2, .L001F33C8
/* F34B4 001F33B4 00000000 */   nop
.L001F33B8:
/* F34B8 001F33B8 D901013C */  lui        $at, (0x1D903C0 >> 16)
/* F34BC 001F33BC C00320AC */  sw         $0, (0x1D903C0 & 0xFFFF)($at)
/* F34C0 001F33C0 D901013C */  lui        $at, (0x1D903C4 >> 16)
/* F34C4 001F33C4 C40320AC */  sw         $0, (0x1D903C4 & 0xFFFF)($at)
.L001F33C8:
/* F34C8 001F33C8 CC01023C */  lui        $2, %hi(GamePad)
/* F34CC 001F33CC 40C54424 */  addiu      $4, $2, %lo(GamePad)
/* F34D0 001F33D0 00100524 */  addiu      $5, $0, 0x1000
/* F34D4 001F33D4 1CAE040C */  jal        Down__8CGamePadFi
/* F34D8 001F33D8 00000000 */   nop
/* F34DC 001F33DC 1E004010 */  beqz       $2, .L001F3458
/* F34E0 001F33E0 00000000 */   nop
/* F34E4 001F33E4 D901013C */  lui        $at, (0x1D903C0 >> 16)
/* F34E8 001F33E8 C003228C */  lw         $2, (0x1D903C0 & 0xFFFF)($at)
/* F34EC 001F33EC FFFF4224 */  addiu      $2, $2, -0x1
/* F34F0 001F33F0 D901013C */  lui        $at, (0x1D903C0 >> 16)
/* F34F4 001F33F4 C00322AC */  sw         $2, (0x1D903C0 & 0xFFFF)($at)
/* F34F8 001F33F8 D901013C */  lui        $at, (0x1D903C0 >> 16)
/* F34FC 001F33FC C003228C */  lw         $2, (0x1D903C0 & 0xFFFF)($at)
/* F3500 001F3400 03004104 */  bgez       $2, .L001F3410
/* F3504 001F3404 00000000 */   nop
/* F3508 001F3408 D901013C */  lui        $at, (0x1D903C0 >> 16)
/* F350C 001F340C C00320AC */  sw         $0, (0x1D903C0 & 0xFFFF)($at)
.L001F3410:
/* F3510 001F3410 D901013C */  lui        $at, (0x1D903C0 >> 16)
/* F3514 001F3414 C003238C */  lw         $3, (0x1D903C0 & 0xFFFF)($at)
/* F3518 001F3418 D901013C */  lui        $at, (0x1D903C4 >> 16)
/* F351C 001F341C C403228C */  lw         $2, (0x1D903C4 & 0xFFFF)($at)
/* F3520 001F3420 2A086200 */  slt        $at, $3, $2
/* F3524 001F3424 04002010 */  beqz       $at, .L001F3438
/* F3528 001F3428 00000000 */   nop
/* F352C 001F342C FFFF4224 */  addiu      $2, $2, -0x1
/* F3530 001F3430 D901013C */  lui        $at, (0x1D903C4 >> 16)
/* F3534 001F3434 C40322AC */  sw         $2, (0x1D903C4 & 0xFFFF)($at)
.L001F3438:
/* F3538 001F3438 D901013C */  lui        $at, (0x1D903C4 >> 16)
/* F353C 001F343C C403228C */  lw         $2, (0x1D903C4 & 0xFFFF)($at)
/* F3540 001F3440 05004104 */  bgez       $2, .L001F3458
/* F3544 001F3444 00000000 */   nop
/* F3548 001F3448 D901013C */  lui        $at, (0x1D903C4 >> 16)
/* F354C 001F344C C40320AC */  sw         $0, (0x1D903C4 & 0xFFFF)($at)
/* F3550 001F3450 D901013C */  lui        $at, (0x1D903C0 >> 16)
/* F3554 001F3454 C00320AC */  sw         $0, (0x1D903C0 & 0xFFFF)($at)
.L001F3458:
/* F3558 001F3458 CC01023C */  lui        $2, %hi(GamePad)
/* F355C 001F345C 40C54424 */  addiu      $4, $2, %lo(GamePad)
/* F3560 001F3460 00400524 */  addiu      $5, $0, 0x4000
/* F3564 001F3464 1CAE040C */  jal        Down__8CGamePadFi
/* F3568 001F3468 00000000 */   nop
/* F356C 001F346C 21004010 */  beqz       $2, .L001F34F4
/* F3570 001F3470 00000000 */   nop
/* F3574 001F3474 D901013C */  lui        $at, (0x1D903C0 >> 16)
/* F3578 001F3478 C003228C */  lw         $2, (0x1D903C0 & 0xFFFF)($at)
/* F357C 001F347C 01004224 */  addiu      $2, $2, 0x1
/* F3580 001F3480 D901013C */  lui        $at, (0x1D903C0 >> 16)
/* F3584 001F3484 C00322AC */  sw         $2, (0x1D903C0 & 0xFFFF)($at)
/* F3588 001F3488 D901013C */  lui        $at, (0x1D903C0 >> 16)
/* F358C 001F348C C003228C */  lw         $2, (0x1D903C0 & 0xFFFF)($at)
/* F3590 001F3490 13004228 */  slti       $2, $2, 0x13
/* F3594 001F3494 04004014 */  bnez       $2, .L001F34A8
/* F3598 001F3498 00000000 */   nop
/* F359C 001F349C 13000224 */  addiu      $2, $0, 0x13
/* F35A0 001F34A0 D901013C */  lui        $at, (0x1D903C0 >> 16)
/* F35A4 001F34A4 C00322AC */  sw         $2, (0x1D903C0 & 0xFFFF)($at)
.L001F34A8:
/* F35A8 001F34A8 D901013C */  lui        $at, (0x1D903C4 >> 16)
/* F35AC 001F34AC C403238C */  lw         $3, (0x1D903C4 & 0xFFFF)($at)
/* F35B0 001F34B0 D901013C */  lui        $at, (0x1D903C0 >> 16)
/* F35B4 001F34B4 C003228C */  lw         $2, (0x1D903C0 & 0xFFFF)($at)
/* F35B8 001F34B8 FCFF4224 */  addiu      $2, $2, -0x4
/* F35BC 001F34BC 2A086200 */  slt        $at, $3, $2
/* F35C0 001F34C0 0C002010 */  beqz       $at, .L001F34F4
/* F35C4 001F34C4 00000000 */   nop
/* F35C8 001F34C8 01006224 */  addiu      $2, $3, 0x1
/* F35CC 001F34CC D901013C */  lui        $at, (0x1D903C4 >> 16)
/* F35D0 001F34D0 C40322AC */  sw         $2, (0x1D903C4 & 0xFFFF)($at)
/* F35D4 001F34D4 D901013C */  lui        $at, (0x1D903C4 >> 16)
/* F35D8 001F34D8 C403228C */  lw         $2, (0x1D903C4 & 0xFFFF)($at)
/* F35DC 001F34DC 11004128 */  slti       $at, $2, 0x11
/* F35E0 001F34E0 04002014 */  bnez       $at, .L001F34F4
/* F35E4 001F34E4 00000000 */   nop
/* F35E8 001F34E8 10000224 */  addiu      $2, $0, 0x10
/* F35EC 001F34EC D901013C */  lui        $at, (0x1D903C4 >> 16)
/* F35F0 001F34F0 C40322AC */  sw         $2, (0x1D903C4 & 0xFFFF)($at)
.L001F34F4:
/* F35F4 001F34F4 CC01023C */  lui        $2, %hi(GamePad)
/* F35F8 001F34F8 40C54424 */  addiu      $4, $2, %lo(GamePad)
/* F35FC 001F34FC 20000524 */  addiu      $5, $0, 0x20
/* F3600 001F3500 1CAE040C */  jal        Down__8CGamePadFi
/* F3604 001F3504 00000000 */   nop
/* F3608 001F3508 06004010 */  beqz       $2, .L001F3524
/* F360C 001F350C 00000000 */   nop
/* F3610 001F3510 01000224 */  addiu      $2, $0, 0x1
/* F3614 001F3514 D901013C */  lui        $at, (0x1D903CC >> 16)
/* F3618 001F3518 CC0322AC */  sw         $2, (0x1D903CC & 0xFFFF)($at)
/* F361C 001F351C D901013C */  lui        $at, (0x1D903D0 >> 16)
/* F3620 001F3520 D00320AC */  sw         $0, (0x1D903D0 & 0xFFFF)($at)
.L001F3524:
/* F3624 001F3524 D901013C */  lui        $at, (0x1D903C0 >> 16)
/* F3628 001F3528 C003228C */  lw         $2, (0x1D903C0 & 0xFFFF)($at)
/* F362C 001F352C 29002212 */  beq        $17, $2, .L001F35D4
/* F3630 001F3530 00000000 */   nop
/* F3634 001F3534 28260070 */  paddub     $4, $0, $0
/* F3638 001F3538 BCB3080C */  jal        ComMenuSePlay__Fi
/* F363C 001F353C 00000000 */   nop
/* F3640 001F3540 288E0070 */  paddub     $17, $0, $0
/* F3644 001F3544 18000010 */  b          .L001F35A8
/* F3648 001F3548 00000000 */   nop
.L001F354C:
/* F364C 001F354C D901013C */  lui        $at, (0x1D903C4 >> 16)
/* F3650 001F3550 C403228C */  lw         $2, (0x1D903C4 & 0xFFFF)($at)
/* F3654 001F3554 21205100 */  addu       $4, $2, $17
/* F3658 001F3558 94CB070C */  jal        GetFishingRankData__Fi
/* F365C 001F355C 00000000 */   nop
/* F3660 001F3560 0B004010 */  beqz       $2, .L001F3590
/* F3664 001F3564 00000000 */   nop
/* F3668 001F3568 0000448C */  lw         $4, 0x0($2)
/* F366C 001F356C 84CB070C */  jal        GetFishMsgNo__Fi
/* F3670 001F3570 00000000 */   nop
/* F3674 001F3574 80201100 */  sll        $4, $17, 2
/* F3678 001F3578 DA01033C */  lui        $3, %hi(D_1DA69B0)
/* F367C 001F357C B0696324 */  addiu      $3, $3, %lo(D_1DA69B0)
/* F3680 001F3580 21186400 */  addu       $3, $3, $4
/* F3684 001F3584 000062AC */  sw         $2, 0x0($3)
/* F3688 001F3588 06000010 */  b          .L001F35A4
/* F368C 001F358C 00000000 */   nop
.L001F3590:
/* F3690 001F3590 80181100 */  sll        $3, $17, 2
/* F3694 001F3594 DA01023C */  lui        $2, %hi(D_1DA69B0)
/* F3698 001F3598 B0694224 */  addiu      $2, $2, %lo(D_1DA69B0)
/* F369C 001F359C 21104300 */  addu       $2, $2, $3
/* F36A0 001F35A0 000040AC */  sw         $0, 0x0($2)
.L001F35A4:
/* F36A4 001F35A4 01003126 */  addiu      $17, $17, 0x1
.L001F35A8:
/* F36A8 001F35A8 0500222A */  slti       $2, $17, 0x5
/* F36AC 001F35AC E7FF4014 */  bnez       $2, .L001F354C
/* F36B0 001F35B0 00000000 */   nop
/* F36B4 001F35B4 FFFF0224 */  addiu      $2, $0, -0x1
/* F36B8 001F35B8 DA01013C */  lui        $at, (0x1DA698C >> 16)
/* F36BC 001F35BC 8C6922AC */  sw         $2, (0x1DA698C & 0xFFFF)($at)
/* F36C0 001F35C0 DA01023C */  lui        $2, %hi(AtoraNameMes)
/* F36C4 001F35C4 D0524424 */  addiu      $4, $2, %lo(AtoraNameMes)
/* F36C8 001F35C8 C8000524 */  addiu      $5, $0, 0xC8
/* F36CC 001F35CC 5441050C */  jal        MakeMesWin__6ClsMesFi
/* F36D0 001F35D0 00000000 */   nop
.L001F35D4:
/* F36D4 001F35D4 28160072 */  paddub     $2, $16, $0
/* F36D8 001F35D8 2000BF7B */  lq         $31, 0x20($sp)
/* F36DC 001F35DC 1000B17B */  lq         $17, 0x10($sp)
/* F36E0 001F35E0 0000B07B */  lq         $16, 0x0($sp)
/* F36E4 001F35E4 3000BD27 */  addiu      $sp, $sp, 0x30
/* F36E8 001F35E8 0800E003 */  jr         $31
/* F36EC 001F35EC 00000000 */   nop
