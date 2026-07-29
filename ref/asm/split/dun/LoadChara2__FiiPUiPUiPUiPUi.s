.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel LoadChara2__FiiPUiPUiPUiPUi
/* 00E6C0 01DBA3C0 20FEBD27 */  addiu       $29, $29, -0x1E0
/* 00E6C4 01DBA3C4 7000BF7F */  sq          $31, 0x70($29)
/* 00E6C8 01DBA3C8 6000B67F */  sq          $22, 0x60($29)
/* 00E6CC 01DBA3CC 5000B57F */  sq          $21, 0x50($29)
/* 00E6D0 01DBA3D0 4000B47F */  sq          $20, 0x40($29)
/* 00E6D4 01DBA3D4 3000B37F */  sq          $19, 0x30($29)
/* 00E6D8 01DBA3D8 2000B27F */  sq          $18, 0x20($29)
/* 00E6DC 01DBA3DC 1000B17F */  sq          $17, 0x10($29)
/* 00E6E0 01DBA3E0 0000B07F */  sq          $16, 0x0($29)
/* 00E6E4 01DBA3E4 28AE8070 */  paddub      $21, $4, $0
/* 00E6E8 01DBA3E8 28A6A070 */  paddub      $20, $5, $0
/* 00E6EC 01DBA3EC 289EC070 */  paddub      $19, $6, $0
/* 00E6F0 01DBA3F0 2896E070 */  paddub      $18, $7, $0
/* 00E6F4 01DBA3F4 288E0071 */  paddub      $17, $8, $0
/* 00E6F8 01DBA3F8 28B62071 */  paddub      $22, $9, $0
/* 00E6FC 01DBA3FC 8000A427 */  addiu       $4, $29, 0x80
/* 00E700 01DBA400 509F040C */  jal         __ct__10CFrameAttrFv
/* 00E704 01DBA404 00000000 */   nop
/* 00E708 01DBA408 01000224 */  addiu       $2, $0, 0x1
/* 00E70C 01DBA40C 8C00A2A3 */  sb          $2, 0x8C($29)
/* 00E710 01DBA410 8800A0A3 */  sb          $0, 0x88($29)
/* 00E714 01DBA414 8B00A0A3 */  sb          $0, 0x8B($29)
/* 00E718 01DBA418 0A008016 */  bnez        $20, .L01DBA444_2F5A44
/* 00E71C 01DBA41C 00000000 */   nop
/* 00E720 01DBA420 109D828F */  lw          $2, -0x62F0($28)
/* 00E724 01DBA424 E000A427 */  addiu       $4, $29, 0xE0
/* 00E728 01DBA428 20024524 */  addiu       $5, $2, 0x220
/* 00E72C 01DBA42C 0C86040C */  jal         sceVu0CopyVector
/* 00E730 01DBA430 00000000 */   nop
/* 00E734 01DBA434 109D848F */  lw          $4, -0x62F0($28)
/* 00E738 01DBA438 F000A527 */  addiu       $5, $29, 0xF0
/* 00E73C 01DBA43C 8CA3040C */  jal         GetRotation__6CFrameFPf
/* 00E740 01DBA440 00000000 */   nop
.L01DBA444_2F5A44:
/* 00E744 01DBA444 C701023C */  lui         $2, %hi(TexManager)
/* 00E748 01DBA448 70584424 */  addiu       $4, $2, %lo(TexManager)
/* 00E74C 01DBA44C 11000524 */  addiu       $5, $0, 0x11
/* 00E750 01DBA450 C0CD040C */  jal         DeleteTextureBlock__15CTextureManagerFi
/* 00E754 01DBA454 00000000 */   nop
/* 00E758 01DBA458 C701023C */  lui         $2, %hi(TexManager)
/* 00E75C 01DBA45C 70584424 */  addiu       $4, $2, %lo(TexManager)
/* 00E760 01DBA460 1D000524 */  addiu       $5, $0, 0x1D
/* 00E764 01DBA464 C0CD040C */  jal         DeleteTextureBlock__15CTextureManagerFi
/* 00E768 01DBA468 00000000 */   nop
/* 00E76C 01DBA46C C701023C */  lui         $2, %hi(TexManager)
/* 00E770 01DBA470 70584424 */  addiu       $4, $2, %lo(TexManager)
/* 00E774 01DBA474 10000524 */  addiu       $5, $0, 0x10
/* 00E778 01DBA478 C0CD040C */  jal         DeleteTextureBlock__15CTextureManagerFi
/* 00E77C 01DBA47C 00000000 */   nop
/* 00E780 01DBA480 C701023C */  lui         $2, %hi(TexManager)
/* 00E784 01DBA484 70584424 */  addiu       $4, $2, %lo(TexManager)
/* 00E788 01DBA488 FCCD040C */  jal         CleanUpBuffer__15CTextureManagerFv
/* 00E78C 01DBA48C 00000000 */   nop
/* 00E790 01DBA490 C701023C */  lui         $2, %hi(TexManager)
/* 00E794 01DBA494 70584424 */  addiu       $4, $2, %lo(TexManager)
/* 00E798 01DBA498 98CE040C */  jal         CleanUpTextureList__15CTextureManagerFv
/* 00E79C 01DBA49C 00000000 */   nop
/* 00E7A0 01DBA4A0 F001013C */  lui         $1, %hi(CharaModelBuffer + 0x8)
/* 00E7A4 01DBA4A4 686620AC */  sw          $0, %lo(CharaModelBuffer + 0x8)($1)
/* 00E7A8 01DBA4A8 EA01023C */  lui         $2, %hi(CharaMain)
/* 00E7AC 01DBA4AC 201D4424 */  addiu       $4, $2, %lo(CharaMain)
/* 00E7B0 01DBA4B0 74E6040C */  jal         Initialize__10CCharacterFv
/* 00E7B4 01DBA4B4 00000000 */   nop
/* 00E7B8 01DBA4B8 28860070 */  paddub      $16, $0, $0
/* 00E7BC 01DBA4BC 0C000010 */  b           .L01DBA4F0_2F5AF0
/* 00E7C0 01DBA4C0 00000000 */   nop
.L01DBA4C4_2F5AC4:
/* 00E7C4 01DBA4C4 80101000 */  sll         $2, $16, 2
/* 00E7C8 01DBA4C8 21105000 */  addu        $2, $2, $16
/* 00E7CC 01DBA4CC 40100200 */  sll         $2, $2, 1
/* 00E7D0 01DBA4D0 21105000 */  addu        $2, $2, $16
/* 00E7D4 01DBA4D4 C0180200 */  sll         $3, $2, 3
/* 00E7D8 01DBA4D8 F001023C */  lui         $2, %hi(CharaMainTexAnim)
/* 00E7DC 01DBA4DC 40504224 */  addiu       $2, $2, %lo(CharaMainTexAnim)
/* 00E7E0 01DBA4E0 21204300 */  addu        $4, $2, $3
/* 00E7E4 01DBA4E4 349C050C */  jal         Initialize__13CTexAnimeDataFv
/* 00E7E8 01DBA4E8 00000000 */   nop
/* 00E7EC 01DBA4EC 01001026 */  addiu       $16, $16, 0x1
.L01DBA4F0_2F5AF0:
/* 00E7F0 01DBA4F0 4000022A */  slti        $2, $16, 0x40
/* 00E7F4 01DBA4F4 F3FF4014 */  bnez        $2, .L01DBA4C4_2F5AC4
/* 00E7F8 01DBA4F8 00000000 */   nop
/* 00E7FC 01DBA4FC EA01023C */  lui         $2, %hi(CharaMain)
/* 00E800 01DBA500 201D4424 */  addiu       $4, $2, %lo(CharaMain)
/* 00E804 01DBA504 F001023C */  lui         $2, %hi(CharaMainTexAnim)
/* 00E808 01DBA508 40504524 */  addiu       $5, $2, %lo(CharaMainTexAnim)
/* 00E80C 01DBA50C 40000624 */  addiu       $6, $0, 0x40
/* 00E810 01DBA510 FCDF040C */  jal         InitializeTexAnime__10CCharacterFP13CTexAnimeDatai
/* 00E814 01DBA514 00000000 */   nop
/* 00E818 01DBA518 EA01023C */  lui         $2, %hi(CharaMain)
/* 00E81C 01DBA51C 201D4424 */  addiu       $4, $2, %lo(CharaMain)
/* 00E820 01DBA520 282E6072 */  paddub      $5, $19, $0
/* 00E824 01DBA524 DC01023C */  lui         $2, %hi(LIT_5197)
/* 00E828 01DBA528 68314624 */  addiu       $6, $2, %lo(LIT_5197)
/* 00E82C 01DBA52C F001023C */  lui         $2, %hi(CharaModelBuffer)
/* 00E830 01DBA530 60664724 */  addiu       $7, $2, %lo(CharaModelBuffer)
/* 00E834 01DBA534 11000824 */  addiu       $8, $0, 0x11
/* 00E838 01DBA538 F001023C */  lui         $2, %hi(CharaModelBuffer)
/* 00E83C 01DBA53C 60664924 */  addiu       $9, $2, %lo(CharaModelBuffer)
/* 00E840 01DBA540 28560070 */  paddub      $10, $0, $0
/* 00E844 01DBA544 14E6040C */  jal         LoadPackData2__10CCharacterFPUiPcP14CDataAlloc2_1_iP14CDataAlloc2_1_i
/* 00E848 01DBA548 00000000 */   nop
/* 00E84C 01DBA54C 009D80AF */  sw          $0, -0x6300($28)
/* 00E850 01DBA550 EA01023C */  lui         $2, %hi(CharaHand)
/* 00E854 01DBA554 D02E4424 */  addiu       $4, $2, %lo(CharaHand)
/* 00E858 01DBA558 74E6040C */  jal         Initialize__10CCharacterFv
/* 00E85C 01DBA55C 00000000 */   nop
/* 00E860 01DBA560 01000224 */  addiu       $2, $0, 0x1
/* 00E864 01DBA564 1A00A216 */  bne         $21, $2, .L01DBA5D0_2F5BD0
/* 00E868 01DBA568 00000000 */   nop
/* 00E86C 01DBA56C 0001A427 */  addiu       $4, $29, 0x100
/* 00E870 01DBA570 509F040C */  jal         __ct__10CFrameAttrFv
/* 00E874 01DBA574 00000000 */   nop
/* 00E878 01DBA578 01000224 */  addiu       $2, $0, 0x1
/* 00E87C 01DBA57C 0801A2A3 */  sb          $2, 0x108($29)
/* 00E880 01DBA580 0901A0A3 */  sb          $0, 0x109($29)
/* 00E884 01DBA584 EA01023C */  lui         $2, %hi(CharaHand)
/* 00E888 01DBA588 D02E4424 */  addiu       $4, $2, %lo(CharaHand)
/* 00E88C 01DBA58C 282E6072 */  paddub      $5, $19, $0
/* 00E890 01DBA590 DC01023C */  lui         $2, %hi(LIT_5198)
/* 00E894 01DBA594 78314624 */  addiu       $6, $2, %lo(LIT_5198)
/* 00E898 01DBA598 F001023C */  lui         $2, %hi(CharaModelBuffer)
/* 00E89C 01DBA59C 60664724 */  addiu       $7, $2, %lo(CharaModelBuffer)
/* 00E8A0 01DBA5A0 F001023C */  lui         $2, %hi(CharaModelBuffer)
/* 00E8A4 01DBA5A4 60664824 */  addiu       $8, $2, %lo(CharaModelBuffer)
/* 00E8A8 01DBA5A8 284E0070 */  paddub      $9, $0, $0
/* 00E8AC 01DBA5AC 08E6040C */  jal         LoadPackData__10CCharacterFPUiPcP14CDataAlloc2_1_P14CDataAlloc2_1_P14CDataAlloc2_1_
/* 00E8B0 01DBA5B0 00000000 */   nop
/* 00E8B4 01DBA5B4 EA01013C */  lui         $1, %hi(CharaHand + 0xBC)
/* 00E8B8 01DBA5B8 8C2F248C */  lw          $4, %lo(CharaHand + 0xBC)($1)
/* 00E8BC 01DBA5BC 0001A527 */  addiu       $5, $29, 0x100
/* 00E8C0 01DBA5C0 01000624 */  addiu       $6, $0, 0x1
/* 00E8C4 01DBA5C4 283E0070 */  paddub      $7, $0, $0
/* 00E8C8 01DBA5C8 D4A2040C */  jal         SetAttr__6CFrameFR10CFrameAttrii
/* 00E8CC 01DBA5CC 00000000 */   nop
.L01DBA5D0_2F5BD0:
/* 00E8D0 01DBA5D0 03000224 */  addiu       $2, $0, 0x3
/* 00E8D4 01DBA5D4 1A00A216 */  bne         $21, $2, .L01DBA640_2F5C40
/* 00E8D8 01DBA5D8 00000000 */   nop
/* 00E8DC 01DBA5DC 6001A427 */  addiu       $4, $29, 0x160
/* 00E8E0 01DBA5E0 509F040C */  jal         __ct__10CFrameAttrFv
/* 00E8E4 01DBA5E4 00000000 */   nop
/* 00E8E8 01DBA5E8 01000224 */  addiu       $2, $0, 0x1
/* 00E8EC 01DBA5EC 6801A2A3 */  sb          $2, 0x168($29)
/* 00E8F0 01DBA5F0 6901A0A3 */  sb          $0, 0x169($29)
/* 00E8F4 01DBA5F4 EA01023C */  lui         $2, %hi(CharaHand)
/* 00E8F8 01DBA5F8 D02E4424 */  addiu       $4, $2, %lo(CharaHand)
/* 00E8FC 01DBA5FC 282E6072 */  paddub      $5, $19, $0
/* 00E900 01DBA600 DC01023C */  lui         $2, %hi(LIT_5198)
/* 00E904 01DBA604 78314624 */  addiu       $6, $2, %lo(LIT_5198)
/* 00E908 01DBA608 F001023C */  lui         $2, %hi(CharaModelBuffer)
/* 00E90C 01DBA60C 60664724 */  addiu       $7, $2, %lo(CharaModelBuffer)
/* 00E910 01DBA610 F001023C */  lui         $2, %hi(CharaModelBuffer)
/* 00E914 01DBA614 60664824 */  addiu       $8, $2, %lo(CharaModelBuffer)
/* 00E918 01DBA618 284E0070 */  paddub      $9, $0, $0
/* 00E91C 01DBA61C 08E6040C */  jal         LoadPackData__10CCharacterFPUiPcP14CDataAlloc2_1_P14CDataAlloc2_1_P14CDataAlloc2_1_
/* 00E920 01DBA620 00000000 */   nop
/* 00E924 01DBA624 EA01013C */  lui         $1, %hi(CharaHand + 0xBC)
/* 00E928 01DBA628 8C2F248C */  lw          $4, %lo(CharaHand + 0xBC)($1)
/* 00E92C 01DBA62C 6001A527 */  addiu       $5, $29, 0x160
/* 00E930 01DBA630 01000624 */  addiu       $6, $0, 0x1
/* 00E934 01DBA634 283E0070 */  paddub      $7, $0, $0
/* 00E938 01DBA638 D4A2040C */  jal         SetAttr__6CFrameFR10CFrameAttrii
/* 00E93C 01DBA63C 00000000 */   nop
.L01DBA640_2F5C40:
/* 00E940 01DBA640 EA01013C */  lui         $1, %hi(CharaMain + 0xBC)
/* 00E944 01DBA644 DC1D248C */  lw          $4, %lo(CharaMain + 0xBC)($1)
/* 00E948 01DBA648 8000A527 */  addiu       $5, $29, 0x80
/* 00E94C 01DBA64C 01000624 */  addiu       $6, $0, 0x1
/* 00E950 01DBA650 04000724 */  addiu       $7, $0, 0x4
/* 00E954 01DBA654 D4A2040C */  jal         SetAttr__6CFrameFR10CFrameAttrii
/* 00E958 01DBA658 00000000 */   nop
/* 00E95C 01DBA65C 1B008016 */  bnez        $20, .L01DBA6CC_2F5CCC
/* 00E960 01DBA660 00000000 */   nop
/* 00E964 01DBA664 EA01013C */  lui         $1, %hi(CharaMain + 0xBC)
/* 00E968 01DBA668 DC1D248C */  lw          $4, %lo(CharaMain + 0xBC)($1)
/* 00E96C 01DBA66C E000A527 */  addiu       $5, $29, 0xE0
/* 00E970 01DBA670 B89F040C */  jal         SetPosition__6CFrameFPf
/* 00E974 01DBA674 00000000 */   nop
/* 00E978 01DBA678 F400B027 */  addiu       $16, $29, 0xF4
/* 00E97C 01DBA67C F800B427 */  addiu       $20, $29, 0xF8
/* 00E980 01DBA680 EA01013C */  lui         $1, %hi(CharaMain + 0xBC)
/* 00E984 01DBA684 DC1D248C */  lw          $4, %lo(CharaMain + 0xBC)($1)
/* 00E988 01DBA688 F000ACC7 */  lwc1        $f12, 0xF0($29)
/* 00E98C 01DBA68C 00000DC6 */  lwc1        $f13, 0x0($16)
/* 00E990 01DBA690 00008EC6 */  lwc1        $f14, 0x0($20)
/* 00E994 01DBA694 70A3040C */  jal         SetRotation__6CFrameFfff
/* 00E998 01DBA698 00000000 */   nop
/* 00E99C 01DBA69C EA01023C */  lui         $2, %hi(CharaMain)
/* 00E9A0 01DBA6A0 201D4424 */  addiu       $4, $2, %lo(CharaMain)
/* 00E9A4 01DBA6A4 E000A527 */  addiu       $5, $29, 0xE0
/* 00E9A8 01DBA6A8 38E4040C */  jal         SetPosition__10CCharacterFPf
/* 00E9AC 01DBA6AC 00000000 */   nop
/* 00E9B0 01DBA6B0 EA01023C */  lui         $2, %hi(CharaMain)
/* 00E9B4 01DBA6B4 201D4424 */  addiu       $4, $2, %lo(CharaMain)
/* 00E9B8 01DBA6B8 F000ACC7 */  lwc1        $f12, 0xF0($29)
/* 00E9BC 01DBA6BC 00000DC6 */  lwc1        $f13, 0x0($16)
/* 00E9C0 01DBA6C0 00008EC6 */  lwc1        $f14, 0x0($20)
/* 00E9C4 01DBA6C4 54E4040C */  jal         SetRotation__10CCharacterFfff
/* 00E9C8 01DBA6C8 00000000 */   nop
.L01DBA6CC_2F5CCC:
/* 00E9CC 01DBA6CC EA01013C */  lui         $1, %hi(CharaMain + 0xBC)
/* 00E9D0 01DBA6D0 DC1D228C */  lw          $2, %lo(CharaMain + 0xBC)($1)
/* 00E9D4 01DBA6D4 109D82AF */  sw          $2, -0x62F0($28)
/* 00E9D8 01DBA6D8 05000224 */  addiu       $2, $0, 0x5
/* 00E9DC 01DBA6DC 4D00A216 */  bne         $21, $2, .L01DBA814_2F5E14
/* 00E9E0 01DBA6E0 00000000 */   nop
/* 00E9E4 01DBA6E4 DC01023C */  lui         $2, %hi(LIT_5176)
/* 00E9E8 01DBA6E8 20284224 */  addiu       $2, $2, %lo(LIT_5176)
/* 00E9EC 01DBA6EC C001A427 */  addiu       $4, $29, 0x1C0
/* 00E9F0 01DBA6F0 00004378 */  lq          $3, 0x0($2)
/* 00E9F4 01DBA6F4 100042DC */  ld          $2, 0x10($2)
/* 00E9F8 01DBA6F8 0000837C */  sq          $3, 0x0($4)
/* 00E9FC 01DBA6FC 100082FC */  sd          $2, 0x10($4)
/* 00EA00 01DBA700 28266072 */  paddub      $4, $19, $0
/* 00EA04 01DBA704 DC01023C */  lui         $2, %hi(LIT_5199)
/* 00EA08 01DBA708 88314524 */  addiu       $5, $2, %lo(LIT_5199)
/* 00EA0C 01DBA70C D801A627 */  addiu       $6, $29, 0x1D8
/* 00EA10 01DBA710 C8FD040C */  jal         GetPackFile__FPUiPcPi
/* 00EA14 01DBA714 00000000 */   nop
/* 00EA18 01DBA718 F001013C */  lui         $1, %hi(CharaModelBuffer + 0x8)
/* 00EA1C 01DBA71C 6866238C */  lw          $3, %lo(CharaModelBuffer + 0x8)($1)
/* 00EA20 01DBA720 00210300 */  sll         $4, $3, 4
/* 00EA24 01DBA724 F001013C */  lui         $1, %hi(CharaModelBuffer)
/* 00EA28 01DBA728 6066238C */  lw          $3, %lo(CharaModelBuffer)($1)
/* 00EA2C 01DBA72C 21806400 */  addu        $16, $3, $4
/* 00EA30 01DBA730 D801A68F */  lw          $6, 0x1D8($29)
/* 00EA34 01DBA734 28260072 */  paddub      $4, $16, $0
/* 00EA38 01DBA738 282E4070 */  paddub      $5, $2, $0
/* 00EA3C 01DBA73C EC0C040C */  jal         memcpy
/* 00EA40 01DBA740 00000000 */   nop
/* 00EA44 01DBA744 D801A28F */  lw          $2, 0x1D8($29)
/* 00EA48 01DBA748 83110200 */  sra         $2, $2, 6
/* 00EA4C 01DBA74C 01004224 */  addiu       $2, $2, 0x1
/* 00EA50 01DBA750 80110200 */  sll         $2, $2, 6
/* 00EA54 01DBA754 03110200 */  sra         $2, $2, 4
/* 00EA58 01DBA758 D801A2AF */  sw          $2, 0x1D8($29)
/* 00EA5C 01DBA75C F001023C */  lui         $2, %hi(CharaModelBuffer)
/* 00EA60 01DBA760 60664424 */  addiu       $4, $2, %lo(CharaModelBuffer)
/* 00EA64 01DBA764 D801A58F */  lw          $5, 0x1D8($29)
/* 00EA68 01DBA768 289E040C */  jal         Alloc__14CDataAlloc2_1_Fi
/* 00EA6C 01DBA76C 00000000 */   nop
/* 00EA70 01DBA770 C001B0AF */  sw          $16, 0x1C0($29)
/* 00EA74 01DBA774 C701023C */  lui         $2, %hi(TexManager)
/* 00EA78 01DBA778 70584424 */  addiu       $4, $2, %lo(TexManager)
/* 00EA7C 01DBA77C 46000524 */  addiu       $5, $0, 0x46
/* 00EA80 01DBA780 C0CD040C */  jal         DeleteTextureBlock__15CTextureManagerFi
/* 00EA84 01DBA784 00000000 */   nop
/* 00EA88 01DBA788 C701023C */  lui         $2, %hi(TexManager)
/* 00EA8C 01DBA78C 70584424 */  addiu       $4, $2, %lo(TexManager)
/* 00EA90 01DBA790 46000524 */  addiu       $5, $0, 0x46
/* 00EA94 01DBA794 C001A627 */  addiu       $6, $29, 0x1C0
/* 00EA98 01DBA798 30D0040C */  jal         LoadTextureBlockEX__15CTextureManagerFiP17LOADTEXTURE_INFO2
/* 00EA9C 01DBA79C 00000000 */   nop
/* 00EAA0 01DBA7A0 28266072 */  paddub      $4, $19, $0
/* 00EAA4 01DBA7A4 DC01023C */  lui         $2, %hi(LIT_5200)
/* 00EAA8 01DBA7A8 98314524 */  addiu       $5, $2, %lo(LIT_5200)
/* 00EAAC 01DBA7AC D801A627 */  addiu       $6, $29, 0x1D8
/* 00EAB0 01DBA7B0 C8FD040C */  jal         GetPackFile__FPUiPcPi
/* 00EAB4 01DBA7B4 00000000 */   nop
/* 00EAB8 01DBA7B8 F001013C */  lui         $1, %hi(CharaModelBuffer + 0x8)
/* 00EABC 01DBA7BC 6866238C */  lw          $3, %lo(CharaModelBuffer + 0x8)($1)
/* 00EAC0 01DBA7C0 00210300 */  sll         $4, $3, 4
/* 00EAC4 01DBA7C4 F001013C */  lui         $1, %hi(CharaModelBuffer)
/* 00EAC8 01DBA7C8 6066238C */  lw          $3, %lo(CharaModelBuffer)($1)
/* 00EACC 01DBA7CC 21186400 */  addu        $3, $3, $4
/* 00EAD0 01DBA7D0 EC9D83AF */  sw          $3, -0x6214($28)
/* 00EAD4 01DBA7D4 D801A68F */  lw          $6, 0x1D8($29)
/* 00EAD8 01DBA7D8 EC9D848F */  lw          $4, -0x6214($28)
/* 00EADC 01DBA7DC 282E4070 */  paddub      $5, $2, $0
/* 00EAE0 01DBA7E0 EC0C040C */  jal         memcpy
/* 00EAE4 01DBA7E4 00000000 */   nop
/* 00EAE8 01DBA7E8 D801A28F */  lw          $2, 0x1D8($29)
/* 00EAEC 01DBA7EC 83110200 */  sra         $2, $2, 6
/* 00EAF0 01DBA7F0 01004224 */  addiu       $2, $2, 0x1
/* 00EAF4 01DBA7F4 80110200 */  sll         $2, $2, 6
/* 00EAF8 01DBA7F8 03110200 */  sra         $2, $2, 4
/* 00EAFC 01DBA7FC D801A2AF */  sw          $2, 0x1D8($29)
/* 00EB00 01DBA800 F001023C */  lui         $2, %hi(CharaModelBuffer)
/* 00EB04 01DBA804 60664424 */  addiu       $4, $2, %lo(CharaModelBuffer)
/* 00EB08 01DBA808 D801A58F */  lw          $5, 0x1D8($29)
/* 00EB0C 01DBA80C 289E040C */  jal         Alloc__14CDataAlloc2_1_Fi
/* 00EB10 01DBA810 00000000 */   nop
.L01DBA814_2F5E14:
/* 00EB14 01DBA814 03000224 */  addiu       $2, $0, 0x3
/* 00EB18 01DBA818 1E00A216 */  bne         $21, $2, .L01DBA894_2F5E94
/* 00EB1C 01DBA81C 00000000 */   nop
/* 00EB20 01DBA820 28266072 */  paddub      $4, $19, $0
/* 00EB24 01DBA824 DC01023C */  lui         $2, %hi(LIT_5201)
/* 00EB28 01DBA828 A8314524 */  addiu       $5, $2, %lo(LIT_5201)
/* 00EB2C 01DBA82C DC01A627 */  addiu       $6, $29, 0x1DC
/* 00EB30 01DBA830 C8FD040C */  jal         GetPackFile__FPUiPcPi
/* 00EB34 01DBA834 00000000 */   nop
/* 00EB38 01DBA838 F001013C */  lui         $1, %hi(CharaModelBuffer + 0x8)
/* 00EB3C 01DBA83C 6866238C */  lw          $3, %lo(CharaModelBuffer + 0x8)($1)
/* 00EB40 01DBA840 00210300 */  sll         $4, $3, 4
/* 00EB44 01DBA844 F001013C */  lui         $1, %hi(CharaModelBuffer)
/* 00EB48 01DBA848 6066238C */  lw          $3, %lo(CharaModelBuffer)($1)
/* 00EB4C 01DBA84C 21186400 */  addu        $3, $3, $4
/* 00EB50 01DBA850 EC9D83AF */  sw          $3, -0x6214($28)
/* 00EB54 01DBA854 DC01A68F */  lw          $6, 0x1DC($29)
/* 00EB58 01DBA858 EC9D848F */  lw          $4, -0x6214($28)
/* 00EB5C 01DBA85C 282E4070 */  paddub      $5, $2, $0
/* 00EB60 01DBA860 EC0C040C */  jal         memcpy
/* 00EB64 01DBA864 00000000 */   nop
/* 00EB68 01DBA868 DC01A28F */  lw          $2, 0x1DC($29)
/* 00EB6C 01DBA86C 83110200 */  sra         $2, $2, 6
/* 00EB70 01DBA870 01004224 */  addiu       $2, $2, 0x1
/* 00EB74 01DBA874 80110200 */  sll         $2, $2, 6
/* 00EB78 01DBA878 03110200 */  sra         $2, $2, 4
/* 00EB7C 01DBA87C DC01A2AF */  sw          $2, 0x1DC($29)
/* 00EB80 01DBA880 F001023C */  lui         $2, %hi(CharaModelBuffer)
/* 00EB84 01DBA884 60664424 */  addiu       $4, $2, %lo(CharaModelBuffer)
/* 00EB88 01DBA888 DC01A58F */  lw          $5, 0x1DC($29)
/* 00EB8C 01DBA88C 289E040C */  jal         Alloc__14CDataAlloc2_1_Fi
/* 00EB90 01DBA890 00000000 */   nop
.L01DBA894_2F5E94:
/* 00EB94 01DBA894 F001013C */  lui         $1, %hi(CharaModelBuffer + 0x8)
/* 00EB98 01DBA898 6866248C */  lw          $4, %lo(CharaModelBuffer + 0x8)($1)
/* 00EB9C 01DBA89C 00190400 */  sll         $3, $4, 4
/* 00EBA0 01DBA8A0 F001013C */  lui         $1, %hi(CharaModelBuffer)
/* 00EBA4 01DBA8A4 6066228C */  lw          $2, %lo(CharaModelBuffer)($1)
/* 00EBA8 01DBA8A8 21184300 */  addu        $3, $2, $3
/* 00EBAC 01DBA8AC 0300023C */  lui         $2, (0x33450 >> 16)
/* 00EBB0 01DBA8B0 50344234 */  ori         $2, $2, (0x33450 & 0xFFFF)
/* 00EBB4 01DBA8B4 23104400 */  subu        $2, $2, $4
/* 00EBB8 01DBA8B8 3C100200 */  dsll32      $2, $2, 0
/* 00EBBC 01DBA8BC 3F100200 */  dsra32      $2, $2, 0
/* 00EBC0 01DBA8C0 F001013C */  lui         $1, %hi(WeaponModelBuffer)
/* 00EBC4 01DBA8C4 706623AC */  sw          $3, %lo(WeaponModelBuffer)($1)
/* 00EBC8 01DBA8C8 F001013C */  lui         $1, %hi(WeaponModelBuffer + 0xC)
/* 00EBCC 01DBA8CC 7C6622AC */  sw          $2, %lo(WeaponModelBuffer + 0xC)($1)
/* 00EBD0 01DBA8D0 F001013C */  lui         $1, %hi(WeaponModelBuffer + 0x8)
/* 00EBD4 01DBA8D4 786620AC */  sw          $0, %lo(WeaponModelBuffer + 0x8)($1)
/* 00EBD8 01DBA8D8 28264072 */  paddub      $4, $18, $0
/* 00EBDC 01DBA8DC 282E2072 */  paddub      $5, $17, $0
/* 00EBE0 01DBA8E0 2836C072 */  paddub      $6, $22, $0
/* 00EBE4 01DBA8E4 283EA072 */  paddub      $7, $21, $0
/* 00EBE8 01DBA8E8 28460070 */  paddub      $8, $0, $0
/* 00EBEC 01DBA8EC 10E6760C */  jal         LoadWeapon2__FPUiPUiPUiii
/* 00EBF0 01DBA8F0 00000000 */   nop
/* 00EBF4 01DBA8F4 1CB0760C */  jal         MemoryMapDump__Fv
/* 00EBF8 01DBA8F8 00000000 */   nop
/* 00EBFC 01DBA8FC 7000BF7B */  lq          $31, 0x70($29)
/* 00EC00 01DBA900 6000B67B */  lq          $22, 0x60($29)
/* 00EC04 01DBA904 5000B57B */  lq          $21, 0x50($29)
/* 00EC08 01DBA908 4000B47B */  lq          $20, 0x40($29)
/* 00EC0C 01DBA90C 3000B37B */  lq          $19, 0x30($29)
/* 00EC10 01DBA910 2000B27B */  lq          $18, 0x20($29)
/* 00EC14 01DBA914 1000B17B */  lq          $17, 0x10($29)
/* 00EC18 01DBA918 0000B07B */  lq          $16, 0x0($29)
/* 00EC1C 01DBA91C E001BD27 */  addiu       $29, $29, 0x1E0
/* 00EC20 01DBA920 0800E003 */  jr          $31
/* 00EC24 01DBA924 00000000 */   nop
/* 00EC28 01DBA928 00000000 */  nop
/* 00EC2C 01DBA92C 00000000 */  nop
