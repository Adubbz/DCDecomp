.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel DrawWaterSurface__11CEditGroundFP7CCamera
/* A3460 001A3360 60FFBD27 */  addiu      $sp, $sp, -0xA0
/* A3464 001A3364 5000BF7F */  sq         $31, 0x50($sp)
/* A3468 001A3368 4000B47F */  sq         $20, 0x40($sp)
/* A346C 001A336C 3000B37F */  sq         $19, 0x30($sp)
/* A3470 001A3370 2000B27F */  sq         $18, 0x20($sp)
/* A3474 001A3374 1000B17F */  sq         $17, 0x10($sp)
/* A3478 001A3378 0000B07F */  sq         $16, 0x0($sp)
/* A347C 001A337C 28A68070 */  paddub     $20, $4, $0
/* A3480 001A3380 2886A070 */  paddub     $16, $5, $0
/* A3484 001A3384 0100013C */  lui        $at, (0x15040 >> 16)
/* A3488 001A3388 40502134 */  ori        $at, $at, (0x15040 & 0xFFFF)
/* A348C 001A338C 21888102 */  addu       $17, $20, $at
/* A3490 001A3390 28260072 */  paddub     $4, $16, $0
/* A3494 001A3394 6000A527 */  addiu      $5, $sp, 0x60
/* A3498 001A3398 9C91040C */  jal        GetPos__7CCameraFPf
/* A349C 001A339C 00000000 */   nop
/* A34A0 001A33A0 28260072 */  paddub     $4, $16, $0
/* A34A4 001A33A4 8000A527 */  addiu      $5, $sp, 0x80
/* A34A8 001A33A8 E890040C */  jal        GetDir__7CCameraFPf
/* A34AC 001A33AC 00000000 */   nop
/* A34B0 001A33B0 8400A0AF */  sw         $0, 0x84($sp)
/* A34B4 001A33B4 8000A427 */  addiu      $4, $sp, 0x80
/* A34B8 001A33B8 282E8070 */  paddub     $5, $4, $0
/* A34BC 001A33BC 9285040C */  jal        sceVu0Normalize
/* A34C0 001A33C0 00000000 */   nop
/* A34C4 001A33C4 28860070 */  paddub     $16, $0, $0
/* A34C8 001A33C8 87000010 */  b          .L001A35E8
/* A34CC 001A33CC 00000000 */   nop
.L001A33D0:
/* A34D0 001A33D0 2000238E */  lw         $3, 0x20($17)
/* A34D4 001A33D4 82006010 */  beqz       $3, .L001A35E0
/* A34D8 001A33D8 00000000 */   nop
/* A34DC 001A33DC 90003226 */  addiu      $18, $17, 0x90
/* A34E0 001A33E0 7000A427 */  addiu      $4, $sp, 0x70
/* A34E4 001A33E4 40002526 */  addiu      $5, $17, 0x40
/* A34E8 001A33E8 0C86040C */  jal        sceVu0CopyVector
/* A34EC 001A33EC 00000000 */   nop
/* A34F0 001A33F0 3400258E */  lw         $5, 0x34($17)
/* A34F4 001A33F4 4D00A004 */  bltz       $5, .L001A352C
/* A34F8 001A33F8 00000000 */   nop
/* A34FC 001A33FC 28268072 */  paddub     $4, $20, $0
/* A3500 001A3400 2086060C */  jal        GetPartsObject__11CEditGroundFi
/* A3504 001A3404 00000000 */   nop
/* A3508 001A3408 289E4070 */  paddub     $19, $2, $0
/* A350C 001A340C 74006012 */  beqz       $19, .L001A35E0
/* A3510 001A3410 00000000 */   nop
/* A3514 001A3414 0401648E */  lw         $4, 0x104($19)
/* A3518 001A3418 0E008010 */  beqz       $4, .L001A3454
/* A351C 001A341C 00000000 */   nop
/* A3520 001A3420 00002282 */  lb         $2, 0x0($17)
/* A3524 001A3424 0B004010 */  beqz       $2, .L001A3454
/* A3528 001A3428 00000000 */   nop
/* A352C 001A342C 282E2072 */  paddub     $5, $17, $0
/* A3530 001A3430 C0A1040C */  jal        SearchFrame__6CFrameFPc
/* A3534 001A3434 00000000 */   nop
/* A3538 001A3438 28264070 */  paddub     $4, $2, $0
/* A353C 001A343C 05008010 */  beqz       $4, .L001A3454
/* A3540 001A3440 00000000 */   nop
/* A3544 001A3444 B0008384 */  lh         $3, 0xB0($4)
/* A3548 001A3448 01006330 */  andi       $3, $3, 0x1
/* A354C 001A344C 64006010 */  beqz       $3, .L001A35E0
/* A3550 001A3450 00000000 */   nop
.L001A3454:
/* A3554 001A3454 28266072 */  paddub     $4, $19, $0
/* A3558 001A3458 9000A527 */  addiu      $5, $sp, 0x90
/* A355C 001A345C EC69060C */  jal        GetPosition__9CMapPartsFPf
/* A3560 001A3460 00000000 */   nop
/* A3564 001A3464 0100013C */  lui        $at, (0x15F2C >> 16)
/* A3568 001A3468 21088102 */  addu       $at, $20, $at
/* A356C 001A346C 2C5F21C4 */  lwc1       $f1, (0x15F2C & 0xFFFF)($at)
/* A3570 001A3470 00008044 */  mtc1       $0, $f0
/* A3574 001A3474 00000000 */  nop
/* A3578 001A3478 36080046 */  c.le.s     $f1, $f0
/* A357C 001A347C 00000000 */  nop
/* A3580 001A3480 13000145 */  bc1t       .L001A34D0
/* A3584 001A3484 00000000 */   nop
/* A3588 001A3488 9000A427 */  addiu      $4, $sp, 0x90
/* A358C 001A348C 0100013C */  lui        $at, (0x15F20 >> 16)
/* A3590 001A3490 205F2134 */  ori        $at, $at, (0x15F20 & 0xFFFF)
/* A3594 001A3494 21288102 */  addu       $5, $20, $at
/* A3598 001A3498 648D040C */  jal        DistVector__FPfPf
/* A359C 001A349C 00000000 */   nop
/* A35A0 001A34A0 0100013C */  lui        $at, (0x15F2C >> 16)
/* A35A4 001A34A4 21088102 */  addu       $at, $20, $at
/* A35A8 001A34A8 2C5F21C4 */  lwc1       $f1, (0x15F2C & 0xFFFF)($at)
/* A35AC 001A34AC 36000146 */  c.le.s     $f0, $f1
/* A35B0 001A34B0 00000000 */  nop
/* A35B4 001A34B4 06000145 */  bc1t       .L001A34D0
/* A35B8 001A34B8 00000000 */   nop
/* A35BC 001A34BC 28266072 */  paddub     $4, $19, $0
/* A35C0 001A34C0 386B060C */  jal        ChangeDigData__9CMapPartsFv
/* A35C4 001A34C4 00000000 */   nop
/* A35C8 001A34C8 45004010 */  beqz       $2, .L001A35E0
/* A35CC 001A34CC 00000000 */   nop
.L001A34D0:
/* A35D0 001A34D0 7000A427 */  addiu      $4, $sp, 0x70
/* A35D4 001A34D4 282E8070 */  paddub     $5, $4, $0
/* A35D8 001A34D8 9000A627 */  addiu      $6, $sp, 0x90
/* A35DC 001A34DC E885040C */  jal        sceVu0AddVector
/* A35E0 001A34E0 00000000 */   nop
/* A35E4 001A34E4 B0004426 */  addiu      $4, $18, 0xB0
/* A35E8 001A34E8 7000A527 */  addiu      $5, $sp, 0x70
/* A35EC 001A34EC B89F040C */  jal        SetPosition__6CFrameFPf
/* A35F0 001A34F0 00000000 */   nop
/* A35F4 001A34F4 28266072 */  paddub     $4, $19, $0
/* A35F8 001A34F8 9000A527 */  addiu      $5, $sp, 0x90
/* A35FC 001A34FC A000798E */  lw         $25, 0xA0($19)
/* A3600 001A3500 5800398F */  lw         $25, 0x58($25)
/* A3604 001A3504 09F82003 */  jalr       $25
/* A3608 001A3508 00000000 */   nop
/* A360C 001A350C B0004426 */  addiu      $4, $18, 0xB0
/* A3610 001A3510 9000ACC7 */  lwc1       $f12, 0x90($sp)
/* A3614 001A3514 9400ADC7 */  lwc1       $f13, 0x94($sp)
/* A3618 001A3518 9800AEC7 */  lwc1       $f14, 0x98($sp)
/* A361C 001A351C 70A3040C */  jal        SetRotation__6CFrameFfff
/* A3620 001A3520 00000000 */   nop
/* A3624 001A3524 25000010 */  b          .L001A35BC
/* A3628 001A3528 00000000 */   nop
.L001A352C:
/* A362C 001A352C 2400228E */  lw         $2, 0x24($17)
/* A3630 001A3530 08004010 */  beqz       $2, .L001A3554
/* A3634 001A3534 00000000 */   nop
/* A3638 001A3538 6000A2C7 */  lwc1       $f2, 0x60($sp)
/* A363C 001A353C 4842023C */  lui        $2, (0x42480000 >> 16)
/* A3640 001A3540 00088244 */  mtc1       $2, $f1
/* A3644 001A3544 8000A0C7 */  lwc1       $f0, 0x80($sp)
/* A3648 001A3548 02080046 */  mul.s      $f0, $f1, $f0
/* A364C 001A354C 00100046 */  add.s      $f0, $f2, $f0
/* A3650 001A3550 7000A0E7 */  swc1       $f0, 0x70($sp)
.L001A3554:
/* A3654 001A3554 2800228E */  lw         $2, 0x28($17)
/* A3658 001A3558 03004010 */  beqz       $2, .L001A3568
/* A365C 001A355C 00000000 */   nop
/* A3660 001A3560 6400A0C7 */  lwc1       $f0, 0x64($sp)
/* A3664 001A3564 7400A0E7 */  swc1       $f0, 0x74($sp)
.L001A3568:
/* A3668 001A3568 2C00228E */  lw         $2, 0x2C($17)
/* A366C 001A356C 08004010 */  beqz       $2, .L001A3590
/* A3670 001A3570 00000000 */   nop
/* A3674 001A3574 6800A2C7 */  lwc1       $f2, 0x68($sp)
/* A3678 001A3578 4842023C */  lui        $2, (0x42480000 >> 16)
/* A367C 001A357C 00088244 */  mtc1       $2, $f1
/* A3680 001A3580 8800A0C7 */  lwc1       $f0, 0x88($sp)
/* A3684 001A3584 02080046 */  mul.s      $f0, $f1, $f0
/* A3688 001A3588 00100046 */  add.s      $f0, $f2, $f0
/* A368C 001A358C 7800A0E7 */  swc1       $f0, 0x78($sp)
.L001A3590:
/* A3690 001A3590 00688044 */  mtc1       $0, $f13
/* A3694 001A3594 00000000 */  nop
/* A3698 001A3598 866B0046 */  mov.s      $f14, $f13
/* A369C 001A359C 066B0046 */  mov.s      $f12, $f13
/* A36A0 001A35A0 B0004426 */  addiu      $4, $18, 0xB0
/* A36A4 001A35A4 70A3040C */  jal        SetRotation__6CFrameFfff
/* A36A8 001A35A8 00000000 */   nop
/* A36AC 001A35AC B0004426 */  addiu      $4, $18, 0xB0
/* A36B0 001A35B0 7000A527 */  addiu      $5, $sp, 0x70
/* A36B4 001A35B4 B89F040C */  jal        SetPosition__6CFrameFPf
/* A36B8 001A35B8 00000000 */   nop
.L001A35BC:
/* A36BC 001A35BC A0B8040C */  jal        GetVif1Packet__Fv
/* A36C0 001A35C0 00000000 */   nop
/* A36C4 001A35C4 28264072 */  paddub     $4, $18, $0
/* A36C8 001A35C8 C701033C */  lui        $3, %hi(mgRenderInfo)
/* A36CC 001A35CC 20556524 */  addiu      $5, $3, %lo(mgRenderInfo)
/* A36D0 001A35D0 28364070 */  paddub     $6, $2, $0
/* A36D4 001A35D4 283E0070 */  paddub     $7, $0, $0
/* A36D8 001A35D8 C883050C */  jal        DrawVu1__6CWaterFP10RenderInfoP13sceVif1PacketP1
/* A36DC 001A35DC 00000000 */   nop
.L001A35E0:
/* A36E0 001A35E0 01001026 */  addiu      $16, $16, 0x1
/* A36E4 001A35E4 B0033126 */  addiu      $17, $17, 0x3B0
.L001A35E8:
/* A36E8 001A35E8 0400032A */  slti       $3, $16, 0x4
/* A36EC 001A35EC 78FF6014 */  bnez       $3, .L001A33D0
/* A36F0 001A35F0 00000000 */   nop
/* A36F4 001A35F4 5000BF7B */  lq         $31, 0x50($sp)
/* A36F8 001A35F8 4000B47B */  lq         $20, 0x40($sp)
/* A36FC 001A35FC 3000B37B */  lq         $19, 0x30($sp)
/* A3700 001A3600 2000B27B */  lq         $18, 0x20($sp)
/* A3704 001A3604 1000B17B */  lq         $17, 0x10($sp)
/* A3708 001A3608 0000B07B */  lq         $16, 0x0($sp)
/* A370C 001A360C A000BD27 */  addiu      $sp, $sp, 0xA0
/* A3710 001A3610 0800E003 */  jr         $31
/* A3714 001A3614 00000000 */   nop
/* A3718 001A3618 00000000 */  nop
/* A371C 001A361C 00000000 */  nop
