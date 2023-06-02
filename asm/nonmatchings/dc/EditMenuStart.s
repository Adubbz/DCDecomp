.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel EditMenuStart__Fv
/* 1113C0 002112C0 20FFBD27 */  addiu      $sp, $sp, -0xE0
/* 1113C4 002112C4 7000BF7F */  sq         $31, 0x70($sp)
/* 1113C8 002112C8 6000B67F */  sq         $22, 0x60($sp)
/* 1113CC 002112CC 5000B57F */  sq         $21, 0x50($sp)
/* 1113D0 002112D0 4000B47F */  sq         $20, 0x40($sp)
/* 1113D4 002112D4 3000B37F */  sq         $19, 0x30($sp)
/* 1113D8 002112D8 2000B27F */  sq         $18, 0x20($sp)
/* 1113DC 002112DC 1000B17F */  sq         $17, 0x10($sp)
/* 1113E0 002112E0 0000B07F */  sq         $16, 0x0($sp)
/* 1113E4 002112E4 C800A327 */  addiu      $3, $sp, 0xC8
/* 1113E8 002112E8 308980C7 */  lwc1       $f0, -0x76D0($gp)
/* 1113EC 002112EC 34898287 */  lh         $2, -0x76CC($gp)
/* 1113F0 002112F0 000060E4 */  swc1       $f0, 0x0($3)
/* 1113F4 002112F4 040062A4 */  sh         $2, 0x4($3)
/* 1113F8 002112F8 D000A327 */  addiu      $3, $sp, 0xD0
/* 1113FC 002112FC 388980C7 */  lwc1       $f0, -0x76C8($gp)
/* 111400 00211300 3C898293 */  lbu        $2, -0x76C4($gp)
/* 111404 00211304 000060E4 */  swc1       $f0, 0x0($3)
/* 111408 00211308 040062A0 */  sb         $2, 0x4($3)
/* 11140C 0021130C B840080C */  jal        GetEditMenuMax__Fv
/* 111410 00211310 00000000 */   nop
/* 111414 00211314 D800A427 */  addiu      $4, $sp, 0xD8
/* 111418 00211318 408980C7 */  lwc1       $f0, -0x76C0($gp)
/* 11141C 0021131C 44898387 */  lh         $3, -0x76BC($gp)
/* 111420 00211320 000080E4 */  swc1       $f0, 0x0($4)
/* 111424 00211324 040083A4 */  sh         $3, 0x4($4)
/* 111428 00211328 05000324 */  addiu      $3, $0, 0x5
/* 11142C 0021132C 0B004314 */  bne        $2, $3, .L0021135C
/* 111430 00211330 00000000 */   nop
/* 111434 00211334 282E0070 */  paddub     $5, $0, $0
/* 111438 00211338 05000010 */  b          .L00211350
/* 11143C 0021133C 00000000 */   nop
.L00211340:
/* 111440 00211340 2120BD00 */  addu       $4, $5, $sp
/* 111444 00211344 D0008390 */  lbu        $3, 0xD0($4)
/* 111448 00211348 D80083A0 */  sb         $3, 0xD8($4)
/* 11144C 0021134C 0100A524 */  addiu      $5, $5, 0x1
.L00211350:
/* 111450 00211350 2A18A200 */  slt        $3, $5, $2
/* 111454 00211354 FAFF6014 */  bnez       $3, .L00211340
/* 111458 00211358 00000000 */   nop
.L0021135C:
/* 11145C 0021135C 06000324 */  addiu      $3, $0, 0x6
/* 111460 00211360 0B004314 */  bne        $2, $3, .L00211390
/* 111464 00211364 00000000 */   nop
/* 111468 00211368 282E0070 */  paddub     $5, $0, $0
/* 11146C 0021136C 05000010 */  b          .L00211384
/* 111470 00211370 00000000 */   nop
.L00211374:
/* 111474 00211374 2120BD00 */  addu       $4, $5, $sp
/* 111478 00211378 C8008390 */  lbu        $3, 0xC8($4)
/* 11147C 0021137C D80083A0 */  sb         $3, 0xD8($4)
/* 111480 00211380 0100A524 */  addiu      $5, $5, 0x1
.L00211384:
/* 111484 00211384 2A18A200 */  slt        $3, $5, $2
/* 111488 00211388 FAFF6014 */  bnez       $3, .L00211374
/* 11148C 0021138C 00000000 */   nop
.L00211390:
/* 111490 00211390 282E0070 */  paddub     $5, $0, $0
/* 111494 00211394 1E000010 */  b          .L00211410
/* 111498 00211398 00000000 */   nop
.L0021139C:
/* 11149C 0021139C C0200500 */  sll        $4, $5, 3
/* 1114A0 002113A0 DA01033C */  lui        $3, %hi(MenuIconPos)
/* 1114A4 002113A4 20EF6324 */  addiu      $3, $3, %lo(MenuIconPos)
/* 1114A8 002113A8 21306400 */  addu       $6, $3, $4
/* 1114AC 002113AC 2118BD00 */  addu       $3, $5, $sp
/* 1114B0 002113B0 D8006390 */  lbu        $3, 0xD8($3)
/* 1114B4 002113B4 06006004 */  bltz       $3, .L002113D0
/* 1114B8 002113B8 00000000 */   nop
/* 1114BC 002113BC 00008344 */  mtc1       $3, $f0
/* 1114C0 002113C0 00000000 */  nop
/* 1114C4 002113C4 20008046 */  cvt.s.w    $f0, $f0
/* 1114C8 002113C8 08000010 */  b          .L002113EC
/* 1114CC 002113CC 00000000 */   nop
.L002113D0:
/* 1114D0 002113D0 42200300 */  srl        $4, $3, 1
/* 1114D4 002113D4 01006330 */  andi       $3, $3, 0x1
/* 1114D8 002113D8 25208300 */  or         $4, $4, $3
/* 1114DC 002113DC 00008444 */  mtc1       $4, $f0
/* 1114E0 002113E0 00000000 */  nop
/* 1114E4 002113E4 20008046 */  cvt.s.w    $f0, $f0
/* 1114E8 002113E8 00000046 */  add.s      $f0, $f0, $f0
.L002113EC:
/* 1114EC 002113EC 0000C2C4 */  lwc1       $f2, 0x0($6)
/* 1114F0 002113F0 41000246 */  sub.s      $f1, $f0, $f2
/* 1114F4 002113F4 8040033C */  lui        $3, (0x40800000 >> 16)
/* 1114F8 002113F8 00008344 */  mtc1       $3, $f0
/* 1114FC 002113FC 00000000 */  nop
/* 111500 00211400 03080046 */  div.s      $f0, $f1, $f0
/* 111504 00211404 00100046 */  add.s      $f0, $f2, $f0
/* 111508 00211408 0000C0E4 */  swc1       $f0, 0x0($6)
/* 11150C 0021140C 0100A524 */  addiu      $5, $5, 0x1
.L00211410:
/* 111510 00211410 2A18A200 */  slt        $3, $5, $2
/* 111514 00211414 E1FF6014 */  bnez       $3, .L0021139C
/* 111518 00211418 00000000 */   nop
/* 11151C 0021141C 58968287 */  lh         $2, -0x69A8($gp)
/* 111520 00211420 41004128 */  slti       $at, $2, 0x41
/* 111524 00211424 03002014 */  bnez       $at, .L00211434
/* 111528 00211428 00000000 */   nop
/* 11152C 0021142C FCFF4224 */  addiu      $2, $2, -0x4
/* 111530 00211430 589682A7 */  sh         $2, -0x69A8($gp)
.L00211434:
/* 111534 00211434 5C96838F */  lw         $3, -0x69A4($gp)
/* 111538 00211438 C0100300 */  sll        $2, $3, 3
/* 11153C 0021143C 23804300 */  subu       $16, $2, $3
/* 111540 00211440 8100012A */  slti       $at, $16, 0x81
/* 111544 00211444 02002014 */  bnez       $at, .L00211450
/* 111548 00211448 00000000 */   nop
/* 11154C 0021144C 80001024 */  addiu      $16, $0, 0x80
.L00211450:
/* 111550 00211450 28960070 */  paddub     $18, $0, $0
/* 111554 00211454 31000010 */  b          .L0021151C
/* 111558 00211458 00000000 */   nop
.L0021145C:
/* 11155C 0021145C 288E0070 */  paddub     $17, $0, $0
/* 111560 00211460 28B60070 */  paddub     $22, $0, $0
/* 111564 00211464 08898227 */  addiu      $2, $gp, -0x76F8
/* 111568 00211468 21105200 */  addu       $2, $2, $18
/* 11156C 0021146C 00005380 */  lb         $19, 0x0($2)
/* 111570 00211470 28266072 */  paddub     $4, $19, $0
/* 111574 00211474 D0B7080C */  jal        GetMenuIconInfo__Fi
/* 111578 00211478 00000000 */   nop
/* 11157C 0021147C 28A60070 */  paddub     $20, $0, $0
/* 111580 00211480 DA01013C */  lui        $at, (0x1DA0000 >> 16)
/* 111584 00211484 58EF2280 */  lb         $2, -0x10A8($at)
/* 111588 00211488 05004216 */  bne        $18, $2, .L002114A0
/* 11158C 0021148C 00000000 */   nop
/* 111590 00211490 08001624 */  addiu      $22, $0, 0x8
/* 111594 00211494 02001124 */  addiu      $17, $0, 0x2
/* 111598 00211498 80001024 */  addiu      $16, $0, 0x80
/* 11159C 0021149C 01001424 */  addiu      $20, $0, 0x1
.L002114A0:
/* 1115A0 002114A0 C0A81200 */  sll        $21, $18, 3
/* 1115A4 002114A4 DA01023C */  lui        $2, %hi(MenuIconPos)
/* 1115A8 002114A8 20EF4224 */  addiu      $2, $2, %lo(MenuIconPos)
/* 1115AC 002114AC 21105500 */  addu       $2, $2, $21
/* 1115B0 002114B0 000041C4 */  lwc1       $f1, 0x0($2)
/* 1115B4 002114B4 00009644 */  mtc1       $22, $f0
/* 1115B8 002114B8 00000000 */  nop
/* 1115BC 002114BC 20008046 */  cvt.s.w    $f0, $f0
/* 1115C0 002114C0 010B0046 */  sub.s      $f12, $f1, $f0
/* 1115C4 002114C4 2C44040C */  jal        fptosi
/* 1115C8 002114C8 00000000 */   nop
/* 1115CC 002114CC 28B64070 */  paddub     $22, $2, $0
/* 1115D0 002114D0 DA01023C */  lui        $2, %hi(D_1D9EF24)
/* 1115D4 002114D4 24EF4224 */  addiu      $2, $2, %lo(D_1D9EF24)
/* 1115D8 002114D8 21105500 */  addu       $2, $2, $21
/* 1115DC 002114DC 000041C4 */  lwc1       $f1, 0x0($2)
/* 1115E0 002114E0 00009144 */  mtc1       $17, $f0
/* 1115E4 002114E4 00000000 */  nop
/* 1115E8 002114E8 20008046 */  cvt.s.w    $f0, $f0
/* 1115EC 002114EC 010B0046 */  sub.s      $f12, $f1, $f0
/* 1115F0 002114F0 2C44040C */  jal        fptosi
/* 1115F4 002114F4 00000000 */   nop
/* 1115F8 002114F8 2826C072 */  paddub     $4, $22, $0
/* 1115FC 002114FC 282E4070 */  paddub     $5, $2, $0
/* 111600 00211500 28366072 */  paddub     $6, $19, $0
/* 111604 00211504 283E8072 */  paddub     $7, $20, $0
/* 111608 00211508 80000824 */  addiu      $8, $0, 0x80
/* 11160C 0021150C 284E0072 */  paddub     $9, $16, $0
/* 111610 00211510 E8B7080C */  jal        DrawMainMenuIcon__Fiiiiii
/* 111614 00211514 00000000 */   nop
/* 111618 00211518 01005226 */  addiu      $18, $18, 0x1
.L0021151C:
/* 11161C 0021151C B840080C */  jal        GetEditMenuMax__Fv
/* 111620 00211520 00000000 */   nop
/* 111624 00211524 2A104202 */  slt        $2, $18, $2
/* 111628 00211528 CCFF4014 */  bnez       $2, .L0021145C
/* 11162C 0021152C 00000000 */   nop
/* 111630 00211530 8CFB040C */  jal        ReadBGSync__Fv
/* 111634 00211534 00000000 */   nop
/* 111638 00211538 75004014 */  bnez       $2, .L00211710
/* 11163C 0021153C 00000000 */   nop
/* 111640 00211540 3C96828F */  lw         $2, -0x69C4($gp)
/* 111644 00211544 72004014 */  bnez       $2, .L00211710
/* 111648 00211548 00000000 */   nop
/* 11164C 0021154C 2900023C */  lui        $2, %hi(_574)
/* 111650 00211550 D03C4524 */  addiu      $5, $2, %lo(_574)
/* 111654 00211554 8000A427 */  addiu      $4, $sp, 0x80
/* 111658 00211558 02000324 */  addiu      $3, $0, 0x2
.L0021155C:
/* 11165C 0021155C 0000A278 */  lq         $2, 0x0($5)
/* 111660 00211560 1000A524 */  addiu      $5, $5, 0x10
/* 111664 00211564 FFFF6324 */  addiu      $3, $3, -0x1
/* 111668 00211568 0000827C */  sq         $2, 0x0($4)
/* 11166C 0021156C 10008424 */  addiu      $4, $4, 0x10
/* 111670 00211570 FAFF601C */  bgtz       $3, .L0021155C
/* 111674 00211574 00000000 */   nop
/* 111678 00211578 0000A2C4 */  lwc1       $f2, 0x0($5)
/* 11167C 0021157C 000082E4 */  swc1       $f2, 0x0($4)
/* 111680 00211580 4096828F */  lw         $2, -0x69C0($gp)
/* 111684 00211584 8400A2AF */  sw         $2, 0x84($sp)
/* 111688 00211588 9000A2AF */  sw         $2, 0x90($sp)
/* 11168C 0021158C 28260070 */  paddub     $4, $0, $0
/* 111690 00211590 18FB040C */  jal        GetReadBGFile__Fi
/* 111694 00211594 00000000 */   nop
/* 111698 00211598 28864070 */  paddub     $16, $2, $0
/* 11169C 0021159C 8C00448C */  lw         $4, 0x8C($2)
/* 1116A0 002115A0 2A00023C */  lui        $2, %hi(_583)
/* 1116A4 002115A4 00E44524 */  addiu      $5, $2, %lo(_583)
/* 1116A8 002115A8 28360070 */  paddub     $6, $0, $0
/* 1116AC 002115AC C8FD040C */  jal        GetPackFile__FPUiPcPi
/* 1116B0 002115B0 00000000 */   nop
/* 1116B4 002115B4 8C00A2AF */  sw         $2, 0x8C($sp)
/* 1116B8 002115B8 2900023C */  lui        $2, %hi(_575_3)
/* 1116BC 002115BC 003D4224 */  addiu      $2, $2, %lo(_575_3)
/* 1116C0 002115C0 B000A427 */  addiu      $4, $sp, 0xB0
/* 1116C4 002115C4 00004378 */  lq         $3, 0x0($2)
/* 1116C8 002115C8 100042C4 */  lwc1       $f2, 0x10($2)
/* 1116CC 002115CC 0000837C */  sq         $3, 0x0($4)
/* 1116D0 002115D0 100082E4 */  swc1       $f2, 0x10($4)
/* 1116D4 002115D4 4096828F */  lw         $2, -0x69C0($gp)
/* 1116D8 002115D8 B000A2AF */  sw         $2, 0xB0($sp)
/* 1116DC 002115DC 4896828F */  lw         $2, -0x69B8($gp)
/* 1116E0 002115E0 B400A2AF */  sw         $2, 0xB4($sp)
/* 1116E4 002115E4 4C96828F */  lw         $2, -0x69B4($gp)
/* 1116E8 002115E8 B800A2AF */  sw         $2, 0xB8($sp)
/* 1116EC 002115EC 5096828F */  lw         $2, -0x69B0($gp)
/* 1116F0 002115F0 BC00A2AF */  sw         $2, 0xBC($sp)
/* 1116F4 002115F4 4CB4080C */  jal        MenuTextureDelete__FPi
/* 1116F8 002115F8 00000000 */   nop
/* 1116FC 002115FC C701023C */  lui        $2, %hi(TexManager)
/* 111700 00211600 70584424 */  addiu      $4, $2, %lo(TexManager)
/* 111704 00211604 98CE040C */  jal        CleanUpTextureList__15CTextureManagerFv
/* 111708 00211608 00000000 */   nop
/* 11170C 0021160C C701023C */  lui        $2, %hi(TexManager)
/* 111710 00211610 70584424 */  addiu      $4, $2, %lo(TexManager)
/* 111714 00211614 FFFF0524 */  addiu      $5, $0, -0x1
/* 111718 00211618 8000A627 */  addiu      $6, $sp, 0x80
/* 11171C 0021161C 30D0040C */  jal        LoadTextureBlockEX__15CTextureManagerFiP17LOADTEXTURE_INFO2
/* 111720 00211620 00000000 */   nop
/* 111724 00211624 C701023C */  lui        $2, %hi(TexManager)
/* 111728 00211628 70584424 */  addiu      $4, $2, %lo(TexManager)
/* 11172C 0021162C 2A00023C */  lui        $2, %hi(_584_2)
/* 111730 00211630 10E44524 */  addiu      $5, $2, %lo(_584_2)
/* 111734 00211634 4096868F */  lw         $6, -0x69C0($gp)
/* 111738 00211638 B4C4040C */  jal        GetTexture__15CTextureManagerFPci
/* 11173C 0021163C 00000000 */   nop
/* 111740 00211640 349682AF */  sw         $2, -0x69CC($gp)
/* 111744 00211644 C701023C */  lui        $2, %hi(TexManager)
/* 111748 00211648 70584424 */  addiu      $4, $2, %lo(TexManager)
/* 11174C 0021164C 2A00023C */  lui        $2, %hi(_585_2)
/* 111750 00211650 20E44524 */  addiu      $5, $2, %lo(_585_2)
/* 111754 00211654 4096868F */  lw         $6, -0x69C0($gp)
/* 111758 00211658 B4C4040C */  jal        GetTexture__15CTextureManagerFPci
/* 11175C 0021165C 00000000 */   nop
/* 111760 00211660 389682AF */  sw         $2, -0x69C8($gp)
/* 111764 00211664 C701023C */  lui        $2, %hi(TexManager)
/* 111768 00211668 70584424 */  addiu      $4, $2, %lo(TexManager)
/* 11176C 0021166C 2A00023C */  lui        $2, %hi(_586_2)
/* 111770 00211670 28E44524 */  addiu      $5, $2, %lo(_586_2)
/* 111774 00211674 4096868F */  lw         $6, -0x69C0($gp)
/* 111778 00211678 B4C4040C */  jal        GetTexture__15CTextureManagerFPci
/* 11177C 0021167C 00000000 */   nop
/* 111780 00211680 A49782AF */  sw         $2, -0x685C($gp)
/* 111784 00211684 C701023C */  lui        $2, %hi(TexManager)
/* 111788 00211688 70584424 */  addiu      $4, $2, %lo(TexManager)
/* 11178C 0021168C 2A00023C */  lui        $2, %hi(_587_2)
/* 111790 00211690 30E44524 */  addiu      $5, $2, %lo(_587_2)
/* 111794 00211694 FFFF0624 */  addiu      $6, $0, -0x1
/* 111798 00211698 B4C4040C */  jal        GetTexture__15CTextureManagerFPci
/* 11179C 0021169C 00000000 */   nop
/* 1117A0 002116A0 D09682AF */  sw         $2, -0x6930($gp)
/* 1117A4 002116A4 C701023C */  lui        $2, %hi(TexManager)
/* 1117A8 002116A8 70584424 */  addiu      $4, $2, %lo(TexManager)
/* 1117AC 002116AC 2A00023C */  lui        $2, %hi(_588_2)
/* 1117B0 002116B0 38E44524 */  addiu      $5, $2, %lo(_588_2)
/* 1117B4 002116B4 FFFF0624 */  addiu      $6, $0, -0x1
/* 1117B8 002116B8 B4C4040C */  jal        GetTexture__15CTextureManagerFPci
/* 1117BC 002116BC 00000000 */   nop
/* 1117C0 002116C0 CC9682AF */  sw         $2, -0x6934($gp)
/* 1117C4 002116C4 8C00048E */  lw         $4, 0x8C($16)
/* 1117C8 002116C8 2A00023C */  lui        $2, %hi(_589_3)
/* 1117CC 002116CC 40E44524 */  addiu      $5, $2, %lo(_589_3)
/* 1117D0 002116D0 28360070 */  paddub     $6, $0, $0
/* 1117D4 002116D4 C8FD040C */  jal        GetPackFile__FPUiPcPi
/* 1117D8 002116D8 00000000 */   nop
/* 1117DC 002116DC E09682AF */  sw         $2, -0x6920($gp)
/* 1117E0 002116E0 8C00048E */  lw         $4, 0x8C($16)
/* 1117E4 002116E4 2A00023C */  lui        $2, %hi(_590_3)
/* 1117E8 002116E8 50E44524 */  addiu      $5, $2, %lo(_590_3)
/* 1117EC 002116EC 28360070 */  paddub     $6, $0, $0
/* 1117F0 002116F0 C8FD040C */  jal        GetPackFile__FPUiPcPi
/* 1117F4 002116F4 00000000 */   nop
/* 1117F8 002116F8 28260070 */  paddub     $4, $0, $0
/* 1117FC 002116FC 282E4070 */  paddub     $5, $2, $0
/* 111800 00211700 50B0080C */  jal        InitMenuMesSet__FiPs
/* 111804 00211704 00000000 */   nop
/* 111808 00211708 01000224 */  addiu      $2, $0, 0x1
/* 11180C 0021170C 3C9682AF */  sw         $2, -0x69C4($gp)
.L00211710:
/* 111810 00211710 5C96828F */  lw         $2, -0x69A4($gp)
/* 111814 00211714 01004224 */  addiu      $2, $2, 0x1
/* 111818 00211718 5C9682AF */  sw         $2, -0x69A4($gp)
/* 11181C 0021171C 5C96828F */  lw         $2, -0x69A4($gp)
/* 111820 00211720 11004228 */  slti       $2, $2, 0x11
/* 111824 00211724 09004014 */  bnez       $2, .L0021174C
/* 111828 00211728 00000000 */   nop
/* 11182C 0021172C 3C96828F */  lw         $2, -0x69C4($gp)
/* 111830 00211730 06004010 */  beqz       $2, .L0021174C
/* 111834 00211734 00000000 */   nop
/* 111838 00211738 02000224 */  addiu      $2, $0, 0x2
/* 11183C 0021173C 549682AF */  sw         $2, -0x69AC($gp)
/* 111840 00211740 DA01013C */  lui        $at, (0x1DA0000 >> 16)
/* 111844 00211744 58EF20A0 */  sb         $0, -0x10A8($at)
/* 111848 00211748 5C9680AF */  sw         $0, -0x69A4($gp)
.L0021174C:
/* 11184C 0021174C 28160070 */  paddub     $2, $0, $0
/* 111850 00211750 7000BF7B */  lq         $31, 0x70($sp)
/* 111854 00211754 6000B67B */  lq         $22, 0x60($sp)
/* 111858 00211758 5000B57B */  lq         $21, 0x50($sp)
/* 11185C 0021175C 4000B47B */  lq         $20, 0x40($sp)
/* 111860 00211760 3000B37B */  lq         $19, 0x30($sp)
/* 111864 00211764 2000B27B */  lq         $18, 0x20($sp)
/* 111868 00211768 1000B17B */  lq         $17, 0x10($sp)
/* 11186C 0021176C 0000B07B */  lq         $16, 0x0($sp)
/* 111870 00211770 E000BD27 */  addiu      $sp, $sp, 0xE0
/* 111874 00211774 0800E003 */  jr         $31
/* 111878 00211778 00000000 */   nop
/* 11187C 0021177C 00000000 */  nop