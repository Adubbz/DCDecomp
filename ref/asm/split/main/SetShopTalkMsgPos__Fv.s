.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel SetShopTalkMsgPos__Fv
/* 0EDAC0 001ED9C0 B0FFBD27 */  addiu       $29, $29, -0x50
/* 0EDAC4 001ED9C4 0000BF7F */  sq          $31, 0x0($29)
/* 0EDAC8 001ED9C8 1000A427 */  addiu       $4, $29, 0x10
/* 0EDACC 001ED9CC D901023C */  lui         $2, %hi(MenuCharaFrame + 0x10)
/* 0EDAD0 001ED9D0 90044524 */  addiu       $5, $2, %lo(MenuCharaFrame + 0x10)
/* 0EDAD4 001ED9D4 0C86040C */  jal         sceVu0CopyVector
/* 0EDAD8 001ED9D8 00000000 */   nop
/* 0EDADC 001ED9DC D901023C */  lui         $2, %hi(MenuCharaFrame)
/* 0EDAE0 001ED9E0 80044424 */  addiu       $4, $2, %lo(MenuCharaFrame)
/* 0EDAE4 001ED9E4 4000A527 */  addiu       $5, $29, 0x40
/* 0EDAE8 001ED9E8 FC5B050C */  jal         GetScale__7CObjectFPf
/* 0EDAEC 001ED9EC 00000000 */   nop
/* 0EDAF0 001ED9F0 1000A1C7 */  lwc1        $f1, 0x10($29)
/* 0EDAF4 001ED9F4 0040023C */  lui         $2, (0x40000000 >> 16)
/* 0EDAF8 001ED9F8 00008244 */  mtc1        $2, $f0
/* 0EDAFC 001ED9FC 00000000 */  nop
/* 0EDB00 001EDA00 01080046 */  sub.s       $f0, $f1, $f0
/* 0EDB04 001EDA04 1000A0E7 */  swc1        $f0, 0x10($29)
/* 0EDB08 001EDA08 1400A2C7 */  lwc1        $f2, 0x14($29)
/* 0EDB0C 001EDA0C 708181C7 */  lwc1        $f1, -0x7E90($28)
/* 0EDB10 001EDA10 D901013C */  lui         $1, %hi(MenuCharaFrame + 0xB4)
/* 0EDB14 001EDA14 340520C4 */  lwc1        $f0, %lo(MenuCharaFrame + 0xB4)($1)
/* 0EDB18 001EDA18 02080046 */  mul.s       $f0, $f1, $f0
/* 0EDB1C 001EDA1C 00100046 */  add.s       $f0, $f2, $f0
/* 0EDB20 001EDA20 1400A0E7 */  swc1        $f0, 0x14($29)
/* 0EDB24 001EDA24 803F023C */  lui         $2, (0x3F800000 >> 16)
/* 0EDB28 001EDA28 1C00A2AF */  sw          $2, 0x1C($29)
/* 0EDB2C 001EDA2C 2000A427 */  addiu       $4, $29, 0x20
/* 0EDB30 001EDA30 1000A527 */  addiu       $5, $29, 0x10
/* 0EDB34 001EDA34 28360070 */  paddub      $6, $0, $0
/* 0EDB38 001EDA38 38B9040C */  jal         MGRotTransPers2D__FPiPfi
/* 0EDB3C 001EDA3C 00000000 */   nop
/* 0EDB40 001EDA40 2000A28F */  lw          $2, 0x20($29)
/* 0EDB44 001EDA44 3800A2AF */  sw          $2, 0x38($29)
/* 0EDB48 001EDA48 2400A28F */  lw          $2, 0x24($29)
/* 0EDB4C 001EDA4C 3C00A2AF */  sw          $2, 0x3C($29)
/* 0EDB50 001EDA50 DA01023C */  lui         $2, %hi(CommonMenuMes3)
/* 0EDB54 001EDA54 103B4424 */  addiu       $4, $2, %lo(CommonMenuMes3)
/* 0EDB58 001EDA58 3800A527 */  addiu       $5, $29, 0x38
/* 0EDB5C 001EDA5C 0C34050C */  jal         AutoSet__6ClsMesFPi
/* 0EDB60 001EDA60 00000000 */   nop
/* 0EDB64 001EDA64 0000BF7B */  lq          $31, 0x0($29)
/* 0EDB68 001EDA68 5000BD27 */  addiu       $29, $29, 0x50
/* 0EDB6C 001EDA6C 0800E003 */  jr          $31
/* 0EDB70 001EDA70 00000000 */   nop
/* 0EDB74 001EDA74 00000000 */  nop
/* 0EDB78 001EDA78 00000000 */  nop
/* 0EDB7C 001EDA7C 00000000 */  nop
