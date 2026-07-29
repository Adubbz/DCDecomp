.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel FishRecordViewKey__Fv
/* 0F32E0 001F31E0 D0FFBD27 */  addiu       $29, $29, -0x30
/* 0F32E4 001F31E4 2000BF7F */  sq          $31, 0x20($29)
/* 0F32E8 001F31E8 1000B17F */  sq          $17, 0x10($29)
/* 0F32EC 001F31EC 0000B07F */  sq          $16, 0x0($29)
/* 0F32F0 001F31F0 38FB040C */  jal         ReadBG__Fv
/* 0F32F4 001F31F4 00000000 */   nop
/* 0F32F8 001F31F8 28860070 */  paddub      $16, $0, $0
/* 0F32FC 001F31FC D901013C */  lui         $1, %hi(FishRecordMenu + 0xC)
/* 0F3300 001F3200 CC03248C */  lw          $4, %lo(FishRecordMenu + 0xC)($1)
/* 0F3304 001F3204 02000324 */  addiu       $3, $0, 0x2
/* 0F3308 001F3208 2F008310 */  beq         $4, $3, .L001F32C8
/* 0F330C 001F320C 00000000 */   nop
/* 0F3310 001F3210 01000224 */  addiu       $2, $0, 0x1
/* 0F3314 001F3214 1D008210 */  beq         $4, $2, .L001F328C
/* 0F3318 001F3218 00000000 */   nop
/* 0F331C 001F321C 03008010 */  beqz        $4, .L001F322C
/* 0F3320 001F3220 00000000 */   nop
/* 0F3324 001F3224 EB000010 */  b           .L001F35D4
/* 0F3328 001F3228 00000000 */   nop
.L001F322C:
/* 0F332C 001F322C D901013C */  lui         $1, %hi(FishRecordMenu + 0x10)
/* 0F3330 001F3230 D003228C */  lw          $2, %lo(FishRecordMenu + 0x10)($1)
/* 0F3334 001F3234 01004224 */  addiu       $2, $2, 0x1
/* 0F3338 001F3238 D901013C */  lui         $1, %hi(FishRecordMenu + 0x10)
/* 0F333C 001F323C D00322AC */  sw          $2, %lo(FishRecordMenu + 0x10)($1)
/* 0F3340 001F3240 D901013C */  lui         $1, %hi(FishRecordMenu + 0x18)
/* 0F3344 001F3244 D803228C */  lw          $2, %lo(FishRecordMenu + 0x18)($1)
/* 0F3348 001F3248 05004014 */  bnez        $2, .L001F3260
/* 0F334C 001F324C 00000000 */   nop
/* 0F3350 001F3250 00CC070C */  jal         FishRecordTextureEnter__Fv
/* 0F3354 001F3254 00000000 */   nop
/* 0F3358 001F3258 DE000010 */  b           .L001F35D4
/* 0F335C 001F325C 00000000 */   nop
.L001F3260:
/* 0F3360 001F3260 D901013C */  lui         $1, %hi(FishRecordMenu + 0x10)
/* 0F3364 001F3264 D003228C */  lw          $2, %lo(FishRecordMenu + 0x10)($1)
/* 0F3368 001F3268 21004128 */  slti        $1, $2, 0x21
/* 0F336C 001F326C D9002014 */  bnez        $1, .L001F35D4
/* 0F3370 001F3270 00000000 */   nop
/* 0F3374 001F3274 D901013C */  lui         $1, %hi(FishRecordMenu + 0xC)
/* 0F3378 001F3278 CC0323AC */  sw          $3, %lo(FishRecordMenu + 0xC)($1)
/* 0F337C 001F327C D901013C */  lui         $1, %hi(FishRecordMenu + 0x10)
/* 0F3380 001F3280 D00320AC */  sw          $0, %lo(FishRecordMenu + 0x10)($1)
/* 0F3384 001F3284 D3000010 */  b           .L001F35D4
/* 0F3388 001F3288 00000000 */   nop
.L001F328C:
/* 0F338C 001F328C D901013C */  lui         $1, %hi(FishRecordMenu + 0x10)
/* 0F3390 001F3290 D003228C */  lw          $2, %lo(FishRecordMenu + 0x10)($1)
/* 0F3394 001F3294 01004224 */  addiu       $2, $2, 0x1
/* 0F3398 001F3298 D901013C */  lui         $1, %hi(FishRecordMenu + 0x10)
/* 0F339C 001F329C D00322AC */  sw          $2, %lo(FishRecordMenu + 0x10)($1)
/* 0F33A0 001F32A0 D901013C */  lui         $1, %hi(FishRecordMenu + 0x10)
/* 0F33A4 001F32A4 D003228C */  lw          $2, %lo(FishRecordMenu + 0x10)($1)
/* 0F33A8 001F32A8 21004128 */  slti        $1, $2, 0x21
/* 0F33AC 001F32AC C9002014 */  bnez        $1, .L001F35D4
/* 0F33B0 001F32B0 00000000 */   nop
/* 0F33B4 001F32B4 E8CB070C */  jal         ExitFishRecord__Fv
/* 0F33B8 001F32B8 00000000 */   nop
/* 0F33BC 001F32BC 01001024 */  addiu       $16, $0, 0x1
/* 0F33C0 001F32C0 C4000010 */  b           .L001F35D4
/* 0F33C4 001F32C4 00000000 */   nop
.L001F32C8:
/* 0F33C8 001F32C8 D901013C */  lui         $1, %hi(FishRecordMenu)
/* 0F33CC 001F32CC C003318C */  lw          $17, %lo(FishRecordMenu)($1)
/* 0F33D0 001F32D0 CC01023C */  lui         $2, %hi(GamePad)
/* 0F33D4 001F32D4 40C54424 */  addiu       $4, $2, %lo(GamePad)
/* 0F33D8 001F32D8 0A200524 */  addiu       $5, $0, 0x200A
/* 0F33DC 001F32DC 1CAE040C */  jal         Down__8CGamePadFi
/* 0F33E0 001F32E0 00000000 */   nop
/* 0F33E4 001F32E4 1B004010 */  beqz        $2, .L001F3354
/* 0F33E8 001F32E8 00000000 */   nop
/* 0F33EC 001F32EC D901013C */  lui         $1, %hi(FishRecordMenu + 0x4)
/* 0F33F0 001F32F0 C403228C */  lw          $2, %lo(FishRecordMenu + 0x4)($1)
/* 0F33F4 001F32F4 05004224 */  addiu       $2, $2, 0x5
/* 0F33F8 001F32F8 D901013C */  lui         $1, %hi(FishRecordMenu + 0x4)
/* 0F33FC 001F32FC C40322AC */  sw          $2, %lo(FishRecordMenu + 0x4)($1)
/* 0F3400 001F3300 D901013C */  lui         $1, %hi(FishRecordMenu)
/* 0F3404 001F3304 C003228C */  lw          $2, %lo(FishRecordMenu)($1)
/* 0F3408 001F3308 05004224 */  addiu       $2, $2, 0x5
/* 0F340C 001F330C D901013C */  lui         $1, %hi(FishRecordMenu)
/* 0F3410 001F3310 C00322AC */  sw          $2, %lo(FishRecordMenu)($1)
/* 0F3414 001F3314 D901013C */  lui         $1, %hi(FishRecordMenu + 0x4)
/* 0F3418 001F3318 C403228C */  lw          $2, %lo(FishRecordMenu + 0x4)($1)
/* 0F341C 001F331C 11004128 */  slti        $1, $2, 0x11
/* 0F3420 001F3320 04002014 */  bnez        $1, .L001F3334
/* 0F3424 001F3324 00000000 */   nop
/* 0F3428 001F3328 0F000224 */  addiu       $2, $0, 0xF
/* 0F342C 001F332C D901013C */  lui         $1, %hi(FishRecordMenu + 0x4)
/* 0F3430 001F3330 C40322AC */  sw          $2, %lo(FishRecordMenu + 0x4)($1)
.L001F3334:
/* 0F3434 001F3334 D901013C */  lui         $1, %hi(FishRecordMenu)
/* 0F3438 001F3338 C003228C */  lw          $2, %lo(FishRecordMenu)($1)
/* 0F343C 001F333C 13004228 */  slti        $2, $2, 0x13
/* 0F3440 001F3340 04004014 */  bnez        $2, .L001F3354
/* 0F3444 001F3344 00000000 */   nop
/* 0F3448 001F3348 13000224 */  addiu       $2, $0, 0x13
/* 0F344C 001F334C D901013C */  lui         $1, %hi(FishRecordMenu)
/* 0F3450 001F3350 C00322AC */  sw          $2, %lo(FishRecordMenu)($1)
.L001F3354:
/* 0F3454 001F3354 CC01023C */  lui         $2, %hi(GamePad)
/* 0F3458 001F3358 40C54424 */  addiu       $4, $2, %lo(GamePad)
/* 0F345C 001F335C 05800534 */  ori         $5, $0, 0x8005
/* 0F3460 001F3360 1CAE040C */  jal         Down__8CGamePadFi
/* 0F3464 001F3364 00000000 */   nop
/* 0F3468 001F3368 17004010 */  beqz        $2, .L001F33C8
/* 0F346C 001F336C 00000000 */   nop
/* 0F3470 001F3370 D901013C */  lui         $1, %hi(FishRecordMenu + 0x4)
/* 0F3474 001F3374 C403228C */  lw          $2, %lo(FishRecordMenu + 0x4)($1)
/* 0F3478 001F3378 FBFF4224 */  addiu       $2, $2, -0x5
/* 0F347C 001F337C D901013C */  lui         $1, %hi(FishRecordMenu + 0x4)
/* 0F3480 001F3380 C40322AC */  sw          $2, %lo(FishRecordMenu + 0x4)($1)
/* 0F3484 001F3384 D901013C */  lui         $1, %hi(FishRecordMenu)
/* 0F3488 001F3388 C003228C */  lw          $2, %lo(FishRecordMenu)($1)
/* 0F348C 001F338C FBFF4224 */  addiu       $2, $2, -0x5
/* 0F3490 001F3390 D901013C */  lui         $1, %hi(FishRecordMenu)
/* 0F3494 001F3394 C00322AC */  sw          $2, %lo(FishRecordMenu)($1)
/* 0F3498 001F3398 D901013C */  lui         $1, %hi(FishRecordMenu)
/* 0F349C 001F339C C003228C */  lw          $2, %lo(FishRecordMenu)($1)
/* 0F34A0 001F33A0 05004004 */  bltz        $2, .L001F33B8
/* 0F34A4 001F33A4 00000000 */   nop
/* 0F34A8 001F33A8 D901013C */  lui         $1, %hi(FishRecordMenu + 0x4)
/* 0F34AC 001F33AC C403228C */  lw          $2, %lo(FishRecordMenu + 0x4)($1)
/* 0F34B0 001F33B0 05004104 */  bgez        $2, .L001F33C8
/* 0F34B4 001F33B4 00000000 */   nop
.L001F33B8:
/* 0F34B8 001F33B8 D901013C */  lui         $1, %hi(FishRecordMenu)
/* 0F34BC 001F33BC C00320AC */  sw          $0, %lo(FishRecordMenu)($1)
/* 0F34C0 001F33C0 D901013C */  lui         $1, %hi(FishRecordMenu + 0x4)
/* 0F34C4 001F33C4 C40320AC */  sw          $0, %lo(FishRecordMenu + 0x4)($1)
.L001F33C8:
/* 0F34C8 001F33C8 CC01023C */  lui         $2, %hi(GamePad)
/* 0F34CC 001F33CC 40C54424 */  addiu       $4, $2, %lo(GamePad)
/* 0F34D0 001F33D0 00100524 */  addiu       $5, $0, 0x1000
/* 0F34D4 001F33D4 1CAE040C */  jal         Down__8CGamePadFi
/* 0F34D8 001F33D8 00000000 */   nop
/* 0F34DC 001F33DC 1E004010 */  beqz        $2, .L001F3458
/* 0F34E0 001F33E0 00000000 */   nop
/* 0F34E4 001F33E4 D901013C */  lui         $1, %hi(FishRecordMenu)
/* 0F34E8 001F33E8 C003228C */  lw          $2, %lo(FishRecordMenu)($1)
/* 0F34EC 001F33EC FFFF4224 */  addiu       $2, $2, -0x1
/* 0F34F0 001F33F0 D901013C */  lui         $1, %hi(FishRecordMenu)
/* 0F34F4 001F33F4 C00322AC */  sw          $2, %lo(FishRecordMenu)($1)
/* 0F34F8 001F33F8 D901013C */  lui         $1, %hi(FishRecordMenu)
/* 0F34FC 001F33FC C003228C */  lw          $2, %lo(FishRecordMenu)($1)
/* 0F3500 001F3400 03004104 */  bgez        $2, .L001F3410
/* 0F3504 001F3404 00000000 */   nop
/* 0F3508 001F3408 D901013C */  lui         $1, %hi(FishRecordMenu)
/* 0F350C 001F340C C00320AC */  sw          $0, %lo(FishRecordMenu)($1)
.L001F3410:
/* 0F3510 001F3410 D901013C */  lui         $1, %hi(FishRecordMenu)
/* 0F3514 001F3414 C003238C */  lw          $3, %lo(FishRecordMenu)($1)
/* 0F3518 001F3418 D901013C */  lui         $1, %hi(FishRecordMenu + 0x4)
/* 0F351C 001F341C C403228C */  lw          $2, %lo(FishRecordMenu + 0x4)($1)
/* 0F3520 001F3420 2A086200 */  slt         $1, $3, $2
/* 0F3524 001F3424 04002010 */  beqz        $1, .L001F3438
/* 0F3528 001F3428 00000000 */   nop
/* 0F352C 001F342C FFFF4224 */  addiu       $2, $2, -0x1
/* 0F3530 001F3430 D901013C */  lui         $1, %hi(FishRecordMenu + 0x4)
/* 0F3534 001F3434 C40322AC */  sw          $2, %lo(FishRecordMenu + 0x4)($1)
.L001F3438:
/* 0F3538 001F3438 D901013C */  lui         $1, %hi(FishRecordMenu + 0x4)
/* 0F353C 001F343C C403228C */  lw          $2, %lo(FishRecordMenu + 0x4)($1)
/* 0F3540 001F3440 05004104 */  bgez        $2, .L001F3458
/* 0F3544 001F3444 00000000 */   nop
/* 0F3548 001F3448 D901013C */  lui         $1, %hi(FishRecordMenu + 0x4)
/* 0F354C 001F344C C40320AC */  sw          $0, %lo(FishRecordMenu + 0x4)($1)
/* 0F3550 001F3450 D901013C */  lui         $1, %hi(FishRecordMenu)
/* 0F3554 001F3454 C00320AC */  sw          $0, %lo(FishRecordMenu)($1)
.L001F3458:
/* 0F3558 001F3458 CC01023C */  lui         $2, %hi(GamePad)
/* 0F355C 001F345C 40C54424 */  addiu       $4, $2, %lo(GamePad)
/* 0F3560 001F3460 00400524 */  addiu       $5, $0, 0x4000
/* 0F3564 001F3464 1CAE040C */  jal         Down__8CGamePadFi
/* 0F3568 001F3468 00000000 */   nop
/* 0F356C 001F346C 21004010 */  beqz        $2, .L001F34F4
/* 0F3570 001F3470 00000000 */   nop
/* 0F3574 001F3474 D901013C */  lui         $1, %hi(FishRecordMenu)
/* 0F3578 001F3478 C003228C */  lw          $2, %lo(FishRecordMenu)($1)
/* 0F357C 001F347C 01004224 */  addiu       $2, $2, 0x1
/* 0F3580 001F3480 D901013C */  lui         $1, %hi(FishRecordMenu)
/* 0F3584 001F3484 C00322AC */  sw          $2, %lo(FishRecordMenu)($1)
/* 0F3588 001F3488 D901013C */  lui         $1, %hi(FishRecordMenu)
/* 0F358C 001F348C C003228C */  lw          $2, %lo(FishRecordMenu)($1)
/* 0F3590 001F3490 13004228 */  slti        $2, $2, 0x13
/* 0F3594 001F3494 04004014 */  bnez        $2, .L001F34A8
/* 0F3598 001F3498 00000000 */   nop
/* 0F359C 001F349C 13000224 */  addiu       $2, $0, 0x13
/* 0F35A0 001F34A0 D901013C */  lui         $1, %hi(FishRecordMenu)
/* 0F35A4 001F34A4 C00322AC */  sw          $2, %lo(FishRecordMenu)($1)
.L001F34A8:
/* 0F35A8 001F34A8 D901013C */  lui         $1, %hi(FishRecordMenu + 0x4)
/* 0F35AC 001F34AC C403238C */  lw          $3, %lo(FishRecordMenu + 0x4)($1)
/* 0F35B0 001F34B0 D901013C */  lui         $1, %hi(FishRecordMenu)
/* 0F35B4 001F34B4 C003228C */  lw          $2, %lo(FishRecordMenu)($1)
/* 0F35B8 001F34B8 FCFF4224 */  addiu       $2, $2, -0x4
/* 0F35BC 001F34BC 2A086200 */  slt         $1, $3, $2
/* 0F35C0 001F34C0 0C002010 */  beqz        $1, .L001F34F4
/* 0F35C4 001F34C4 00000000 */   nop
/* 0F35C8 001F34C8 01006224 */  addiu       $2, $3, 0x1
/* 0F35CC 001F34CC D901013C */  lui         $1, %hi(FishRecordMenu + 0x4)
/* 0F35D0 001F34D0 C40322AC */  sw          $2, %lo(FishRecordMenu + 0x4)($1)
/* 0F35D4 001F34D4 D901013C */  lui         $1, %hi(FishRecordMenu + 0x4)
/* 0F35D8 001F34D8 C403228C */  lw          $2, %lo(FishRecordMenu + 0x4)($1)
/* 0F35DC 001F34DC 11004128 */  slti        $1, $2, 0x11
/* 0F35E0 001F34E0 04002014 */  bnez        $1, .L001F34F4
/* 0F35E4 001F34E4 00000000 */   nop
/* 0F35E8 001F34E8 10000224 */  addiu       $2, $0, 0x10
/* 0F35EC 001F34EC D901013C */  lui         $1, %hi(FishRecordMenu + 0x4)
/* 0F35F0 001F34F0 C40322AC */  sw          $2, %lo(FishRecordMenu + 0x4)($1)
.L001F34F4:
/* 0F35F4 001F34F4 CC01023C */  lui         $2, %hi(GamePad)
/* 0F35F8 001F34F8 40C54424 */  addiu       $4, $2, %lo(GamePad)
/* 0F35FC 001F34FC 20000524 */  addiu       $5, $0, 0x20
/* 0F3600 001F3500 1CAE040C */  jal         Down__8CGamePadFi
/* 0F3604 001F3504 00000000 */   nop
/* 0F3608 001F3508 06004010 */  beqz        $2, .L001F3524
/* 0F360C 001F350C 00000000 */   nop
/* 0F3610 001F3510 01000224 */  addiu       $2, $0, 0x1
/* 0F3614 001F3514 D901013C */  lui         $1, %hi(FishRecordMenu + 0xC)
/* 0F3618 001F3518 CC0322AC */  sw          $2, %lo(FishRecordMenu + 0xC)($1)
/* 0F361C 001F351C D901013C */  lui         $1, %hi(FishRecordMenu + 0x10)
/* 0F3620 001F3520 D00320AC */  sw          $0, %lo(FishRecordMenu + 0x10)($1)
.L001F3524:
/* 0F3624 001F3524 D901013C */  lui         $1, %hi(FishRecordMenu)
/* 0F3628 001F3528 C003228C */  lw          $2, %lo(FishRecordMenu)($1)
/* 0F362C 001F352C 29002212 */  beq         $17, $2, .L001F35D4
/* 0F3630 001F3530 00000000 */   nop
/* 0F3634 001F3534 28260070 */  paddub      $4, $0, $0
/* 0F3638 001F3538 BCB3080C */  jal         ComMenuSePlay__Fi
/* 0F363C 001F353C 00000000 */   nop
/* 0F3640 001F3540 288E0070 */  paddub      $17, $0, $0
/* 0F3644 001F3544 18000010 */  b           .L001F35A8
/* 0F3648 001F3548 00000000 */   nop
.L001F354C:
/* 0F364C 001F354C D901013C */  lui         $1, %hi(FishRecordMenu + 0x4)
/* 0F3650 001F3550 C403228C */  lw          $2, %lo(FishRecordMenu + 0x4)($1)
/* 0F3654 001F3554 21205100 */  addu        $4, $2, $17
/* 0F3658 001F3558 94CB070C */  jal         GetFishingRankData__Fi
/* 0F365C 001F355C 00000000 */   nop
/* 0F3660 001F3560 0B004010 */  beqz        $2, .L001F3590
/* 0F3664 001F3564 00000000 */   nop
/* 0F3668 001F3568 0000448C */  lw          $4, 0x0($2)
/* 0F366C 001F356C 84CB070C */  jal         GetFishMsgNo__Fi
/* 0F3670 001F3570 00000000 */   nop
/* 0F3674 001F3574 80201100 */  sll         $4, $17, 2
/* 0F3678 001F3578 DA01033C */  lui         $3, %hi(AtoraNameMes + 0x16E0)
/* 0F367C 001F357C B0696324 */  addiu       $3, $3, %lo(AtoraNameMes + 0x16E0)
/* 0F3680 001F3580 21186400 */  addu        $3, $3, $4
/* 0F3684 001F3584 000062AC */  sw          $2, 0x0($3)
/* 0F3688 001F3588 06000010 */  b           .L001F35A4
/* 0F368C 001F358C 00000000 */   nop
.L001F3590:
/* 0F3690 001F3590 80181100 */  sll         $3, $17, 2
/* 0F3694 001F3594 DA01023C */  lui         $2, %hi(AtoraNameMes + 0x16E0)
/* 0F3698 001F3598 B0694224 */  addiu       $2, $2, %lo(AtoraNameMes + 0x16E0)
/* 0F369C 001F359C 21104300 */  addu        $2, $2, $3
/* 0F36A0 001F35A0 000040AC */  sw          $0, 0x0($2)
.L001F35A4:
/* 0F36A4 001F35A4 01003126 */  addiu       $17, $17, 0x1
.L001F35A8:
/* 0F36A8 001F35A8 0500222A */  slti        $2, $17, 0x5
/* 0F36AC 001F35AC E7FF4014 */  bnez        $2, .L001F354C
/* 0F36B0 001F35B0 00000000 */   nop
/* 0F36B4 001F35B4 FFFF0224 */  addiu       $2, $0, -0x1
/* 0F36B8 001F35B8 DA01013C */  lui         $1, %hi(AtoraNameMes + 0x16BC)
/* 0F36BC 001F35BC 8C6922AC */  sw          $2, %lo(AtoraNameMes + 0x16BC)($1)
/* 0F36C0 001F35C0 DA01023C */  lui         $2, %hi(AtoraNameMes)
/* 0F36C4 001F35C4 D0524424 */  addiu       $4, $2, %lo(AtoraNameMes)
/* 0F36C8 001F35C8 C8000524 */  addiu       $5, $0, 0xC8
/* 0F36CC 001F35CC 5441050C */  jal         MakeMesWin__6ClsMesFi
/* 0F36D0 001F35D0 00000000 */   nop
.L001F35D4:
/* 0F36D4 001F35D4 28160072 */  paddub      $2, $16, $0
/* 0F36D8 001F35D8 2000BF7B */  lq          $31, 0x20($29)
/* 0F36DC 001F35DC 1000B17B */  lq          $17, 0x10($29)
/* 0F36E0 001F35E0 0000B07B */  lq          $16, 0x0($29)
/* 0F36E4 001F35E4 3000BD27 */  addiu       $29, $29, 0x30
/* 0F36E8 001F35E8 0800E003 */  jr          $31
/* 0F36EC 001F35EC 00000000 */   nop
