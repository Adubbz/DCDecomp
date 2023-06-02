.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel SetShopTalkMsgPos__Fv
/* EDAC0 001ED9C0 B0FFBD27 */  addiu      $sp, $sp, -0x50
/* EDAC4 001ED9C4 0000BF7F */  sq         $31, 0x0($sp)
/* EDAC8 001ED9C8 1000A427 */  addiu      $4, $sp, 0x10
/* EDACC 001ED9CC D901023C */  lui        $2, %hi(D_1D90490)
/* EDAD0 001ED9D0 90044524 */  addiu      $5, $2, %lo(D_1D90490)
/* EDAD4 001ED9D4 0C86040C */  jal        sceVu0CopyVector
/* EDAD8 001ED9D8 00000000 */   nop
/* EDADC 001ED9DC D901023C */  lui        $2, %hi(MenuCharaFrame)
/* EDAE0 001ED9E0 80044424 */  addiu      $4, $2, %lo(MenuCharaFrame)
/* EDAE4 001ED9E4 4000A527 */  addiu      $5, $sp, 0x40
/* EDAE8 001ED9E8 FC5B050C */  jal        GetScale__7CObjectFPf
/* EDAEC 001ED9EC 00000000 */   nop
/* EDAF0 001ED9F0 1000A1C7 */  lwc1       $f1, 0x10($sp)
/* EDAF4 001ED9F4 0040023C */  lui        $2, (0x40000000 >> 16)
/* EDAF8 001ED9F8 00008244 */  mtc1       $2, $f0
/* EDAFC 001ED9FC 00000000 */  nop
/* EDB00 001EDA00 01080046 */  sub.s      $f0, $f1, $f0
/* EDB04 001EDA04 1000A0E7 */  swc1       $f0, 0x10($sp)
/* EDB08 001EDA08 1400A2C7 */  lwc1       $f2, 0x14($sp)
/* EDB0C 001EDA0C 708181C7 */  lwc1       $f1, -0x7E90($gp)
/* EDB10 001EDA10 D901013C */  lui        $at, (0x1D90534 >> 16)
/* EDB14 001EDA14 340520C4 */  lwc1       $f0, (0x1D90534 & 0xFFFF)($at)
/* EDB18 001EDA18 02080046 */  mul.s      $f0, $f1, $f0
/* EDB1C 001EDA1C 00100046 */  add.s      $f0, $f2, $f0
/* EDB20 001EDA20 1400A0E7 */  swc1       $f0, 0x14($sp)
/* EDB24 001EDA24 803F023C */  lui        $2, (0x3F800000 >> 16)
/* EDB28 001EDA28 1C00A2AF */  sw         $2, 0x1C($sp)
/* EDB2C 001EDA2C 2000A427 */  addiu      $4, $sp, 0x20
/* EDB30 001EDA30 1000A527 */  addiu      $5, $sp, 0x10
/* EDB34 001EDA34 28360070 */  paddub     $6, $0, $0
/* EDB38 001EDA38 38B9040C */  jal        MGRotTransPers2D__FPiPfi
/* EDB3C 001EDA3C 00000000 */   nop
/* EDB40 001EDA40 2000A28F */  lw         $2, 0x20($sp)
/* EDB44 001EDA44 3800A2AF */  sw         $2, 0x38($sp)
/* EDB48 001EDA48 2400A28F */  lw         $2, 0x24($sp)
/* EDB4C 001EDA4C 3C00A2AF */  sw         $2, 0x3C($sp)
/* EDB50 001EDA50 DA01023C */  lui        $2, %hi(CommonMenuMes3)
/* EDB54 001EDA54 103B4424 */  addiu      $4, $2, %lo(CommonMenuMes3)
/* EDB58 001EDA58 3800A527 */  addiu      $5, $sp, 0x38
/* EDB5C 001EDA5C 0C34050C */  jal        AutoSet__6ClsMesFPi
/* EDB60 001EDA60 00000000 */   nop
/* EDB64 001EDA64 0000BF7B */  lq         $31, 0x0($sp)
/* EDB68 001EDA68 5000BD27 */  addiu      $sp, $sp, 0x50
/* EDB6C 001EDA6C 0800E003 */  jr         $31
/* EDB70 001EDA70 00000000 */   nop
/* EDB74 001EDA74 00000000 */  nop
/* EDB78 001EDA78 00000000 */  nop
/* EDB7C 001EDA7C 00000000 */  nop
