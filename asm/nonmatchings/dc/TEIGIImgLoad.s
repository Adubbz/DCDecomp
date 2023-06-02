.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel TEIGIImgLoad__FPUiP14CDataAlloc2_1_
/* CE550 001CE450 E0FDBD27 */  addiu      $sp, $sp, -0x220
/* CE554 001CE454 8000BF7F */  sq         $31, 0x80($sp)
/* CE558 001CE458 7000B77F */  sq         $23, 0x70($sp)
/* CE55C 001CE45C 6000B67F */  sq         $22, 0x60($sp)
/* CE560 001CE460 5000B57F */  sq         $21, 0x50($sp)
/* CE564 001CE464 4000B47F */  sq         $20, 0x40($sp)
/* CE568 001CE468 3000B37F */  sq         $19, 0x30($sp)
/* CE56C 001CE46C 2000B27F */  sq         $18, 0x20($sp)
/* CE570 001CE470 1000B17F */  sq         $17, 0x10($sp)
/* CE574 001CE474 0000B07F */  sq         $16, 0x0($sp)
/* CE578 001CE478 28AE8070 */  paddub     $21, $4, $0
/* CE57C 001CE47C 28A6A070 */  paddub     $20, $5, $0
/* CE580 001CE480 288E0070 */  paddub     $17, $0, $0
/* CE584 001CE484 D801023C */  lui        $2, %hi(pathName)
/* CE588 001CE488 201E4424 */  addiu      $4, $2, %lo(pathName)
/* CE58C 001CE48C 2A00023C */  lui        $2, %hi(_766_2)
/* CE590 001CE490 88C24524 */  addiu      $5, $2, %lo(_766_2)
/* CE594 001CE494 5A15040C */  jal        strcpy
/* CE598 001CE498 00000000 */   nop
/* CE59C 001CE49C 2800023C */  lui        $2, %hi(_767)
/* CE5A0 001CE4A0 10A64524 */  addiu      $5, $2, %lo(_767)
/* CE5A4 001CE4A4 9001A427 */  addiu      $4, $sp, 0x190
/* CE5A8 001CE4A8 03000324 */  addiu      $3, $0, 0x3
.L001CE4AC:
/* CE5AC 001CE4AC 0000A278 */  lq         $2, 0x0($5)
/* CE5B0 001CE4B0 1000A524 */  addiu      $5, $5, 0x10
/* CE5B4 001CE4B4 FFFF6324 */  addiu      $3, $3, -0x1
/* CE5B8 001CE4B8 0000827C */  sq         $2, 0x0($4)
/* CE5BC 001CE4BC 10008424 */  addiu      $4, $4, 0x10
/* CE5C0 001CE4C0 FAFF601C */  bgtz       $3, .L001CE4AC
/* CE5C4 001CE4C4 00000000 */   nop
/* CE5C8 001CE4C8 0000A3DC */  ld         $3, 0x0($5)
/* CE5CC 001CE4CC 0800A2C4 */  lwc1       $f2, 0x8($5)
/* CE5D0 001CE4D0 000083FC */  sd         $3, 0x0($4)
/* CE5D4 001CE4D4 080082E4 */  swc1       $f2, 0x8($4)
/* CE5D8 001CE4D8 2800023C */  lui        $2, %hi(_769)
/* CE5DC 001CE4DC 50A64524 */  addiu      $5, $2, %lo(_769)
/* CE5E0 001CE4E0 D001A427 */  addiu      $4, $sp, 0x1D0
/* CE5E4 001CE4E4 02000324 */  addiu      $3, $0, 0x2
.L001CE4E8:
/* CE5E8 001CE4E8 0000A278 */  lq         $2, 0x0($5)
/* CE5EC 001CE4EC 1000A524 */  addiu      $5, $5, 0x10
/* CE5F0 001CE4F0 FFFF6324 */  addiu      $3, $3, -0x1
/* CE5F4 001CE4F4 0000827C */  sq         $2, 0x0($4)
/* CE5F8 001CE4F8 10008424 */  addiu      $4, $4, 0x10
/* CE5FC 001CE4FC FAFF601C */  bgtz       $3, .L001CE4E8
/* CE600 001CE500 00000000 */   nop
/* CE604 001CE504 0000A2C4 */  lwc1       $f2, 0x0($5)
/* CE608 001CE508 000082E4 */  swc1       $f2, 0x0($4)
/* CE60C 001CE50C 2800023C */  lui        $2, %hi(_770)
/* CE610 001CE510 80A64224 */  addiu      $2, $2, %lo(_770)
/* CE614 001CE514 0002A427 */  addiu      $4, $sp, 0x200
/* CE618 001CE518 00004378 */  lq         $3, 0x0($2)
/* CE61C 001CE51C 100042DC */  ld         $2, 0x10($2)
/* CE620 001CE520 0000837C */  sq         $3, 0x0($4)
/* CE624 001CE524 100082FC */  sd         $2, 0x10($4)
/* CE628 001CE528 28860070 */  paddub     $16, $0, $0
/* CE62C 001CE52C 07000010 */  b          .L001CE54C
/* CE630 001CE530 00000000 */   nop
.L001CE534:
/* CE634 001CE534 40000526 */  addiu      $5, $16, 0x40
/* CE638 001CE538 C701023C */  lui        $2, %hi(TexManager)
/* CE63C 001CE53C 70584424 */  addiu      $4, $2, %lo(TexManager)
/* CE640 001CE540 C0CD040C */  jal        DeleteTextureBlock__15CTextureManagerFi
/* CE644 001CE544 00000000 */   nop
/* CE648 001CE548 01001026 */  addiu      $16, $16, 0x1
.L001CE54C:
/* CE64C 001CE54C 0400022A */  slti       $2, $16, 0x4
/* CE650 001CE550 F8FF4014 */  bnez       $2, .L001CE534
/* CE654 001CE554 00000000 */   nop
/* CE658 001CE558 C701023C */  lui        $2, %hi(TexManager)
/* CE65C 001CE55C 70584424 */  addiu      $4, $2, %lo(TexManager)
/* CE660 001CE560 98CE040C */  jal        CleanUpTextureList__15CTextureManagerFv
/* CE664 001CE564 00000000 */   nop
/* CE668 001CE568 C701023C */  lui        $2, %hi(TexManager)
/* CE66C 001CE56C 70584424 */  addiu      $4, $2, %lo(TexManager)
/* CE670 001CE570 FCCD040C */  jal        CleanUpBuffer__15CTextureManagerFv
/* CE674 001CE574 00000000 */   nop
/* CE678 001CE578 28860070 */  paddub     $16, $0, $0
/* CE67C 001CE57C 09010010 */  b          .L001CE9A4
/* CE680 001CE580 00000000 */   nop
.L001CE584:
/* CE684 001CE584 2800013C */  lui        $at, (0x280000 >> 16)
/* CE688 001CE588 B8A1328C */  lw         $18, -0x5E48($at)
/* CE68C 001CE58C C0101000 */  sll        $2, $16, 3
/* CE690 001CE590 21105000 */  addu       $2, $2, $16
/* CE694 001CE594 00B10200 */  sll        $22, $2, 4
/* CE698 001CE598 D701023C */  lui        $2, %hi(argValBuff)
/* CE69C 001CE59C 20B64224 */  addiu      $2, $2, %lo(argValBuff)
/* CE6A0 001CE5A0 21985600 */  addu       $19, $2, $22
/* CE6A4 001CE5A4 00006CC6 */  lwc1       $f12, 0x0($19)
/* CE6A8 001CE5A8 2C44040C */  jal        fptosi
/* CE6AC 001CE5AC 00000000 */   nop
/* CE6B0 001CE5B0 0B004216 */  bne        $18, $2, .L001CE5E0
/* CE6B4 001CE5B4 00000000 */   nop
/* CE6B8 001CE5B8 C0101000 */  sll        $2, $16, 3
/* CE6BC 001CE5BC 21105000 */  addu       $2, $2, $16
/* CE6C0 001CE5C0 80180200 */  sll        $3, $2, 2
/* CE6C4 001CE5C4 D601023C */  lui        $2, %hi(argStrBuff)
/* CE6C8 001CE5C8 205C4224 */  addiu      $2, $2, %lo(argStrBuff)
/* CE6CC 001CE5CC 21284300 */  addu       $5, $2, $3
/* CE6D0 001CE5D0 D801023C */  lui        $2, %hi(pathName)
/* CE6D4 001CE5D4 201E4424 */  addiu      $4, $2, %lo(pathName)
/* CE6D8 001CE5D8 5A15040C */  jal        strcpy
/* CE6DC 001CE5DC 00000000 */   nop
.L001CE5E0:
/* CE6E0 001CE5E0 2800013C */  lui        $at, (0x280000 >> 16)
/* CE6E4 001CE5E4 B0A0328C */  lw         $18, -0x5F50($at)
/* CE6E8 001CE5E8 00006CC6 */  lwc1       $f12, 0x0($19)
/* CE6EC 001CE5EC 2C44040C */  jal        fptosi
/* CE6F0 001CE5F0 00000000 */   nop
/* CE6F4 001CE5F4 7A004216 */  bne        $18, $2, .L001CE7E0
/* CE6F8 001CE5F8 00000000 */   nop
/* CE6FC 001CE5FC 9000A427 */  addiu      $4, $sp, 0x90
/* CE700 001CE600 D801023C */  lui        $2, %hi(pathName)
/* CE704 001CE604 201E4524 */  addiu      $5, $2, %lo(pathName)
/* CE708 001CE608 5A15040C */  jal        strcpy
/* CE70C 001CE60C 00000000 */   nop
/* CE710 001CE610 C0101000 */  sll        $2, $16, 3
/* CE714 001CE614 21105000 */  addu       $2, $2, $16
/* CE718 001CE618 80180200 */  sll        $3, $2, 2
/* CE71C 001CE61C D601023C */  lui        $2, %hi(argStrBuff)
/* CE720 001CE620 205C4224 */  addiu      $2, $2, %lo(argStrBuff)
/* CE724 001CE624 21904300 */  addu       $18, $2, $3
/* CE728 001CE628 9000A427 */  addiu      $4, $sp, 0x90
/* CE72C 001CE62C 282E4072 */  paddub     $5, $18, $0
/* CE730 001CE630 BC14040C */  jal        strcat
/* CE734 001CE634 00000000 */   nop
/* CE738 001CE638 28264072 */  paddub     $4, $18, $0
/* CE73C 001CE63C 9000A527 */  addiu      $5, $sp, 0x90
/* CE740 001CE640 5A15040C */  jal        strcpy
/* CE744 001CE644 00000000 */   nop
/* CE748 001CE648 0800828E */  lw         $2, 0x8($20)
/* CE74C 001CE64C 00190200 */  sll        $3, $2, 4
/* CE750 001CE650 0000828E */  lw         $2, 0x0($20)
/* CE754 001CE654 21B84300 */  addu       $23, $2, $3
/* CE758 001CE658 2826A072 */  paddub     $4, $21, $0
/* CE75C 001CE65C 282E4072 */  paddub     $5, $18, $0
/* CE760 001CE660 1C02A627 */  addiu      $6, $sp, 0x21C
/* CE764 001CE664 C8FD040C */  jal        GetPackFile__FPUiPcPi
/* CE768 001CE668 00000000 */   nop
/* CE76C 001CE66C 28964070 */  paddub     $18, $2, $0
/* CE770 001CE670 1C02A28F */  lw         $2, 0x21C($sp)
/* CE774 001CE674 83110200 */  sra        $2, $2, 6
/* CE778 001CE678 01004224 */  addiu      $2, $2, 0x1
/* CE77C 001CE67C 80110200 */  sll        $2, $2, 6
/* CE780 001CE680 03290200 */  sra        $5, $2, 4
/* CE784 001CE684 28268072 */  paddub     $4, $20, $0
/* CE788 001CE688 289E040C */  jal        Alloc__14CDataAlloc2_1_Fi
/* CE78C 001CE68C 00000000 */   nop
/* CE790 001CE690 1C02A68F */  lw         $6, 0x21C($sp)
/* CE794 001CE694 2826E072 */  paddub     $4, $23, $0
/* CE798 001CE698 282E4072 */  paddub     $5, $18, $0
/* CE79C 001CE69C EC0C040C */  jal        memcpy
/* CE7A0 001CE6A0 00000000 */   nop
/* CE7A4 001CE6A4 40101100 */  sll        $2, $17, 1
/* CE7A8 001CE6A8 21105100 */  addu       $2, $2, $17
/* CE7AC 001CE6AC 80900200 */  sll        $18, $2, 2
/* CE7B0 001CE6B0 21185D02 */  addu       $3, $18, $sp
/* CE7B4 001CE6B4 900177AC */  sw         $23, 0x190($3)
/* CE7B8 001CE6B8 03000224 */  addiu      $2, $0, 0x3
/* CE7BC 001CE6BC 940162AC */  sw         $2, 0x194($3)
/* CE7C0 001CE6C0 D701023C */  lui        $2, %hi(D_1D6B628)
/* CE7C4 001CE6C4 28B64224 */  addiu      $2, $2, %lo(D_1D6B628)
/* CE7C8 001CE6C8 21105600 */  addu       $2, $2, $22
/* CE7CC 001CE6CC 00004CC4 */  lwc1       $f12, 0x0($2)
/* CE7D0 001CE6D0 2C44040C */  jal        fptosi
/* CE7D4 001CE6D4 00000000 */   nop
/* CE7D8 001CE6D8 21185D02 */  addu       $3, $18, $sp
/* CE7DC 001CE6DC 980162AC */  sw         $2, 0x198($3)
/* CE7E0 001CE6E0 01003126 */  addiu      $17, $17, 0x1
/* CE7E4 001CE6E4 40101100 */  sll        $2, $17, 1
/* CE7E8 001CE6E8 21105100 */  addu       $2, $2, $17
/* CE7EC 001CE6EC 80100200 */  sll        $2, $2, 2
/* CE7F0 001CE6F0 21105D00 */  addu       $2, $2, $sp
/* CE7F4 001CE6F4 900140AC */  sw         $0, 0x190($2)
/* CE7F8 001CE6F8 C701023C */  lui        $2, %hi(TexManager)
/* CE7FC 001CE6FC 70584424 */  addiu      $4, $2, %lo(TexManager)
/* CE800 001CE700 03000524 */  addiu      $5, $0, 0x3
/* CE804 001CE704 C0CD040C */  jal        DeleteTextureBlock__15CTextureManagerFi
/* CE808 001CE708 00000000 */   nop
/* CE80C 001CE70C C701023C */  lui        $2, %hi(TexManager)
/* CE810 001CE710 70584424 */  addiu      $4, $2, %lo(TexManager)
/* CE814 001CE714 98CE040C */  jal        CleanUpTextureList__15CTextureManagerFv
/* CE818 001CE718 00000000 */   nop
/* CE81C 001CE71C C701023C */  lui        $2, %hi(TexManager)
/* CE820 001CE720 70584424 */  addiu      $4, $2, %lo(TexManager)
/* CE824 001CE724 FCCD040C */  jal        CleanUpBuffer__15CTextureManagerFv
/* CE828 001CE728 00000000 */   nop
/* CE82C 001CE72C C701023C */  lui        $2, %hi(TexManager)
/* CE830 001CE730 70584424 */  addiu      $4, $2, %lo(TexManager)
/* CE834 001CE734 FFFF0524 */  addiu      $5, $0, -0x1
/* CE838 001CE738 9001A627 */  addiu      $6, $sp, 0x190
/* CE83C 001CE73C 30D0040C */  jal        LoadTextureBlockEX__15CTextureManagerFiP17LOADTEXTURE_INFO2
/* CE840 001CE740 00000000 */   nop
/* CE844 001CE744 F001023C */  lui        $2, %hi(D_1F00150)
/* CE848 001CE748 50014424 */  addiu      $4, $2, %lo(D_1F00150)
/* CE84C 001CE74C F001023C */  lui        $2, %hi(D_1F00340)
/* CE850 001CE750 40034524 */  addiu      $5, $2, %lo(D_1F00340)
/* CE854 001CE754 60000624 */  addiu      $6, $0, 0x60
/* CE858 001CE758 089E050C */  jal        Initialize__13CTextureAnimeFP13CTexAnimeDatai
/* CE85C 001CE75C 00000000 */   nop
/* CE860 001CE760 2826A072 */  paddub     $4, $21, $0
/* CE864 001CE764 2A00023C */  lui        $2, %hi(_809_2)
/* CE868 001CE768 A8C24524 */  addiu      $5, $2, %lo(_809_2)
/* CE86C 001CE76C 1C02A627 */  addiu      $6, $sp, 0x21C
/* CE870 001CE770 C8FD040C */  jal        GetPackFile__FPUiPcPi
/* CE874 001CE774 00000000 */   nop
/* CE878 001CE778 28B64070 */  paddub     $22, $2, $0
/* CE87C 001CE77C 1800C012 */  beqz       $22, .L001CE7E0
/* CE880 001CE780 00000000 */   nop
/* CE884 001CE784 28960070 */  paddub     $18, $0, $0
/* CE888 001CE788 0C000010 */  b          .L001CE7BC
/* CE88C 001CE78C 00000000 */   nop
.L001CE790:
/* CE890 001CE790 80101200 */  sll        $2, $18, 2
/* CE894 001CE794 21105200 */  addu       $2, $2, $18
/* CE898 001CE798 40100200 */  sll        $2, $2, 1
/* CE89C 001CE79C 21105200 */  addu       $2, $2, $18
/* CE8A0 001CE7A0 C0180200 */  sll        $3, $2, 3
/* CE8A4 001CE7A4 F001023C */  lui        $2, %hi(D_1F00340)
/* CE8A8 001CE7A8 40034224 */  addiu      $2, $2, %lo(D_1F00340)
/* CE8AC 001CE7AC 21204300 */  addu       $4, $2, $3
/* CE8B0 001CE7B0 349C050C */  jal        Initialize__13CTexAnimeDataFv
/* CE8B4 001CE7B4 00000000 */   nop
/* CE8B8 001CE7B8 01005226 */  addiu      $18, $18, 0x1
.L001CE7BC:
/* CE8BC 001CE7BC 6000422A */  slti       $2, $18, 0x60
/* CE8C0 001CE7C0 F3FF4014 */  bnez       $2, .L001CE790
/* CE8C4 001CE7C4 00000000 */   nop
/* CE8C8 001CE7C8 F001023C */  lui        $2, %hi(D_1F00150)
/* CE8CC 001CE7CC 50014424 */  addiu      $4, $2, %lo(D_1F00150)
/* CE8D0 001CE7D0 282EC072 */  paddub     $5, $22, $0
/* CE8D4 001CE7D4 1C02A68F */  lw         $6, 0x21C($sp)
/* CE8D8 001CE7D8 F09E050C */  jal        LoadCFGFile__13CTextureAnimeFPci
/* CE8DC 001CE7DC 00000000 */   nop
.L001CE7E0:
/* CE8E0 001CE7E0 2800013C */  lui        $at, (0x280000 >> 16)
/* CE8E4 001CE7E4 C0A0328C */  lw         $18, -0x5F40($at)
/* CE8E8 001CE7E8 00006CC6 */  lwc1       $f12, 0x0($19)
/* CE8EC 001CE7EC 2C44040C */  jal        fptosi
/* CE8F0 001CE7F0 00000000 */   nop
/* CE8F4 001CE7F4 36004216 */  bne        $18, $2, .L001CE8D0
/* CE8F8 001CE7F8 00000000 */   nop
/* CE8FC 001CE7FC 9000A427 */  addiu      $4, $sp, 0x90
/* CE900 001CE800 D801023C */  lui        $2, %hi(pathName)
/* CE904 001CE804 201E4524 */  addiu      $5, $2, %lo(pathName)
/* CE908 001CE808 5A15040C */  jal        strcpy
/* CE90C 001CE80C 00000000 */   nop
/* CE910 001CE810 C0101000 */  sll        $2, $16, 3
/* CE914 001CE814 21105000 */  addu       $2, $2, $16
/* CE918 001CE818 80180200 */  sll        $3, $2, 2
/* CE91C 001CE81C D601023C */  lui        $2, %hi(argStrBuff)
/* CE920 001CE820 205C4224 */  addiu      $2, $2, %lo(argStrBuff)
/* CE924 001CE824 21904300 */  addu       $18, $2, $3
/* CE928 001CE828 9000A427 */  addiu      $4, $sp, 0x90
/* CE92C 001CE82C 282E4072 */  paddub     $5, $18, $0
/* CE930 001CE830 BC14040C */  jal        strcat
/* CE934 001CE834 00000000 */   nop
/* CE938 001CE838 2A00023C */  lui        $2, %hi(_810)
/* CE93C 001CE83C B8C24424 */  addiu      $4, $2, %lo(_810)
/* CE940 001CE840 282E4072 */  paddub     $5, $18, $0
/* CE944 001CE844 A611040C */  jal        printf
/* CE948 001CE848 00000000 */   nop
/* CE94C 001CE84C 2826A072 */  paddub     $4, $21, $0
/* CE950 001CE850 2A00023C */  lui        $2, %hi(_811)
/* CE954 001CE854 C0C24524 */  addiu      $5, $2, %lo(_811)
/* CE958 001CE858 1C02A627 */  addiu      $6, $sp, 0x21C
/* CE95C 001CE85C C8FD040C */  jal        GetPackFile__FPUiPcPi
/* CE960 001CE860 00000000 */   nop
/* CE964 001CE864 DC01A327 */  addiu      $3, $sp, 0x1DC
/* CE968 001CE868 000062AC */  sw         $2, 0x0($3)
/* CE96C 001CE86C 0000628C */  lw         $2, 0x0($3)
/* CE970 001CE870 04004014 */  bnez       $2, .L001CE884
/* CE974 001CE874 00000000 */   nop
/* CE978 001CE878 FFFF0424 */  addiu      $4, $0, -0x1
/* CE97C 001CE87C DC05040C */  jal        exit_2
/* CE980 001CE880 00000000 */   nop
.L001CE884:
/* CE984 001CE884 C701023C */  lui        $2, %hi(TexManager)
/* CE988 001CE888 70584424 */  addiu      $4, $2, %lo(TexManager)
/* CE98C 001CE88C 0E000524 */  addiu      $5, $0, 0xE
/* CE990 001CE890 C0CD040C */  jal        DeleteTextureBlock__15CTextureManagerFi
/* CE994 001CE894 00000000 */   nop
/* CE998 001CE898 C701023C */  lui        $2, %hi(TexManager)
/* CE99C 001CE89C 70584424 */  addiu      $4, $2, %lo(TexManager)
/* CE9A0 001CE8A0 98CE040C */  jal        CleanUpTextureList__15CTextureManagerFv
/* CE9A4 001CE8A4 00000000 */   nop
/* CE9A8 001CE8A8 C701023C */  lui        $2, %hi(TexManager)
/* CE9AC 001CE8AC 70584424 */  addiu      $4, $2, %lo(TexManager)
/* CE9B0 001CE8B0 FCCD040C */  jal        CleanUpBuffer__15CTextureManagerFv
/* CE9B4 001CE8B4 00000000 */   nop
/* CE9B8 001CE8B8 C701023C */  lui        $2, %hi(TexManager)
/* CE9BC 001CE8BC 70584424 */  addiu      $4, $2, %lo(TexManager)
/* CE9C0 001CE8C0 FFFF0524 */  addiu      $5, $0, -0x1
/* CE9C4 001CE8C4 D001A627 */  addiu      $6, $sp, 0x1D0
/* CE9C8 001CE8C8 C8CF040C */  jal        LoadTextureBlock__15CTextureManagerFiP17LOADTEXTURE_INFO2
/* CE9CC 001CE8CC 00000000 */   nop
.L001CE8D0:
/* CE9D0 001CE8D0 2800013C */  lui        $at, (0x280000 >> 16)
/* CE9D4 001CE8D4 98A2328C */  lw         $18, -0x5D68($at)
/* CE9D8 001CE8D8 00006CC6 */  lwc1       $f12, 0x0($19)
/* CE9DC 001CE8DC 2C44040C */  jal        fptosi
/* CE9E0 001CE8E0 00000000 */   nop
/* CE9E4 001CE8E4 2E004216 */  bne        $18, $2, .L001CE9A0
/* CE9E8 001CE8E8 00000000 */   nop
/* CE9EC 001CE8EC 9000A427 */  addiu      $4, $sp, 0x90
/* CE9F0 001CE8F0 D801023C */  lui        $2, %hi(pathName)
/* CE9F4 001CE8F4 201E4524 */  addiu      $5, $2, %lo(pathName)
/* CE9F8 001CE8F8 5A15040C */  jal        strcpy
/* CE9FC 001CE8FC 00000000 */   nop
/* CEA00 001CE900 C0101000 */  sll        $2, $16, 3
/* CEA04 001CE904 21105000 */  addu       $2, $2, $16
/* CEA08 001CE908 80180200 */  sll        $3, $2, 2
/* CEA0C 001CE90C D601023C */  lui        $2, %hi(argStrBuff)
/* CEA10 001CE910 205C4224 */  addiu      $2, $2, %lo(argStrBuff)
/* CEA14 001CE914 21284300 */  addu       $5, $2, $3
/* CEA18 001CE918 9000A427 */  addiu      $4, $sp, 0x90
/* CEA1C 001CE91C BC14040C */  jal        strcat
/* CEA20 001CE920 00000000 */   nop
/* CEA24 001CE924 2826A072 */  paddub     $4, $21, $0
/* CEA28 001CE928 9000A527 */  addiu      $5, $sp, 0x90
/* CEA2C 001CE92C 1C02A627 */  addiu      $6, $sp, 0x21C
/* CEA30 001CE930 C8FD040C */  jal        GetPackFile__FPUiPcPi
/* CEA34 001CE934 00000000 */   nop
/* CEA38 001CE938 0002A2AF */  sw         $2, 0x200($sp)
/* CEA3C 001CE93C 0002A28F */  lw         $2, 0x200($sp)
/* CEA40 001CE940 04004014 */  bnez       $2, .L001CE954
/* CEA44 001CE944 00000000 */   nop
/* CEA48 001CE948 FFFF0424 */  addiu      $4, $0, -0x1
/* CEA4C 001CE94C DC05040C */  jal        exit_2
/* CEA50 001CE950 00000000 */   nop
.L001CE954:
/* CEA54 001CE954 C701023C */  lui        $2, %hi(TexManager)
/* CEA58 001CE958 70584424 */  addiu      $4, $2, %lo(TexManager)
/* CEA5C 001CE95C 1F000524 */  addiu      $5, $0, 0x1F
/* CEA60 001CE960 C0CD040C */  jal        DeleteTextureBlock__15CTextureManagerFi
/* CEA64 001CE964 00000000 */   nop
/* CEA68 001CE968 C701023C */  lui        $2, %hi(TexManager)
/* CEA6C 001CE96C 70584424 */  addiu      $4, $2, %lo(TexManager)
/* CEA70 001CE970 98CE040C */  jal        CleanUpTextureList__15CTextureManagerFv
/* CEA74 001CE974 00000000 */   nop
/* CEA78 001CE978 C701023C */  lui        $2, %hi(TexManager)
/* CEA7C 001CE97C 70584424 */  addiu      $4, $2, %lo(TexManager)
/* CEA80 001CE980 FCCD040C */  jal        CleanUpBuffer__15CTextureManagerFv
/* CEA84 001CE984 00000000 */   nop
/* CEA88 001CE988 C701023C */  lui        $2, %hi(TexManager)
/* CEA8C 001CE98C 70584424 */  addiu      $4, $2, %lo(TexManager)
/* CEA90 001CE990 FFFF0524 */  addiu      $5, $0, -0x1
/* CEA94 001CE994 0002A627 */  addiu      $6, $sp, 0x200
/* CEA98 001CE998 C8CF040C */  jal        LoadTextureBlock__15CTextureManagerFiP17LOADTEXTURE_INFO2
/* CEA9C 001CE99C 00000000 */   nop
.L001CE9A0:
/* CEAA0 001CE9A0 01001026 */  addiu      $16, $16, 0x1
.L001CE9A4:
/* CEAA4 001CE9A4 0C94838F */  lw         $3, -0x6BF4($gp)
/* CEAA8 001CE9A8 2A180302 */  slt        $3, $16, $3
/* CEAAC 001CE9AC F5FE6014 */  bnez       $3, .L001CE584
/* CEAB0 001CE9B0 00000000 */   nop
/* CEAB4 001CE9B4 8000BF7B */  lq         $31, 0x80($sp)
/* CEAB8 001CE9B8 7000B77B */  lq         $23, 0x70($sp)
/* CEABC 001CE9BC 6000B67B */  lq         $22, 0x60($sp)
/* CEAC0 001CE9C0 5000B57B */  lq         $21, 0x50($sp)
/* CEAC4 001CE9C4 4000B47B */  lq         $20, 0x40($sp)
/* CEAC8 001CE9C8 3000B37B */  lq         $19, 0x30($sp)
/* CEACC 001CE9CC 2000B27B */  lq         $18, 0x20($sp)
/* CEAD0 001CE9D0 1000B17B */  lq         $17, 0x10($sp)
/* CEAD4 001CE9D4 0000B07B */  lq         $16, 0x0($sp)
/* CEAD8 001CE9D8 2002BD27 */  addiu      $sp, $sp, 0x220
/* CEADC 001CE9DC 0800E003 */  jr         $31
/* CEAE0 001CE9E0 00000000 */   nop
/* CEAE4 001CE9E4 00000000 */  nop
/* CEAE8 001CE9E8 00000000 */  nop
/* CEAEC 001CE9EC 00000000 */  nop
