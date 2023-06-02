.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel DngActItemModelBuild__Fi
/* 12A490 0022A390 50FFBD27 */  addiu      $sp, $sp, -0xB0
/* 12A494 0022A394 9000BF7F */  sq         $31, 0x90($sp)
/* 12A498 0022A398 8000BE7F */  sq         $fp, 0x80($sp)
/* 12A49C 0022A39C 7000B77F */  sq         $23, 0x70($sp)
/* 12A4A0 0022A3A0 6000B67F */  sq         $22, 0x60($sp)
/* 12A4A4 0022A3A4 5000B57F */  sq         $21, 0x50($sp)
/* 12A4A8 0022A3A8 4000B47F */  sq         $20, 0x40($sp)
/* 12A4AC 0022A3AC 3000B37F */  sq         $19, 0x30($sp)
/* 12A4B0 0022A3B0 2000B27F */  sq         $18, 0x20($sp)
/* 12A4B4 0022A3B4 1000B17F */  sq         $17, 0x10($sp)
/* 12A4B8 0022A3B8 0000B07F */  sq         $16, 0x0($sp)
/* 12A4BC 0022A3BC 28868070 */  paddub     $16, $4, $0
/* 12A4C0 0022A3C0 8CFB040C */  jal        ReadBGSync__Fv
/* 12A4C4 0022A3C4 00000000 */   nop
/* 12A4C8 0022A3C8 0E004010 */  beqz       $2, .L0022A404
/* 12A4CC 0022A3CC 00000000 */   nop
/* 12A4D0 0022A3D0 07000012 */  beqz       $16, .L0022A3F0
/* 12A4D4 0022A3D4 00000000 */   nop
.L0022A3D8:
/* 12A4D8 0022A3D8 8CFB040C */  jal        ReadBGSync__Fv
/* 12A4DC 0022A3DC 00000000 */   nop
/* 12A4E0 0022A3E0 FDFF4014 */  bnez       $2, .L0022A3D8
/* 12A4E4 0022A3E4 00000000 */   nop
/* 12A4E8 0022A3E8 06000010 */  b          .L0022A404
/* 12A4EC 0022A3EC 00000000 */   nop
.L0022A3F0:
/* 12A4F0 0022A3F0 38FB040C */  jal        ReadBG__Fv
/* 12A4F4 0022A3F4 00000000 */   nop
/* 12A4F8 0022A3F8 28160070 */  paddub     $2, $0, $0
/* 12A4FC 0022A3FC 5A000010 */  b          .L0022A568
/* 12A500 0022A400 00000000 */   nop
.L0022A404:
/* 12A504 0022A404 D494858F */  lw         $5, -0x6B2C($gp)
/* 12A508 0022A408 2900023C */  lui        $2, %hi(_1674_2)
/* 12A50C 0022A40C C0424424 */  addiu      $4, $2, %lo(_1674_2)
/* 12A510 0022A410 A000A327 */  addiu      $3, $sp, 0xA0
/* 12A514 0022A414 000082DC */  ld         $2, 0x0($4)
/* 12A518 0022A418 080080C4 */  lwc1       $f0, 0x8($4)
/* 12A51C 0022A41C 000062FC */  sd         $2, 0x0($3)
/* 12A520 0022A420 080060E4 */  swc1       $f0, 0x8($3)
/* 12A524 0022A424 6243A284 */  lh         $2, 0x4362($5)
/* 12A528 0022A428 A000A2AF */  sw         $2, 0xA0($sp)
/* 12A52C 0022A42C 6443A284 */  lh         $2, 0x4364($5)
/* 12A530 0022A430 A400A2AF */  sw         $2, 0xA4($sp)
/* 12A534 0022A434 6643A284 */  lh         $2, 0x4366($5)
/* 12A538 0022A438 A800A2AF */  sw         $2, 0xA8($sp)
/* 12A53C 0022A43C 28960070 */  paddub     $18, $0, $0
/* 12A540 0022A440 289E0070 */  paddub     $19, $0, $0
/* 12A544 0022A444 44000010 */  b          .L0022A558
/* 12A548 0022A448 00000000 */   nop
.L0022A44C:
/* 12A54C 0022A44C 80A81300 */  sll        $21, $19, 2
/* 12A550 0022A450 2110BD02 */  addu       $2, $21, $sp
/* 12A554 0022A454 A000568C */  lw         $22, 0xA0($2)
/* 12A558 0022A458 8400C22A */  slti       $2, $22, 0x84
/* 12A55C 0022A45C 3D004014 */  bnez       $2, .L0022A554
/* 12A560 0022A460 00000000 */   nop
/* 12A564 0022A464 40A01200 */  sll        $20, $18, 1
/* 12A568 0022A468 28268072 */  paddub     $4, $20, $0
/* 12A56C 0022A46C 18FB040C */  jal        GetReadBGFile__Fi
/* 12A570 0022A470 00000000 */   nop
/* 12A574 0022A474 28864070 */  paddub     $16, $2, $0
/* 12A578 0022A478 01008426 */  addiu      $4, $20, 0x1
/* 12A57C 0022A47C 18FB040C */  jal        GetReadBGFile__Fi
/* 12A580 0022A480 00000000 */   nop
/* 12A584 0022A484 01005226 */  addiu      $18, $18, 0x1
/* 12A588 0022A488 03000012 */  beqz       $16, .L0022A498
/* 12A58C 0022A48C 00000000 */   nop
/* 12A590 0022A490 8C001E8E */  lw         $fp, 0x8C($16)
/* 12A594 0022A494 00000000 */  nop
.L0022A498:
/* 12A598 0022A498 04004010 */  beqz       $2, .L0022A4AC
/* 12A59C 0022A49C 00000000 */   nop
/* 12A5A0 0022A4A0 8C00578C */  lw         $23, 0x8C($2)
/* 12A5A4 0022A4A4 9000518C */  lw         $17, 0x90($2)
/* 12A5A8 0022A4A8 00000000 */  nop
.L0022A4AC:
/* 12A5AC 0022A4AC 29000012 */  beqz       $16, .L0022A554
/* 12A5B0 0022A4B0 00000000 */   nop
/* 12A5B4 0022A4B4 27004010 */  beqz       $2, .L0022A554
/* 12A5B8 0022A4B8 00000000 */   nop
/* 12A5BC 0022A4BC EC01023C */  lui        $2, %hi(D_1EC7888)
/* 12A5C0 0022A4C0 88784224 */  addiu      $2, $2, %lo(D_1EC7888)
/* 12A5C4 0022A4C4 21805500 */  addu       $16, $2, $21
/* 12A5C8 0022A4C8 0000058E */  lw         $5, 0x0($16)
/* 12A5CC 0022A4CC FFFF0224 */  addiu      $2, $0, -0x1
/* 12A5D0 0022A4D0 0700A210 */  beq        $5, $2, .L0022A4F0
/* 12A5D4 0022A4D4 00000000 */   nop
/* 12A5D8 0022A4D8 EC01013C */  lui        $at, (0x1EC78A8 >> 16)
/* 12A5DC 0022A4DC A878248C */  lw         $4, (0x1EC78A8 & 0xFFFF)($at)
/* 12A5E0 0022A4E0 DC51070C */  jal        DeleteModel__14CMainItemModelFi
/* 12A5E4 0022A4E4 00000000 */   nop
/* 12A5E8 0022A4E8 FFFF0224 */  addiu      $2, $0, -0x1
/* 12A5EC 0022A4EC 000002AE */  sw         $2, 0x0($16)
.L0022A4F0:
/* 12A5F0 0022A4F0 0000058E */  lw         $5, 0x0($16)
/* 12A5F4 0022A4F4 FFFF0224 */  addiu      $2, $0, -0x1
/* 12A5F8 0022A4F8 0500A210 */  beq        $5, $2, .L0022A510
/* 12A5FC 0022A4FC 00000000 */   nop
/* 12A600 0022A500 EC01013C */  lui        $at, (0x1EC78A8 >> 16)
/* 12A604 0022A504 A878248C */  lw         $4, (0x1EC78A8 & 0xFFFF)($at)
/* 12A608 0022A508 DC51070C */  jal        DeleteModel__14CMainItemModelFi
/* 12A60C 0022A50C 00000000 */   nop
.L0022A510:
/* 12A610 0022A510 EC01013C */  lui        $at, (0x1EC78A8 >> 16)
/* 12A614 0022A514 A878248C */  lw         $4, (0x1EC78A8 & 0xFFFF)($at)
/* 12A618 0022A518 282EC072 */  paddub     $5, $22, $0
/* 12A61C 0022A51C 2836C073 */  paddub     $6, $fp, $0
/* 12A620 0022A520 283EE072 */  paddub     $7, $23, $0
/* 12A624 0022A524 28462072 */  paddub     $8, $17, $0
/* 12A628 0022A528 7851070C */  jal        SetCashModel__14CMainItemModelFiPUiPUii
/* 12A62C 0022A52C 00000000 */   nop
/* 12A630 0022A530 000002AE */  sw         $2, 0x0($16)
/* 12A634 0022A534 EC01023C */  lui        $2, %hi(D_1EC7898)
/* 12A638 0022A538 98784224 */  addiu      $2, $2, %lo(D_1EC7898)
/* 12A63C 0022A53C 21105500 */  addu       $2, $2, $21
/* 12A640 0022A540 000040AC */  sw         $0, 0x0($2)
/* 12A644 0022A544 EC01023C */  lui        $2, %hi(D_1EC7878)
/* 12A648 0022A548 78784224 */  addiu      $2, $2, %lo(D_1EC7878)
/* 12A64C 0022A54C 21105500 */  addu       $2, $2, $21
/* 12A650 0022A550 000056AC */  sw         $22, 0x0($2)
.L0022A554:
/* 12A654 0022A554 01007326 */  addiu      $19, $19, 0x1
.L0022A558:
/* 12A658 0022A558 0300622A */  slti       $2, $19, 0x3
/* 12A65C 0022A55C BBFF4014 */  bnez       $2, .L0022A44C
/* 12A660 0022A560 00000000 */   nop
/* 12A664 0022A564 01000224 */  addiu      $2, $0, 0x1
.L0022A568:
/* 12A668 0022A568 9000BF7B */  lq         $31, 0x90($sp)
/* 12A66C 0022A56C 8000BE7B */  lq         $fp, 0x80($sp)
/* 12A670 0022A570 7000B77B */  lq         $23, 0x70($sp)
/* 12A674 0022A574 6000B67B */  lq         $22, 0x60($sp)
/* 12A678 0022A578 5000B57B */  lq         $21, 0x50($sp)
/* 12A67C 0022A57C 4000B47B */  lq         $20, 0x40($sp)
/* 12A680 0022A580 3000B37B */  lq         $19, 0x30($sp)
/* 12A684 0022A584 2000B27B */  lq         $18, 0x20($sp)
/* 12A688 0022A588 1000B17B */  lq         $17, 0x10($sp)
/* 12A68C 0022A58C 0000B07B */  lq         $16, 0x0($sp)
/* 12A690 0022A590 B000BD27 */  addiu      $sp, $sp, 0xB0
/* 12A694 0022A594 0800E003 */  jr         $31
/* 12A698 0022A598 00000000 */   nop
/* 12A69C 0022A59C 00000000 */  nop
