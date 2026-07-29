.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel BattleMenuCharaKey__Fv
/* 0F7540 001F7440 A0FFBD27 */  addiu       $29, $29, -0x60
/* 0F7544 001F7444 1000BF7F */  sq          $31, 0x10($29)
/* 0F7548 001F7448 0000B07F */  sq          $16, 0x0($29)
/* 0F754C 001F744C D901013C */  lui         $1, %hi(MenuChara + 0x3)
/* 0F7550 001F7450 73042480 */  lb          $4, %lo(MenuChara + 0x3)($1)
/* 0F7554 001F7454 0700812C */  sltiu       $1, $4, 0x7
/* 0F7558 001F7458 6E022010 */  beqz        $1, .L001F7E14
/* 0F755C 001F745C 00000000 */   nop
/* 0F7560 001F7460 2A00023C */  lui         $2, %hi(LIT_1515__2)
/* 0F7564 001F7464 C0D74324 */  addiu       $3, $2, %lo(LIT_1515__2)
/* 0F7568 001F7468 80100400 */  sll         $2, $4, 2
/* 0F756C 001F746C 21104300 */  addu        $2, $2, $3
/* 0F7570 001F7470 0000428C */  lw          $2, 0x0($2)
/* 0F7574 001F7474 08004000 */  jr          $2
/* 0F7578 001F7478 00000000 */   nop
jlabel .L001F747C
.L001F747C$b:
/* 0F757C 001F747C D901013C */  lui         $1, %hi(MenuChara + 0x8)
/* 0F7580 001F7480 7804228C */  lw          $2, %lo(MenuChara + 0x8)($1)
/* 0F7584 001F7484 01004224 */  addiu       $2, $2, 0x1
/* 0F7588 001F7488 D901013C */  lui         $1, %hi(MenuChara + 0x8)
/* 0F758C 001F748C 780422AC */  sw          $2, %lo(MenuChara + 0x8)($1)
/* 0F7590 001F7490 8CFB040C */  jal         ReadBGSync__Fv
/* 0F7594 001F7494 00000000 */   nop
/* 0F7598 001F7498 5E024014 */  bnez        $2, .L001F7E14
/* 0F759C 001F749C 00000000 */   nop
/* 0F75A0 001F74A0 D901013C */  lui         $1, %hi(MenuChara + 0x8)
/* 0F75A4 001F74A4 7804228C */  lw          $2, %lo(MenuChara + 0x8)($1)
/* 0F75A8 001F74A8 15004128 */  slti        $1, $2, 0x15
/* 0F75AC 001F74AC 59022014 */  bnez        $1, .L001F7E14
/* 0F75B0 001F74B0 00000000 */   nop
/* 0F75B4 001F74B4 583A080C */  jal         BtMenuLoadChara__Fv
/* 0F75B8 001F74B8 00000000 */   nop
/* 0F75BC 001F74BC B0FB040C */  jal         BreakReadBG__Fv
/* 0F75C0 001F74C0 00000000 */   nop
/* 0F75C4 001F74C4 30FB040C */  jal         StartReadBG__Fv
/* 0F75C8 001F74C8 00000000 */   nop
/* 0F75CC 001F74CC 01000424 */  addiu       $4, $0, 0x1
/* 0F75D0 001F74D0 2C3A080C */  jal         CharaChangeInitToGL2__Fi
/* 0F75D4 001F74D4 00000000 */   nop
/* 0F75D8 001F74D8 05000224 */  addiu       $2, $0, 0x5
/* 0F75DC 001F74DC D901013C */  lui         $1, %hi(MenuChara + 0x3)
/* 0F75E0 001F74E0 730422A0 */  sb          $2, %lo(MenuChara + 0x3)($1)
/* 0F75E4 001F74E4 4B020010 */  b           .L001F7E14
/* 0F75E8 001F74E8 00000000 */   nop
jlabel .L001F74EC
.L001F74EC$b:
/* 0F75EC 001F74EC D901013C */  lui         $1, %hi(MenuChara + 0x8)
/* 0F75F0 001F74F0 7804228C */  lw          $2, %lo(MenuChara + 0x8)($1)
/* 0F75F4 001F74F4 01004224 */  addiu       $2, $2, 0x1
/* 0F75F8 001F74F8 D901013C */  lui         $1, %hi(MenuChara + 0x8)
/* 0F75FC 001F74FC 780422AC */  sw          $2, %lo(MenuChara + 0x8)($1)
/* 0F7600 001F7500 8CFB040C */  jal         ReadBGSync__Fv
/* 0F7604 001F7504 00000000 */   nop
/* 0F7608 001F7508 42024014 */  bnez        $2, .L001F7E14
/* 0F760C 001F750C 00000000 */   nop
/* 0F7610 001F7510 D901013C */  lui         $1, %hi(MenuChara + 0x8)
/* 0F7614 001F7514 7804228C */  lw          $2, %lo(MenuChara + 0x8)($1)
/* 0F7618 001F7518 15004128 */  slti        $1, $2, 0x15
/* 0F761C 001F751C 3D022014 */  bnez        $1, .L001F7E14
/* 0F7620 001F7520 00000000 */   nop
/* 0F7624 001F7524 01000424 */  addiu       $4, $0, 0x1
/* 0F7628 001F7528 803A080C */  jal         BtMenuLoad2__Fi
/* 0F762C 001F752C 00000000 */   nop
/* 0F7630 001F7530 38FF760C */  jal         LockOffTargte__Fv
/* 0F7634 001F7534 00000000 */   nop
/* 0F7638 001F7538 01000424 */  addiu       $4, $0, 0x1
/* 0F763C 001F753C C0D6070C */  jal         ExitBattleMenu__Fi
/* 0F7640 001F7540 00000000 */   nop
/* 0F7644 001F7544 28160070 */  paddub      $2, $0, $0
/* 0F7648 001F7548 33020010 */  b           .L001F7E18
/* 0F764C 001F754C 00000000 */   nop
jlabel .L001F7550
.L001F7550$b:
/* 0F7650 001F7550 FC94828F */  lw          $2, -0x6B04($28)
/* 0F7654 001F7554 6F004014 */  bnez        $2, .L001F7714
/* 0F7658 001F7558 00000000 */   nop
/* 0F765C 001F755C 8CFB040C */  jal         ReadBGSync__Fv
/* 0F7660 001F7560 00000000 */   nop
/* 0F7664 001F7564 68004014 */  bnez        $2, .L001F7708
/* 0F7668 001F7568 00000000 */   nop
/* 0F766C 001F756C 2900023C */  lui         $2, %hi(LIT_1364__2)
/* 0F7670 001F7570 F02F4524 */  addiu       $5, $2, %lo(LIT_1364__2)
/* 0F7674 001F7574 2000A427 */  addiu       $4, $29, 0x20
/* 0F7678 001F7578 02000324 */  addiu       $3, $0, 0x2
.L001F757C:
/* 0F767C 001F757C 0000A278 */  lq          $2, 0x0($5)
/* 0F7680 001F7580 1000A524 */  addiu       $5, $5, 0x10
/* 0F7684 001F7584 FFFF6324 */  addiu       $3, $3, -0x1
/* 0F7688 001F7588 0000827C */  sq          $2, 0x0($4)
/* 0F768C 001F758C 10008424 */  addiu       $4, $4, 0x10
/* 0F7690 001F7590 FAFF601C */  bgtz        $3, .L001F757C
/* 0F7694 001F7594 00000000 */   nop
/* 0F7698 001F7598 0000A2C4 */  lwc1        $f2, 0x0($5)
/* 0F769C 001F759C 000082E4 */  swc1        $f2, 0x0($4)
/* 0F76A0 001F75A0 F894828F */  lw          $2, -0x6B08($28)
/* 0F76A4 001F75A4 2400A2AF */  sw          $2, 0x24($29)
/* 0F76A8 001F75A8 3000A2AF */  sw          $2, 0x30($29)
/* 0F76AC 001F75AC 28260070 */  paddub      $4, $0, $0
/* 0F76B0 001F75B0 18FB040C */  jal         GetReadBGFile__Fi
/* 0F76B4 001F75B4 00000000 */   nop
/* 0F76B8 001F75B8 8C00438C */  lw          $3, 0x8C($2)
/* 0F76BC 001F75BC 2C00A3AF */  sw          $3, 0x2C($29)
/* 0F76C0 001F75C0 9000438C */  lw          $3, 0x90($2)
/* 0F76C4 001F75C4 03190300 */  sra         $3, $3, 4
/* 0F76C8 001F75C8 00190300 */  sll         $3, $3, 4
/* 0F76CC 001F75CC 8C00428C */  lw          $2, 0x8C($2)
/* 0F76D0 001F75D0 21104300 */  addu        $2, $2, $3
/* 0F76D4 001F75D4 10004224 */  addiu       $2, $2, 0x10
/* 0F76D8 001F75D8 8C9582AF */  sw          $2, -0x6A74($28)
/* 0F76DC 001F75DC 8C95848F */  lw          $4, -0x6A74($28)
/* 0F76E0 001F75E0 00AF080C */  jal         MenuCalcBufAlignment__FP1
/* 0F76E4 001F75E4 00000000 */   nop
/* 0F76E8 001F75E8 8C9582AF */  sw          $2, -0x6A74($28)
/* 0F76EC 001F75EC 5000A427 */  addiu       $4, $29, 0x50
/* 0F76F0 001F75F0 688882DF */  ld          $2, -0x7798($28)
/* 0F76F4 001F75F4 000082FC */  sd          $2, 0x0($4)
/* 0F76F8 001F75F8 F894828F */  lw          $2, -0x6B08($28)
/* 0F76FC 001F75FC 5000A2AF */  sw          $2, 0x50($29)
/* 0F7700 001F7600 4CB4080C */  jal         MenuTextureDelete__FPi
/* 0F7704 001F7604 00000000 */   nop
/* 0F7708 001F7608 C701023C */  lui         $2, %hi(TexManager)
/* 0F770C 001F760C 70584424 */  addiu       $4, $2, %lo(TexManager)
/* 0F7710 001F7610 98CE040C */  jal         CleanUpTextureList__15CTextureManagerFv
/* 0F7714 001F7614 00000000 */   nop
/* 0F7718 001F7618 C701023C */  lui         $2, %hi(TexManager)
/* 0F771C 001F761C 70584424 */  addiu       $4, $2, %lo(TexManager)
/* 0F7720 001F7620 FFFF0524 */  addiu       $5, $0, -0x1
/* 0F7724 001F7624 2000A627 */  addiu       $6, $29, 0x20
/* 0F7728 001F7628 30D0040C */  jal         LoadTextureBlockEX__15CTextureManagerFiP17LOADTEXTURE_INFO2
/* 0F772C 001F762C 00000000 */   nop
/* 0F7730 001F7630 28D6070C */  jal         BtlMenuTexBlockEnter__Fv
/* 0F7734 001F7634 00000000 */   nop
/* 0F7738 001F7638 C701023C */  lui         $2, %hi(TexManager)
/* 0F773C 001F763C 70584424 */  addiu       $4, $2, %lo(TexManager)
/* 0F7740 001F7640 2A00023C */  lui         $2, %hi(LIT_926__2)
/* 0F7744 001F7644 F8D44524 */  addiu       $5, $2, %lo(LIT_926__2)
/* 0F7748 001F7648 F894868F */  lw          $6, -0x6B08($28)
/* 0F774C 001F764C B4C4040C */  jal         GetTexture__15CTextureManagerFPci
/* 0F7750 001F7650 00000000 */   nop
/* 0F7754 001F7654 209582AF */  sw          $2, -0x6AE0($28)
/* 0F7758 001F7658 C701023C */  lui         $2, %hi(TexManager)
/* 0F775C 001F765C 70584424 */  addiu       $4, $2, %lo(TexManager)
/* 0F7760 001F7660 2A00023C */  lui         $2, %hi(LIT_927__2)
/* 0F7764 001F7664 08D54524 */  addiu       $5, $2, %lo(LIT_927__2)
/* 0F7768 001F7668 F894868F */  lw          $6, -0x6B08($28)
/* 0F776C 001F766C B4C4040C */  jal         GetTexture__15CTextureManagerFPci
/* 0F7770 001F7670 00000000 */   nop
/* 0F7774 001F7674 289582AF */  sw          $2, -0x6AD8($28)
/* 0F7778 001F7678 C701023C */  lui         $2, %hi(TexManager)
/* 0F777C 001F767C 70584424 */  addiu       $4, $2, %lo(TexManager)
/* 0F7780 001F7680 2A00023C */  lui         $2, %hi(LIT_1511__3)
/* 0F7784 001F7684 88D74524 */  addiu       $5, $2, %lo(LIT_1511__3)
/* 0F7788 001F7688 F894868F */  lw          $6, -0x6B08($28)
/* 0F778C 001F768C B4C4040C */  jal         GetTexture__15CTextureManagerFPci
/* 0F7790 001F7690 00000000 */   nop
/* 0F7794 001F7694 249582AF */  sw          $2, -0x6ADC($28)
/* 0F7798 001F7698 C701023C */  lui         $2, %hi(TexManager)
/* 0F779C 001F769C 70584424 */  addiu       $4, $2, %lo(TexManager)
/* 0F77A0 001F76A0 2A00023C */  lui         $2, %hi(LIT_1512__3)
/* 0F77A4 001F76A4 98D74524 */  addiu       $5, $2, %lo(LIT_1512__3)
/* 0F77A8 001F76A8 F894868F */  lw          $6, -0x6B08($28)
/* 0F77AC 001F76AC B4C4040C */  jal         GetTexture__15CTextureManagerFPci
/* 0F77B0 001F76B0 00000000 */   nop
/* 0F77B4 001F76B4 309582AF */  sw          $2, -0x6AD0($28)
/* 0F77B8 001F76B8 C701023C */  lui         $2, %hi(TexManager)
/* 0F77BC 001F76BC 70584424 */  addiu       $4, $2, %lo(TexManager)
/* 0F77C0 001F76C0 2A00023C */  lui         $2, %hi(LIT_1513__2)
/* 0F77C4 001F76C4 A8D74524 */  addiu       $5, $2, %lo(LIT_1513__2)
/* 0F77C8 001F76C8 F894868F */  lw          $6, -0x6B08($28)
/* 0F77CC 001F76CC B4C4040C */  jal         GetTexture__15CTextureManagerFPci
/* 0F77D0 001F76D0 00000000 */   nop
/* 0F77D4 001F76D4 349582AF */  sw          $2, -0x6ACC($28)
/* 0F77D8 001F76D8 C701023C */  lui         $2, %hi(TexManager)
/* 0F77DC 001F76DC 70584424 */  addiu       $4, $2, %lo(TexManager)
/* 0F77E0 001F76E0 2A00023C */  lui         $2, %hi(LIT_1514__2)
/* 0F77E4 001F76E4 B0D74524 */  addiu       $5, $2, %lo(LIT_1514__2)
/* 0F77E8 001F76E8 F894868F */  lw          $6, -0x6B08($28)
/* 0F77EC 001F76EC B4C4040C */  jal         GetTexture__15CTextureManagerFPci
/* 0F77F0 001F76F0 00000000 */   nop
/* 0F77F4 001F76F4 389582AF */  sw          $2, -0x6AC8($28)
/* 0F77F8 001F76F8 01000224 */  addiu       $2, $0, 0x1
/* 0F77FC 001F76FC FC9482AF */  sw          $2, -0x6B04($28)
/* 0F7800 001F7700 04000010 */  b           .L001F7714
/* 0F7804 001F7704 00000000 */   nop
.L001F7708:
/* 0F7808 001F7708 01000224 */  addiu       $2, $0, 0x1
/* 0F780C 001F770C C2010010 */  b           .L001F7E18
/* 0F7810 001F7710 00000000 */   nop
.L001F7714:
/* 0F7814 001F7714 28260070 */  paddub      $4, $0, $0
/* 0F7818 001F7718 D8DB070C */  jal         ToFromSelect__Fi
/* 0F781C 001F771C 00000000 */   nop
/* 0F7820 001F7720 FC94848F */  lw          $4, -0x6B04($28)
/* 0F7824 001F7724 09008010 */  beqz        $4, .L001F774C
/* 0F7828 001F7728 00000000 */   nop
/* 0F782C 001F772C D901013C */  lui         $1, %hi(MenuChara + 0x4)
/* 0F7830 001F7730 740421C4 */  lwc1        $f1, %lo(MenuChara + 0x4)($1)
/* 0F7834 001F7734 803F033C */  lui         $3, (0x3F800000 >> 16)
/* 0F7838 001F7738 00008344 */  mtc1        $3, $f0
/* 0F783C 001F773C 00000000 */  nop
/* 0F7840 001F7740 00080046 */  add.s       $f0, $f1, $f0
/* 0F7844 001F7744 D901013C */  lui         $1, %hi(MenuChara + 0x4)
/* 0F7848 001F7748 740420E4 */  swc1        $f0, %lo(MenuChara + 0x4)($1)
.L001F774C:
/* 0F784C 001F774C D901013C */  lui         $1, %hi(MenuChara + 0x4)
/* 0F7850 001F7750 740421C4 */  lwc1        $f1, %lo(MenuChara + 0x4)($1)
/* 0F7854 001F7754 A041033C */  lui         $3, (0x41A00000 >> 16)
/* 0F7858 001F7758 00008344 */  mtc1        $3, $f0
/* 0F785C 001F775C 00000000 */  nop
/* 0F7860 001F7760 34080046 */  c.lt.s      $f1, $f0
/* 0F7864 001F7764 00000000 */  nop
/* 0F7868 001F7768 03000145 */  bc1t        .L001F7778
/* 0F786C 001F776C 00000000 */   nop
/* 0F7870 001F7770 D901013C */  lui         $1, %hi(MenuChara + 0x4)
/* 0F7874 001F7774 740423AC */  sw          $3, %lo(MenuChara + 0x4)($1)
.L001F7778:
/* 0F7878 001F7778 D901013C */  lui         $1, %hi(MenuChara + 0x4)
/* 0F787C 001F777C 740421C4 */  lwc1        $f1, %lo(MenuChara + 0x4)($1)
/* 0F7880 001F7780 A041033C */  lui         $3, (0x41A00000 >> 16)
/* 0F7884 001F7784 00008344 */  mtc1        $3, $f0
/* 0F7888 001F7788 00000000 */  nop
/* 0F788C 001F778C 34080046 */  c.lt.s      $f1, $f0
/* 0F7890 001F7790 00000000 */  nop
/* 0F7894 001F7794 9F010145 */  bc1t        .L001F7E14
/* 0F7898 001F7798 00000000 */   nop
/* 0F789C 001F779C 01000324 */  addiu       $3, $0, 0x1
/* 0F78A0 001F77A0 9C014314 */  bne         $2, $3, .L001F7E14
/* 0F78A4 001F77A4 00000000 */   nop
/* 0F78A8 001F77A8 9A018010 */  beqz        $4, .L001F7E14
/* 0F78AC 001F77AC 00000000 */   nop
/* 0F78B0 001F77B0 6C9580AF */  sw          $0, -0x6A94($28)
/* 0F78B4 001F77B4 D901013C */  lui         $1, %hi(MenuChara + 0x3)
/* 0F78B8 001F77B8 730420A0 */  sb          $0, %lo(MenuChara + 0x3)($1)
/* 0F78BC 001F77BC D901013C */  lui         $1, %hi(MenuChara + 0x4)
/* 0F78C0 001F77C0 740420AC */  sw          $0, %lo(MenuChara + 0x4)($1)
/* 0F78C4 001F77C4 03000224 */  addiu       $2, $0, 0x3
/* 0F78C8 001F77C8 208882AF */  sw          $2, -0x77E0($28)
/* 0F78CC 001F77CC 91010010 */  b           .L001F7E14
/* 0F78D0 001F77D0 00000000 */   nop
jlabel .L001F77D4
.L001F77D4$b:
/* 0F78D4 001F77D4 01000424 */  addiu       $4, $0, 0x1
/* 0F78D8 001F77D8 D8DB070C */  jal         ToFromSelect__Fi
/* 0F78DC 001F77DC 00000000 */   nop
/* 0F78E0 001F77E0 D901013C */  lui         $1, %hi(MenuChara + 0x4)
/* 0F78E4 001F77E4 740421C4 */  lwc1        $f1, %lo(MenuChara + 0x4)($1)
/* 0F78E8 001F77E8 803F033C */  lui         $3, (0x3F800000 >> 16)
/* 0F78EC 001F77EC 00008344 */  mtc1        $3, $f0
/* 0F78F0 001F77F0 00000000 */  nop
/* 0F78F4 001F77F4 40080046 */  add.s       $f1, $f1, $f0
/* 0F78F8 001F77F8 D901013C */  lui         $1, %hi(MenuChara + 0x4)
/* 0F78FC 001F77FC 740421E4 */  swc1        $f1, %lo(MenuChara + 0x4)($1)
/* 0F7900 001F7800 A041033C */  lui         $3, (0x41A00000 >> 16)
/* 0F7904 001F7804 00008344 */  mtc1        $3, $f0
/* 0F7908 001F7808 00000000 */  nop
/* 0F790C 001F780C 36080046 */  c.le.s      $f1, $f0
/* 0F7910 001F7810 00000000 */  nop
/* 0F7914 001F7814 7F010145 */  bc1t        .L001F7E14
/* 0F7918 001F7818 00000000 */   nop
/* 0F791C 001F781C 01000324 */  addiu       $3, $0, 0x1
/* 0F7920 001F7820 7C014314 */  bne         $2, $3, .L001F7E14
/* 0F7924 001F7824 00000000 */   nop
/* 0F7928 001F7828 80DC070C */  jal         ForBackMenu__Fv
/* 0F792C 001F782C 00000000 */   nop
/* 0F7930 001F7830 5800A427 */  addiu       $4, $29, 0x58
/* 0F7934 001F7834 708882DF */  ld          $2, -0x7790($28)
/* 0F7938 001F7838 000082FC */  sd          $2, 0x0($4)
/* 0F793C 001F783C F894828F */  lw          $2, -0x6B08($28)
/* 0F7940 001F7840 5800A2AF */  sw          $2, 0x58($29)
/* 0F7944 001F7844 4CB4080C */  jal         MenuTextureDelete__FPi
/* 0F7948 001F7848 00000000 */   nop
/* 0F794C 001F784C C701023C */  lui         $2, %hi(TexManager)
/* 0F7950 001F7850 70584424 */  addiu       $4, $2, %lo(TexManager)
/* 0F7954 001F7854 98CE040C */  jal         CleanUpTextureList__15CTextureManagerFv
/* 0F7958 001F7858 00000000 */   nop
/* 0F795C 001F785C 28D6070C */  jal         BtlMenuTexBlockEnter__Fv
/* 0F7960 001F7860 00000000 */   nop
/* 0F7964 001F7864 C701023C */  lui         $2, %hi(TexManager)
/* 0F7968 001F7868 70584424 */  addiu       $4, $2, %lo(TexManager)
/* 0F796C 001F786C 2A00023C */  lui         $2, %hi(LIT_926__2)
/* 0F7970 001F7870 F8D44524 */  addiu       $5, $2, %lo(LIT_926__2)
/* 0F7974 001F7874 E094868F */  lw          $6, -0x6B20($28)
/* 0F7978 001F7878 B4C4040C */  jal         GetTexture__15CTextureManagerFPci
/* 0F797C 001F787C 00000000 */   nop
/* 0F7980 001F7880 209582AF */  sw          $2, -0x6AE0($28)
/* 0F7984 001F7884 C701023C */  lui         $2, %hi(TexManager)
/* 0F7988 001F7888 70584424 */  addiu       $4, $2, %lo(TexManager)
/* 0F798C 001F788C 2A00023C */  lui         $2, %hi(LIT_927__2)
/* 0F7990 001F7890 08D54524 */  addiu       $5, $2, %lo(LIT_927__2)
/* 0F7994 001F7894 E094868F */  lw          $6, -0x6B20($28)
/* 0F7998 001F7898 B4C4040C */  jal         GetTexture__15CTextureManagerFPci
/* 0F799C 001F789C 00000000 */   nop
/* 0F79A0 001F78A0 289582AF */  sw          $2, -0x6AD8($28)
/* 0F79A4 001F78A4 208880AF */  sw          $0, -0x77E0($28)
/* 0F79A8 001F78A8 5A010010 */  b           .L001F7E14
/* 0F79AC 001F78AC 00000000 */   nop
jlabel .L001F78B0
.L001F78B0$b:
/* 0F79B0 001F78B0 D901013C */  lui         $1, %hi(MenuChara + 0x4)
/* 0F79B4 001F78B4 740421C4 */  lwc1        $f1, %lo(MenuChara + 0x4)($1)
/* 0F79B8 001F78B8 803F023C */  lui         $2, (0x3F800000 >> 16)
/* 0F79BC 001F78BC 00008244 */  mtc1        $2, $f0
/* 0F79C0 001F78C0 00000000 */  nop
/* 0F79C4 001F78C4 40080046 */  add.s       $f1, $f1, $f0
/* 0F79C8 001F78C8 D901013C */  lui         $1, %hi(MenuChara + 0x4)
/* 0F79CC 001F78CC 740421E4 */  swc1        $f1, %lo(MenuChara + 0x4)($1)
/* 0F79D0 001F78D0 A841023C */  lui         $2, (0x41A80000 >> 16)
/* 0F79D4 001F78D4 00008244 */  mtc1        $2, $f0
/* 0F79D8 001F78D8 00000000 */  nop
/* 0F79DC 001F78DC 34080046 */  c.lt.s      $f1, $f0
/* 0F79E0 001F78E0 00000000 */  nop
/* 0F79E4 001F78E4 4B010145 */  bc1t        .L001F7E14
/* 0F79E8 001F78E8 00000000 */   nop
/* 0F79EC 001F78EC 6C9581C7 */  lwc1        $f1, -0x6A94($28)
/* 0F79F0 001F78F0 00008044 */  mtc1        $0, $f0
/* 0F79F4 001F78F4 00000000 */  nop
/* 0F79F8 001F78F8 36080046 */  c.le.s      $f1, $f0
/* 0F79FC 001F78FC 00000000 */  nop
/* 0F7A00 001F7900 19000145 */  bc1t        .L001F7968
/* 0F7A04 001F7904 00000000 */   nop
/* 0F7A08 001F7908 28260070 */  paddub      $4, $0, $0
/* 0F7A0C 001F790C 0F000010 */  b           .L001F794C
/* 0F7A10 001F7910 00000000 */   nop
.L001F7914:
/* 0F7A14 001F7914 40100400 */  sll         $2, $4, 1
/* 0F7A18 001F7918 21104400 */  addu        $2, $2, $4
/* 0F7A1C 001F791C 80180200 */  sll         $3, $2, 2
/* 0F7A20 001F7920 2900023C */  lui         $2, %hi(SysChara + 0x1)
/* 0F7A24 001F7924 512B4224 */  addiu       $2, $2, %lo(SysChara + 0x1)
/* 0F7A28 001F7928 21184300 */  addu        $3, $2, $3
/* 0F7A2C 001F792C 00006280 */  lb          $2, 0x0($3)
/* 0F7A30 001F7930 01004224 */  addiu       $2, $2, 0x1
/* 0F7A34 001F7934 000062A0 */  sb          $2, 0x0($3)
/* 0F7A38 001F7938 00006280 */  lb          $2, 0x0($3)
/* 0F7A3C 001F793C 0200A214 */  bne         $5, $2, .L001F7948
/* 0F7A40 001F7940 00000000 */   nop
/* 0F7A44 001F7944 000060A0 */  sb          $0, 0x0($3)
.L001F7948:
/* 0F7A48 001F7948 01008424 */  addiu       $4, $4, 0x1
.L001F794C:
/* 0F7A4C 001F794C D901013C */  lui         $1, %hi(MenuChara + 0x2)
/* 0F7A50 001F7950 72042580 */  lb          $5, %lo(MenuChara + 0x2)($1)
/* 0F7A54 001F7954 2A108500 */  slt         $2, $4, $5
/* 0F7A58 001F7958 EEFF4014 */  bnez        $2, .L001F7914
/* 0F7A5C 001F795C 00000000 */   nop
/* 0F7A60 001F7960 19000010 */  b           .L001F79C8
/* 0F7A64 001F7964 00000000 */   nop
.L001F7968:
/* 0F7A68 001F7968 28260070 */  paddub      $4, $0, $0
/* 0F7A6C 001F796C 11000010 */  b           .L001F79B4
/* 0F7A70 001F7970 00000000 */   nop
.L001F7974:
/* 0F7A74 001F7974 40100400 */  sll         $2, $4, 1
/* 0F7A78 001F7978 21104400 */  addu        $2, $2, $4
/* 0F7A7C 001F797C 80180200 */  sll         $3, $2, 2
/* 0F7A80 001F7980 2900023C */  lui         $2, %hi(SysChara + 0x1)
/* 0F7A84 001F7984 512B4224 */  addiu       $2, $2, %lo(SysChara + 0x1)
/* 0F7A88 001F7988 21284300 */  addu        $5, $2, $3
/* 0F7A8C 001F798C 0000A280 */  lb          $2, 0x0($5)
/* 0F7A90 001F7990 FFFF4224 */  addiu       $2, $2, -0x1
/* 0F7A94 001F7994 0000A2A0 */  sb          $2, 0x0($5)
/* 0F7A98 001F7998 0000A380 */  lb          $3, 0x0($5)
/* 0F7A9C 001F799C FFFF0224 */  addiu       $2, $0, -0x1
/* 0F7AA0 001F79A0 03006214 */  bne         $3, $2, .L001F79B0
/* 0F7AA4 001F79A4 00000000 */   nop
/* 0F7AA8 001F79A8 FFFFC224 */  addiu       $2, $6, -0x1
/* 0F7AAC 001F79AC 0000A2A0 */  sb          $2, 0x0($5)
.L001F79B0:
/* 0F7AB0 001F79B0 01008424 */  addiu       $4, $4, 0x1
.L001F79B4:
/* 0F7AB4 001F79B4 D901013C */  lui         $1, %hi(MenuChara + 0x2)
/* 0F7AB8 001F79B8 72042680 */  lb          $6, %lo(MenuChara + 0x2)($1)
/* 0F7ABC 001F79BC 2A108600 */  slt         $2, $4, $6
/* 0F7AC0 001F79C0 ECFF4014 */  bnez        $2, .L001F7974
/* 0F7AC4 001F79C4 00000000 */   nop
.L001F79C8:
/* 0F7AC8 001F79C8 28860070 */  paddub      $16, $0, $0
/* 0F7ACC 001F79CC 1F000010 */  b           .L001F7A4C
/* 0F7AD0 001F79D0 00000000 */   nop
.L001F79D4:
/* 0F7AD4 001F79D4 40101000 */  sll         $2, $16, 1
/* 0F7AD8 001F79D8 21105000 */  addu        $2, $2, $16
/* 0F7ADC 001F79DC 80180200 */  sll         $3, $2, 2
/* 0F7AE0 001F79E0 2900023C */  lui         $2, %hi(SysChara + 0x1)
/* 0F7AE4 001F79E4 512B4224 */  addiu       $2, $2, %lo(SysChara + 0x1)
/* 0F7AE8 001F79E8 21104300 */  addu        $2, $2, $3
/* 0F7AEC 001F79EC 00004280 */  lb          $2, 0x0($2)
/* 0F7AF0 001F79F0 15004014 */  bnez        $2, .L001F7A48
/* 0F7AF4 001F79F4 00000000 */   nop
/* 0F7AF8 001F79F8 2900023C */  lui         $2, %hi(SysChara)
/* 0F7AFC 001F79FC 502B4224 */  addiu       $2, $2, %lo(SysChara)
/* 0F7B00 001F7A00 21104300 */  addu        $2, $2, $3
/* 0F7B04 001F7A04 00004380 */  lb          $3, 0x0($2)
/* 0F7B08 001F7A08 1E006524 */  addiu       $5, $3, 0x1E
/* 0F7B0C 001F7A0C D494828F */  lw          $2, -0x6B2C($28)
/* 0F7B10 001F7A10 05004280 */  lb          $2, 0x5($2)
/* 0F7B14 001F7A14 FFFF4224 */  addiu       $2, $2, -0x1
/* 0F7B18 001F7A18 2A084300 */  slt         $1, $2, $3
/* 0F7B1C 001F7A1C 02002010 */  beqz        $1, .L001F7A28
/* 0F7B20 001F7A20 00000000 */   nop
/* 0F7B24 001F7A24 27000524 */  addiu       $5, $0, 0x27
.L001F7A28:
/* 0F7B28 001F7A28 DA01013C */  lui         $1, %hi(CommonMenuMes2 + 0x16BC)
/* 0F7B2C 001F7A2C 0C3A228C */  lw          $2, %lo(CommonMenuMes2 + 0x16BC)($1)
/* 0F7B30 001F7A30 05004510 */  beq         $2, $5, .L001F7A48
/* 0F7B34 001F7A34 00000000 */   nop
/* 0F7B38 001F7A38 DA01023C */  lui         $2, %hi(CommonMenuMes2)
/* 0F7B3C 001F7A3C 50234424 */  addiu       $4, $2, %lo(CommonMenuMes2)
/* 0F7B40 001F7A40 5441050C */  jal         MakeMesWin__6ClsMesFi
/* 0F7B44 001F7A44 00000000 */   nop
.L001F7A48:
/* 0F7B48 001F7A48 01001026 */  addiu       $16, $16, 0x1
.L001F7A4C:
/* 0F7B4C 001F7A4C 0600022A */  slti        $2, $16, 0x6
/* 0F7B50 001F7A50 E0FF4014 */  bnez        $2, .L001F79D4
/* 0F7B54 001F7A54 00000000 */   nop
/* 0F7B58 001F7A58 D901013C */  lui         $1, %hi(MenuChara + 0x3)
/* 0F7B5C 001F7A5C 730420A0 */  sb          $0, %lo(MenuChara + 0x3)($1)
/* 0F7B60 001F7A60 D901013C */  lui         $1, %hi(MenuChara + 0x4)
/* 0F7B64 001F7A64 740420AC */  sw          $0, %lo(MenuChara + 0x4)($1)
/* 0F7B68 001F7A68 6C9580AF */  sw          $0, -0x6A94($28)
/* 0F7B6C 001F7A6C E9000010 */  b           .L001F7E14
/* 0F7B70 001F7A70 00000000 */   nop
jlabel .L001F7A74
.L001F7A74$b:
/* 0F7B74 001F7A74 CC01023C */  lui         $2, %hi(GamePad)
/* 0F7B78 001F7A78 40C54424 */  addiu       $4, $2, %lo(GamePad)
/* 0F7B7C 001F7A7C 60000524 */  addiu       $5, $0, 0x60
/* 0F7B80 001F7A80 1CAE040C */  jal         Down__8CGamePadFi
/* 0F7B84 001F7A84 00000000 */   nop
/* 0F7B88 001F7A88 E2004010 */  beqz        $2, .L001F7E14
/* 0F7B8C 001F7A8C 00000000 */   nop
/* 0F7B90 001F7A90 D901013C */  lui         $1, %hi(MenuChara + 0x3)
/* 0F7B94 001F7A94 730420A0 */  sb          $0, %lo(MenuChara + 0x3)($1)
/* 0F7B98 001F7A98 01000424 */  addiu       $4, $0, 0x1
/* 0F7B9C 001F7A9C BCB3080C */  jal         ComMenuSePlay__Fi
/* 0F7BA0 001F7AA0 00000000 */   nop
/* 0F7BA4 001F7AA4 DB000010 */  b           .L001F7E14
/* 0F7BA8 001F7AA8 00000000 */   nop
jlabel .L001F7AAC
.L001F7AAC$b:
/* 0F7BAC 001F7AAC D901013C */  lui         $1, %hi(MenuChara)
/* 0F7BB0 001F7AB0 70043084 */  lh          $16, %lo(MenuChara)($1)
/* 0F7BB4 001F7AB4 CC01023C */  lui         $2, %hi(GamePad)
/* 0F7BB8 001F7AB8 40C54424 */  addiu       $4, $2, %lo(GamePad)
/* 0F7BBC 001F7ABC 00300524 */  addiu       $5, $0, 0x3000
/* 0F7BC0 001F7AC0 04AE040C */  jal         On__8CGamePadFi
/* 0F7BC4 001F7AC4 00000000 */   nop
/* 0F7BC8 001F7AC8 1C004010 */  beqz        $2, .L001F7B3C
/* 0F7BCC 001F7ACC 00000000 */   nop
/* 0F7BD0 001F7AD0 A041023C */  lui         $2, (0x41A00000 >> 16)
/* 0F7BD4 001F7AD4 00088244 */  mtc1        $2, $f1
/* 0F7BD8 001F7AD8 709580C7 */  lwc1        $f0, -0x6A90($28)
/* 0F7BDC 001F7ADC 03000146 */  div.s       $f0, $f0, $f1
/* 0F7BE0 001F7AE0 6C9580E7 */  swc1        $f0, -0x6A94($28)
/* 0F7BE4 001F7AE4 03000224 */  addiu       $2, $0, 0x3
/* 0F7BE8 001F7AE8 D901013C */  lui         $1, %hi(MenuChara + 0x3)
/* 0F7BEC 001F7AEC 730422A0 */  sb          $2, %lo(MenuChara + 0x3)($1)
/* 0F7BF0 001F7AF0 D901013C */  lui         $1, %hi(MenuChara + 0x4)
/* 0F7BF4 001F7AF4 740420AC */  sw          $0, %lo(MenuChara + 0x4)($1)
/* 0F7BF8 001F7AF8 D901013C */  lui         $1, %hi(MenuChara)
/* 0F7BFC 001F7AFC 70042284 */  lh          $2, %lo(MenuChara)($1)
/* 0F7C00 001F7B00 FFFF4224 */  addiu       $2, $2, -0x1
/* 0F7C04 001F7B04 D901013C */  lui         $1, %hi(MenuChara)
/* 0F7C08 001F7B08 700422A4 */  sh          $2, %lo(MenuChara)($1)
/* 0F7C0C 001F7B0C D901013C */  lui         $1, %hi(MenuChara)
/* 0F7C10 001F7B10 70042284 */  lh          $2, %lo(MenuChara)($1)
/* 0F7C14 001F7B14 04004104 */  bgez        $2, .L001F7B28
/* 0F7C18 001F7B18 00000000 */   nop
/* 0F7C1C 001F7B1C 05000224 */  addiu       $2, $0, 0x5
/* 0F7C20 001F7B20 D901013C */  lui         $1, %hi(MenuChara)
/* 0F7C24 001F7B24 700422A4 */  sh          $2, %lo(MenuChara)($1)
.L001F7B28:
/* 0F7C28 001F7B28 28260070 */  paddub      $4, $0, $0
/* 0F7C2C 001F7B2C BCB3080C */  jal         ComMenuSePlay__Fi
/* 0F7C30 001F7B30 00000000 */   nop
/* 0F7C34 001F7B34 A1000010 */  b           .L001F7DBC
/* 0F7C38 001F7B38 00000000 */   nop
.L001F7B3C:
/* 0F7C3C 001F7B3C CC01023C */  lui         $2, %hi(GamePad)
/* 0F7C40 001F7B40 40C54424 */  addiu       $4, $2, %lo(GamePad)
/* 0F7C44 001F7B44 00C00534 */  ori         $5, $0, 0xC000
/* 0F7C48 001F7B48 04AE040C */  jal         On__8CGamePadFi
/* 0F7C4C 001F7B4C 00000000 */   nop
/* 0F7C50 001F7B50 1E004010 */  beqz        $2, .L001F7BCC
/* 0F7C54 001F7B54 00000000 */   nop
/* 0F7C58 001F7B58 709580C7 */  lwc1        $f0, -0x6A90($28)
/* 0F7C5C 001F7B5C 47000046 */  neg.s       $f1, $f0
/* 0F7C60 001F7B60 A041023C */  lui         $2, (0x41A00000 >> 16)
/* 0F7C64 001F7B64 00008244 */  mtc1        $2, $f0
/* 0F7C68 001F7B68 00000000 */  nop
/* 0F7C6C 001F7B6C 03080046 */  div.s       $f0, $f1, $f0
/* 0F7C70 001F7B70 6C9580E7 */  swc1        $f0, -0x6A94($28)
/* 0F7C74 001F7B74 03000224 */  addiu       $2, $0, 0x3
/* 0F7C78 001F7B78 D901013C */  lui         $1, %hi(MenuChara + 0x3)
/* 0F7C7C 001F7B7C 730422A0 */  sb          $2, %lo(MenuChara + 0x3)($1)
/* 0F7C80 001F7B80 D901013C */  lui         $1, %hi(MenuChara + 0x4)
/* 0F7C84 001F7B84 740420AC */  sw          $0, %lo(MenuChara + 0x4)($1)
/* 0F7C88 001F7B88 D901013C */  lui         $1, %hi(MenuChara)
/* 0F7C8C 001F7B8C 70042284 */  lh          $2, %lo(MenuChara)($1)
/* 0F7C90 001F7B90 01004224 */  addiu       $2, $2, 0x1
/* 0F7C94 001F7B94 D901013C */  lui         $1, %hi(MenuChara)
/* 0F7C98 001F7B98 700422A4 */  sh          $2, %lo(MenuChara)($1)
/* 0F7C9C 001F7B9C D901013C */  lui         $1, %hi(MenuChara)
/* 0F7CA0 001F7BA0 70042284 */  lh          $2, %lo(MenuChara)($1)
/* 0F7CA4 001F7BA4 06004128 */  slti        $1, $2, 0x6
/* 0F7CA8 001F7BA8 03002014 */  bnez        $1, .L001F7BB8
/* 0F7CAC 001F7BAC 00000000 */   nop
/* 0F7CB0 001F7BB0 D901013C */  lui         $1, %hi(MenuChara)
/* 0F7CB4 001F7BB4 700420A4 */  sh          $0, %lo(MenuChara)($1)
.L001F7BB8:
/* 0F7CB8 001F7BB8 28260070 */  paddub      $4, $0, $0
/* 0F7CBC 001F7BBC BCB3080C */  jal         ComMenuSePlay__Fi
/* 0F7CC0 001F7BC0 00000000 */   nop
/* 0F7CC4 001F7BC4 7D000010 */  b           .L001F7DBC
/* 0F7CC8 001F7BC8 00000000 */   nop
.L001F7BCC:
/* 0F7CCC 001F7BCC CC01023C */  lui         $2, %hi(GamePad)
/* 0F7CD0 001F7BD0 40C54424 */  addiu       $4, $2, %lo(GamePad)
/* 0F7CD4 001F7BD4 20000524 */  addiu       $5, $0, 0x20
/* 0F7CD8 001F7BD8 1CAE040C */  jal         Down__8CGamePadFi
/* 0F7CDC 001F7BDC 00000000 */   nop
/* 0F7CE0 001F7BE0 0E004010 */  beqz        $2, .L001F7C1C
/* 0F7CE4 001F7BE4 00000000 */   nop
/* 0F7CE8 001F7BE8 13000224 */  addiu       $2, $0, 0x13
/* 0F7CEC 001F7BEC 208882AF */  sw          $2, -0x77E0($28)
/* 0F7CF0 001F7BF0 02000424 */  addiu       $4, $0, 0x2
/* 0F7CF4 001F7BF4 D901013C */  lui         $1, %hi(MenuChara + 0x3)
/* 0F7CF8 001F7BF8 730424A0 */  sb          $4, %lo(MenuChara + 0x3)($1)
/* 0F7CFC 001F7BFC D901013C */  lui         $1, %hi(MenuChara + 0x4)
/* 0F7D00 001F7C00 740420AC */  sw          $0, %lo(MenuChara + 0x4)($1)
/* 0F7D04 001F7C04 308880AF */  sw          $0, -0x77D0($28)
/* 0F7D08 001F7C08 849580AF */  sw          $0, -0x6A7C($28)
/* 0F7D0C 001F7C0C BCB3080C */  jal         ComMenuSePlay__Fi
/* 0F7D10 001F7C10 00000000 */   nop
/* 0F7D14 001F7C14 69000010 */  b           .L001F7DBC
/* 0F7D18 001F7C18 00000000 */   nop
.L001F7C1C:
/* 0F7D1C 001F7C1C CC01023C */  lui         $2, %hi(GamePad)
/* 0F7D20 001F7C20 40C54424 */  addiu       $4, $2, %lo(GamePad)
/* 0F7D24 001F7C24 40000524 */  addiu       $5, $0, 0x40
/* 0F7D28 001F7C28 1CAE040C */  jal         Down__8CGamePadFi
/* 0F7D2C 001F7C2C 00000000 */   nop
/* 0F7D30 001F7C30 62004010 */  beqz        $2, .L001F7DBC
/* 0F7D34 001F7C34 00000000 */   nop
/* 0F7D38 001F7C38 D894828F */  lw          $2, -0x6B28($28)
/* 0F7D3C 001F7C3C 03004010 */  beqz        $2, .L001F7C4C
/* 0F7D40 001F7C40 00000000 */   nop
/* 0F7D44 001F7C44 5A000010 */  b           .L001F7DB0
/* 0F7D48 001F7C48 00000000 */   nop
.L001F7C4C:
/* 0F7D4C 001F7C4C D494838F */  lw          $3, -0x6B2C($28)
/* 0F7D50 001F7C50 04006524 */  addiu       $5, $3, 0x4
/* 0F7D54 001F7C54 04006480 */  lb          $4, 0x4($3)
/* 0F7D58 001F7C58 05000224 */  addiu       $2, $0, 0x5
/* 0F7D5C 001F7C5C 10008214 */  bne         $4, $2, .L001F7CA0
/* 0F7D60 001F7C60 00000000 */   nop
/* 0F7D64 001F7C64 DC01013C */  lui         $1, %hi(BtActStatus + 0x92)
/* 0F7D68 001F7C68 12452684 */  lh          $6, %lo(BtActStatus + 0x92)($1)
/* 0F7D6C 001F7C6C 0A000224 */  addiu       $2, $0, 0xA
/* 0F7D70 001F7C70 0B00C214 */  bne         $6, $2, .L001F7CA0
/* 0F7D74 001F7C74 00000000 */   nop
/* 0F7D78 001F7C78 DA01023C */  lui         $2, %hi(CommonMenuMes1)
/* 0F7D7C 001F7C7C 900B4424 */  addiu       $4, $2, %lo(CommonMenuMes1)
/* 0F7D80 001F7C80 A1010524 */  addiu       $5, $0, 0x1A1
/* 0F7D84 001F7C84 5441050C */  jal         MakeMesWin__6ClsMesFi
/* 0F7D88 001F7C88 00000000 */   nop
/* 0F7D8C 001F7C8C 02000424 */  addiu       $4, $0, 0x2
/* 0F7D90 001F7C90 BCB3080C */  jal         ComMenuSePlay__Fi
/* 0F7D94 001F7C94 00000000 */   nop
/* 0F7D98 001F7C98 48000010 */  b           .L001F7DBC
/* 0F7D9C 001F7C9C 00000000 */   nop
.L001F7CA0:
/* 0F7DA0 001F7CA0 28160070 */  paddub      $2, $0, $0
/* 0F7DA4 001F7CA4 3B000010 */  b           .L001F7D94
/* 0F7DA8 001F7CA8 00000000 */   nop
.L001F7CAC:
/* 0F7DAC 001F7CAC 40300200 */  sll         $6, $2, 1
/* 0F7DB0 001F7CB0 2130C200 */  addu        $6, $6, $2
/* 0F7DB4 001F7CB4 80380600 */  sll         $7, $6, 2
/* 0F7DB8 001F7CB8 2900063C */  lui         $6, %hi(SysChara + 0x1)
/* 0F7DBC 001F7CBC 512BC624 */  addiu       $6, $6, %lo(SysChara + 0x1)
/* 0F7DC0 001F7CC0 2130C700 */  addu        $6, $6, $7
/* 0F7DC4 001F7CC4 0000C680 */  lb          $6, 0x0($6)
/* 0F7DC8 001F7CC8 3100C014 */  bnez        $6, .L001F7D90
/* 0F7DCC 001F7CCC 00000000 */   nop
/* 0F7DD0 001F7CD0 2900063C */  lui         $6, %hi(SysChara)
/* 0F7DD4 001F7CD4 502BC624 */  addiu       $6, $6, %lo(SysChara)
/* 0F7DD8 001F7CD8 2130C700 */  addu        $6, $6, $7
/* 0F7DDC 001F7CDC 0000C880 */  lb          $8, 0x0($6)
/* 0F7DE0 001F7CE0 05006680 */  lb          $6, 0x5($3)
/* 0F7DE4 001F7CE4 FFFFC624 */  addiu       $6, $6, -0x1
/* 0F7DE8 001F7CE8 2A08C800 */  slt         $1, $6, $8
/* 0F7DEC 001F7CEC 07002010 */  beqz        $1, .L001F7D0C
/* 0F7DF0 001F7CF0 00000000 */   nop
/* 0F7DF4 001F7CF4 02000424 */  addiu       $4, $0, 0x2
/* 0F7DF8 001F7CF8 BCB3080C */  jal         ComMenuSePlay__Fi
/* 0F7DFC 001F7CFC 00000000 */   nop
/* 0F7E00 001F7D00 01000224 */  addiu       $2, $0, 0x1
/* 0F7E04 001F7D04 44000010 */  b           .L001F7E18
/* 0F7E08 001F7D08 00000000 */   nop
.L001F7D0C:
/* 0F7E0C 001F7D0C 40300800 */  sll         $6, $8, 1
/* 0F7E10 001F7D10 2130C300 */  addu        $6, $6, $3
/* 0F7E14 001F7D14 1200C784 */  lh          $7, 0x12($6)
/* 0F7E18 001F7D18 80300800 */  sll         $6, $8, 2
/* 0F7E1C 001F7D1C 2130C300 */  addu        $6, $6, $3
/* 0F7E20 001F7D20 C842C68C */  lw          $6, 0x42C8($6)
/* 0F7E24 001F7D24 0400E018 */  blez        $7, .L001F7D38
/* 0F7E28 001F7D28 00000000 */   nop
/* 0F7E2C 001F7D2C 0200C630 */  andi        $6, $6, 0x2
/* 0F7E30 001F7D30 0700C010 */  beqz        $6, .L001F7D50
/* 0F7E34 001F7D34 00000000 */   nop
.L001F7D38:
/* 0F7E38 001F7D38 02000424 */  addiu       $4, $0, 0x2
/* 0F7E3C 001F7D3C BCB3080C */  jal         ComMenuSePlay__Fi
/* 0F7E40 001F7D40 00000000 */   nop
/* 0F7E44 001F7D44 01000224 */  addiu       $2, $0, 0x1
/* 0F7E48 001F7D48 33000010 */  b           .L001F7E18
/* 0F7E4C 001F7D4C 00000000 */   nop
.L001F7D50:
/* 0F7E50 001F7D50 3C360400 */  dsll32      $6, $4, 24
/* 0F7E54 001F7D54 3F360600 */  dsra32      $6, $6, 24
/* 0F7E58 001F7D58 0D000611 */  beq         $8, $6, .L001F7D90
/* 0F7E5C 001F7D5C 00000000 */   nop
/* 0F7E60 001F7D60 0000A8A0 */  sb          $8, 0x0($5)
/* 0F7E64 001F7D64 01000424 */  addiu       $4, $0, 0x1
/* 0F7E68 001F7D68 BCB3080C */  jal         ComMenuSePlay__Fi
/* 0F7E6C 001F7D6C 00000000 */   nop
/* 0F7E70 001F7D70 04000224 */  addiu       $2, $0, 0x4
/* 0F7E74 001F7D74 D901013C */  lui         $1, %hi(MenuChara + 0x3)
/* 0F7E78 001F7D78 730422A0 */  sb          $2, %lo(MenuChara + 0x3)($1)
/* 0F7E7C 001F7D7C D901013C */  lui         $1, %hi(MenuChara + 0x8)
/* 0F7E80 001F7D80 780420AC */  sw          $0, %lo(MenuChara + 0x8)($1)
/* 0F7E84 001F7D84 01000224 */  addiu       $2, $0, 0x1
/* 0F7E88 001F7D88 23000010 */  b           .L001F7E18
/* 0F7E8C 001F7D8C 00000000 */   nop
.L001F7D90:
/* 0F7E90 001F7D90 01004224 */  addiu       $2, $2, 0x1
.L001F7D94:
/* 0F7E94 001F7D94 D901013C */  lui         $1, %hi(MenuChara + 0x2)
/* 0F7E98 001F7D98 72042680 */  lb          $6, %lo(MenuChara + 0x2)($1)
/* 0F7E9C 001F7D9C 2A304600 */  slt         $6, $2, $6
/* 0F7EA0 001F7DA0 C2FFC014 */  bnez        $6, .L001F7CAC
/* 0F7EA4 001F7DA4 00000000 */   nop
/* 0F7EA8 001F7DA8 04000010 */  b           .L001F7DBC
/* 0F7EAC 001F7DAC 00000000 */   nop
.L001F7DB0:
/* 0F7EB0 001F7DB0 02000424 */  addiu       $4, $0, 0x2
/* 0F7EB4 001F7DB4 BCB3080C */  jal         ComMenuSePlay__Fi
/* 0F7EB8 001F7DB8 00000000 */   nop
.L001F7DBC:
/* 0F7EBC 001F7DBC D901013C */  lui         $1, %hi(MenuChara)
/* 0F7EC0 001F7DC0 70042384 */  lh          $3, %lo(MenuChara)($1)
/* 0F7EC4 001F7DC4 13000312 */  beq         $16, $3, .L001F7E14
/* 0F7EC8 001F7DC8 00000000 */   nop
/* 0F7ECC 001F7DCC D494828F */  lw          $2, -0x6B2C($28)
/* 0F7ED0 001F7DD0 05004280 */  lb          $2, 0x5($2)
/* 0F7ED4 001F7DD4 2A086200 */  slt         $1, $3, $2
/* 0F7ED8 001F7DD8 0E002010 */  beqz        $1, .L001F7E14
/* 0F7EDC 001F7DDC 00000000 */   nop
/* 0F7EE0 001F7DE0 8C95828F */  lw          $2, -0x6A74($28)
/* 0F7EE4 001F7DE4 0B004010 */  beqz        $2, .L001F7E14
/* 0F7EE8 001F7DE8 00000000 */   nop
/* 0F7EEC 001F7DEC D894828F */  lw          $2, -0x6B28($28)
/* 0F7EF0 001F7DF0 08004014 */  bnez        $2, .L001F7E14
/* 0F7EF4 001F7DF4 00000000 */   nop
/* 0F7EF8 001F7DF8 B0FB040C */  jal         BreakReadBG__Fv
/* 0F7EFC 001F7DFC 00000000 */   nop
/* 0F7F00 001F7E00 D901013C */  lui         $1, %hi(MenuChara)
/* 0F7F04 001F7E04 70042584 */  lh          $5, %lo(MenuChara)($1)
/* 0F7F08 001F7E08 8C95848F */  lw          $4, -0x6A74($28)
/* 0F7F0C 001F7E0C 6C39080C */  jal         CharaChangeInitToGL__FP1i
/* 0F7F10 001F7E10 00000000 */   nop
.L001F7E14:
/* 0F7F14 001F7E14 01000224 */  addiu       $2, $0, 0x1
.L001F7E18:
/* 0F7F18 001F7E18 1000BF7B */  lq          $31, 0x10($29)
/* 0F7F1C 001F7E1C 0000B07B */  lq          $16, 0x0($29)
/* 0F7F20 001F7E20 6000BD27 */  addiu       $29, $29, 0x60
/* 0F7F24 001F7E24 0800E003 */  jr          $31
/* 0F7F28 001F7E28 00000000 */   nop
/* 0F7F2C 001F7E2C 00000000 */  nop
