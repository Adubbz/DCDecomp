.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel TEIGIImgLoad__FPUiP14CDataAlloc2_1_
/* 0CE550 001CE450 E0FDBD27 */  addiu       $29, $29, -0x220
/* 0CE554 001CE454 8000BF7F */  sq          $31, 0x80($29)
/* 0CE558 001CE458 7000B77F */  sq          $23, 0x70($29)
/* 0CE55C 001CE45C 6000B67F */  sq          $22, 0x60($29)
/* 0CE560 001CE460 5000B57F */  sq          $21, 0x50($29)
/* 0CE564 001CE464 4000B47F */  sq          $20, 0x40($29)
/* 0CE568 001CE468 3000B37F */  sq          $19, 0x30($29)
/* 0CE56C 001CE46C 2000B27F */  sq          $18, 0x20($29)
/* 0CE570 001CE470 1000B17F */  sq          $17, 0x10($29)
/* 0CE574 001CE474 0000B07F */  sq          $16, 0x0($29)
/* 0CE578 001CE478 28AE8070 */  paddub      $21, $4, $0
/* 0CE57C 001CE47C 28A6A070 */  paddub      $20, $5, $0
/* 0CE580 001CE480 288E0070 */  paddub      $17, $0, $0
/* 0CE584 001CE484 D801023C */  lui         $2, %hi(pathName)
/* 0CE588 001CE488 201E4424 */  addiu       $4, $2, %lo(pathName)
/* 0CE58C 001CE48C 2A00023C */  lui         $2, %hi(LIT_766__2)
/* 0CE590 001CE490 88C24524 */  addiu       $5, $2, %lo(LIT_766__2)
/* 0CE594 001CE494 5A15040C */  jal         strcpy
/* 0CE598 001CE498 00000000 */   nop
/* 0CE59C 001CE49C 2800023C */  lui         $2, %hi(LIT_767)
/* 0CE5A0 001CE4A0 10A64524 */  addiu       $5, $2, %lo(LIT_767)
/* 0CE5A4 001CE4A4 9001A427 */  addiu       $4, $29, 0x190
/* 0CE5A8 001CE4A8 03000324 */  addiu       $3, $0, 0x3
.L001CE4AC:
/* 0CE5AC 001CE4AC 0000A278 */  lq          $2, 0x0($5)
/* 0CE5B0 001CE4B0 1000A524 */  addiu       $5, $5, 0x10
/* 0CE5B4 001CE4B4 FFFF6324 */  addiu       $3, $3, -0x1
/* 0CE5B8 001CE4B8 0000827C */  sq          $2, 0x0($4)
/* 0CE5BC 001CE4BC 10008424 */  addiu       $4, $4, 0x10
/* 0CE5C0 001CE4C0 FAFF601C */  bgtz        $3, .L001CE4AC
/* 0CE5C4 001CE4C4 00000000 */   nop
/* 0CE5C8 001CE4C8 0000A3DC */  ld          $3, 0x0($5)
/* 0CE5CC 001CE4CC 0800A2C4 */  lwc1        $f2, 0x8($5)
/* 0CE5D0 001CE4D0 000083FC */  sd          $3, 0x0($4)
/* 0CE5D4 001CE4D4 080082E4 */  swc1        $f2, 0x8($4)
/* 0CE5D8 001CE4D8 2800023C */  lui         $2, %hi(LIT_769)
/* 0CE5DC 001CE4DC 50A64524 */  addiu       $5, $2, %lo(LIT_769)
/* 0CE5E0 001CE4E0 D001A427 */  addiu       $4, $29, 0x1D0
/* 0CE5E4 001CE4E4 02000324 */  addiu       $3, $0, 0x2
.L001CE4E8:
/* 0CE5E8 001CE4E8 0000A278 */  lq          $2, 0x0($5)
/* 0CE5EC 001CE4EC 1000A524 */  addiu       $5, $5, 0x10
/* 0CE5F0 001CE4F0 FFFF6324 */  addiu       $3, $3, -0x1
/* 0CE5F4 001CE4F4 0000827C */  sq          $2, 0x0($4)
/* 0CE5F8 001CE4F8 10008424 */  addiu       $4, $4, 0x10
/* 0CE5FC 001CE4FC FAFF601C */  bgtz        $3, .L001CE4E8
/* 0CE600 001CE500 00000000 */   nop
/* 0CE604 001CE504 0000A2C4 */  lwc1        $f2, 0x0($5)
/* 0CE608 001CE508 000082E4 */  swc1        $f2, 0x0($4)
/* 0CE60C 001CE50C 2800023C */  lui         $2, %hi(LIT_770)
/* 0CE610 001CE510 80A64224 */  addiu       $2, $2, %lo(LIT_770)
/* 0CE614 001CE514 0002A427 */  addiu       $4, $29, 0x200
/* 0CE618 001CE518 00004378 */  lq          $3, 0x0($2)
/* 0CE61C 001CE51C 100042DC */  ld          $2, 0x10($2)
/* 0CE620 001CE520 0000837C */  sq          $3, 0x0($4)
/* 0CE624 001CE524 100082FC */  sd          $2, 0x10($4)
/* 0CE628 001CE528 28860070 */  paddub      $16, $0, $0
/* 0CE62C 001CE52C 07000010 */  b           .L001CE54C
/* 0CE630 001CE530 00000000 */   nop
.L001CE534:
/* 0CE634 001CE534 40000526 */  addiu       $5, $16, 0x40
/* 0CE638 001CE538 C701023C */  lui         $2, %hi(TexManager)
/* 0CE63C 001CE53C 70584424 */  addiu       $4, $2, %lo(TexManager)
/* 0CE640 001CE540 C0CD040C */  jal         DeleteTextureBlock__15CTextureManagerFi
/* 0CE644 001CE544 00000000 */   nop
/* 0CE648 001CE548 01001026 */  addiu       $16, $16, 0x1
.L001CE54C:
/* 0CE64C 001CE54C 0400022A */  slti        $2, $16, 0x4
/* 0CE650 001CE550 F8FF4014 */  bnez        $2, .L001CE534
/* 0CE654 001CE554 00000000 */   nop
/* 0CE658 001CE558 C701023C */  lui         $2, %hi(TexManager)
/* 0CE65C 001CE55C 70584424 */  addiu       $4, $2, %lo(TexManager)
/* 0CE660 001CE560 98CE040C */  jal         CleanUpTextureList__15CTextureManagerFv
/* 0CE664 001CE564 00000000 */   nop
/* 0CE668 001CE568 C701023C */  lui         $2, %hi(TexManager)
/* 0CE66C 001CE56C 70584424 */  addiu       $4, $2, %lo(TexManager)
/* 0CE670 001CE570 FCCD040C */  jal         CleanUpBuffer__15CTextureManagerFv
/* 0CE674 001CE574 00000000 */   nop
/* 0CE678 001CE578 28860070 */  paddub      $16, $0, $0
/* 0CE67C 001CE57C 09010010 */  b           .L001CE9A4
/* 0CE680 001CE580 00000000 */   nop
.L001CE584:
/* 0CE684 001CE584 2800013C */  lui         $1, %hi(TEIGI_SET_PATH)
/* 0CE688 001CE588 B8A1328C */  lw          $18, %lo(TEIGI_SET_PATH)($1)
/* 0CE68C 001CE58C C0101000 */  sll         $2, $16, 3
/* 0CE690 001CE590 21105000 */  addu        $2, $2, $16
/* 0CE694 001CE594 00B10200 */  sll         $22, $2, 4
/* 0CE698 001CE598 D701023C */  lui         $2, %hi(argValBuff__2)
/* 0CE69C 001CE59C 20B64224 */  addiu       $2, $2, %lo(argValBuff__2)
/* 0CE6A0 001CE5A0 21985600 */  addu        $19, $2, $22
/* 0CE6A4 001CE5A4 00006CC6 */  lwc1        $f12, 0x0($19)
/* 0CE6A8 001CE5A8 2C44040C */  jal         fptosi
/* 0CE6AC 001CE5AC 00000000 */   nop
/* 0CE6B0 001CE5B0 0B004216 */  bne         $18, $2, .L001CE5E0
/* 0CE6B4 001CE5B4 00000000 */   nop
/* 0CE6B8 001CE5B8 C0101000 */  sll         $2, $16, 3
/* 0CE6BC 001CE5BC 21105000 */  addu        $2, $2, $16
/* 0CE6C0 001CE5C0 80180200 */  sll         $3, $2, 2
/* 0CE6C4 001CE5C4 D601023C */  lui         $2, %hi(argStrBuff__2)
/* 0CE6C8 001CE5C8 205C4224 */  addiu       $2, $2, %lo(argStrBuff__2)
/* 0CE6CC 001CE5CC 21284300 */  addu        $5, $2, $3
/* 0CE6D0 001CE5D0 D801023C */  lui         $2, %hi(pathName)
/* 0CE6D4 001CE5D4 201E4424 */  addiu       $4, $2, %lo(pathName)
/* 0CE6D8 001CE5D8 5A15040C */  jal         strcpy
/* 0CE6DC 001CE5DC 00000000 */   nop
.L001CE5E0:
/* 0CE6E0 001CE5E0 2800013C */  lui         $1, %hi(TEIGI_GRD_IMG__2)
/* 0CE6E4 001CE5E4 B0A0328C */  lw          $18, %lo(TEIGI_GRD_IMG__2)($1)
/* 0CE6E8 001CE5E8 00006CC6 */  lwc1        $f12, 0x0($19)
/* 0CE6EC 001CE5EC 2C44040C */  jal         fptosi
/* 0CE6F0 001CE5F0 00000000 */   nop
/* 0CE6F4 001CE5F4 7A004216 */  bne         $18, $2, .L001CE7E0
/* 0CE6F8 001CE5F8 00000000 */   nop
/* 0CE6FC 001CE5FC 9000A427 */  addiu       $4, $29, 0x90
/* 0CE700 001CE600 D801023C */  lui         $2, %hi(pathName)
/* 0CE704 001CE604 201E4524 */  addiu       $5, $2, %lo(pathName)
/* 0CE708 001CE608 5A15040C */  jal         strcpy
/* 0CE70C 001CE60C 00000000 */   nop
/* 0CE710 001CE610 C0101000 */  sll         $2, $16, 3
/* 0CE714 001CE614 21105000 */  addu        $2, $2, $16
/* 0CE718 001CE618 80180200 */  sll         $3, $2, 2
/* 0CE71C 001CE61C D601023C */  lui         $2, %hi(argStrBuff__2)
/* 0CE720 001CE620 205C4224 */  addiu       $2, $2, %lo(argStrBuff__2)
/* 0CE724 001CE624 21904300 */  addu        $18, $2, $3
/* 0CE728 001CE628 9000A427 */  addiu       $4, $29, 0x90
/* 0CE72C 001CE62C 282E4072 */  paddub      $5, $18, $0
/* 0CE730 001CE630 BC14040C */  jal         strcat
/* 0CE734 001CE634 00000000 */   nop
/* 0CE738 001CE638 28264072 */  paddub      $4, $18, $0
/* 0CE73C 001CE63C 9000A527 */  addiu       $5, $29, 0x90
/* 0CE740 001CE640 5A15040C */  jal         strcpy
/* 0CE744 001CE644 00000000 */   nop
/* 0CE748 001CE648 0800828E */  lw          $2, 0x8($20)
/* 0CE74C 001CE64C 00190200 */  sll         $3, $2, 4
/* 0CE750 001CE650 0000828E */  lw          $2, 0x0($20)
/* 0CE754 001CE654 21B84300 */  addu        $23, $2, $3
/* 0CE758 001CE658 2826A072 */  paddub      $4, $21, $0
/* 0CE75C 001CE65C 282E4072 */  paddub      $5, $18, $0
/* 0CE760 001CE660 1C02A627 */  addiu       $6, $29, 0x21C
/* 0CE764 001CE664 C8FD040C */  jal         GetPackFile__FPUiPcPi
/* 0CE768 001CE668 00000000 */   nop
/* 0CE76C 001CE66C 28964070 */  paddub      $18, $2, $0
/* 0CE770 001CE670 1C02A28F */  lw          $2, 0x21C($29)
/* 0CE774 001CE674 83110200 */  sra         $2, $2, 6
/* 0CE778 001CE678 01004224 */  addiu       $2, $2, 0x1
/* 0CE77C 001CE67C 80110200 */  sll         $2, $2, 6
/* 0CE780 001CE680 03290200 */  sra         $5, $2, 4
/* 0CE784 001CE684 28268072 */  paddub      $4, $20, $0
/* 0CE788 001CE688 289E040C */  jal         Alloc__14CDataAlloc2_1_Fi
/* 0CE78C 001CE68C 00000000 */   nop
/* 0CE790 001CE690 1C02A68F */  lw          $6, 0x21C($29)
/* 0CE794 001CE694 2826E072 */  paddub      $4, $23, $0
/* 0CE798 001CE698 282E4072 */  paddub      $5, $18, $0
/* 0CE79C 001CE69C EC0C040C */  jal         memcpy
/* 0CE7A0 001CE6A0 00000000 */   nop
/* 0CE7A4 001CE6A4 40101100 */  sll         $2, $17, 1
/* 0CE7A8 001CE6A8 21105100 */  addu        $2, $2, $17
/* 0CE7AC 001CE6AC 80900200 */  sll         $18, $2, 2
/* 0CE7B0 001CE6B0 21185D02 */  addu        $3, $18, $29
/* 0CE7B4 001CE6B4 900177AC */  sw          $23, 0x190($3)
/* 0CE7B8 001CE6B8 03000224 */  addiu       $2, $0, 0x3
/* 0CE7BC 001CE6BC 940162AC */  sw          $2, 0x194($3)
/* 0CE7C0 001CE6C0 D701023C */  lui         $2, %hi(argValBuff__2 + 0x8)
/* 0CE7C4 001CE6C4 28B64224 */  addiu       $2, $2, %lo(argValBuff__2 + 0x8)
/* 0CE7C8 001CE6C8 21105600 */  addu        $2, $2, $22
/* 0CE7CC 001CE6CC 00004CC4 */  lwc1        $f12, 0x0($2)
/* 0CE7D0 001CE6D0 2C44040C */  jal         fptosi
/* 0CE7D4 001CE6D4 00000000 */   nop
/* 0CE7D8 001CE6D8 21185D02 */  addu        $3, $18, $29
/* 0CE7DC 001CE6DC 980162AC */  sw          $2, 0x198($3)
/* 0CE7E0 001CE6E0 01003126 */  addiu       $17, $17, 0x1
/* 0CE7E4 001CE6E4 40101100 */  sll         $2, $17, 1
/* 0CE7E8 001CE6E8 21105100 */  addu        $2, $2, $17
/* 0CE7EC 001CE6EC 80100200 */  sll         $2, $2, 2
/* 0CE7F0 001CE6F0 21105D00 */  addu        $2, $2, $29
/* 0CE7F4 001CE6F4 900140AC */  sw          $0, 0x190($2)
/* 0CE7F8 001CE6F8 C701023C */  lui         $2, %hi(TexManager)
/* 0CE7FC 001CE6FC 70584424 */  addiu       $4, $2, %lo(TexManager)
/* 0CE800 001CE700 03000524 */  addiu       $5, $0, 0x3
/* 0CE804 001CE704 C0CD040C */  jal         DeleteTextureBlock__15CTextureManagerFi
/* 0CE808 001CE708 00000000 */   nop
/* 0CE80C 001CE70C C701023C */  lui         $2, %hi(TexManager)
/* 0CE810 001CE710 70584424 */  addiu       $4, $2, %lo(TexManager)
/* 0CE814 001CE714 98CE040C */  jal         CleanUpTextureList__15CTextureManagerFv
/* 0CE818 001CE718 00000000 */   nop
/* 0CE81C 001CE71C C701023C */  lui         $2, %hi(TexManager)
/* 0CE820 001CE720 70584424 */  addiu       $4, $2, %lo(TexManager)
/* 0CE824 001CE724 FCCD040C */  jal         CleanUpBuffer__15CTextureManagerFv
/* 0CE828 001CE728 00000000 */   nop
/* 0CE82C 001CE72C C701023C */  lui         $2, %hi(TexManager)
/* 0CE830 001CE730 70584424 */  addiu       $4, $2, %lo(TexManager)
/* 0CE834 001CE734 FFFF0524 */  addiu       $5, $0, -0x1
/* 0CE838 001CE738 9001A627 */  addiu       $6, $29, 0x190
/* 0CE83C 001CE73C 30D0040C */  jal         LoadTextureBlockEX__15CTextureManagerFiP17LOADTEXTURE_INFO2
/* 0CE840 001CE740 00000000 */   nop
/* 0CE844 001CE744 F001023C */  lui         $2, %hi(BtTexAnime)
/* 0CE848 001CE748 50014424 */  addiu       $4, $2, %lo(BtTexAnime)
/* 0CE84C 001CE74C F001023C */  lui         $2, %hi(BtTexAnimeData)
/* 0CE850 001CE750 40034524 */  addiu       $5, $2, %lo(BtTexAnimeData)
/* 0CE854 001CE754 60000624 */  addiu       $6, $0, 0x60
/* 0CE858 001CE758 089E050C */  jal         Initialize__13CTextureAnimeFP13CTexAnimeDatai
/* 0CE85C 001CE75C 00000000 */   nop
/* 0CE860 001CE760 2826A072 */  paddub      $4, $21, $0
/* 0CE864 001CE764 2A00023C */  lui         $2, %hi(LIT_809__2)
/* 0CE868 001CE768 A8C24524 */  addiu       $5, $2, %lo(LIT_809__2)
/* 0CE86C 001CE76C 1C02A627 */  addiu       $6, $29, 0x21C
/* 0CE870 001CE770 C8FD040C */  jal         GetPackFile__FPUiPcPi
/* 0CE874 001CE774 00000000 */   nop
/* 0CE878 001CE778 28B64070 */  paddub      $22, $2, $0
/* 0CE87C 001CE77C 1800C012 */  beqz        $22, .L001CE7E0
/* 0CE880 001CE780 00000000 */   nop
/* 0CE884 001CE784 28960070 */  paddub      $18, $0, $0
/* 0CE888 001CE788 0C000010 */  b           .L001CE7BC
/* 0CE88C 001CE78C 00000000 */   nop
.L001CE790:
/* 0CE890 001CE790 80101200 */  sll         $2, $18, 2
/* 0CE894 001CE794 21105200 */  addu        $2, $2, $18
/* 0CE898 001CE798 40100200 */  sll         $2, $2, 1
/* 0CE89C 001CE79C 21105200 */  addu        $2, $2, $18
/* 0CE8A0 001CE7A0 C0180200 */  sll         $3, $2, 3
/* 0CE8A4 001CE7A4 F001023C */  lui         $2, %hi(BtTexAnimeData)
/* 0CE8A8 001CE7A8 40034224 */  addiu       $2, $2, %lo(BtTexAnimeData)
/* 0CE8AC 001CE7AC 21204300 */  addu        $4, $2, $3
/* 0CE8B0 001CE7B0 349C050C */  jal         Initialize__13CTexAnimeDataFv
/* 0CE8B4 001CE7B4 00000000 */   nop
/* 0CE8B8 001CE7B8 01005226 */  addiu       $18, $18, 0x1
.L001CE7BC:
/* 0CE8BC 001CE7BC 6000422A */  slti        $2, $18, 0x60
/* 0CE8C0 001CE7C0 F3FF4014 */  bnez        $2, .L001CE790
/* 0CE8C4 001CE7C4 00000000 */   nop
/* 0CE8C8 001CE7C8 F001023C */  lui         $2, %hi(BtTexAnime)
/* 0CE8CC 001CE7CC 50014424 */  addiu       $4, $2, %lo(BtTexAnime)
/* 0CE8D0 001CE7D0 282EC072 */  paddub      $5, $22, $0
/* 0CE8D4 001CE7D4 1C02A68F */  lw          $6, 0x21C($29)
/* 0CE8D8 001CE7D8 F09E050C */  jal         LoadCFGFile__13CTextureAnimeFPci
/* 0CE8DC 001CE7DC 00000000 */   nop
.L001CE7E0:
/* 0CE8E0 001CE7E0 2800013C */  lui         $1, %hi(TEIGI_FIRE_IMG__2)
/* 0CE8E4 001CE7E4 C0A0328C */  lw          $18, %lo(TEIGI_FIRE_IMG__2)($1)
/* 0CE8E8 001CE7E8 00006CC6 */  lwc1        $f12, 0x0($19)
/* 0CE8EC 001CE7EC 2C44040C */  jal         fptosi
/* 0CE8F0 001CE7F0 00000000 */   nop
/* 0CE8F4 001CE7F4 36004216 */  bne         $18, $2, .L001CE8D0
/* 0CE8F8 001CE7F8 00000000 */   nop
/* 0CE8FC 001CE7FC 9000A427 */  addiu       $4, $29, 0x90
/* 0CE900 001CE800 D801023C */  lui         $2, %hi(pathName)
/* 0CE904 001CE804 201E4524 */  addiu       $5, $2, %lo(pathName)
/* 0CE908 001CE808 5A15040C */  jal         strcpy
/* 0CE90C 001CE80C 00000000 */   nop
/* 0CE910 001CE810 C0101000 */  sll         $2, $16, 3
/* 0CE914 001CE814 21105000 */  addu        $2, $2, $16
/* 0CE918 001CE818 80180200 */  sll         $3, $2, 2
/* 0CE91C 001CE81C D601023C */  lui         $2, %hi(argStrBuff__2)
/* 0CE920 001CE820 205C4224 */  addiu       $2, $2, %lo(argStrBuff__2)
/* 0CE924 001CE824 21904300 */  addu        $18, $2, $3
/* 0CE928 001CE828 9000A427 */  addiu       $4, $29, 0x90
/* 0CE92C 001CE82C 282E4072 */  paddub      $5, $18, $0
/* 0CE930 001CE830 BC14040C */  jal         strcat
/* 0CE934 001CE834 00000000 */   nop
/* 0CE938 001CE838 2A00023C */  lui         $2, %hi(LIT_810)
/* 0CE93C 001CE83C B8C24424 */  addiu       $4, $2, %lo(LIT_810)
/* 0CE940 001CE840 282E4072 */  paddub      $5, $18, $0
/* 0CE944 001CE844 A611040C */  jal         printf
/* 0CE948 001CE848 00000000 */   nop
/* 0CE94C 001CE84C 2826A072 */  paddub      $4, $21, $0
/* 0CE950 001CE850 2A00023C */  lui         $2, %hi(LIT_811)
/* 0CE954 001CE854 C0C24524 */  addiu       $5, $2, %lo(LIT_811)
/* 0CE958 001CE858 1C02A627 */  addiu       $6, $29, 0x21C
/* 0CE95C 001CE85C C8FD040C */  jal         GetPackFile__FPUiPcPi
/* 0CE960 001CE860 00000000 */   nop
/* 0CE964 001CE864 DC01A327 */  addiu       $3, $29, 0x1DC
/* 0CE968 001CE868 000062AC */  sw          $2, 0x0($3)
/* 0CE96C 001CE86C 0000628C */  lw          $2, 0x0($3)
/* 0CE970 001CE870 04004014 */  bnez        $2, .L001CE884
/* 0CE974 001CE874 00000000 */   nop
/* 0CE978 001CE878 FFFF0424 */  addiu       $4, $0, -0x1
/* 0CE97C 001CE87C DC05040C */  jal         exit__2
/* 0CE980 001CE880 00000000 */   nop
.L001CE884:
/* 0CE984 001CE884 C701023C */  lui         $2, %hi(TexManager)
/* 0CE988 001CE888 70584424 */  addiu       $4, $2, %lo(TexManager)
/* 0CE98C 001CE88C 0E000524 */  addiu       $5, $0, 0xE
/* 0CE990 001CE890 C0CD040C */  jal         DeleteTextureBlock__15CTextureManagerFi
/* 0CE994 001CE894 00000000 */   nop
/* 0CE998 001CE898 C701023C */  lui         $2, %hi(TexManager)
/* 0CE99C 001CE89C 70584424 */  addiu       $4, $2, %lo(TexManager)
/* 0CE9A0 001CE8A0 98CE040C */  jal         CleanUpTextureList__15CTextureManagerFv
/* 0CE9A4 001CE8A4 00000000 */   nop
/* 0CE9A8 001CE8A8 C701023C */  lui         $2, %hi(TexManager)
/* 0CE9AC 001CE8AC 70584424 */  addiu       $4, $2, %lo(TexManager)
/* 0CE9B0 001CE8B0 FCCD040C */  jal         CleanUpBuffer__15CTextureManagerFv
/* 0CE9B4 001CE8B4 00000000 */   nop
/* 0CE9B8 001CE8B8 C701023C */  lui         $2, %hi(TexManager)
/* 0CE9BC 001CE8BC 70584424 */  addiu       $4, $2, %lo(TexManager)
/* 0CE9C0 001CE8C0 FFFF0524 */  addiu       $5, $0, -0x1
/* 0CE9C4 001CE8C4 D001A627 */  addiu       $6, $29, 0x1D0
/* 0CE9C8 001CE8C8 C8CF040C */  jal         LoadTextureBlock__15CTextureManagerFiP17LOADTEXTURE_INFO2
/* 0CE9CC 001CE8CC 00000000 */   nop
.L001CE8D0:
/* 0CE9D0 001CE8D0 2800013C */  lui         $1, %hi(TEIGI_MINIMAP_IMG)
/* 0CE9D4 001CE8D4 98A2328C */  lw          $18, %lo(TEIGI_MINIMAP_IMG)($1)
/* 0CE9D8 001CE8D8 00006CC6 */  lwc1        $f12, 0x0($19)
/* 0CE9DC 001CE8DC 2C44040C */  jal         fptosi
/* 0CE9E0 001CE8E0 00000000 */   nop
/* 0CE9E4 001CE8E4 2E004216 */  bne         $18, $2, .L001CE9A0
/* 0CE9E8 001CE8E8 00000000 */   nop
/* 0CE9EC 001CE8EC 9000A427 */  addiu       $4, $29, 0x90
/* 0CE9F0 001CE8F0 D801023C */  lui         $2, %hi(pathName)
/* 0CE9F4 001CE8F4 201E4524 */  addiu       $5, $2, %lo(pathName)
/* 0CE9F8 001CE8F8 5A15040C */  jal         strcpy
/* 0CE9FC 001CE8FC 00000000 */   nop
/* 0CEA00 001CE900 C0101000 */  sll         $2, $16, 3
/* 0CEA04 001CE904 21105000 */  addu        $2, $2, $16
/* 0CEA08 001CE908 80180200 */  sll         $3, $2, 2
/* 0CEA0C 001CE90C D601023C */  lui         $2, %hi(argStrBuff__2)
/* 0CEA10 001CE910 205C4224 */  addiu       $2, $2, %lo(argStrBuff__2)
/* 0CEA14 001CE914 21284300 */  addu        $5, $2, $3
/* 0CEA18 001CE918 9000A427 */  addiu       $4, $29, 0x90
/* 0CEA1C 001CE91C BC14040C */  jal         strcat
/* 0CEA20 001CE920 00000000 */   nop
/* 0CEA24 001CE924 2826A072 */  paddub      $4, $21, $0
/* 0CEA28 001CE928 9000A527 */  addiu       $5, $29, 0x90
/* 0CEA2C 001CE92C 1C02A627 */  addiu       $6, $29, 0x21C
/* 0CEA30 001CE930 C8FD040C */  jal         GetPackFile__FPUiPcPi
/* 0CEA34 001CE934 00000000 */   nop
/* 0CEA38 001CE938 0002A2AF */  sw          $2, 0x200($29)
/* 0CEA3C 001CE93C 0002A28F */  lw          $2, 0x200($29)
/* 0CEA40 001CE940 04004014 */  bnez        $2, .L001CE954
/* 0CEA44 001CE944 00000000 */   nop
/* 0CEA48 001CE948 FFFF0424 */  addiu       $4, $0, -0x1
/* 0CEA4C 001CE94C DC05040C */  jal         exit__2
/* 0CEA50 001CE950 00000000 */   nop
.L001CE954:
/* 0CEA54 001CE954 C701023C */  lui         $2, %hi(TexManager)
/* 0CEA58 001CE958 70584424 */  addiu       $4, $2, %lo(TexManager)
/* 0CEA5C 001CE95C 1F000524 */  addiu       $5, $0, 0x1F
/* 0CEA60 001CE960 C0CD040C */  jal         DeleteTextureBlock__15CTextureManagerFi
/* 0CEA64 001CE964 00000000 */   nop
/* 0CEA68 001CE968 C701023C */  lui         $2, %hi(TexManager)
/* 0CEA6C 001CE96C 70584424 */  addiu       $4, $2, %lo(TexManager)
/* 0CEA70 001CE970 98CE040C */  jal         CleanUpTextureList__15CTextureManagerFv
/* 0CEA74 001CE974 00000000 */   nop
/* 0CEA78 001CE978 C701023C */  lui         $2, %hi(TexManager)
/* 0CEA7C 001CE97C 70584424 */  addiu       $4, $2, %lo(TexManager)
/* 0CEA80 001CE980 FCCD040C */  jal         CleanUpBuffer__15CTextureManagerFv
/* 0CEA84 001CE984 00000000 */   nop
/* 0CEA88 001CE988 C701023C */  lui         $2, %hi(TexManager)
/* 0CEA8C 001CE98C 70584424 */  addiu       $4, $2, %lo(TexManager)
/* 0CEA90 001CE990 FFFF0524 */  addiu       $5, $0, -0x1
/* 0CEA94 001CE994 0002A627 */  addiu       $6, $29, 0x200
/* 0CEA98 001CE998 C8CF040C */  jal         LoadTextureBlock__15CTextureManagerFiP17LOADTEXTURE_INFO2
/* 0CEA9C 001CE99C 00000000 */   nop
.L001CE9A0:
/* 0CEAA0 001CE9A0 01001026 */  addiu       $16, $16, 0x1
.L001CE9A4:
/* 0CEAA4 001CE9A4 0C94838F */  lw          $3, -0x6BF4($28)
/* 0CEAA8 001CE9A8 2A180302 */  slt         $3, $16, $3
/* 0CEAAC 001CE9AC F5FE6014 */  bnez        $3, .L001CE584
/* 0CEAB0 001CE9B0 00000000 */   nop
/* 0CEAB4 001CE9B4 8000BF7B */  lq          $31, 0x80($29)
/* 0CEAB8 001CE9B8 7000B77B */  lq          $23, 0x70($29)
/* 0CEABC 001CE9BC 6000B67B */  lq          $22, 0x60($29)
/* 0CEAC0 001CE9C0 5000B57B */  lq          $21, 0x50($29)
/* 0CEAC4 001CE9C4 4000B47B */  lq          $20, 0x40($29)
/* 0CEAC8 001CE9C8 3000B37B */  lq          $19, 0x30($29)
/* 0CEACC 001CE9CC 2000B27B */  lq          $18, 0x20($29)
/* 0CEAD0 001CE9D0 1000B17B */  lq          $17, 0x10($29)
/* 0CEAD4 001CE9D4 0000B07B */  lq          $16, 0x0($29)
/* 0CEAD8 001CE9D8 2002BD27 */  addiu       $29, $29, 0x220
/* 0CEADC 001CE9DC 0800E003 */  jr          $31
/* 0CEAE0 001CE9E0 00000000 */   nop
/* 0CEAE4 001CE9E4 00000000 */  nop
/* 0CEAE8 001CE9E8 00000000 */  nop
/* 0CEAEC 001CE9EC 00000000 */  nop
