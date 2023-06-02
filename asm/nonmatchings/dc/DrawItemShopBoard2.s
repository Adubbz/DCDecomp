.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel DrawItemShopBoard2__Fiii
/* EC470 001EC370 30FFBD27 */  addiu      $sp, $sp, -0xD0
/* EC474 001EC374 9000BF7F */  sq         $31, 0x90($sp)
/* EC478 001EC378 8000BE7F */  sq         $fp, 0x80($sp)
/* EC47C 001EC37C 7000B77F */  sq         $23, 0x70($sp)
/* EC480 001EC380 6000B67F */  sq         $22, 0x60($sp)
/* EC484 001EC384 5000B57F */  sq         $21, 0x50($sp)
/* EC488 001EC388 4000B47F */  sq         $20, 0x40($sp)
/* EC48C 001EC38C 3000B37F */  sq         $19, 0x30($sp)
/* EC490 001EC390 2000B27F */  sq         $18, 0x20($sp)
/* EC494 001EC394 1000B17F */  sq         $17, 0x10($sp)
/* EC498 001EC398 0000B07F */  sq         $16, 0x0($sp)
/* EC49C 001EC39C 28AE8070 */  paddub     $21, $4, $0
/* EC4A0 001EC3A0 28A6A070 */  paddub     $20, $5, $0
/* EC4A4 001EC3A4 28B6C070 */  paddub     $22, $6, $0
/* EC4A8 001EC3A8 09008226 */  addiu      $2, $20, 0x9
/* EC4AC 001EC3AC A000A2AF */  sw         $2, 0xA0($sp)
/* EC4B0 001EC3B0 A9009E26 */  addiu      $fp, $20, 0xA9
/* EC4B4 001EC3B4 1400B126 */  addiu      $17, $21, 0x14
/* EC4B8 001EC3B8 06008626 */  addiu      $6, $20, 0x6
/* EC4BC 001EC3BC D901013C */  lui        $at, (0x1D90246 >> 16)
/* EC4C0 001EC3C0 46022390 */  lbu        $3, (0x1D90246 & 0xFFFF)($at)
/* EC4C4 001EC3C4 80100300 */  sll        $2, $3, 2
/* EC4C8 001EC3C8 21104300 */  addu       $2, $2, $3
/* EC4CC 001EC3CC C0100200 */  sll        $2, $2, 3
/* EC4D0 001EC3D0 2380C200 */  subu       $16, $6, $2
/* EC4D4 001EC3D4 00009044 */  mtc1       $16, $f0
/* EC4D8 001EC3D8 00000000 */  nop
/* EC4DC 001EC3DC 20008046 */  cvt.s.w    $f0, $f0
/* EC4E0 001EC3E0 D901013C */  lui        $at, (0x1D9023C >> 16)
/* EC4E4 001EC3E4 3C0222C4 */  lwc1       $f2, (0x1D9023C & 0xFFFF)($at)
/* EC4E8 001EC3E8 41000246 */  sub.s      $f1, $f0, $f2
/* EC4EC 001EC3EC 8040023C */  lui        $2, (0x40800000 >> 16)
/* EC4F0 001EC3F0 00008244 */  mtc1       $2, $f0
/* EC4F4 001EC3F4 00000000 */  nop
/* EC4F8 001EC3F8 03080046 */  div.s      $f0, $f1, $f0
/* EC4FC 001EC3FC 00130046 */  add.s      $f12, $f2, $f0
/* EC500 001EC400 D901013C */  lui        $at, (0x1D9023C >> 16)
/* EC504 001EC404 3C022CE4 */  swc1       $f12, (0x1D9023C & 0xFFFF)($at)
/* EC508 001EC408 2C44040C */  jal        fptosi
/* EC50C 001EC40C 00000000 */   nop
/* EC510 001EC410 28864070 */  paddub     $16, $2, $0
/* EC514 001EC414 28260070 */  paddub     $4, $0, $0
/* EC518 001EC418 1E000524 */  addiu      $5, $0, 0x1E
/* EC51C 001EC41C 28362072 */  paddub     $6, $17, $0
/* EC520 001EC420 283E0072 */  paddub     $7, $16, $0
/* EC524 001EC424 A000A88F */  lw         $8, 0xA0($sp)
/* EC528 001EC428 284EC073 */  paddub     $9, $fp, $0
/* EC52C 001EC42C 88948A8F */  lw         $10, -0x6B78($gp)
/* EC530 001EC430 80000B24 */  addiu      $11, $0, 0x80
/* EC534 001EC434 70C3080C */  jal        DrawPerBoardDraw__FiiiiiiP8CTexturei
/* EC538 001EC438 00000000 */   nop
/* EC53C 001EC43C 02003226 */  addiu      $18, $17, 0x2
/* EC540 001EC440 06001726 */  addiu      $23, $16, 0x6
/* EC544 001EC444 289E0070 */  paddub     $19, $0, $0
/* EC548 001EC448 2B000010 */  b          .L001EC4F8
/* EC54C 001EC44C 00000000 */   nop
.L001EC450:
/* EC550 001EC450 A094868F */  lw         $6, -0x6B60($gp)
/* EC554 001EC454 80111300 */  sll        $2, $19, 6
/* EC558 001EC458 23105300 */  subu       $2, $2, $19
/* EC55C 001EC45C 80280200 */  sll        $5, $2, 2
/* EC560 001EC460 2118C500 */  addu       $3, $6, $5
/* EC564 001EC464 00006484 */  lh         $4, 0x0($3)
/* EC568 001EC468 28560070 */  paddub     $10, $0, $0
/* EC56C 001EC46C 5B008228 */  slti       $2, $4, 0x5B
/* EC570 001EC470 08004014 */  bnez       $2, .L001EC494
/* EC574 001EC474 00000000 */   nop
/* EC578 001EC478 5F008128 */  slti       $at, $4, 0x5F
/* EC57C 001EC47C 05002010 */  beqz       $at, .L001EC494
/* EC580 001EC480 00000000 */   nop
/* EC584 001EC484 40100400 */  sll        $2, $4, 1
/* EC588 001EC488 21104300 */  addu       $2, $2, $3
/* EC58C 001EC48C 56FF4A84 */  lh         $10, -0xAA($2)
/* EC590 001EC490 00000000 */  nop
.L001EC494:
/* EC594 001EC494 5A000224 */  addiu      $2, $0, 0x5A
/* EC598 001EC498 04008214 */  bne        $4, $2, .L001EC4AC
/* EC59C 001EC49C 00000000 */   nop
/* EC5A0 001EC4A0 2110A600 */  addu       $2, $5, $6
/* EC5A4 001EC4A4 06004A84 */  lh         $10, 0x6($2)
/* EC5A8 001EC4A8 00000000 */  nop
.L001EC4AC:
/* EC5AC 001EC4AC 282E4072 */  paddub     $5, $18, $0
/* EC5B0 001EC4B0 2836E072 */  paddub     $6, $23, $0
/* EC5B4 001EC4B4 A000A78F */  lw         $7, 0xA0($sp)
/* EC5B8 001EC4B8 2846C073 */  paddub     $8, $fp, $0
/* EC5BC 001EC4BC 284EC072 */  paddub     $9, $22, $0
/* EC5C0 001EC4C0 68B5080C */  jal        DrawIconParts__Fiiiiiii
/* EC5C4 001EC4C4 00000000 */   nop
/* EC5C8 001EC4C8 28005226 */  addiu      $18, $18, 0x28
/* EC5CC 001EC4CC 05000224 */  addiu      $2, $0, 0x5
/* EC5D0 001EC4D0 1A006202 */  div        $0, $19, $2
/* EC5D4 001EC4D4 00000000 */  nop
/* EC5D8 001EC4D8 00000000 */  nop
/* EC5DC 001EC4DC 10180000 */  mfhi       $3
/* EC5E0 001EC4E0 04000224 */  addiu      $2, $0, 0x4
/* EC5E4 001EC4E4 03006214 */  bne        $3, $2, .L001EC4F4
/* EC5E8 001EC4E8 00000000 */   nop
/* EC5EC 001EC4EC 02003226 */  addiu      $18, $17, 0x2
/* EC5F0 001EC4F0 2800F726 */  addiu      $23, $23, 0x28
.L001EC4F4:
/* EC5F4 001EC4F4 01007326 */  addiu      $19, $19, 0x1
.L001EC4F8:
/* EC5F8 001EC4F8 1E00622A */  slti       $2, $19, 0x1E
/* EC5FC 001EC4FC D4FF4014 */  bnez       $2, .L001EC450
/* EC600 001EC500 00000000 */   nop
/* EC604 001EC504 02002426 */  addiu      $4, $17, 0x2
/* EC608 001EC508 06000526 */  addiu      $5, $16, 0x6
/* EC60C 001EC50C A000A68F */  lw         $6, 0xA0($sp)
/* EC610 001EC510 283EC073 */  paddub     $7, $fp, $0
/* EC614 001EC514 80000824 */  addiu      $8, $0, 0x80
/* EC618 001EC518 8CB2070C */  jal        DrawSellTicket_2__Fiiiii
/* EC61C 001EC51C 00000000 */   nop
/* EC620 001EC520 B000B5AF */  sw         $21, 0xB0($sp)
/* EC624 001EC524 EDFF8226 */  addiu      $2, $20, -0x13
/* EC628 001EC528 B400A2AF */  sw         $2, 0xB4($sp)
/* EC62C 001EC52C 80000424 */  addiu      $4, $0, 0x80
/* EC630 001EC530 B800A4AF */  sw         $4, 0xB8($sp)
/* EC634 001EC534 14000324 */  addiu      $3, $0, 0x14
/* EC638 001EC538 BC00A3AF */  sw         $3, 0xBC($sp)
/* EC63C 001EC53C 00010224 */  addiu      $2, $0, 0x100
/* EC640 001EC540 C000A2AF */  sw         $2, 0xC0($sp)
/* EC644 001EC544 7C000224 */  addiu      $2, $0, 0x7C
/* EC648 001EC548 C400B027 */  addiu      $16, $sp, 0xC4
/* EC64C 001EC54C 000002AE */  sw         $2, 0x0($16)
/* EC650 001EC550 C800A4AF */  sw         $4, 0xC8($sp)
/* EC654 001EC554 CC00A3AF */  sw         $3, 0xCC($sp)
/* EC658 001EC558 8894848F */  lw         $4, -0x6B78($gp)
/* EC65C 001EC55C B000A527 */  addiu      $5, $sp, 0xB0
/* EC660 001EC560 C000A627 */  addiu      $6, $sp, 0xC0
/* EC664 001EC564 283EC072 */  paddub     $7, $22, $0
/* EC668 001EC568 C8B3080C */  jal        DrawMenu2DSprite__FP8CTexture8CRect_i_8CRect_i_i
/* EC66C 001EC56C 00000000 */   nop
/* EC670 001EC570 B000A28F */  lw         $2, 0xB0($sp)
/* EC674 001EC574 80004224 */  addiu      $2, $2, 0x80
/* EC678 001EC578 B000A2AF */  sw         $2, 0xB0($sp)
/* EC67C 001EC57C C000A28F */  lw         $2, 0xC0($sp)
/* EC680 001EC580 80004224 */  addiu      $2, $2, 0x80
/* EC684 001EC584 C000A2AF */  sw         $2, 0xC0($sp)
/* EC688 001EC588 1C000224 */  addiu      $2, $0, 0x1C
/* EC68C 001EC58C 000002AE */  sw         $2, 0x0($16)
/* EC690 001EC590 8894848F */  lw         $4, -0x6B78($gp)
/* EC694 001EC594 B000A527 */  addiu      $5, $sp, 0xB0
/* EC698 001EC598 C000A627 */  addiu      $6, $sp, 0xC0
/* EC69C 001EC59C 283EC072 */  paddub     $7, $22, $0
/* EC6A0 001EC5A0 C8B3080C */  jal        DrawMenu2DSprite__FP8CTexture8CRect_i_8CRect_i_i
/* EC6A4 001EC5A4 00000000 */   nop
/* EC6A8 001EC5A8 2826A072 */  paddub     $4, $21, $0
/* EC6AC 001EC5AC 282E8072 */  paddub     $5, $20, $0
/* EC6B0 001EC5B0 8894868F */  lw         $6, -0x6B78($gp)
/* EC6B4 001EC5B4 80000724 */  addiu      $7, $0, 0x80
/* EC6B8 001EC5B8 F0BF080C */  jal        PersonalBoardDrawWaku__FiiP8CTexturei
/* EC6BC 001EC5BC 00000000 */   nop
/* EC6C0 001EC5C0 1E000424 */  addiu      $4, $0, 0x1E
/* EC6C4 001EC5C4 282EA072 */  paddub     $5, $21, $0
/* EC6C8 001EC5C8 28368072 */  paddub     $6, $20, $0
/* EC6CC 001EC5CC D901023C */  lui        $2, %hi(D_1D90240)
/* EC6D0 001EC5D0 40024724 */  addiu      $7, $2, %lo(D_1D90240)
/* EC6D4 001EC5D4 D901013C */  lui        $at, (0x1D90246 >> 16)
/* EC6D8 001EC5D8 46022890 */  lbu        $8, (0x1D90246 & 0xFFFF)($at)
/* EC6DC 001EC5DC 8894898F */  lw         $9, -0x6B78($gp)
/* EC6E0 001EC5E0 80000A24 */  addiu      $10, $0, 0x80
/* EC6E4 001EC5E4 C8C1080C */  jal        PersonalBoardScrlBarDraw__FiiiRfUcP8CTexturei
/* EC6E8 001EC5E8 00000000 */   nop
/* EC6EC 001EC5EC A800A426 */  addiu      $4, $21, 0xA8
/* EC6F0 001EC5F0 AA008526 */  addiu      $5, $20, 0xAA
/* EC6F4 001EC5F4 80000624 */  addiu      $6, $0, 0x80
/* EC6F8 001EC5F8 F4B1070C */  jal        DrawCheckButton__Fiii
/* EC6FC 001EC5FC 00000000 */   nop
/* EC700 001EC600 9000BF7B */  lq         $31, 0x90($sp)
/* EC704 001EC604 8000BE7B */  lq         $fp, 0x80($sp)
/* EC708 001EC608 7000B77B */  lq         $23, 0x70($sp)
/* EC70C 001EC60C 6000B67B */  lq         $22, 0x60($sp)
/* EC710 001EC610 5000B57B */  lq         $21, 0x50($sp)
/* EC714 001EC614 4000B47B */  lq         $20, 0x40($sp)
/* EC718 001EC618 3000B37B */  lq         $19, 0x30($sp)
/* EC71C 001EC61C 2000B27B */  lq         $18, 0x20($sp)
/* EC720 001EC620 1000B17B */  lq         $17, 0x10($sp)
/* EC724 001EC624 0000B07B */  lq         $16, 0x0($sp)
/* EC728 001EC628 D000BD27 */  addiu      $sp, $sp, 0xD0
/* EC72C 001EC62C 0800E003 */  jr         $31
/* EC730 001EC630 00000000 */   nop
/* EC734 001EC634 00000000 */  nop
/* EC738 001EC638 00000000 */  nop
/* EC73C 001EC63C 00000000 */  nop
