.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel DrawMoneyCheckBoard2__Fiii
/* 0EC740 001EC640 40FFBD27 */  addiu       $29, $29, -0xC0
/* 0EC744 001EC644 6000BF7F */  sq          $31, 0x60($29)
/* 0EC748 001EC648 5000B57F */  sq          $21, 0x50($29)
/* 0EC74C 001EC64C 4000B47F */  sq          $20, 0x40($29)
/* 0EC750 001EC650 3000B37F */  sq          $19, 0x30($29)
/* 0EC754 001EC654 2000B27F */  sq          $18, 0x20($29)
/* 0EC758 001EC658 1000B17F */  sq          $17, 0x10($29)
/* 0EC75C 001EC65C 0000B07F */  sq          $16, 0x0($29)
/* 0EC760 001EC660 28AE8070 */  paddub      $21, $4, $0
/* 0EC764 001EC664 28A6A070 */  paddub      $20, $5, $0
/* 0EC768 001EC668 289EC070 */  paddub      $19, $6, $0
/* 0EC76C 001EC66C D0000224 */  addiu       $2, $0, 0xD0
/* 0EC770 001EC670 9000A2AF */  sw          $2, 0x90($29)
/* 0EC774 001EC674 C0000224 */  addiu       $2, $0, 0xC0
/* 0EC778 001EC678 9400A2AF */  sw          $2, 0x94($29)
/* 0EC77C 001EC67C 60000324 */  addiu       $3, $0, 0x60
/* 0EC780 001EC680 9800A3AF */  sw          $3, 0x98($29)
/* 0EC784 001EC684 1C000224 */  addiu       $2, $0, 0x1C
/* 0EC788 001EC688 9C00A2AF */  sw          $2, 0x9C($29)
/* 0EC78C 001EC68C 8000B5AF */  sw          $21, 0x80($29)
/* 0EC790 001EC690 01008226 */  addiu       $2, $20, 0x1
/* 0EC794 001EC694 8400A2AF */  sw          $2, 0x84($29)
/* 0EC798 001EC698 8800A3AF */  sw          $3, 0x88($29)
/* 0EC79C 001EC69C 1B000224 */  addiu       $2, $0, 0x1B
/* 0EC7A0 001EC6A0 8C00A2AF */  sw          $2, 0x8C($29)
/* 0EC7A4 001EC6A4 8894848F */  lw          $4, -0x6B78($28)
/* 0EC7A8 001EC6A8 8000A527 */  addiu       $5, $29, 0x80
/* 0EC7AC 001EC6AC 9000A627 */  addiu       $6, $29, 0x90
/* 0EC7B0 001EC6B0 283E6072 */  paddub      $7, $19, $0
/* 0EC7B4 001EC6B4 C8B3080C */  jal         DrawMenu2DSprite__FP8CTexture8CRect_i_8CRect_i_i
/* 0EC7B8 001EC6B8 00000000 */   nop
/* 0EC7BC 001EC6BC E8AC070C */  jal         BuyMoneyCheck2__Fv
/* 0EC7C0 001EC6C0 00000000 */   nop
/* 0EC7C4 001EC6C4 28664070 */  paddub      $12, $2, $0
/* 0EC7C8 001EC6C8 50AD070C */  jal         SellMoneyCheck2__Fv
/* 0EC7CC 001EC6CC 00000000 */   nop
/* 0EC7D0 001EC6D0 23804C00 */  subu        $16, $2, $12
/* 0EC7D4 001EC6D4 2900023C */  lui         $2, %hi(LIT_1809)
/* 0EC7D8 001EC6D8 20284224 */  addiu       $2, $2, %lo(LIT_1809)
/* 0EC7DC 001EC6DC 7000A327 */  addiu       $3, $29, 0x70
/* 0EC7E0 001EC6E0 00004278 */  lq          $2, 0x0($2)
/* 0EC7E4 001EC6E4 0000627C */  sq          $2, 0x0($3)
/* 0EC7E8 001EC6E8 06000106 */  bgez        $16, .L001EC704
/* 0EC7EC 001EC6EC 00000000 */   nop
/* 0EC7F0 001EC6F0 7400A28F */  lw          $2, 0x74($29)
/* 0EC7F4 001EC6F4 0C004224 */  addiu       $2, $2, 0xC
/* 0EC7F8 001EC6F8 7400A2AF */  sw          $2, 0x74($29)
/* 0EC7FC 001EC6FC 84001124 */  addiu       $17, $0, 0x84
/* 0EC800 001EC700 E8001224 */  addiu       $18, $0, 0xE8
.L001EC704:
/* 0EC804 001EC704 0600001A */  blez        $16, .L001EC720
/* 0EC808 001EC708 00000000 */   nop
/* 0EC80C 001EC70C 7400A28F */  lw          $2, 0x74($29)
/* 0EC810 001EC710 18004224 */  addiu       $2, $2, 0x18
/* 0EC814 001EC714 7400A2AF */  sw          $2, 0x74($29)
/* 0EC818 001EC718 78001124 */  addiu       $17, $0, 0x78
/* 0EC81C 001EC71C F4001224 */  addiu       $18, $0, 0xF4
.L001EC720:
/* 0EC820 001EC720 5400B526 */  addiu       $21, $21, 0x54
/* 0EC824 001EC724 07009426 */  addiu       $20, $20, 0x7
/* 0EC828 001EC728 28260072 */  paddub      $4, $16, $0
/* 0EC82C 001EC72C 7200040C */  jal         abs
/* 0EC830 001EC730 00000000 */   nop
/* 0EC834 001EC734 28264070 */  paddub      $4, $2, $0
/* 0EC838 001EC738 282EA072 */  paddub      $5, $21, $0
/* 0EC83C 001EC73C 28368072 */  paddub      $6, $20, $0
/* 0EC840 001EC740 8894878F */  lw          $7, -0x6B78($28)
/* 0EC844 001EC744 7000A827 */  addiu       $8, $29, 0x70
/* 0EC848 001EC748 01000924 */  addiu       $9, $0, 0x1
/* 0EC84C 001EC74C 28566072 */  paddub      $10, $19, $0
/* 0EC850 001EC750 705F080C */  jal         DrawMenuNumber__FiiiP8CTexture4RECTii
/* 0EC854 001EC754 00000000 */   nop
/* 0EC858 001EC758 28AE4070 */  paddub      $21, $2, $0
/* 0EC85C 001EC75C 11000012 */  beqz        $16, .L001EC7A4
/* 0EC860 001EC760 00000000 */   nop
/* 0EC864 001EC764 B000B1AF */  sw          $17, 0xB0($29)
/* 0EC868 001EC768 B400B2AF */  sw          $18, 0xB4($29)
/* 0EC86C 001EC76C 0C000324 */  addiu       $3, $0, 0xC
/* 0EC870 001EC770 B800A3AF */  sw          $3, 0xB8($29)
/* 0EC874 001EC774 BC00A3AF */  sw          $3, 0xBC($29)
/* 0EC878 001EC778 F4FFA226 */  addiu       $2, $21, -0xC
/* 0EC87C 001EC77C A000A2AF */  sw          $2, 0xA0($29)
/* 0EC880 001EC780 A400B4AF */  sw          $20, 0xA4($29)
/* 0EC884 001EC784 A800A3AF */  sw          $3, 0xA8($29)
/* 0EC888 001EC788 AC00A3AF */  sw          $3, 0xAC($29)
/* 0EC88C 001EC78C 8894848F */  lw          $4, -0x6B78($28)
/* 0EC890 001EC790 A000A527 */  addiu       $5, $29, 0xA0
/* 0EC894 001EC794 B000A627 */  addiu       $6, $29, 0xB0
/* 0EC898 001EC798 283E6072 */  paddub      $7, $19, $0
/* 0EC89C 001EC79C C8B3080C */  jal         DrawMenu2DSprite__FP8CTexture8CRect_i_8CRect_i_i
/* 0EC8A0 001EC7A0 00000000 */   nop
.L001EC7A4:
/* 0EC8A4 001EC7A4 6000BF7B */  lq          $31, 0x60($29)
/* 0EC8A8 001EC7A8 5000B57B */  lq          $21, 0x50($29)
/* 0EC8AC 001EC7AC 4000B47B */  lq          $20, 0x40($29)
/* 0EC8B0 001EC7B0 3000B37B */  lq          $19, 0x30($29)
/* 0EC8B4 001EC7B4 2000B27B */  lq          $18, 0x20($29)
/* 0EC8B8 001EC7B8 1000B17B */  lq          $17, 0x10($29)
/* 0EC8BC 001EC7BC 0000B07B */  lq          $16, 0x0($29)
/* 0EC8C0 001EC7C0 C000BD27 */  addiu       $29, $29, 0xC0
/* 0EC8C4 001EC7C4 0800E003 */  jr          $31
/* 0EC8C8 001EC7C8 00000000 */   nop
/* 0EC8CC 001EC7CC 00000000 */  nop
