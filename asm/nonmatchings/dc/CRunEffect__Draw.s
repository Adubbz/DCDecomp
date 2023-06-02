.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel Draw__10CRunEffectFv
/* 63580 00163480 00FFBD27 */  addiu      $sp, $sp, -0x100
/* 63584 00163484 6000BF7F */  sq         $31, 0x60($sp)
/* 63588 00163488 5000B57F */  sq         $21, 0x50($sp)
/* 6358C 0016348C 4000B47F */  sq         $20, 0x40($sp)
/* 63590 00163490 3000B37F */  sq         $19, 0x30($sp)
/* 63594 00163494 2000B27F */  sq         $18, 0x20($sp)
/* 63598 00163498 1000B17F */  sq         $17, 0x10($sp)
/* 6359C 0016349C 0000B07F */  sq         $16, 0x0($sp)
/* 635A0 001634A0 28868070 */  paddub     $16, $4, $0
/* 635A4 001634A4 C701023C */  lui        $2, %hi(TexManager)
/* 635A8 001634A8 70584424 */  addiu      $4, $2, %lo(TexManager)
/* 635AC 001634AC 2A00023C */  lui        $2, %hi(_395_2)
/* 635B0 001634B0 F0A04524 */  addiu      $5, $2, %lo(_395_2)
/* 635B4 001634B4 FFFF0624 */  addiu      $6, $0, -0x1
/* 635B8 001634B8 B4C4040C */  jal        GetTexture__15CTextureManagerFPci
/* 635BC 001634BC 00000000 */   nop
/* 635C0 001634C0 288E4070 */  paddub     $17, $2, $0
/* 635C4 001634C4 C701023C */  lui        $2, %hi(TexManager)
/* 635C8 001634C8 70584424 */  addiu      $4, $2, %lo(TexManager)
/* 635CC 001634CC 2A00023C */  lui        $2, %hi(_396)
/* 635D0 001634D0 F8A04524 */  addiu      $5, $2, %lo(_396)
/* 635D4 001634D4 FFFF0624 */  addiu      $6, $0, -0x1
/* 635D8 001634D8 B4C4040C */  jal        GetTexture__15CTextureManagerFPci
/* 635DC 001634DC 00000000 */   nop
/* 635E0 001634E0 28964070 */  paddub     $18, $2, $0
/* 635E4 001634E4 03002012 */  beqz       $17, .L001634F4
/* 635E8 001634E8 00000000 */   nop
/* 635EC 001634EC 03004016 */  bnez       $18, .L001634FC
/* 635F0 001634F0 00000000 */   nop
.L001634F4:
/* 635F4 001634F4 F3000010 */  b          .L001638C4
/* 635F8 001634F8 00000000 */   nop
.L001634FC:
/* 635FC 001634FC 2600023C */  lui        $2, %hi(_363_3)
/* 63600 00163500 10694224 */  addiu      $2, $2, %lo(_363_3)
/* 63604 00163504 C000A527 */  addiu      $5, $sp, 0xC0
/* 63608 00163508 00004278 */  lq         $2, 0x0($2)
/* 6360C 0016350C 0000A27C */  sq         $2, 0x0($5)
/* 63610 00163510 B000A427 */  addiu      $4, $sp, 0xB0
/* 63614 00163514 64BA040C */  jal        MGCalcColor__FPfPf
/* 63618 00163518 00000000 */   nop
/* 6361C 0016351C B000A1C7 */  lwc1       $f1, 0xB0($sp)
/* 63620 00163520 A042023C */  lui        $2, (0x42A00000 >> 16)
/* 63624 00163524 00008244 */  mtc1       $2, $f0
/* 63628 00163528 00000000 */  nop
/* 6362C 0016352C 00080046 */  add.s      $f0, $f1, $f0
/* 63630 00163530 B000A0E7 */  swc1       $f0, 0xB0($sp)
/* 63634 00163534 B400B327 */  addiu      $19, $sp, 0xB4
/* 63638 00163538 000061C6 */  lwc1       $f1, 0x0($19)
/* 6363C 0016353C 7042023C */  lui        $2, (0x42700000 >> 16)
/* 63640 00163540 00008244 */  mtc1       $2, $f0
/* 63644 00163544 00000000 */  nop
/* 63648 00163548 00080046 */  add.s      $f0, $f1, $f0
/* 6364C 0016354C 000060E6 */  swc1       $f0, 0x0($19)
/* 63650 00163550 B800B427 */  addiu      $20, $sp, 0xB8
/* 63654 00163554 000081C6 */  lwc1       $f1, 0x0($20)
/* 63658 00163558 2042023C */  lui        $2, (0x42200000 >> 16)
/* 6365C 0016355C 00008244 */  mtc1       $2, $f0
/* 63660 00163560 00000000 */  nop
/* 63664 00163564 00080046 */  add.s      $f0, $f1, $f0
/* 63668 00163568 000080E6 */  swc1       $f0, 0x0($20)
/* 6366C 0016356C B000A1C7 */  lwc1       $f1, 0xB0($sp)
/* 63670 00163570 7F43023C */  lui        $2, (0x437F0000 >> 16)
/* 63674 00163574 00008244 */  mtc1       $2, $f0
/* 63678 00163578 00000000 */  nop
/* 6367C 0016357C 36080046 */  c.le.s     $f1, $f0
/* 63680 00163580 00000000 */  nop
/* 63684 00163584 02000145 */  bc1t       .L00163590
/* 63688 00163588 00000000 */   nop
/* 6368C 0016358C B000A2AF */  sw         $2, 0xB0($sp)
.L00163590:
/* 63690 00163590 000061C6 */  lwc1       $f1, 0x0($19)
/* 63694 00163594 7F43023C */  lui        $2, (0x437F0000 >> 16)
/* 63698 00163598 00008244 */  mtc1       $2, $f0
/* 6369C 0016359C 00000000 */  nop
/* 636A0 001635A0 36080046 */  c.le.s     $f1, $f0
/* 636A4 001635A4 00000000 */  nop
/* 636A8 001635A8 02000145 */  bc1t       .L001635B4
/* 636AC 001635AC 00000000 */   nop
/* 636B0 001635B0 000062AE */  sw         $2, 0x0($19)
.L001635B4:
/* 636B4 001635B4 000081C6 */  lwc1       $f1, 0x0($20)
/* 636B8 001635B8 7F43023C */  lui        $2, (0x437F0000 >> 16)
/* 636BC 001635BC 00008244 */  mtc1       $2, $f0
/* 636C0 001635C0 00000000 */  nop
/* 636C4 001635C4 36080046 */  c.le.s     $f1, $f0
/* 636C8 001635C8 00000000 */  nop
/* 636CC 001635CC 02000145 */  bc1t       .L001635D8
/* 636D0 001635D0 00000000 */   nop
/* 636D4 001635D4 000082AE */  sw         $2, 0x0($20)
.L001635D8:
/* 636D8 001635D8 0000028E */  lw         $2, 0x0($16)
/* 636DC 001635DC 11004010 */  beqz       $2, .L00163624
/* 636E0 001635E0 00000000 */   nop
/* 636E4 001635E4 B000ACC7 */  lwc1       $f12, 0xB0($sp)
/* 636E8 001635E8 2C44040C */  jal        fptosi
/* 636EC 001635EC 00000000 */   nop
/* 636F0 001635F0 FC00A2A3 */  sb         $2, 0xFC($sp)
/* 636F4 001635F4 00006CC6 */  lwc1       $f12, 0x0($19)
/* 636F8 001635F8 2C44040C */  jal        fptosi
/* 636FC 001635FC 00000000 */   nop
/* 63700 00163600 FD00A2A3 */  sb         $2, 0xFD($sp)
/* 63704 00163604 00008CC6 */  lwc1       $f12, 0x0($20)
/* 63708 00163608 2C44040C */  jal        fptosi
/* 6370C 0016360C 00000000 */   nop
/* 63710 00163610 FE00A2A3 */  sb         $2, 0xFE($sp)
/* 63714 00163614 80000224 */  addiu      $2, $0, 0x80
/* 63718 00163618 FF00A2A3 */  sb         $2, 0xFF($sp)
/* 6371C 0016361C 06000010 */  b          .L00163638
/* 63720 00163620 00000000 */   nop
.L00163624:
/* 63724 00163624 80000224 */  addiu      $2, $0, 0x80
/* 63728 00163628 FC00A2A3 */  sb         $2, 0xFC($sp)
/* 6372C 0016362C FD00A2A3 */  sb         $2, 0xFD($sp)
/* 63730 00163630 FE00A2A3 */  sb         $2, 0xFE($sp)
/* 63734 00163634 FF00A2A3 */  sb         $2, 0xFF($sp)
.L00163638:
/* 63738 00163638 788E828F */  lw         $2, -0x7188($gp)
/* 6373C 0016363C 01004238 */  xori       $2, $2, 0x1
/* 63740 00163640 788E82AF */  sw         $2, -0x7188($gp)
/* 63744 00163644 F000A327 */  addiu      $3, $sp, 0xF0
/* 63748 00163648 F08B82DF */  ld         $2, -0x7410($gp)
/* 6374C 0016364C 000062FC */  sd         $2, 0x0($3)
/* 63750 00163650 F400A493 */  lbu        $4, 0xF4($sp)
/* 63754 00163654 01000364 */  daddiu     $3, $0, 0x1
/* 63758 00163658 FEFF0224 */  addiu      $2, $0, -0x2
/* 6375C 0016365C 24108200 */  and        $2, $4, $2
/* 63760 00163660 25104300 */  or         $2, $2, $3
/* 63764 00163664 F400A2A3 */  sb         $2, 0xF4($sp)
/* 63768 00163668 D48B848F */  lw         $4, -0x742C($gp)
/* 6376C 0016366C 289E8070 */  paddub     $19, $4, $0
/* 63770 00163670 282E0070 */  paddub     $5, $0, $0
/* 63774 00163674 2083040C */  jal        sceVif1PkCnt
/* 63778 00163678 00000000 */   nop
/* 6377C 0016367C 28266072 */  paddub     $4, $19, $0
/* 63780 00163680 282E0070 */  paddub     $5, $0, $0
/* 63784 00163684 8E83040C */  jal        sceVif1PkOpenDirectCode
/* 63788 00163688 00000000 */   nop
/* 6378C 0016368C C701023C */  lui        $2, %hi(GiftagAD)
/* 63790 00163690 C0524224 */  addiu      $2, $2, %lo(GiftagAD)
/* 63794 00163694 28266072 */  paddub     $4, $19, $0
/* 63798 00163698 00004578 */  lq         $5, 0x0($2)
/* 6379C 0016369C B083040C */  jal        sceVif1PkOpenGifTag
/* 637A0 001636A0 00000000 */   nop
/* 637A4 001636A4 F000A227 */  addiu      $2, $sp, 0xF0
/* 637A8 001636A8 28266072 */  paddub     $4, $19, $0
/* 637AC 001636AC 4E000524 */  addiu      $5, $0, 0x4E
/* 637B0 001636B0 000046DC */  ld         $6, 0x0($2)
/* 637B4 001636B4 0A84040C */  jal        sceVif1PkAddGsAD
/* 637B8 001636B8 00000000 */   nop
/* 637BC 001636BC 28266072 */  paddub     $4, $19, $0
/* 637C0 001636C0 B683040C */  jal        sceVif1PkCloseGifTag
/* 637C4 001636C4 00000000 */   nop
/* 637C8 001636C8 28266072 */  paddub     $4, $19, $0
/* 637CC 001636CC A483040C */  jal        sceVif1PkCloseDirectCode
/* 637D0 001636D0 00000000 */   nop
/* 637D4 001636D4 28A60070 */  paddub     $20, $0, $0
/* 637D8 001636D8 5D000010 */  b          .L00163850
/* 637DC 001636DC 00000000 */   nop
.L001636E0:
/* 637E0 001636E0 80101400 */  sll        $2, $20, 2
/* 637E4 001636E4 21105000 */  addu       $2, $2, $16
/* 637E8 001636E8 B0005524 */  addiu      $21, $2, 0xB0
/* 637EC 001636EC B000438C */  lw         $3, 0xB0($2)
/* 637F0 001636F0 56006010 */  beqz       $3, .L0016384C
/* 637F4 001636F4 00000000 */   nop
/* 637F8 001636F8 003F023C */  lui        $2, (0x3F000000 >> 16)
/* 637FC 001636FC 00088244 */  mtc1       $2, $f1
/* 63800 00163700 00008344 */  mtc1       $3, $f0
/* 63804 00163704 00000000 */  nop
/* 63808 00163708 A0008046 */  cvt.s.w    $f2, $f0
/* 6380C 0016370C 42080246 */  mul.s      $f1, $f1, $f2
/* 63810 00163710 4041023C */  lui        $2, (0x41400000 >> 16)
/* 63814 00163714 00008244 */  mtc1       $2, $f0
/* 63818 00163718 00000000 */  nop
/* 6381C 0016371C 01030146 */  sub.s      $f12, $f0, $f1
/* 63820 00163720 803E023C */  lui        $2, (0x3E800000 >> 16)
/* 63824 00163724 00008244 */  mtc1       $2, $f0
/* 63828 00163728 00000000 */  nop
/* 6382C 0016372C 42000246 */  mul.s      $f1, $f0, $f2
/* 63830 00163730 B040023C */  lui        $2, (0x40B00000 >> 16)
/* 63834 00163734 00008244 */  mtc1       $2, $f0
/* 63838 00163738 00000000 */  nop
/* 6383C 0016373C 41030146 */  sub.s      $f13, $f0, $f1
/* 63840 00163740 00111400 */  sll        $2, $20, 4
/* 63844 00163744 21100202 */  addu       $2, $16, $2
/* 63848 00163748 7000A427 */  addiu      $4, $sp, 0x70
/* 6384C 0016374C 8000A527 */  addiu      $5, $sp, 0x80
/* 63850 00163750 10004624 */  addiu      $6, $2, 0x10
/* 63854 00163754 283E0070 */  paddub     $7, $0, $0
/* 63858 00163758 D0B9040C */  jal        MGRotTransPers3DSprite__FPiPiPfffi
/* 6385C 0016375C 00000000 */   nop
/* 63860 00163760 01000324 */  addiu      $3, $0, 0x1
/* 63864 00163764 39004314 */  bne        $2, $3, .L0016384C
/* 63868 00163768 00000000 */   nop
/* 6386C 0016376C 8000A28F */  lw         $2, 0x80($sp)
/* 63870 00163770 9000A2AF */  sw         $2, 0x90($sp)
/* 63874 00163774 7400A28F */  lw         $2, 0x74($sp)
/* 63878 00163778 9400A2AF */  sw         $2, 0x94($sp)
/* 6387C 0016377C 7800A28F */  lw         $2, 0x78($sp)
/* 63880 00163780 9800A2AF */  sw         $2, 0x98($sp)
/* 63884 00163784 7C00A28F */  lw         $2, 0x7C($sp)
/* 63888 00163788 9C00A2AF */  sw         $2, 0x9C($sp)
/* 6388C 0016378C 7000A28F */  lw         $2, 0x70($sp)
/* 63890 00163790 A000A2AF */  sw         $2, 0xA0($sp)
/* 63894 00163794 8400A28F */  lw         $2, 0x84($sp)
/* 63898 00163798 A400A2AF */  sw         $2, 0xA4($sp)
/* 6389C 0016379C 8800A28F */  lw         $2, 0x88($sp)
/* 638A0 001637A0 A800A2AF */  sw         $2, 0xA8($sp)
/* 638A4 001637A4 8C00A28F */  lw         $2, 0x8C($sp)
/* 638A8 001637A8 AC00A2AF */  sw         $2, 0xAC($sp)
/* 638AC 001637AC 0000A392 */  lbu        $3, 0x0($21)
/* 638B0 001637B0 80100300 */  sll        $2, $3, 2
/* 638B4 001637B4 21104300 */  addu       $2, $2, $3
/* 638B8 001637B8 40100200 */  sll        $2, $2, 1
/* 638BC 001637BC FF00A2A3 */  sb         $2, 0xFF($sp)
/* 638C0 001637C0 788E828F */  lw         $2, -0x7188($gp)
/* 638C4 001637C4 12004010 */  beqz       $2, .L00163810
/* 638C8 001637C8 00000000 */   nop
/* 638CC 001637CC D000A0AF */  sw         $0, 0xD0($sp)
/* 638D0 001637D0 D400A0AF */  sw         $0, 0xD4($sp)
/* 638D4 001637D4 20000224 */  addiu      $2, $0, 0x20
/* 638D8 001637D8 D800A2AF */  sw         $2, 0xD8($sp)
/* 638DC 001637DC DC00A2AF */  sw         $2, 0xDC($sp)
/* 638E0 001637E0 D48B848F */  lw         $4, -0x742C($gp)
/* 638E4 001637E4 282E2072 */  paddub     $5, $17, $0
/* 638E8 001637E8 D000A627 */  addiu      $6, $sp, 0xD0
/* 638EC 001637EC 7000A727 */  addiu      $7, $sp, 0x70
/* 638F0 001637F0 9000A827 */  addiu      $8, $sp, 0x90
/* 638F4 001637F4 A000A927 */  addiu      $9, $sp, 0xA0
/* 638F8 001637F8 8000AA27 */  addiu      $10, $sp, 0x80
/* 638FC 001637FC FC00AB27 */  addiu      $11, $sp, 0xFC
/* 63900 00163800 2C75050C */  jal        set3DSprite__FP13sceVif1PacketP8CTextureRC8CRect_i_PiPiPiPiP6spRGBA
/* 63904 00163804 00000000 */   nop
/* 63908 00163808 10000010 */  b          .L0016384C
/* 6390C 0016380C 00000000 */   nop
.L00163810:
/* 63910 00163810 E000A0AF */  sw         $0, 0xE0($sp)
/* 63914 00163814 E400A0AF */  sw         $0, 0xE4($sp)
/* 63918 00163818 20000224 */  addiu      $2, $0, 0x20
/* 6391C 0016381C E800A2AF */  sw         $2, 0xE8($sp)
/* 63920 00163820 EC00A2AF */  sw         $2, 0xEC($sp)
/* 63924 00163824 D48B848F */  lw         $4, -0x742C($gp)
/* 63928 00163828 282E4072 */  paddub     $5, $18, $0
/* 6392C 0016382C E000A627 */  addiu      $6, $sp, 0xE0
/* 63930 00163830 7000A727 */  addiu      $7, $sp, 0x70
/* 63934 00163834 9000A827 */  addiu      $8, $sp, 0x90
/* 63938 00163838 A000A927 */  addiu      $9, $sp, 0xA0
/* 6393C 0016383C 8000AA27 */  addiu      $10, $sp, 0x80
/* 63940 00163840 FC00AB27 */  addiu      $11, $sp, 0xFC
/* 63944 00163844 2C75050C */  jal        set3DSprite__FP13sceVif1PacketP8CTextureRC8CRect_i_PiPiPiPiP6spRGBA
/* 63948 00163848 00000000 */   nop
.L0016384C:
/* 6394C 0016384C 01009426 */  addiu      $20, $20, 0x1
.L00163850:
/* 63950 00163850 0800822A */  slti       $2, $20, 0x8
/* 63954 00163854 A2FF4014 */  bnez       $2, .L001636E0
/* 63958 00163858 00000000 */   nop
/* 6395C 0016385C 28266072 */  paddub     $4, $19, $0
/* 63960 00163860 282E0070 */  paddub     $5, $0, $0
/* 63964 00163864 2083040C */  jal        sceVif1PkCnt
/* 63968 00163868 00000000 */   nop
/* 6396C 0016386C 28266072 */  paddub     $4, $19, $0
/* 63970 00163870 282E0070 */  paddub     $5, $0, $0
/* 63974 00163874 8E83040C */  jal        sceVif1PkOpenDirectCode
/* 63978 00163878 00000000 */   nop
/* 6397C 0016387C C701023C */  lui        $2, %hi(GiftagAD)
/* 63980 00163880 C0524224 */  addiu      $2, $2, %lo(GiftagAD)
/* 63984 00163884 28266072 */  paddub     $4, $19, $0
/* 63988 00163888 00004578 */  lq         $5, 0x0($2)
/* 6398C 0016388C B083040C */  jal        sceVif1PkOpenGifTag
/* 63990 00163890 00000000 */   nop
/* 63994 00163894 F08B8227 */  addiu      $2, $gp, -0x7410
/* 63998 00163898 28266072 */  paddub     $4, $19, $0
/* 6399C 0016389C 4E000524 */  addiu      $5, $0, 0x4E
/* 639A0 001638A0 000046DC */  ld         $6, 0x0($2)
/* 639A4 001638A4 0A84040C */  jal        sceVif1PkAddGsAD
/* 639A8 001638A8 00000000 */   nop
/* 639AC 001638AC 28266072 */  paddub     $4, $19, $0
/* 639B0 001638B0 B683040C */  jal        sceVif1PkCloseGifTag
/* 639B4 001638B4 00000000 */   nop
/* 639B8 001638B8 28266072 */  paddub     $4, $19, $0
/* 639BC 001638BC A483040C */  jal        sceVif1PkCloseDirectCode
/* 639C0 001638C0 00000000 */   nop
.L001638C4:
/* 639C4 001638C4 6000BF7B */  lq         $31, 0x60($sp)
/* 639C8 001638C8 5000B57B */  lq         $21, 0x50($sp)
/* 639CC 001638CC 4000B47B */  lq         $20, 0x40($sp)
/* 639D0 001638D0 3000B37B */  lq         $19, 0x30($sp)
/* 639D4 001638D4 2000B27B */  lq         $18, 0x20($sp)
/* 639D8 001638D8 1000B17B */  lq         $17, 0x10($sp)
/* 639DC 001638DC 0000B07B */  lq         $16, 0x0($sp)
/* 639E0 001638E0 0001BD27 */  addiu      $sp, $sp, 0x100
/* 639E4 001638E4 0800E003 */  jr         $31
/* 639E8 001638E8 00000000 */   nop
/* 639EC 001638EC 00000000 */  nop
