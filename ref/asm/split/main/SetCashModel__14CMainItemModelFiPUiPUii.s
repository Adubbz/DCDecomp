.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel SetCashModel__14CMainItemModelFiPUiPUii
/* 0D46E0 001D45E0 50FFBD27 */  addiu       $29, $29, -0xB0
/* 0D46E4 001D45E4 8000BF7F */  sq          $31, 0x80($29)
/* 0D46E8 001D45E8 7000B77F */  sq          $23, 0x70($29)
/* 0D46EC 001D45EC 6000B67F */  sq          $22, 0x60($29)
/* 0D46F0 001D45F0 5000B57F */  sq          $21, 0x50($29)
/* 0D46F4 001D45F4 4000B47F */  sq          $20, 0x40($29)
/* 0D46F8 001D45F8 3000B37F */  sq          $19, 0x30($29)
/* 0D46FC 001D45FC 2000B27F */  sq          $18, 0x20($29)
/* 0D4700 001D4600 1000B17F */  sq          $17, 0x10($29)
/* 0D4704 001D4604 0000B07F */  sq          $16, 0x0($29)
/* 0D4708 001D4608 28B68070 */  paddub      $22, $4, $0
/* 0D470C 001D460C 28AEA070 */  paddub      $21, $5, $0
/* 0D4710 001D4610 28A6C070 */  paddub      $20, $6, $0
/* 0D4714 001D4614 28BEE070 */  paddub      $23, $7, $0
/* 0D4718 001D4618 289E0071 */  paddub      $19, $8, $0
/* 0D471C 001D461C 5051070C */  jal         GetFreeCashNo__14CMainItemModelFv
/* 0D4720 001D4620 00000000 */   nop
/* 0D4724 001D4624 28864070 */  paddub      $16, $2, $0
/* 0D4728 001D4628 FFFF0224 */  addiu       $2, $0, -0x1
/* 0D472C 001D462C 03000216 */  bne         $16, $2, .L001D463C
/* 0D4730 001D4630 00000000 */   nop
/* 0D4734 001D4634 42000010 */  b           .L001D4740
/* 0D4738 001D4638 00000000 */   nop
.L001D463C:
/* 0D473C 001D463C 00211000 */  sll         $4, $16, 4
/* 0D4740 001D4640 F001023C */  lui         $2, %hi(BtItemCashArea + 0x8)
/* 0D4744 001D4644 E8674224 */  addiu       $2, $2, %lo(BtItemCashArea + 0x8)
/* 0D4748 001D4648 21184400 */  addu        $3, $2, $4
/* 0D474C 001D464C 000060AC */  sw          $0, 0x0($3)
/* 0D4750 001D4650 F001023C */  lui         $2, %hi(BtItemCashArea)
/* 0D4754 001D4654 E0674224 */  addiu       $2, $2, %lo(BtItemCashArea)
/* 0D4758 001D4658 21904400 */  addu        $18, $2, $4
/* 0D475C 001D465C 0000628C */  lw          $2, 0x0($3)
/* 0D4760 001D4660 00190200 */  sll         $3, $2, 4
/* 0D4764 001D4664 0000428E */  lw          $2, 0x0($18)
/* 0D4768 001D4668 21884300 */  addu        $17, $2, $3
/* 0D476C 001D466C 03111300 */  sra         $2, $19, 4
/* 0D4770 001D4670 01004524 */  addiu       $5, $2, 0x1
/* 0D4774 001D4674 28264072 */  paddub      $4, $18, $0
/* 0D4778 001D4678 289E040C */  jal         Alloc__14CDataAlloc2_1_Fi
/* 0D477C 001D467C 00000000 */   nop
/* 0D4780 001D4680 28262072 */  paddub      $4, $17, $0
/* 0D4784 001D4684 282EE072 */  paddub      $5, $23, $0
/* 0D4788 001D4688 28366072 */  paddub      $6, $19, $0
/* 0D478C 001D468C EC0C040C */  jal         memcpy
/* 0D4790 001D4690 00000000 */   nop
/* 0D4794 001D4694 38000526 */  addiu       $5, $16, 0x38
/* 0D4798 001D4698 C701023C */  lui         $2, %hi(TexManager)
/* 0D479C 001D469C 70584424 */  addiu       $4, $2, %lo(TexManager)
/* 0D47A0 001D46A0 C0CD040C */  jal         DeleteTextureBlock__15CTextureManagerFi
/* 0D47A4 001D46A4 00000000 */   nop
/* 0D47A8 001D46A8 C701023C */  lui         $2, %hi(TexManager)
/* 0D47AC 001D46AC 70584424 */  addiu       $4, $2, %lo(TexManager)
/* 0D47B0 001D46B0 FCCD040C */  jal         CleanUpBuffer__15CTextureManagerFv
/* 0D47B4 001D46B4 00000000 */   nop
/* 0D47B8 001D46B8 2800023C */  lui         $2, %hi(LIT_862)
/* 0D47BC 001D46BC E0EA4224 */  addiu       $2, $2, %lo(LIT_862)
/* 0D47C0 001D46C0 9000A627 */  addiu       $6, $29, 0x90
/* 0D47C4 001D46C4 00004378 */  lq          $3, 0x0($2)
/* 0D47C8 001D46C8 100042DC */  ld          $2, 0x10($2)
/* 0D47CC 001D46CC 0000C37C */  sq          $3, 0x0($6)
/* 0D47D0 001D46D0 1000C2FC */  sd          $2, 0x10($6)
/* 0D47D4 001D46D4 9000B1AF */  sw          $17, 0x90($29)
/* 0D47D8 001D46D8 38000526 */  addiu       $5, $16, 0x38
/* 0D47DC 001D46DC 9400A5AF */  sw          $5, 0x94($29)
/* 0D47E0 001D46E0 C701023C */  lui         $2, %hi(TexManager)
/* 0D47E4 001D46E4 70584424 */  addiu       $4, $2, %lo(TexManager)
/* 0D47E8 001D46E8 30D0040C */  jal         LoadTextureBlockEX__15CTextureManagerFiP17LOADTEXTURE_INFO2
/* 0D47EC 001D46EC 00000000 */   nop
/* 0D47F0 001D46F0 28268072 */  paddub      $4, $20, $0
/* 0D47F4 001D46F4 282E4072 */  paddub      $5, $18, $0
/* 0D47F8 001D46F8 28360070 */  paddub      $6, $0, $0
/* 0D47FC 001D46FC 283E0070 */  paddub      $7, $0, $0
/* 0D4800 001D4700 28460070 */  paddub      $8, $0, $0
/* 0D4804 001D4704 AC98040C */  jal         LoadMDSFile__FPUiP14CDataAlloc2_1_iPPcPPc
/* 0D4808 001D4708 00000000 */   nop
/* 0D480C 001D470C 80181000 */  sll         $3, $16, 2
/* 0D4810 001D4710 2118C302 */  addu        $3, $22, $3
/* 0D4814 001D4714 000062AC */  sw          $2, 0x0($3)
/* 0D4818 001D4718 01000224 */  addiu       $2, $0, 0x1
/* 0D481C 001D471C 300062AC */  sw          $2, 0x30($3)
/* 0D4820 001D4720 180075AC */  sw          $21, 0x18($3)
/* 0D4824 001D4724 2826C072 */  paddub      $4, $22, $0
/* 0D4828 001D4728 6451070C */  jal         GetFreeModelNo__14CMainItemModelFv
/* 0D482C 001D472C 00000000 */   nop
/* 0D4830 001D4730 80180200 */  sll         $3, $2, 2
/* 0D4834 001D4734 21187600 */  addu        $3, $3, $22
/* 0D4838 001D4738 480060AC */  sw          $0, 0x48($3)
/* 0D483C 001D473C 880070AC */  sw          $16, 0x88($3)
.L001D4740:
/* 0D4840 001D4740 8000BF7B */  lq          $31, 0x80($29)
/* 0D4844 001D4744 7000B77B */  lq          $23, 0x70($29)
/* 0D4848 001D4748 6000B67B */  lq          $22, 0x60($29)
/* 0D484C 001D474C 5000B57B */  lq          $21, 0x50($29)
/* 0D4850 001D4750 4000B47B */  lq          $20, 0x40($29)
/* 0D4854 001D4754 3000B37B */  lq          $19, 0x30($29)
/* 0D4858 001D4758 2000B27B */  lq          $18, 0x20($29)
/* 0D485C 001D475C 1000B17B */  lq          $17, 0x10($29)
/* 0D4860 001D4760 0000B07B */  lq          $16, 0x0($29)
/* 0D4864 001D4764 B000BD27 */  addiu       $29, $29, 0xB0
/* 0D4868 001D4768 0800E003 */  jr          $31
/* 0D486C 001D476C 00000000 */   nop
