.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel DrawMoneyCheckBoard2__Fiii
/* EC740 001EC640 40FFBD27 */  addiu      $sp, $sp, -0xC0
/* EC744 001EC644 6000BF7F */  sq         $31, 0x60($sp)
/* EC748 001EC648 5000B57F */  sq         $21, 0x50($sp)
/* EC74C 001EC64C 4000B47F */  sq         $20, 0x40($sp)
/* EC750 001EC650 3000B37F */  sq         $19, 0x30($sp)
/* EC754 001EC654 2000B27F */  sq         $18, 0x20($sp)
/* EC758 001EC658 1000B17F */  sq         $17, 0x10($sp)
/* EC75C 001EC65C 0000B07F */  sq         $16, 0x0($sp)
/* EC760 001EC660 28AE8070 */  paddub     $21, $4, $0
/* EC764 001EC664 28A6A070 */  paddub     $20, $5, $0
/* EC768 001EC668 289EC070 */  paddub     $19, $6, $0
/* EC76C 001EC66C D0000224 */  addiu      $2, $0, 0xD0
/* EC770 001EC670 9000A2AF */  sw         $2, 0x90($sp)
/* EC774 001EC674 C0000224 */  addiu      $2, $0, 0xC0
/* EC778 001EC678 9400A2AF */  sw         $2, 0x94($sp)
/* EC77C 001EC67C 60000324 */  addiu      $3, $0, 0x60
/* EC780 001EC680 9800A3AF */  sw         $3, 0x98($sp)
/* EC784 001EC684 1C000224 */  addiu      $2, $0, 0x1C
/* EC788 001EC688 9C00A2AF */  sw         $2, 0x9C($sp)
/* EC78C 001EC68C 8000B5AF */  sw         $21, 0x80($sp)
/* EC790 001EC690 01008226 */  addiu      $2, $20, 0x1
/* EC794 001EC694 8400A2AF */  sw         $2, 0x84($sp)
/* EC798 001EC698 8800A3AF */  sw         $3, 0x88($sp)
/* EC79C 001EC69C 1B000224 */  addiu      $2, $0, 0x1B
/* EC7A0 001EC6A0 8C00A2AF */  sw         $2, 0x8C($sp)
/* EC7A4 001EC6A4 8894848F */  lw         $4, -0x6B78($gp)
/* EC7A8 001EC6A8 8000A527 */  addiu      $5, $sp, 0x80
/* EC7AC 001EC6AC 9000A627 */  addiu      $6, $sp, 0x90
/* EC7B0 001EC6B0 283E6072 */  paddub     $7, $19, $0
/* EC7B4 001EC6B4 C8B3080C */  jal        DrawMenu2DSprite__FP8CTexture8CRect_i_8CRect_i_i
/* EC7B8 001EC6B8 00000000 */   nop
/* EC7BC 001EC6BC E8AC070C */  jal        BuyMoneyCheck2__Fv
/* EC7C0 001EC6C0 00000000 */   nop
/* EC7C4 001EC6C4 28664070 */  paddub     $12, $2, $0
/* EC7C8 001EC6C8 50AD070C */  jal        SellMoneyCheck2__Fv
/* EC7CC 001EC6CC 00000000 */   nop
/* EC7D0 001EC6D0 23804C00 */  subu       $16, $2, $12
/* EC7D4 001EC6D4 2900023C */  lui        $2, %hi(_1809)
/* EC7D8 001EC6D8 20284224 */  addiu      $2, $2, %lo(_1809)
/* EC7DC 001EC6DC 7000A327 */  addiu      $3, $sp, 0x70
/* EC7E0 001EC6E0 00004278 */  lq         $2, 0x0($2)
/* EC7E4 001EC6E4 0000627C */  sq         $2, 0x0($3)
/* EC7E8 001EC6E8 06000106 */  bgez       $16, .L001EC704
/* EC7EC 001EC6EC 00000000 */   nop
/* EC7F0 001EC6F0 7400A28F */  lw         $2, 0x74($sp)
/* EC7F4 001EC6F4 0C004224 */  addiu      $2, $2, 0xC
/* EC7F8 001EC6F8 7400A2AF */  sw         $2, 0x74($sp)
/* EC7FC 001EC6FC 84001124 */  addiu      $17, $0, 0x84
/* EC800 001EC700 E8001224 */  addiu      $18, $0, 0xE8
.L001EC704:
/* EC804 001EC704 0600001A */  blez       $16, .L001EC720
/* EC808 001EC708 00000000 */   nop
/* EC80C 001EC70C 7400A28F */  lw         $2, 0x74($sp)
/* EC810 001EC710 18004224 */  addiu      $2, $2, 0x18
/* EC814 001EC714 7400A2AF */  sw         $2, 0x74($sp)
/* EC818 001EC718 78001124 */  addiu      $17, $0, 0x78
/* EC81C 001EC71C F4001224 */  addiu      $18, $0, 0xF4
.L001EC720:
/* EC820 001EC720 5400B526 */  addiu      $21, $21, 0x54
/* EC824 001EC724 07009426 */  addiu      $20, $20, 0x7
/* EC828 001EC728 28260072 */  paddub     $4, $16, $0
/* EC82C 001EC72C 7200040C */  jal        abs
/* EC830 001EC730 00000000 */   nop
/* EC834 001EC734 28264070 */  paddub     $4, $2, $0
/* EC838 001EC738 282EA072 */  paddub     $5, $21, $0
/* EC83C 001EC73C 28368072 */  paddub     $6, $20, $0
/* EC840 001EC740 8894878F */  lw         $7, -0x6B78($gp)
/* EC844 001EC744 7000A827 */  addiu      $8, $sp, 0x70
/* EC848 001EC748 01000924 */  addiu      $9, $0, 0x1
/* EC84C 001EC74C 28566072 */  paddub     $10, $19, $0
/* EC850 001EC750 705F080C */  jal        DrawMenuNumber__FiiiP8CTexture4RECTii
/* EC854 001EC754 00000000 */   nop
/* EC858 001EC758 28AE4070 */  paddub     $21, $2, $0
/* EC85C 001EC75C 11000012 */  beqz       $16, .L001EC7A4
/* EC860 001EC760 00000000 */   nop
/* EC864 001EC764 B000B1AF */  sw         $17, 0xB0($sp)
/* EC868 001EC768 B400B2AF */  sw         $18, 0xB4($sp)
/* EC86C 001EC76C 0C000324 */  addiu      $3, $0, 0xC
/* EC870 001EC770 B800A3AF */  sw         $3, 0xB8($sp)
/* EC874 001EC774 BC00A3AF */  sw         $3, 0xBC($sp)
/* EC878 001EC778 F4FFA226 */  addiu      $2, $21, -0xC
/* EC87C 001EC77C A000A2AF */  sw         $2, 0xA0($sp)
/* EC880 001EC780 A400B4AF */  sw         $20, 0xA4($sp)
/* EC884 001EC784 A800A3AF */  sw         $3, 0xA8($sp)
/* EC888 001EC788 AC00A3AF */  sw         $3, 0xAC($sp)
/* EC88C 001EC78C 8894848F */  lw         $4, -0x6B78($gp)
/* EC890 001EC790 A000A527 */  addiu      $5, $sp, 0xA0
/* EC894 001EC794 B000A627 */  addiu      $6, $sp, 0xB0
/* EC898 001EC798 283E6072 */  paddub     $7, $19, $0
/* EC89C 001EC79C C8B3080C */  jal        DrawMenu2DSprite__FP8CTexture8CRect_i_8CRect_i_i
/* EC8A0 001EC7A0 00000000 */   nop
.L001EC7A4:
/* EC8A4 001EC7A4 6000BF7B */  lq         $31, 0x60($sp)
/* EC8A8 001EC7A8 5000B57B */  lq         $21, 0x50($sp)
/* EC8AC 001EC7AC 4000B47B */  lq         $20, 0x40($sp)
/* EC8B0 001EC7B0 3000B37B */  lq         $19, 0x30($sp)
/* EC8B4 001EC7B4 2000B27B */  lq         $18, 0x20($sp)
/* EC8B8 001EC7B8 1000B17B */  lq         $17, 0x10($sp)
/* EC8BC 001EC7BC 0000B07B */  lq         $16, 0x0($sp)
/* EC8C0 001EC7C0 C000BD27 */  addiu      $sp, $sp, 0xC0
/* EC8C4 001EC7C4 0800E003 */  jr         $31
/* EC8C8 001EC7C8 00000000 */   nop
/* EC8CC 001EC7CC 00000000 */  nop
