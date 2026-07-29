.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel DrawCheckButton__Fiii
/* 0EC8D0 001EC7D0 D0FFBD27 */  addiu       $29, $29, -0x30
/* 0EC8D4 001EC7D4 0000BF7F */  sq          $31, 0x0($29)
/* 0EC8D8 001EC7D8 283EC070 */  paddub      $7, $6, $0
/* 0EC8DC 001EC7DC 30010624 */  addiu       $6, $0, 0x130
/* 0EC8E0 001EC7E0 D901013C */  lui         $1, %hi(ShopMenu + 0x180)
/* 0EC8E4 001EC7E4 50022384 */  lh          $3, %lo(ShopMenu + 0x180)($1)
/* 0EC8E8 001EC7E8 1A000224 */  addiu       $2, $0, 0x1A
/* 0EC8EC 001EC7EC 03006210 */  beq         $3, $2, .L001EC7FC
/* 0EC8F0 001EC7F0 00000000 */   nop
/* 0EC8F4 001EC7F4 09000010 */  b           .L001EC81C
/* 0EC8F8 001EC7F8 00000000 */   nop
.L001EC7FC:
/* 0EC8FC 001EC7FC 90010624 */  addiu       $6, $0, 0x190
/* 0EC900 001EC800 D901013C */  lui         $1, %hi(ShopMenu + 0x184)
/* 0EC904 001EC804 5402228C */  lw          $2, %lo(ShopMenu + 0x184)($1)
/* 0EC908 001EC808 09004128 */  slti        $1, $2, 0x9
/* 0EC90C 001EC80C 03002014 */  bnez        $1, .L001EC81C
/* 0EC910 001EC810 00000000 */   nop
/* 0EC914 001EC814 D901013C */  lui         $1, %hi(ShopMenu + 0x180)
/* 0EC918 001EC818 500220A4 */  sh          $0, %lo(ShopMenu + 0x180)($1)
.L001EC81C:
/* 0EC91C 001EC81C 2000A6AF */  sw          $6, 0x20($29)
/* 0EC920 001EC820 90000224 */  addiu       $2, $0, 0x90
/* 0EC924 001EC824 2400A2AF */  sw          $2, 0x24($29)
/* 0EC928 001EC828 60000324 */  addiu       $3, $0, 0x60
/* 0EC92C 001EC82C 2800A3AF */  sw          $3, 0x28($29)
/* 0EC930 001EC830 20000224 */  addiu       $2, $0, 0x20
/* 0EC934 001EC834 2C00A2AF */  sw          $2, 0x2C($29)
/* 0EC938 001EC838 1000A4AF */  sw          $4, 0x10($29)
/* 0EC93C 001EC83C 1400A5AF */  sw          $5, 0x14($29)
/* 0EC940 001EC840 1800A3AF */  sw          $3, 0x18($29)
/* 0EC944 001EC844 1C00A2AF */  sw          $2, 0x1C($29)
/* 0EC948 001EC848 8894848F */  lw          $4, -0x6B78($28)
/* 0EC94C 001EC84C 1000A527 */  addiu       $5, $29, 0x10
/* 0EC950 001EC850 2000A627 */  addiu       $6, $29, 0x20
/* 0EC954 001EC854 C8B3080C */  jal         DrawMenu2DSprite__FP8CTexture8CRect_i_8CRect_i_i
/* 0EC958 001EC858 00000000 */   nop
/* 0EC95C 001EC85C 0000BF7B */  lq          $31, 0x0($29)
/* 0EC960 001EC860 3000BD27 */  addiu       $29, $29, 0x30
/* 0EC964 001EC864 0800E003 */  jr          $31
/* 0EC968 001EC868 00000000 */   nop
/* 0EC96C 001EC86C 00000000 */  nop
