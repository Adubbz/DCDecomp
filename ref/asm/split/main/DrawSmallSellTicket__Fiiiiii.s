.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel DrawSmallSellTicket__Fiiiiii
/* 0EC970 001EC870 A0FFBD27 */  addiu       $29, $29, -0x60
/* 0EC974 001EC874 2000BF7F */  sq          $31, 0x20($29)
/* 0EC978 001EC878 1000B17F */  sq          $17, 0x10($29)
/* 0EC97C 001EC87C 0000B07F */  sq          $16, 0x0($29)
/* 0EC980 001EC880 288E2071 */  paddub      $17, $9, $0
/* 0EC984 001EC884 1600B024 */  addiu       $16, $5, 0x16
/* 0EC988 001EC888 1800C324 */  addiu       $3, $6, 0x18
/* 0EC98C 001EC88C 5400A3AF */  sw          $3, 0x54($29)
/* 0EC990 001EC890 B0000324 */  addiu       $3, $0, 0xB0
/* 0EC994 001EC894 5800A3AF */  sw          $3, 0x58($29)
/* 0EC998 001EC898 0C000324 */  addiu       $3, $0, 0xC
/* 0EC99C 001EC89C 5C00A3AF */  sw          $3, 0x5C($29)
/* 0EC9A0 001EC8A0 03008010 */  beqz        $4, .L001EC8B0
/* 0EC9A4 001EC8A4 00000000 */   nop
/* 0EC9A8 001EC8A8 BC000324 */  addiu       $3, $0, 0xBC
/* 0EC9AC 001EC8AC 5800A3AF */  sw          $3, 0x58($29)
.L001EC8B0:
/* 0EC9B0 001EC8B0 5400A48F */  lw          $4, 0x54($29)
/* 0EC9B4 001EC8B4 0C008324 */  addiu       $3, $4, 0xC
/* 0EC9B8 001EC8B8 2A08E300 */  slt         $1, $7, $3
/* 0EC9BC 001EC8BC 04002010 */  beqz        $1, .L001EC8D0
/* 0EC9C0 001EC8C0 00000000 */   nop
/* 0EC9C4 001EC8C4 2A088800 */  slt         $1, $4, $8
/* 0EC9C8 001EC8C8 03002014 */  bnez        $1, .L001EC8D8
/* 0EC9CC 001EC8CC 00000000 */   nop
.L001EC8D0:
/* 0EC9D0 001EC8D0 19000010 */  b           .L001EC938
/* 0EC9D4 001EC8D4 00000000 */   nop
.L001EC8D8:
/* 0EC9D8 001EC8D8 5400A427 */  addiu       $4, $29, 0x54
/* 0EC9DC 001EC8DC 5800A527 */  addiu       $5, $29, 0x58
/* 0EC9E0 001EC8E0 5C00A627 */  addiu       $6, $29, 0x5C
/* 0EC9E4 001EC8E4 A0B7080C */  jal         MenuTextureClip__FRiRiRiii
/* 0EC9E8 001EC8E8 00000000 */   nop
/* 0EC9EC 001EC8EC 5C00A48F */  lw          $4, 0x5C($29)
/* 0EC9F0 001EC8F0 5800A38F */  lw          $3, 0x58($29)
/* 0EC9F4 001EC8F4 30010224 */  addiu       $2, $0, 0x130
/* 0EC9F8 001EC8F8 4000A2AF */  sw          $2, 0x40($29)
/* 0EC9FC 001EC8FC 4400A3AF */  sw          $3, 0x44($29)
/* 0ECA00 001EC900 10000224 */  addiu       $2, $0, 0x10
/* 0ECA04 001EC904 4800A2AF */  sw          $2, 0x48($29)
/* 0ECA08 001EC908 4C00A4AF */  sw          $4, 0x4C($29)
/* 0ECA0C 001EC90C 5400A38F */  lw          $3, 0x54($29)
/* 0ECA10 001EC910 3000B0AF */  sw          $16, 0x30($29)
/* 0ECA14 001EC914 3400A3AF */  sw          $3, 0x34($29)
/* 0ECA18 001EC918 3800A2AF */  sw          $2, 0x38($29)
/* 0ECA1C 001EC91C 3C00A4AF */  sw          $4, 0x3C($29)
/* 0ECA20 001EC920 8894848F */  lw          $4, -0x6B78($28)
/* 0ECA24 001EC924 3000A527 */  addiu       $5, $29, 0x30
/* 0ECA28 001EC928 4000A627 */  addiu       $6, $29, 0x40
/* 0ECA2C 001EC92C 283E2072 */  paddub      $7, $17, $0
/* 0ECA30 001EC930 C8B3080C */  jal         DrawMenu2DSprite__FP8CTexture8CRect_i_8CRect_i_i
/* 0ECA34 001EC934 00000000 */   nop
.L001EC938:
/* 0ECA38 001EC938 2000BF7B */  lq          $31, 0x20($29)
/* 0ECA3C 001EC93C 1000B17B */  lq          $17, 0x10($29)
/* 0ECA40 001EC940 0000B07B */  lq          $16, 0x0($29)
/* 0ECA44 001EC944 6000BD27 */  addiu       $29, $29, 0x60
/* 0ECA48 001EC948 0800E003 */  jr          $31
/* 0ECA4C 001EC94C 00000000 */   nop
