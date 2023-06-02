.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel BattleMenuCharaKey__Fv
/* F7540 001F7440 A0FFBD27 */  addiu      $sp, $sp, -0x60
/* F7544 001F7444 1000BF7F */  sq         $31, 0x10($sp)
/* F7548 001F7448 0000B07F */  sq         $16, 0x0($sp)
/* F754C 001F744C D901013C */  lui        $at, (0x1D90473 >> 16)
/* F7550 001F7450 73042480 */  lb         $4, (0x1D90473 & 0xFFFF)($at)
/* F7554 001F7454 0700812C */  sltiu      $at, $4, 0x7
/* F7558 001F7458 6E022010 */  beqz       $at, .L001F7E14
/* F755C 001F745C 00000000 */   nop
/* F7560 001F7460 2A00023C */  lui        $2, %hi(_1515_2)
/* F7564 001F7464 C0D74324 */  addiu      $3, $2, %lo(_1515_2)
/* F7568 001F7468 80100400 */  sll        $2, $4, 2
/* F756C 001F746C 21104300 */  addu       $2, $2, $3
/* F7570 001F7470 0000428C */  lw         $2, 0x0($2)
/* F7574 001F7474 08004000 */  jr         $2
/* F7578 001F7478 00000000 */   nop
/* F757C 001F747C D901013C */  lui        $at, (0x1D90478 >> 16)
/* F7580 001F7480 7804228C */  lw         $2, (0x1D90478 & 0xFFFF)($at)
/* F7584 001F7484 01004224 */  addiu      $2, $2, 0x1
/* F7588 001F7488 D901013C */  lui        $at, (0x1D90478 >> 16)
/* F758C 001F748C 780422AC */  sw         $2, (0x1D90478 & 0xFFFF)($at)
/* F7590 001F7490 8CFB040C */  jal        ReadBGSync__Fv
/* F7594 001F7494 00000000 */   nop
/* F7598 001F7498 5E024014 */  bnez       $2, .L001F7E14
/* F759C 001F749C 00000000 */   nop
/* F75A0 001F74A0 D901013C */  lui        $at, (0x1D90478 >> 16)
/* F75A4 001F74A4 7804228C */  lw         $2, (0x1D90478 & 0xFFFF)($at)
/* F75A8 001F74A8 15004128 */  slti       $at, $2, 0x15
/* F75AC 001F74AC 59022014 */  bnez       $at, .L001F7E14
/* F75B0 001F74B0 00000000 */   nop
/* F75B4 001F74B4 583A080C */  jal        BtMenuLoadChara__Fv
/* F75B8 001F74B8 00000000 */   nop
/* F75BC 001F74BC B0FB040C */  jal        BreakReadBG__Fv
/* F75C0 001F74C0 00000000 */   nop
/* F75C4 001F74C4 30FB040C */  jal        StartReadBG__Fv
/* F75C8 001F74C8 00000000 */   nop
/* F75CC 001F74CC 01000424 */  addiu      $4, $0, 0x1
/* F75D0 001F74D0 2C3A080C */  jal        CharaChangeInitToGL2__Fi
/* F75D4 001F74D4 00000000 */   nop
/* F75D8 001F74D8 05000224 */  addiu      $2, $0, 0x5
/* F75DC 001F74DC D901013C */  lui        $at, (0x1D90473 >> 16)
/* F75E0 001F74E0 730422A0 */  sb         $2, (0x1D90473 & 0xFFFF)($at)
/* F75E4 001F74E4 4B020010 */  b          .L001F7E14
/* F75E8 001F74E8 00000000 */   nop
/* F75EC 001F74EC D901013C */  lui        $at, (0x1D90478 >> 16)
/* F75F0 001F74F0 7804228C */  lw         $2, (0x1D90478 & 0xFFFF)($at)
/* F75F4 001F74F4 01004224 */  addiu      $2, $2, 0x1
/* F75F8 001F74F8 D901013C */  lui        $at, (0x1D90478 >> 16)
/* F75FC 001F74FC 780422AC */  sw         $2, (0x1D90478 & 0xFFFF)($at)
/* F7600 001F7500 8CFB040C */  jal        ReadBGSync__Fv
/* F7604 001F7504 00000000 */   nop
/* F7608 001F7508 42024014 */  bnez       $2, .L001F7E14
/* F760C 001F750C 00000000 */   nop
/* F7610 001F7510 D901013C */  lui        $at, (0x1D90478 >> 16)
/* F7614 001F7514 7804228C */  lw         $2, (0x1D90478 & 0xFFFF)($at)
/* F7618 001F7518 15004128 */  slti       $at, $2, 0x15
/* F761C 001F751C 3D022014 */  bnez       $at, .L001F7E14
/* F7620 001F7520 00000000 */   nop
/* F7624 001F7524 01000424 */  addiu      $4, $0, 0x1
/* F7628 001F7528 803A080C */  jal        BtMenuLoad2__Fi
/* F762C 001F752C 00000000 */   nop
/* F7630 001F7530 38FF760C */  jal        func_1DBFCE0
/* F7634 001F7534 00000000 */   nop
/* F7638 001F7538 01000424 */  addiu      $4, $0, 0x1
/* F763C 001F753C C0D6070C */  jal        ExitBattleMenu__Fi
/* F7640 001F7540 00000000 */   nop
/* F7644 001F7544 28160070 */  paddub     $2, $0, $0
/* F7648 001F7548 33020010 */  b          .L001F7E18
/* F764C 001F754C 00000000 */   nop
/* F7650 001F7550 FC94828F */  lw         $2, -0x6B04($gp)
/* F7654 001F7554 6F004014 */  bnez       $2, .L001F7714
/* F7658 001F7558 00000000 */   nop
/* F765C 001F755C 8CFB040C */  jal        ReadBGSync__Fv
/* F7660 001F7560 00000000 */   nop
/* F7664 001F7564 68004014 */  bnez       $2, .L001F7708
/* F7668 001F7568 00000000 */   nop
/* F766C 001F756C 2900023C */  lui        $2, %hi(_1364_2)
/* F7670 001F7570 F02F4524 */  addiu      $5, $2, %lo(_1364_2)
/* F7674 001F7574 2000A427 */  addiu      $4, $sp, 0x20
/* F7678 001F7578 02000324 */  addiu      $3, $0, 0x2
.L001F757C:
/* F767C 001F757C 0000A278 */  lq         $2, 0x0($5)
/* F7680 001F7580 1000A524 */  addiu      $5, $5, 0x10
/* F7684 001F7584 FFFF6324 */  addiu      $3, $3, -0x1
/* F7688 001F7588 0000827C */  sq         $2, 0x0($4)
/* F768C 001F758C 10008424 */  addiu      $4, $4, 0x10
/* F7690 001F7590 FAFF601C */  bgtz       $3, .L001F757C
/* F7694 001F7594 00000000 */   nop
/* F7698 001F7598 0000A2C4 */  lwc1       $f2, 0x0($5)
/* F769C 001F759C 000082E4 */  swc1       $f2, 0x0($4)
/* F76A0 001F75A0 F894828F */  lw         $2, -0x6B08($gp)
/* F76A4 001F75A4 2400A2AF */  sw         $2, 0x24($sp)
/* F76A8 001F75A8 3000A2AF */  sw         $2, 0x30($sp)
/* F76AC 001F75AC 28260070 */  paddub     $4, $0, $0
/* F76B0 001F75B0 18FB040C */  jal        GetReadBGFile__Fi
/* F76B4 001F75B4 00000000 */   nop
/* F76B8 001F75B8 8C00438C */  lw         $3, 0x8C($2)
/* F76BC 001F75BC 2C00A3AF */  sw         $3, 0x2C($sp)
/* F76C0 001F75C0 9000438C */  lw         $3, 0x90($2)
/* F76C4 001F75C4 03190300 */  sra        $3, $3, 4
/* F76C8 001F75C8 00190300 */  sll        $3, $3, 4
/* F76CC 001F75CC 8C00428C */  lw         $2, 0x8C($2)
/* F76D0 001F75D0 21104300 */  addu       $2, $2, $3
/* F76D4 001F75D4 10004224 */  addiu      $2, $2, 0x10
/* F76D8 001F75D8 8C9582AF */  sw         $2, -0x6A74($gp)
/* F76DC 001F75DC 8C95848F */  lw         $4, -0x6A74($gp)
/* F76E0 001F75E0 00AF080C */  jal        MenuCalcBufAlignment__FP1
/* F76E4 001F75E4 00000000 */   nop
/* F76E8 001F75E8 8C9582AF */  sw         $2, -0x6A74($gp)
/* F76EC 001F75EC 5000A427 */  addiu      $4, $sp, 0x50
/* F76F0 001F75F0 688882DF */  ld         $2, -0x7798($gp)
/* F76F4 001F75F4 000082FC */  sd         $2, 0x0($4)
/* F76F8 001F75F8 F894828F */  lw         $2, -0x6B08($gp)
/* F76FC 001F75FC 5000A2AF */  sw         $2, 0x50($sp)
/* F7700 001F7600 4CB4080C */  jal        MenuTextureDelete__FPi
/* F7704 001F7604 00000000 */   nop
/* F7708 001F7608 C701023C */  lui        $2, %hi(TexManager)
/* F770C 001F760C 70584424 */  addiu      $4, $2, %lo(TexManager)
/* F7710 001F7610 98CE040C */  jal        CleanUpTextureList__15CTextureManagerFv
/* F7714 001F7614 00000000 */   nop
/* F7718 001F7618 C701023C */  lui        $2, %hi(TexManager)
/* F771C 001F761C 70584424 */  addiu      $4, $2, %lo(TexManager)
/* F7720 001F7620 FFFF0524 */  addiu      $5, $0, -0x1
/* F7724 001F7624 2000A627 */  addiu      $6, $sp, 0x20
/* F7728 001F7628 30D0040C */  jal        LoadTextureBlockEX__15CTextureManagerFiP17LOADTEXTURE_INFO2
/* F772C 001F762C 00000000 */   nop
/* F7730 001F7630 28D6070C */  jal        BtlMenuTexBlockEnter__Fv
/* F7734 001F7634 00000000 */   nop
/* F7738 001F7638 C701023C */  lui        $2, %hi(TexManager)
/* F773C 001F763C 70584424 */  addiu      $4, $2, %lo(TexManager)
/* F7740 001F7640 2A00023C */  lui        $2, %hi(_926_2)
/* F7744 001F7644 F8D44524 */  addiu      $5, $2, %lo(_926_2)
/* F7748 001F7648 F894868F */  lw         $6, -0x6B08($gp)
/* F774C 001F764C B4C4040C */  jal        GetTexture__15CTextureManagerFPci
/* F7750 001F7650 00000000 */   nop
/* F7754 001F7654 209582AF */  sw         $2, -0x6AE0($gp)
/* F7758 001F7658 C701023C */  lui        $2, %hi(TexManager)
/* F775C 001F765C 70584424 */  addiu      $4, $2, %lo(TexManager)
/* F7760 001F7660 2A00023C */  lui        $2, %hi(_927_2)
/* F7764 001F7664 08D54524 */  addiu      $5, $2, %lo(_927_2)
/* F7768 001F7668 F894868F */  lw         $6, -0x6B08($gp)
/* F776C 001F766C B4C4040C */  jal        GetTexture__15CTextureManagerFPci
/* F7770 001F7670 00000000 */   nop
/* F7774 001F7674 289582AF */  sw         $2, -0x6AD8($gp)
/* F7778 001F7678 C701023C */  lui        $2, %hi(TexManager)
/* F777C 001F767C 70584424 */  addiu      $4, $2, %lo(TexManager)
/* F7780 001F7680 2A00023C */  lui        $2, %hi(_1511_3)
/* F7784 001F7684 88D74524 */  addiu      $5, $2, %lo(_1511_3)
/* F7788 001F7688 F894868F */  lw         $6, -0x6B08($gp)
/* F778C 001F768C B4C4040C */  jal        GetTexture__15CTextureManagerFPci
/* F7790 001F7690 00000000 */   nop
/* F7794 001F7694 249582AF */  sw         $2, -0x6ADC($gp)
/* F7798 001F7698 C701023C */  lui        $2, %hi(TexManager)
/* F779C 001F769C 70584424 */  addiu      $4, $2, %lo(TexManager)
/* F77A0 001F76A0 2A00023C */  lui        $2, %hi(_1512_3)
/* F77A4 001F76A4 98D74524 */  addiu      $5, $2, %lo(_1512_3)
/* F77A8 001F76A8 F894868F */  lw         $6, -0x6B08($gp)
/* F77AC 001F76AC B4C4040C */  jal        GetTexture__15CTextureManagerFPci
/* F77B0 001F76B0 00000000 */   nop
/* F77B4 001F76B4 309582AF */  sw         $2, -0x6AD0($gp)
/* F77B8 001F76B8 C701023C */  lui        $2, %hi(TexManager)
/* F77BC 001F76BC 70584424 */  addiu      $4, $2, %lo(TexManager)
/* F77C0 001F76C0 2A00023C */  lui        $2, %hi(_1513_2)
/* F77C4 001F76C4 A8D74524 */  addiu      $5, $2, %lo(_1513_2)
/* F77C8 001F76C8 F894868F */  lw         $6, -0x6B08($gp)
/* F77CC 001F76CC B4C4040C */  jal        GetTexture__15CTextureManagerFPci
/* F77D0 001F76D0 00000000 */   nop
/* F77D4 001F76D4 349582AF */  sw         $2, -0x6ACC($gp)
/* F77D8 001F76D8 C701023C */  lui        $2, %hi(TexManager)
/* F77DC 001F76DC 70584424 */  addiu      $4, $2, %lo(TexManager)
/* F77E0 001F76E0 2A00023C */  lui        $2, %hi(_1514_2)
/* F77E4 001F76E4 B0D74524 */  addiu      $5, $2, %lo(_1514_2)
/* F77E8 001F76E8 F894868F */  lw         $6, -0x6B08($gp)
/* F77EC 001F76EC B4C4040C */  jal        GetTexture__15CTextureManagerFPci
/* F77F0 001F76F0 00000000 */   nop
/* F77F4 001F76F4 389582AF */  sw         $2, -0x6AC8($gp)
/* F77F8 001F76F8 01000224 */  addiu      $2, $0, 0x1
/* F77FC 001F76FC FC9482AF */  sw         $2, -0x6B04($gp)
/* F7800 001F7700 04000010 */  b          .L001F7714
/* F7804 001F7704 00000000 */   nop
.L001F7708:
/* F7808 001F7708 01000224 */  addiu      $2, $0, 0x1
/* F780C 001F770C C2010010 */  b          .L001F7E18
/* F7810 001F7710 00000000 */   nop
.L001F7714:
/* F7814 001F7714 28260070 */  paddub     $4, $0, $0
/* F7818 001F7718 D8DB070C */  jal        ToFromSelect__Fi
/* F781C 001F771C 00000000 */   nop
/* F7820 001F7720 FC94848F */  lw         $4, -0x6B04($gp)
/* F7824 001F7724 09008010 */  beqz       $4, .L001F774C
/* F7828 001F7728 00000000 */   nop
/* F782C 001F772C D901013C */  lui        $at, (0x1D90474 >> 16)
/* F7830 001F7730 740421C4 */  lwc1       $f1, (0x1D90474 & 0xFFFF)($at)
/* F7834 001F7734 803F033C */  lui        $3, (0x3F800000 >> 16)
/* F7838 001F7738 00008344 */  mtc1       $3, $f0
/* F783C 001F773C 00000000 */  nop
/* F7840 001F7740 00080046 */  add.s      $f0, $f1, $f0
/* F7844 001F7744 D901013C */  lui        $at, (0x1D90474 >> 16)
/* F7848 001F7748 740420E4 */  swc1       $f0, (0x1D90474 & 0xFFFF)($at)
.L001F774C:
/* F784C 001F774C D901013C */  lui        $at, (0x1D90474 >> 16)
/* F7850 001F7750 740421C4 */  lwc1       $f1, (0x1D90474 & 0xFFFF)($at)
/* F7854 001F7754 A041033C */  lui        $3, (0x41A00000 >> 16)
/* F7858 001F7758 00008344 */  mtc1       $3, $f0
/* F785C 001F775C 00000000 */  nop
/* F7860 001F7760 34080046 */  c.lt.s     $f1, $f0
/* F7864 001F7764 00000000 */  nop
/* F7868 001F7768 03000145 */  bc1t       .L001F7778
/* F786C 001F776C 00000000 */   nop
/* F7870 001F7770 D901013C */  lui        $at, (0x1D90474 >> 16)
/* F7874 001F7774 740423AC */  sw         $3, (0x1D90474 & 0xFFFF)($at)
.L001F7778:
/* F7878 001F7778 D901013C */  lui        $at, (0x1D90474 >> 16)
/* F787C 001F777C 740421C4 */  lwc1       $f1, (0x1D90474 & 0xFFFF)($at)
/* F7880 001F7780 A041033C */  lui        $3, (0x41A00000 >> 16)
/* F7884 001F7784 00008344 */  mtc1       $3, $f0
/* F7888 001F7788 00000000 */  nop
/* F788C 001F778C 34080046 */  c.lt.s     $f1, $f0
/* F7890 001F7790 00000000 */  nop
/* F7894 001F7794 9F010145 */  bc1t       .L001F7E14
/* F7898 001F7798 00000000 */   nop
/* F789C 001F779C 01000324 */  addiu      $3, $0, 0x1
/* F78A0 001F77A0 9C014314 */  bne        $2, $3, .L001F7E14
/* F78A4 001F77A4 00000000 */   nop
/* F78A8 001F77A8 9A018010 */  beqz       $4, .L001F7E14
/* F78AC 001F77AC 00000000 */   nop
/* F78B0 001F77B0 6C9580AF */  sw         $0, -0x6A94($gp)
/* F78B4 001F77B4 D901013C */  lui        $at, (0x1D90473 >> 16)
/* F78B8 001F77B8 730420A0 */  sb         $0, (0x1D90473 & 0xFFFF)($at)
/* F78BC 001F77BC D901013C */  lui        $at, (0x1D90474 >> 16)
/* F78C0 001F77C0 740420AC */  sw         $0, (0x1D90474 & 0xFFFF)($at)
/* F78C4 001F77C4 03000224 */  addiu      $2, $0, 0x3
/* F78C8 001F77C8 208882AF */  sw         $2, -0x77E0($gp)
/* F78CC 001F77CC 91010010 */  b          .L001F7E14
/* F78D0 001F77D0 00000000 */   nop
/* F78D4 001F77D4 01000424 */  addiu      $4, $0, 0x1
/* F78D8 001F77D8 D8DB070C */  jal        ToFromSelect__Fi
/* F78DC 001F77DC 00000000 */   nop
/* F78E0 001F77E0 D901013C */  lui        $at, (0x1D90474 >> 16)
/* F78E4 001F77E4 740421C4 */  lwc1       $f1, (0x1D90474 & 0xFFFF)($at)
/* F78E8 001F77E8 803F033C */  lui        $3, (0x3F800000 >> 16)
/* F78EC 001F77EC 00008344 */  mtc1       $3, $f0
/* F78F0 001F77F0 00000000 */  nop
/* F78F4 001F77F4 40080046 */  add.s      $f1, $f1, $f0
/* F78F8 001F77F8 D901013C */  lui        $at, (0x1D90474 >> 16)
/* F78FC 001F77FC 740421E4 */  swc1       $f1, (0x1D90474 & 0xFFFF)($at)
/* F7900 001F7800 A041033C */  lui        $3, (0x41A00000 >> 16)
/* F7904 001F7804 00008344 */  mtc1       $3, $f0
/* F7908 001F7808 00000000 */  nop
/* F790C 001F780C 36080046 */  c.le.s     $f1, $f0
/* F7910 001F7810 00000000 */  nop
/* F7914 001F7814 7F010145 */  bc1t       .L001F7E14
/* F7918 001F7818 00000000 */   nop
/* F791C 001F781C 01000324 */  addiu      $3, $0, 0x1
/* F7920 001F7820 7C014314 */  bne        $2, $3, .L001F7E14
/* F7924 001F7824 00000000 */   nop
/* F7928 001F7828 80DC070C */  jal        ForBackMenu__Fv
/* F792C 001F782C 00000000 */   nop
/* F7930 001F7830 5800A427 */  addiu      $4, $sp, 0x58
/* F7934 001F7834 708882DF */  ld         $2, -0x7790($gp)
/* F7938 001F7838 000082FC */  sd         $2, 0x0($4)
/* F793C 001F783C F894828F */  lw         $2, -0x6B08($gp)
/* F7940 001F7840 5800A2AF */  sw         $2, 0x58($sp)
/* F7944 001F7844 4CB4080C */  jal        MenuTextureDelete__FPi
/* F7948 001F7848 00000000 */   nop
/* F794C 001F784C C701023C */  lui        $2, %hi(TexManager)
/* F7950 001F7850 70584424 */  addiu      $4, $2, %lo(TexManager)
/* F7954 001F7854 98CE040C */  jal        CleanUpTextureList__15CTextureManagerFv
/* F7958 001F7858 00000000 */   nop
/* F795C 001F785C 28D6070C */  jal        BtlMenuTexBlockEnter__Fv
/* F7960 001F7860 00000000 */   nop
/* F7964 001F7864 C701023C */  lui        $2, %hi(TexManager)
/* F7968 001F7868 70584424 */  addiu      $4, $2, %lo(TexManager)
/* F796C 001F786C 2A00023C */  lui        $2, %hi(_926_2)
/* F7970 001F7870 F8D44524 */  addiu      $5, $2, %lo(_926_2)
/* F7974 001F7874 E094868F */  lw         $6, -0x6B20($gp)
/* F7978 001F7878 B4C4040C */  jal        GetTexture__15CTextureManagerFPci
/* F797C 001F787C 00000000 */   nop
/* F7980 001F7880 209582AF */  sw         $2, -0x6AE0($gp)
/* F7984 001F7884 C701023C */  lui        $2, %hi(TexManager)
/* F7988 001F7888 70584424 */  addiu      $4, $2, %lo(TexManager)
/* F798C 001F788C 2A00023C */  lui        $2, %hi(_927_2)
/* F7990 001F7890 08D54524 */  addiu      $5, $2, %lo(_927_2)
/* F7994 001F7894 E094868F */  lw         $6, -0x6B20($gp)
/* F7998 001F7898 B4C4040C */  jal        GetTexture__15CTextureManagerFPci
/* F799C 001F789C 00000000 */   nop
/* F79A0 001F78A0 289582AF */  sw         $2, -0x6AD8($gp)
/* F79A4 001F78A4 208880AF */  sw         $0, -0x77E0($gp)
/* F79A8 001F78A8 5A010010 */  b          .L001F7E14
/* F79AC 001F78AC 00000000 */   nop
/* F79B0 001F78B0 D901013C */  lui        $at, (0x1D90474 >> 16)
/* F79B4 001F78B4 740421C4 */  lwc1       $f1, (0x1D90474 & 0xFFFF)($at)
/* F79B8 001F78B8 803F023C */  lui        $2, (0x3F800000 >> 16)
/* F79BC 001F78BC 00008244 */  mtc1       $2, $f0
/* F79C0 001F78C0 00000000 */  nop
/* F79C4 001F78C4 40080046 */  add.s      $f1, $f1, $f0
/* F79C8 001F78C8 D901013C */  lui        $at, (0x1D90474 >> 16)
/* F79CC 001F78CC 740421E4 */  swc1       $f1, (0x1D90474 & 0xFFFF)($at)
/* F79D0 001F78D0 A841023C */  lui        $2, (0x41A80000 >> 16)
/* F79D4 001F78D4 00008244 */  mtc1       $2, $f0
/* F79D8 001F78D8 00000000 */  nop
/* F79DC 001F78DC 34080046 */  c.lt.s     $f1, $f0
/* F79E0 001F78E0 00000000 */  nop
/* F79E4 001F78E4 4B010145 */  bc1t       .L001F7E14
/* F79E8 001F78E8 00000000 */   nop
/* F79EC 001F78EC 6C9581C7 */  lwc1       $f1, -0x6A94($gp)
/* F79F0 001F78F0 00008044 */  mtc1       $0, $f0
/* F79F4 001F78F4 00000000 */  nop
/* F79F8 001F78F8 36080046 */  c.le.s     $f1, $f0
/* F79FC 001F78FC 00000000 */  nop
/* F7A00 001F7900 19000145 */  bc1t       .L001F7968
/* F7A04 001F7904 00000000 */   nop
/* F7A08 001F7908 28260070 */  paddub     $4, $0, $0
/* F7A0C 001F790C 0F000010 */  b          .L001F794C
/* F7A10 001F7910 00000000 */   nop
.L001F7914:
/* F7A14 001F7914 40100400 */  sll        $2, $4, 1
/* F7A18 001F7918 21104400 */  addu       $2, $2, $4
/* F7A1C 001F791C 80180200 */  sll        $3, $2, 2
/* F7A20 001F7920 2900023C */  lui        $2, %hi(SysChara + 0x1)
/* F7A24 001F7924 512B4224 */  addiu      $2, $2, %lo(SysChara + 0x1)
/* F7A28 001F7928 21184300 */  addu       $3, $2, $3
/* F7A2C 001F792C 00006280 */  lb         $2, 0x0($3)
/* F7A30 001F7930 01004224 */  addiu      $2, $2, 0x1
/* F7A34 001F7934 000062A0 */  sb         $2, 0x0($3)
/* F7A38 001F7938 00006280 */  lb         $2, 0x0($3)
/* F7A3C 001F793C 0200A214 */  bne        $5, $2, .L001F7948
/* F7A40 001F7940 00000000 */   nop
/* F7A44 001F7944 000060A0 */  sb         $0, 0x0($3)
.L001F7948:
/* F7A48 001F7948 01008424 */  addiu      $4, $4, 0x1
.L001F794C:
/* F7A4C 001F794C D901013C */  lui        $at, (0x1D90472 >> 16)
/* F7A50 001F7950 72042580 */  lb         $5, (0x1D90472 & 0xFFFF)($at)
/* F7A54 001F7954 2A108500 */  slt        $2, $4, $5
/* F7A58 001F7958 EEFF4014 */  bnez       $2, .L001F7914
/* F7A5C 001F795C 00000000 */   nop
/* F7A60 001F7960 19000010 */  b          .L001F79C8
/* F7A64 001F7964 00000000 */   nop
.L001F7968:
/* F7A68 001F7968 28260070 */  paddub     $4, $0, $0
/* F7A6C 001F796C 11000010 */  b          .L001F79B4
/* F7A70 001F7970 00000000 */   nop
.L001F7974:
/* F7A74 001F7974 40100400 */  sll        $2, $4, 1
/* F7A78 001F7978 21104400 */  addu       $2, $2, $4
/* F7A7C 001F797C 80180200 */  sll        $3, $2, 2
/* F7A80 001F7980 2900023C */  lui        $2, %hi(SysChara + 0x1)
/* F7A84 001F7984 512B4224 */  addiu      $2, $2, %lo(SysChara + 0x1)
/* F7A88 001F7988 21284300 */  addu       $5, $2, $3
/* F7A8C 001F798C 0000A280 */  lb         $2, 0x0($5)
/* F7A90 001F7990 FFFF4224 */  addiu      $2, $2, -0x1
/* F7A94 001F7994 0000A2A0 */  sb         $2, 0x0($5)
/* F7A98 001F7998 0000A380 */  lb         $3, 0x0($5)
/* F7A9C 001F799C FFFF0224 */  addiu      $2, $0, -0x1
/* F7AA0 001F79A0 03006214 */  bne        $3, $2, .L001F79B0
/* F7AA4 001F79A4 00000000 */   nop
/* F7AA8 001F79A8 FFFFC224 */  addiu      $2, $6, -0x1
/* F7AAC 001F79AC 0000A2A0 */  sb         $2, 0x0($5)
.L001F79B0:
/* F7AB0 001F79B0 01008424 */  addiu      $4, $4, 0x1
.L001F79B4:
/* F7AB4 001F79B4 D901013C */  lui        $at, (0x1D90472 >> 16)
/* F7AB8 001F79B8 72042680 */  lb         $6, (0x1D90472 & 0xFFFF)($at)
/* F7ABC 001F79BC 2A108600 */  slt        $2, $4, $6
/* F7AC0 001F79C0 ECFF4014 */  bnez       $2, .L001F7974
/* F7AC4 001F79C4 00000000 */   nop
.L001F79C8:
/* F7AC8 001F79C8 28860070 */  paddub     $16, $0, $0
/* F7ACC 001F79CC 1F000010 */  b          .L001F7A4C
/* F7AD0 001F79D0 00000000 */   nop
.L001F79D4:
/* F7AD4 001F79D4 40101000 */  sll        $2, $16, 1
/* F7AD8 001F79D8 21105000 */  addu       $2, $2, $16
/* F7ADC 001F79DC 80180200 */  sll        $3, $2, 2
/* F7AE0 001F79E0 2900023C */  lui        $2, %hi(SysChara + 0x1)
/* F7AE4 001F79E4 512B4224 */  addiu      $2, $2, %lo(SysChara + 0x1)
/* F7AE8 001F79E8 21104300 */  addu       $2, $2, $3
/* F7AEC 001F79EC 00004280 */  lb         $2, 0x0($2)
/* F7AF0 001F79F0 15004014 */  bnez       $2, .L001F7A48
/* F7AF4 001F79F4 00000000 */   nop
/* F7AF8 001F79F8 2900023C */  lui        $2, %hi(SysChara)
/* F7AFC 001F79FC 502B4224 */  addiu      $2, $2, %lo(SysChara)
/* F7B00 001F7A00 21104300 */  addu       $2, $2, $3
/* F7B04 001F7A04 00004380 */  lb         $3, 0x0($2)
/* F7B08 001F7A08 1E006524 */  addiu      $5, $3, 0x1E
/* F7B0C 001F7A0C D494828F */  lw         $2, -0x6B2C($gp)
/* F7B10 001F7A10 05004280 */  lb         $2, 0x5($2)
/* F7B14 001F7A14 FFFF4224 */  addiu      $2, $2, -0x1
/* F7B18 001F7A18 2A084300 */  slt        $at, $2, $3
/* F7B1C 001F7A1C 02002010 */  beqz       $at, .L001F7A28
/* F7B20 001F7A20 00000000 */   nop
/* F7B24 001F7A24 27000524 */  addiu      $5, $0, 0x27
.L001F7A28:
/* F7B28 001F7A28 DA01013C */  lui        $at, (0x1DA3A0C >> 16)
/* F7B2C 001F7A2C 0C3A228C */  lw         $2, (0x1DA3A0C & 0xFFFF)($at)
/* F7B30 001F7A30 05004510 */  beq        $2, $5, .L001F7A48
/* F7B34 001F7A34 00000000 */   nop
/* F7B38 001F7A38 DA01023C */  lui        $2, %hi(CommonMenuMes2)
/* F7B3C 001F7A3C 50234424 */  addiu      $4, $2, %lo(CommonMenuMes2)
/* F7B40 001F7A40 5441050C */  jal        MakeMesWin__6ClsMesFi
/* F7B44 001F7A44 00000000 */   nop
.L001F7A48:
/* F7B48 001F7A48 01001026 */  addiu      $16, $16, 0x1
.L001F7A4C:
/* F7B4C 001F7A4C 0600022A */  slti       $2, $16, 0x6
/* F7B50 001F7A50 E0FF4014 */  bnez       $2, .L001F79D4
/* F7B54 001F7A54 00000000 */   nop
/* F7B58 001F7A58 D901013C */  lui        $at, (0x1D90473 >> 16)
/* F7B5C 001F7A5C 730420A0 */  sb         $0, (0x1D90473 & 0xFFFF)($at)
/* F7B60 001F7A60 D901013C */  lui        $at, (0x1D90474 >> 16)
/* F7B64 001F7A64 740420AC */  sw         $0, (0x1D90474 & 0xFFFF)($at)
/* F7B68 001F7A68 6C9580AF */  sw         $0, -0x6A94($gp)
/* F7B6C 001F7A6C E9000010 */  b          .L001F7E14
/* F7B70 001F7A70 00000000 */   nop
/* F7B74 001F7A74 CC01023C */  lui        $2, %hi(GamePad)
/* F7B78 001F7A78 40C54424 */  addiu      $4, $2, %lo(GamePad)
/* F7B7C 001F7A7C 60000524 */  addiu      $5, $0, 0x60
/* F7B80 001F7A80 1CAE040C */  jal        Down__8CGamePadFi
/* F7B84 001F7A84 00000000 */   nop
/* F7B88 001F7A88 E2004010 */  beqz       $2, .L001F7E14
/* F7B8C 001F7A8C 00000000 */   nop
/* F7B90 001F7A90 D901013C */  lui        $at, (0x1D90473 >> 16)
/* F7B94 001F7A94 730420A0 */  sb         $0, (0x1D90473 & 0xFFFF)($at)
/* F7B98 001F7A98 01000424 */  addiu      $4, $0, 0x1
/* F7B9C 001F7A9C BCB3080C */  jal        ComMenuSePlay__Fi
/* F7BA0 001F7AA0 00000000 */   nop
/* F7BA4 001F7AA4 DB000010 */  b          .L001F7E14
/* F7BA8 001F7AA8 00000000 */   nop
/* F7BAC 001F7AAC D901013C */  lui        $at, (0x1D90470 >> 16)
/* F7BB0 001F7AB0 70043084 */  lh         $16, (0x1D90470 & 0xFFFF)($at)
/* F7BB4 001F7AB4 CC01023C */  lui        $2, %hi(GamePad)
/* F7BB8 001F7AB8 40C54424 */  addiu      $4, $2, %lo(GamePad)
/* F7BBC 001F7ABC 00300524 */  addiu      $5, $0, 0x3000
/* F7BC0 001F7AC0 04AE040C */  jal        On__8CGamePadFi
/* F7BC4 001F7AC4 00000000 */   nop
/* F7BC8 001F7AC8 1C004010 */  beqz       $2, .L001F7B3C
/* F7BCC 001F7ACC 00000000 */   nop
/* F7BD0 001F7AD0 A041023C */  lui        $2, (0x41A00000 >> 16)
/* F7BD4 001F7AD4 00088244 */  mtc1       $2, $f1
/* F7BD8 001F7AD8 709580C7 */  lwc1       $f0, -0x6A90($gp)
/* F7BDC 001F7ADC 03000146 */  div.s      $f0, $f0, $f1
/* F7BE0 001F7AE0 6C9580E7 */  swc1       $f0, -0x6A94($gp)
/* F7BE4 001F7AE4 03000224 */  addiu      $2, $0, 0x3
/* F7BE8 001F7AE8 D901013C */  lui        $at, (0x1D90473 >> 16)
/* F7BEC 001F7AEC 730422A0 */  sb         $2, (0x1D90473 & 0xFFFF)($at)
/* F7BF0 001F7AF0 D901013C */  lui        $at, (0x1D90474 >> 16)
/* F7BF4 001F7AF4 740420AC */  sw         $0, (0x1D90474 & 0xFFFF)($at)
/* F7BF8 001F7AF8 D901013C */  lui        $at, (0x1D90470 >> 16)
/* F7BFC 001F7AFC 70042284 */  lh         $2, (0x1D90470 & 0xFFFF)($at)
/* F7C00 001F7B00 FFFF4224 */  addiu      $2, $2, -0x1
/* F7C04 001F7B04 D901013C */  lui        $at, (0x1D90470 >> 16)
/* F7C08 001F7B08 700422A4 */  sh         $2, (0x1D90470 & 0xFFFF)($at)
/* F7C0C 001F7B0C D901013C */  lui        $at, (0x1D90470 >> 16)
/* F7C10 001F7B10 70042284 */  lh         $2, (0x1D90470 & 0xFFFF)($at)
/* F7C14 001F7B14 04004104 */  bgez       $2, .L001F7B28
/* F7C18 001F7B18 00000000 */   nop
/* F7C1C 001F7B1C 05000224 */  addiu      $2, $0, 0x5
/* F7C20 001F7B20 D901013C */  lui        $at, (0x1D90470 >> 16)
/* F7C24 001F7B24 700422A4 */  sh         $2, (0x1D90470 & 0xFFFF)($at)
.L001F7B28:
/* F7C28 001F7B28 28260070 */  paddub     $4, $0, $0
/* F7C2C 001F7B2C BCB3080C */  jal        ComMenuSePlay__Fi
/* F7C30 001F7B30 00000000 */   nop
/* F7C34 001F7B34 A1000010 */  b          .L001F7DBC
/* F7C38 001F7B38 00000000 */   nop
.L001F7B3C:
/* F7C3C 001F7B3C CC01023C */  lui        $2, %hi(GamePad)
/* F7C40 001F7B40 40C54424 */  addiu      $4, $2, %lo(GamePad)
/* F7C44 001F7B44 00C00534 */  ori        $5, $0, 0xC000
/* F7C48 001F7B48 04AE040C */  jal        On__8CGamePadFi
/* F7C4C 001F7B4C 00000000 */   nop
/* F7C50 001F7B50 1E004010 */  beqz       $2, .L001F7BCC
/* F7C54 001F7B54 00000000 */   nop
/* F7C58 001F7B58 709580C7 */  lwc1       $f0, -0x6A90($gp)
/* F7C5C 001F7B5C 47000046 */  neg.s      $f1, $f0
/* F7C60 001F7B60 A041023C */  lui        $2, (0x41A00000 >> 16)
/* F7C64 001F7B64 00008244 */  mtc1       $2, $f0
/* F7C68 001F7B68 00000000 */  nop
/* F7C6C 001F7B6C 03080046 */  div.s      $f0, $f1, $f0
/* F7C70 001F7B70 6C9580E7 */  swc1       $f0, -0x6A94($gp)
/* F7C74 001F7B74 03000224 */  addiu      $2, $0, 0x3
/* F7C78 001F7B78 D901013C */  lui        $at, (0x1D90473 >> 16)
/* F7C7C 001F7B7C 730422A0 */  sb         $2, (0x1D90473 & 0xFFFF)($at)
/* F7C80 001F7B80 D901013C */  lui        $at, (0x1D90474 >> 16)
/* F7C84 001F7B84 740420AC */  sw         $0, (0x1D90474 & 0xFFFF)($at)
/* F7C88 001F7B88 D901013C */  lui        $at, (0x1D90470 >> 16)
/* F7C8C 001F7B8C 70042284 */  lh         $2, (0x1D90470 & 0xFFFF)($at)
/* F7C90 001F7B90 01004224 */  addiu      $2, $2, 0x1
/* F7C94 001F7B94 D901013C */  lui        $at, (0x1D90470 >> 16)
/* F7C98 001F7B98 700422A4 */  sh         $2, (0x1D90470 & 0xFFFF)($at)
/* F7C9C 001F7B9C D901013C */  lui        $at, (0x1D90470 >> 16)
/* F7CA0 001F7BA0 70042284 */  lh         $2, (0x1D90470 & 0xFFFF)($at)
/* F7CA4 001F7BA4 06004128 */  slti       $at, $2, 0x6
/* F7CA8 001F7BA8 03002014 */  bnez       $at, .L001F7BB8
/* F7CAC 001F7BAC 00000000 */   nop
/* F7CB0 001F7BB0 D901013C */  lui        $at, (0x1D90470 >> 16)
/* F7CB4 001F7BB4 700420A4 */  sh         $0, (0x1D90470 & 0xFFFF)($at)
.L001F7BB8:
/* F7CB8 001F7BB8 28260070 */  paddub     $4, $0, $0
/* F7CBC 001F7BBC BCB3080C */  jal        ComMenuSePlay__Fi
/* F7CC0 001F7BC0 00000000 */   nop
/* F7CC4 001F7BC4 7D000010 */  b          .L001F7DBC
/* F7CC8 001F7BC8 00000000 */   nop
.L001F7BCC:
/* F7CCC 001F7BCC CC01023C */  lui        $2, %hi(GamePad)
/* F7CD0 001F7BD0 40C54424 */  addiu      $4, $2, %lo(GamePad)
/* F7CD4 001F7BD4 20000524 */  addiu      $5, $0, 0x20
/* F7CD8 001F7BD8 1CAE040C */  jal        Down__8CGamePadFi
/* F7CDC 001F7BDC 00000000 */   nop
/* F7CE0 001F7BE0 0E004010 */  beqz       $2, .L001F7C1C
/* F7CE4 001F7BE4 00000000 */   nop
/* F7CE8 001F7BE8 13000224 */  addiu      $2, $0, 0x13
/* F7CEC 001F7BEC 208882AF */  sw         $2, -0x77E0($gp)
/* F7CF0 001F7BF0 02000424 */  addiu      $4, $0, 0x2
/* F7CF4 001F7BF4 D901013C */  lui        $at, (0x1D90473 >> 16)
/* F7CF8 001F7BF8 730424A0 */  sb         $4, (0x1D90473 & 0xFFFF)($at)
/* F7CFC 001F7BFC D901013C */  lui        $at, (0x1D90474 >> 16)
/* F7D00 001F7C00 740420AC */  sw         $0, (0x1D90474 & 0xFFFF)($at)
/* F7D04 001F7C04 308880AF */  sw         $0, -0x77D0($gp)
/* F7D08 001F7C08 849580AF */  sw         $0, -0x6A7C($gp)
/* F7D0C 001F7C0C BCB3080C */  jal        ComMenuSePlay__Fi
/* F7D10 001F7C10 00000000 */   nop
/* F7D14 001F7C14 69000010 */  b          .L001F7DBC
/* F7D18 001F7C18 00000000 */   nop
.L001F7C1C:
/* F7D1C 001F7C1C CC01023C */  lui        $2, %hi(GamePad)
/* F7D20 001F7C20 40C54424 */  addiu      $4, $2, %lo(GamePad)
/* F7D24 001F7C24 40000524 */  addiu      $5, $0, 0x40
/* F7D28 001F7C28 1CAE040C */  jal        Down__8CGamePadFi
/* F7D2C 001F7C2C 00000000 */   nop
/* F7D30 001F7C30 62004010 */  beqz       $2, .L001F7DBC
/* F7D34 001F7C34 00000000 */   nop
/* F7D38 001F7C38 D894828F */  lw         $2, -0x6B28($gp)
/* F7D3C 001F7C3C 03004010 */  beqz       $2, .L001F7C4C
/* F7D40 001F7C40 00000000 */   nop
/* F7D44 001F7C44 5A000010 */  b          .L001F7DB0
/* F7D48 001F7C48 00000000 */   nop
.L001F7C4C:
/* F7D4C 001F7C4C D494838F */  lw         $3, -0x6B2C($gp)
/* F7D50 001F7C50 04006524 */  addiu      $5, $3, 0x4
/* F7D54 001F7C54 04006480 */  lb         $4, 0x4($3)
/* F7D58 001F7C58 05000224 */  addiu      $2, $0, 0x5
/* F7D5C 001F7C5C 10008214 */  bne        $4, $2, .L001F7CA0
/* F7D60 001F7C60 00000000 */   nop
/* F7D64 001F7C64 DC01013C */  lui        $at, (0x1DC4512 >> 16)
/* F7D68 001F7C68 12452684 */  lh         $6, (0x1DC4512 & 0xFFFF)($at)
/* F7D6C 001F7C6C 0A000224 */  addiu      $2, $0, 0xA
/* F7D70 001F7C70 0B00C214 */  bne        $6, $2, .L001F7CA0
/* F7D74 001F7C74 00000000 */   nop
/* F7D78 001F7C78 DA01023C */  lui        $2, %hi(CommonMenuMes1)
/* F7D7C 001F7C7C 900B4424 */  addiu      $4, $2, %lo(CommonMenuMes1)
/* F7D80 001F7C80 A1010524 */  addiu      $5, $0, 0x1A1
/* F7D84 001F7C84 5441050C */  jal        MakeMesWin__6ClsMesFi
/* F7D88 001F7C88 00000000 */   nop
/* F7D8C 001F7C8C 02000424 */  addiu      $4, $0, 0x2
/* F7D90 001F7C90 BCB3080C */  jal        ComMenuSePlay__Fi
/* F7D94 001F7C94 00000000 */   nop
/* F7D98 001F7C98 48000010 */  b          .L001F7DBC
/* F7D9C 001F7C9C 00000000 */   nop
.L001F7CA0:
/* F7DA0 001F7CA0 28160070 */  paddub     $2, $0, $0
/* F7DA4 001F7CA4 3B000010 */  b          .L001F7D94
/* F7DA8 001F7CA8 00000000 */   nop
.L001F7CAC:
/* F7DAC 001F7CAC 40300200 */  sll        $6, $2, 1
/* F7DB0 001F7CB0 2130C200 */  addu       $6, $6, $2
/* F7DB4 001F7CB4 80380600 */  sll        $7, $6, 2
/* F7DB8 001F7CB8 2900063C */  lui        $6, %hi(SysChara + 0x1)
/* F7DBC 001F7CBC 512BC624 */  addiu      $6, $6, %lo(SysChara + 0x1)
/* F7DC0 001F7CC0 2130C700 */  addu       $6, $6, $7
/* F7DC4 001F7CC4 0000C680 */  lb         $6, 0x0($6)
/* F7DC8 001F7CC8 3100C014 */  bnez       $6, .L001F7D90
/* F7DCC 001F7CCC 00000000 */   nop
/* F7DD0 001F7CD0 2900063C */  lui        $6, %hi(SysChara)
/* F7DD4 001F7CD4 502BC624 */  addiu      $6, $6, %lo(SysChara)
/* F7DD8 001F7CD8 2130C700 */  addu       $6, $6, $7
/* F7DDC 001F7CDC 0000C880 */  lb         $8, 0x0($6)
/* F7DE0 001F7CE0 05006680 */  lb         $6, 0x5($3)
/* F7DE4 001F7CE4 FFFFC624 */  addiu      $6, $6, -0x1
/* F7DE8 001F7CE8 2A08C800 */  slt        $at, $6, $8
/* F7DEC 001F7CEC 07002010 */  beqz       $at, .L001F7D0C
/* F7DF0 001F7CF0 00000000 */   nop
/* F7DF4 001F7CF4 02000424 */  addiu      $4, $0, 0x2
/* F7DF8 001F7CF8 BCB3080C */  jal        ComMenuSePlay__Fi
/* F7DFC 001F7CFC 00000000 */   nop
/* F7E00 001F7D00 01000224 */  addiu      $2, $0, 0x1
/* F7E04 001F7D04 44000010 */  b          .L001F7E18
/* F7E08 001F7D08 00000000 */   nop
.L001F7D0C:
/* F7E0C 001F7D0C 40300800 */  sll        $6, $8, 1
/* F7E10 001F7D10 2130C300 */  addu       $6, $6, $3
/* F7E14 001F7D14 1200C784 */  lh         $7, 0x12($6)
/* F7E18 001F7D18 80300800 */  sll        $6, $8, 2
/* F7E1C 001F7D1C 2130C300 */  addu       $6, $6, $3
/* F7E20 001F7D20 C842C68C */  lw         $6, 0x42C8($6)
/* F7E24 001F7D24 0400E018 */  blez       $7, .L001F7D38
/* F7E28 001F7D28 00000000 */   nop
/* F7E2C 001F7D2C 0200C630 */  andi       $6, $6, 0x2
/* F7E30 001F7D30 0700C010 */  beqz       $6, .L001F7D50
/* F7E34 001F7D34 00000000 */   nop
.L001F7D38:
/* F7E38 001F7D38 02000424 */  addiu      $4, $0, 0x2
/* F7E3C 001F7D3C BCB3080C */  jal        ComMenuSePlay__Fi
/* F7E40 001F7D40 00000000 */   nop
/* F7E44 001F7D44 01000224 */  addiu      $2, $0, 0x1
/* F7E48 001F7D48 33000010 */  b          .L001F7E18
/* F7E4C 001F7D4C 00000000 */   nop
.L001F7D50:
/* F7E50 001F7D50 3C360400 */  dsll32     $6, $4, 24
/* F7E54 001F7D54 3F360600 */  dsra32     $6, $6, 24
/* F7E58 001F7D58 0D000611 */  beq        $8, $6, .L001F7D90
/* F7E5C 001F7D5C 00000000 */   nop
/* F7E60 001F7D60 0000A8A0 */  sb         $8, 0x0($5)
/* F7E64 001F7D64 01000424 */  addiu      $4, $0, 0x1
/* F7E68 001F7D68 BCB3080C */  jal        ComMenuSePlay__Fi
/* F7E6C 001F7D6C 00000000 */   nop
/* F7E70 001F7D70 04000224 */  addiu      $2, $0, 0x4
/* F7E74 001F7D74 D901013C */  lui        $at, (0x1D90473 >> 16)
/* F7E78 001F7D78 730422A0 */  sb         $2, (0x1D90473 & 0xFFFF)($at)
/* F7E7C 001F7D7C D901013C */  lui        $at, (0x1D90478 >> 16)
/* F7E80 001F7D80 780420AC */  sw         $0, (0x1D90478 & 0xFFFF)($at)
/* F7E84 001F7D84 01000224 */  addiu      $2, $0, 0x1
/* F7E88 001F7D88 23000010 */  b          .L001F7E18
/* F7E8C 001F7D8C 00000000 */   nop
.L001F7D90:
/* F7E90 001F7D90 01004224 */  addiu      $2, $2, 0x1
.L001F7D94:
/* F7E94 001F7D94 D901013C */  lui        $at, (0x1D90472 >> 16)
/* F7E98 001F7D98 72042680 */  lb         $6, (0x1D90472 & 0xFFFF)($at)
/* F7E9C 001F7D9C 2A304600 */  slt        $6, $2, $6
/* F7EA0 001F7DA0 C2FFC014 */  bnez       $6, .L001F7CAC
/* F7EA4 001F7DA4 00000000 */   nop
/* F7EA8 001F7DA8 04000010 */  b          .L001F7DBC
/* F7EAC 001F7DAC 00000000 */   nop
.L001F7DB0:
/* F7EB0 001F7DB0 02000424 */  addiu      $4, $0, 0x2
/* F7EB4 001F7DB4 BCB3080C */  jal        ComMenuSePlay__Fi
/* F7EB8 001F7DB8 00000000 */   nop
.L001F7DBC:
/* F7EBC 001F7DBC D901013C */  lui        $at, (0x1D90470 >> 16)
/* F7EC0 001F7DC0 70042384 */  lh         $3, (0x1D90470 & 0xFFFF)($at)
/* F7EC4 001F7DC4 13000312 */  beq        $16, $3, .L001F7E14
/* F7EC8 001F7DC8 00000000 */   nop
/* F7ECC 001F7DCC D494828F */  lw         $2, -0x6B2C($gp)
/* F7ED0 001F7DD0 05004280 */  lb         $2, 0x5($2)
/* F7ED4 001F7DD4 2A086200 */  slt        $at, $3, $2
/* F7ED8 001F7DD8 0E002010 */  beqz       $at, .L001F7E14
/* F7EDC 001F7DDC 00000000 */   nop
/* F7EE0 001F7DE0 8C95828F */  lw         $2, -0x6A74($gp)
/* F7EE4 001F7DE4 0B004010 */  beqz       $2, .L001F7E14
/* F7EE8 001F7DE8 00000000 */   nop
/* F7EEC 001F7DEC D894828F */  lw         $2, -0x6B28($gp)
/* F7EF0 001F7DF0 08004014 */  bnez       $2, .L001F7E14
/* F7EF4 001F7DF4 00000000 */   nop
/* F7EF8 001F7DF8 B0FB040C */  jal        BreakReadBG__Fv
/* F7EFC 001F7DFC 00000000 */   nop
/* F7F00 001F7E00 D901013C */  lui        $at, (0x1D90470 >> 16)
/* F7F04 001F7E04 70042584 */  lh         $5, (0x1D90470 & 0xFFFF)($at)
/* F7F08 001F7E08 8C95848F */  lw         $4, -0x6A74($gp)
/* F7F0C 001F7E0C 6C39080C */  jal        CharaChangeInitToGL__FP1i
/* F7F10 001F7E10 00000000 */   nop
.L001F7E14:
/* F7F14 001F7E14 01000224 */  addiu      $2, $0, 0x1
.L001F7E18:
/* F7F18 001F7E18 1000BF7B */  lq         $31, 0x10($sp)
/* F7F1C 001F7E1C 0000B07B */  lq         $16, 0x0($sp)
/* F7F20 001F7E20 6000BD27 */  addiu      $sp, $sp, 0x60
/* F7F24 001F7E24 0800E003 */  jr         $31
/* F7F28 001F7E28 00000000 */   nop
/* F7F2C 001F7E2C 00000000 */  nop
