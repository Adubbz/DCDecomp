.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel LoadData__Fv__2
/* 009720 01DB5420 90FEBD27 */  addiu       $29, $29, -0x170
/* 009724 01DB5424 2000BF7F */  sq          $31, 0x20($29)
/* 009728 01DB5428 1000B17F */  sq          $17, 0x10($29)
/* 00972C 01DB542C 0000B07F */  sq          $16, 0x0($29)
/* 009730 01DB5430 DD01023C */  lui         $2, %hi(LIT_328__4)
/* 009734 01DB5434 F0634224 */  addiu       $2, $2, %lo(LIT_328__4)
/* 009738 01DB5438 3000A327 */  addiu       $3, $29, 0x30
/* 00973C 01DB543C 00004278 */  lq          $2, 0x0($2)
/* 009740 01DB5440 0000627C */  sq          $2, 0x0($3)
/* 009744 01DB5444 28860070 */  paddub      $16, $0, $0
/* 009748 01DB5448 2F000010 */  b           .L01DB5508_2BAD08
/* 00974C 01DB544C 00000000 */   nop
.L01DB5450_2BAC50:
/* 009750 01DB5450 B0110224 */  addiu       $2, $0, 0x11B0
/* 009754 01DB5454 18880202 */  mult        $17, $16, $2
/* 009758 01DB5458 DF01023C */  lui         $2, %hi(Chara__3)
/* 00975C 01DB545C E0FE4224 */  addiu       $2, $2, %lo(Chara__3)
/* 009760 01DB5460 21205100 */  addu        $4, $2, $17
/* 009764 01DB5464 80101000 */  sll         $2, $16, 2
/* 009768 01DB5468 21105D00 */  addu        $2, $2, $29
/* 00976C 01DB546C 948B858F */  lw          $5, -0x746C($28)
/* 009770 01DB5470 3000468C */  lw          $6, 0x30($2)
/* 009774 01DB5474 DF01023C */  lui         $2, %hi(CharaDataBuffer__2)
/* 009778 01DB5478 00FE4724 */  addiu       $7, $2, %lo(CharaDataBuffer__2)
/* 00977C 01DB547C 28460070 */  paddub      $8, $0, $0
/* 009780 01DB5480 FCE5040C */  jal         LoadPackData__10CCharacterFPUiPcP14CDataAlloc2_1_P14CDataAlloc2_1_
/* 009784 01DB5484 00000000 */   nop
/* 009788 01DB5488 4000A427 */  addiu       $4, $29, 0x40
/* 00978C 01DB548C 509F040C */  jal         __ct__10CFrameAttrFv
/* 009790 01DB5490 00000000 */   nop
/* 009794 01DB5494 4800A0A3 */  sb          $0, 0x48($29)
/* 009798 01DB5498 DF01023C */  lui         $2, %hi(Chara__3 + 0xBC)
/* 00979C 01DB549C 9CFF4224 */  addiu       $2, $2, %lo(Chara__3 + 0xBC)
/* 0097A0 01DB54A0 21105100 */  addu        $2, $2, $17
/* 0097A4 01DB54A4 0000448C */  lw          $4, 0x0($2)
/* 0097A8 01DB54A8 4000A527 */  addiu       $5, $29, 0x40
/* 0097AC 01DB54AC 01000624 */  addiu       $6, $0, 0x1
/* 0097B0 01DB54B0 04000724 */  addiu       $7, $0, 0x4
/* 0097B4 01DB54B4 D4A2040C */  jal         SetAttr__6CFrameFR10CFrameAttrii
/* 0097B8 01DB54B8 00000000 */   nop
/* 0097BC 01DB54BC 2041033C */  lui         $3, (0x41200000 >> 16)
/* 0097C0 01DB54C0 DF01023C */  lui         $2, %hi(Chara__3 + 0x2F0)
/* 0097C4 01DB54C4 D0014224 */  addiu       $2, $2, %lo(Chara__3 + 0x2F0)
/* 0097C8 01DB54C8 21105100 */  addu        $2, $2, $17
/* 0097CC 01DB54CC 000043AC */  sw          $3, 0x0($2)
/* 0097D0 01DB54D0 008180C7 */  lwc1        $f0, -0x7F00($28)
/* 0097D4 01DB54D4 DF01023C */  lui         $2, %hi(Chara__3 + 0x2F8)
/* 0097D8 01DB54D8 D8014224 */  addiu       $2, $2, %lo(Chara__3 + 0x2F8)
/* 0097DC 01DB54DC 21105100 */  addu        $2, $2, $17
/* 0097E0 01DB54E0 000040E4 */  swc1        $f0, 0x0($2)
/* 0097E4 01DB54E4 DF01023C */  lui         $2, %hi(Chara__3 + 0x304)
/* 0097E8 01DB54E8 E4014224 */  addiu       $2, $2, %lo(Chara__3 + 0x304)
/* 0097EC 01DB54EC 21105100 */  addu        $2, $2, $17
/* 0097F0 01DB54F0 000040AC */  sw          $0, 0x0($2)
/* 0097F4 01DB54F4 DF01023C */  lui         $2, %hi(Chara__3 + 0x308)
/* 0097F8 01DB54F8 E8014224 */  addiu       $2, $2, %lo(Chara__3 + 0x308)
/* 0097FC 01DB54FC 21105100 */  addu        $2, $2, $17
/* 009800 01DB5500 000040AC */  sw          $0, 0x0($2)
/* 009804 01DB5504 01001026 */  addiu       $16, $16, 0x1
.L01DB5508_2BAD08:
/* 009808 01DB5508 0400022A */  slti        $2, $16, 0x4
/* 00980C 01DB550C D0FF4014 */  bnez        $2, .L01DB5450_2BAC50
/* 009810 01DB5510 00000000 */   nop
/* 009814 01DB5514 E642023C */  lui         $2, (0x42E60000 >> 16)
/* 009818 01DB5518 DF01013C */  lui         $1, %hi(Chara__3 + 0x14A0)
/* 00981C 01DB551C 801322AC */  sw          $2, %lo(Chara__3 + 0x14A0)($1)
/* 009820 01DB5520 DC4F050C */  jal         wait_now_loading_vsync__Fv
/* 009824 01DB5524 00000000 */   nop
/* 009828 01DB5528 DF01023C */  lui         $2, %hi(UraEventMan + 0xA50)
/* 00982C 01DB552C 00694424 */  addiu       $4, $2, %lo(UraEventMan + 0xA50)
/* 009830 01DB5530 74E6040C */  jal         Initialize__10CCharacterFv
/* 009834 01DB5534 00000000 */   nop
/* 009838 01DB5538 948B848F */  lw          $4, -0x746C($28)
/* 00983C 01DB553C DE01023C */  lui         $2, %hi(LIT_338__2)
/* 009840 01DB5540 08DD4524 */  addiu       $5, $2, %lo(LIT_338__2)
/* 009844 01DB5544 28360070 */  paddub      $6, $0, $0
/* 009848 01DB5548 C8FD040C */  jal         GetPackFile__FPUiPcPi
/* 00984C 01DB554C 00000000 */   nop
/* 009850 01DB5550 28264070 */  paddub      $4, $2, $0
/* 009854 01DB5554 DF01023C */  lui         $2, %hi(CharaDataBuffer__2 + 0x40)
/* 009858 01DB5558 40FE4524 */  addiu       $5, $2, %lo(CharaDataBuffer__2 + 0x40)
/* 00985C 01DB555C 06000624 */  addiu       $6, $0, 0x6
/* 009860 01DB5560 283E0070 */  paddub      $7, $0, $0
/* 009864 01DB5564 28460070 */  paddub      $8, $0, $0
/* 009868 01DB5568 AC98040C */  jal         LoadMDSFile__FPUiP14CDataAlloc2_1_iPPcPPc
/* 00986C 01DB556C 00000000 */   nop
/* 009870 01DB5570 DF01013C */  lui         $1, %hi(UraEventMan + 0xB0C)
/* 009874 01DB5574 BC6922AC */  sw          $2, %lo(UraEventMan + 0xB0C)($1)
/* 009878 01DB5578 A000A427 */  addiu       $4, $29, 0xA0
/* 00987C 01DB557C 509F040C */  jal         __ct__10CFrameAttrFv
/* 009880 01DB5580 00000000 */   nop
/* 009884 01DB5584 A800A0A3 */  sb          $0, 0xA8($29)
/* 009888 01DB5588 DF01013C */  lui         $1, %hi(UraEventMan + 0xB0C)
/* 00988C 01DB558C BC69248C */  lw          $4, %lo(UraEventMan + 0xB0C)($1)
/* 009890 01DB5590 A000A527 */  addiu       $5, $29, 0xA0
/* 009894 01DB5594 01000624 */  addiu       $6, $0, 0x1
/* 009898 01DB5598 04000724 */  addiu       $7, $0, 0x4
/* 00989C 01DB559C D4A2040C */  jal         SetAttr__6CFrameFR10CFrameAttrii
/* 0098A0 01DB55A0 00000000 */   nop
/* 0098A4 01DB55A4 DC4F050C */  jal         wait_now_loading_vsync__Fv
/* 0098A8 01DB55A8 00000000 */   nop
/* 0098AC 01DB55AC DF01023C */  lui         $2, %hi(UraEventMan + 0x1C00)
/* 0098B0 01DB55B0 B07A4424 */  addiu       $4, $2, %lo(UraEventMan + 0x1C00)
/* 0098B4 01DB55B4 74E6040C */  jal         Initialize__10CCharacterFv
/* 0098B8 01DB55B8 00000000 */   nop
/* 0098BC 01DB55BC 948B848F */  lw          $4, -0x746C($28)
/* 0098C0 01DB55C0 DE01023C */  lui         $2, %hi(LIT_339__3)
/* 0098C4 01DB55C4 18DD4524 */  addiu       $5, $2, %lo(LIT_339__3)
/* 0098C8 01DB55C8 28360070 */  paddub      $6, $0, $0
/* 0098CC 01DB55CC C8FD040C */  jal         GetPackFile__FPUiPcPi
/* 0098D0 01DB55D0 00000000 */   nop
/* 0098D4 01DB55D4 28264070 */  paddub      $4, $2, $0
/* 0098D8 01DB55D8 DF01023C */  lui         $2, %hi(CharaDataBuffer__2 + 0x40)
/* 0098DC 01DB55DC 40FE4524 */  addiu       $5, $2, %lo(CharaDataBuffer__2 + 0x40)
/* 0098E0 01DB55E0 06000624 */  addiu       $6, $0, 0x6
/* 0098E4 01DB55E4 283E0070 */  paddub      $7, $0, $0
/* 0098E8 01DB55E8 28460070 */  paddub      $8, $0, $0
/* 0098EC 01DB55EC AC98040C */  jal         LoadMDSFile__FPUiP14CDataAlloc2_1_iPPcPPc
/* 0098F0 01DB55F0 00000000 */   nop
/* 0098F4 01DB55F4 DF01013C */  lui         $1, %hi(UraEventMan + 0x1CBC)
/* 0098F8 01DB55F8 6C7B22AC */  sw          $2, %lo(UraEventMan + 0x1CBC)($1)
/* 0098FC 01DB55FC 0001A427 */  addiu       $4, $29, 0x100
/* 009900 01DB5600 509F040C */  jal         __ct__10CFrameAttrFv
/* 009904 01DB5604 00000000 */   nop
/* 009908 01DB5608 0801A0A3 */  sb          $0, 0x108($29)
/* 00990C 01DB560C DF01013C */  lui         $1, %hi(UraEventMan + 0x1CBC)
/* 009910 01DB5610 6C7B248C */  lw          $4, %lo(UraEventMan + 0x1CBC)($1)
/* 009914 01DB5614 0001A527 */  addiu       $5, $29, 0x100
/* 009918 01DB5618 01000624 */  addiu       $6, $0, 0x1
/* 00991C 01DB561C 04000724 */  addiu       $7, $0, 0x4
/* 009920 01DB5620 D4A2040C */  jal         SetAttr__6CFrameFR10CFrameAttrii
/* 009924 01DB5624 00000000 */   nop
/* 009928 01DB5628 DD01023C */  lui         $2, %hi(LIT_334__5)
/* 00992C 01DB562C 00644224 */  addiu       $2, $2, %lo(LIT_334__5)
/* 009930 01DB5630 6001A327 */  addiu       $3, $29, 0x160
/* 009934 01DB5634 00004278 */  lq          $2, 0x0($2)
/* 009938 01DB5638 0000627C */  sq          $2, 0x0($3)
/* 00993C 01DB563C DF01013C */  lui         $1, %hi(UraEventMan + 0x1CBC)
/* 009940 01DB5640 6C7B248C */  lw          $4, %lo(UraEventMan + 0x1CBC)($1)
/* 009944 01DB5644 DE01023C */  lui         $2, %hi(LIT_340__2)
/* 009948 01DB5648 28DD4524 */  addiu       $5, $2, %lo(LIT_340__2)
/* 00994C 01DB564C C0A1040C */  jal         SearchFrame__6CFrameFPc
/* 009950 01DB5650 00000000 */   nop
/* 009954 01DB5654 28264070 */  paddub      $4, $2, $0
/* 009958 01DB5658 6001A527 */  addiu       $5, $29, 0x160
/* 00995C 01DB565C 48A2040C */  jal         ScaleBoundBox__6CFrameFPf
/* 009960 01DB5660 00000000 */   nop
/* 009964 01DB5664 28D6760C */  jal         InitDancerPos__Fv
/* 009968 01DB5668 00000000 */   nop
/* 00996C 01DB566C DC4F050C */  jal         wait_now_loading_vsync__Fv
/* 009970 01DB5670 00000000 */   nop
/* 009974 01DB5674 948B848F */  lw          $4, -0x746C($28)
/* 009978 01DB5678 DE01023C */  lui         $2, %hi(LIT_341__2)
/* 00997C 01DB567C 30DD4524 */  addiu       $5, $2, %lo(LIT_341__2)
/* 009980 01DB5680 28360070 */  paddub      $6, $0, $0
/* 009984 01DB5684 C8FD040C */  jal         GetPackFile__FPUiPcPi
/* 009988 01DB5688 00000000 */   nop
/* 00998C 01DB568C 28264070 */  paddub      $4, $2, $0
/* 009990 01DB5690 02000524 */  addiu       $5, $0, 0x2
/* 009994 01DB5694 28360070 */  paddub      $6, $0, $0
/* 009998 01DB5698 289D040C */  jal         LoadMDSFile__FPUiii
/* 00999C 01DB569C 00000000 */   nop
/* 0099A0 01DB56A0 E201013C */  lui         $1, %hi(Cloud + 0xBC)
/* 0099A4 01DB56A4 7CE522AC */  sw          $2, %lo(Cloud + 0xBC)($1)
/* 0099A8 01DB56A8 00608044 */  mtc1        $0, $f12
/* 0099AC 01DB56AC 4842023C */  lui         $2, (0x42480000 >> 16)
/* 0099B0 01DB56B0 00688244 */  mtc1        $2, $f13
/* 0099B4 01DB56B4 A041023C */  lui         $2, (0x41A00000 >> 16)
/* 0099B8 01DB56B8 00708244 */  mtc1        $2, $f14
/* 0099BC 01DB56BC E201023C */  lui         $2, %hi(Cloud)
/* 0099C0 01DB56C0 C0E44424 */  addiu       $4, $2, %lo(Cloud)
/* 0099C4 01DB56C4 ECE3040C */  jal         SetPosition__10CCharacterFfff
/* 0099C8 01DB56C8 00000000 */   nop
/* 0099CC 01DB56CC DF01023C */  lui         $2, %hi(MapDataBuffer)
/* 0099D0 01DB56D0 B0FE4424 */  addiu       $4, $2, %lo(MapDataBuffer)
/* 0099D4 01DB56D4 00320524 */  addiu       $5, $0, 0x3200
/* 0099D8 01DB56D8 289E040C */  jal         Alloc__14CDataAlloc2_1_Fi
/* 0099DC 01DB56DC 00000000 */   nop
/* 0099E0 01DB56E0 E09882AF */  sw          $2, -0x6720($28)
/* 0099E4 01DB56E4 D8988427 */  addiu       $4, $28, -0x6728
/* 0099E8 01DB56E8 E098858F */  lw          $5, -0x6720($28)
/* 0099EC 01DB56EC 32000624 */  addiu       $6, $0, 0x32
/* 0099F0 01DB56F0 C892050C */  jal         Initialize__12CEffectGroupFP7CEffecti
/* 0099F4 01DB56F4 00000000 */   nop
/* 0099F8 01DB56F8 D8988427 */  addiu       $4, $28, -0x6728
/* 0099FC 01DB56FC B092050C */  jal         Clear__12CEffectGroupFv
/* 009A00 01DB5700 00000000 */   nop
/* 009A04 01DB5704 948B848F */  lw          $4, -0x746C($28)
/* 009A08 01DB5708 DE01023C */  lui         $2, %hi(LIT_342__2)
/* 009A0C 01DB570C 40DD4524 */  addiu       $5, $2, %lo(LIT_342__2)
/* 009A10 01DB5710 28360070 */  paddub      $6, $0, $0
/* 009A14 01DB5714 C8FD040C */  jal         GetPackFile__FPUiPcPi
/* 009A18 01DB5718 00000000 */   nop
/* 009A1C 01DB571C 28264070 */  paddub      $4, $2, $0
/* 009A20 01DB5720 02000524 */  addiu       $5, $0, 0x2
/* 009A24 01DB5724 28360070 */  paddub      $6, $0, $0
/* 009A28 01DB5728 289D040C */  jal         LoadMDSFile__FPUiii
/* 009A2C 01DB572C 00000000 */   nop
/* 009A30 01DB5730 CC9882AF */  sw          $2, -0x6734($28)
/* 009A34 01DB5734 2000BF7B */  lq          $31, 0x20($29)
/* 009A38 01DB5738 1000B17B */  lq          $17, 0x10($29)
/* 009A3C 01DB573C 0000B07B */  lq          $16, 0x0($29)
/* 009A40 01DB5740 7001BD27 */  addiu       $29, $29, 0x170
/* 009A44 01DB5744 0800E003 */  jr          $31
/* 009A48 01DB5748 00000000 */   nop
/* 009A4C 01DB574C 00000000 */  nop
