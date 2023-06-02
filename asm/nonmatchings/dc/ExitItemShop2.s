.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel ExitItemShop2__Fv
/* EBA80 001EB980 F0FFBD27 */  addiu      $sp, $sp, -0x10
/* EBA84 001EB984 0000BF7F */  sq         $31, 0x0($sp)
/* EBA88 001EB988 E4B3070C */  jal        ShopCancelGoodReturn2__Fv
/* EBA8C 001EB98C 00000000 */   nop
/* EBA90 001EB990 E89E070C */  jal        ShopMenuExit__Fv
/* EBA94 001EB994 00000000 */   nop
/* EBA98 001EB998 1C8D848F */  lw         $4, -0x72E4($gp)
/* EBA9C 001EB99C 1B008010 */  beqz       $4, .L001EBA0C
/* EBAA0 001EB9A0 00000000 */   nop
/* EBAA4 001EB9A4 D901013C */  lui        $at, (0x1D900D0 >> 16)
/* EBAA8 001EB9A8 D0002584 */  lh         $5, (0x1D900D0 & 0xFFFF)($at)
/* EBAAC 001EB9AC 01000324 */  addiu      $3, $0, 0x1
/* EBAB0 001EB9B0 1600A314 */  bne        $5, $3, .L001EBA0C
/* EBAB4 001EB9B4 00000000 */   nop
/* EBAB8 001EB9B8 C8000524 */  addiu      $5, $0, 0xC8
/* EBABC 001EB9BC 8060050C */  jal        GetGameFlag__9CSaveDataFi
/* EBAC0 001EB9C0 00000000 */   nop
/* EBAC4 001EB9C4 11004014 */  bnez       $2, .L001EBA0C
/* EBAC8 001EB9C8 00000000 */   nop
/* EBACC 001EB9CC 1C8D848F */  lw         $4, -0x72E4($gp)
/* EBAD0 001EB9D0 7860050C */  jal        GetDngStatus__9CSaveDataFv
/* EBAD4 001EB9D4 00000000 */   nop
/* EBAD8 001EB9D8 28264070 */  paddub     $4, $2, $0
/* EBADC 001EB9DC 0B008010 */  beqz       $4, .L001EBA0C
/* EBAE0 001EB9E0 00000000 */   nop
/* EBAE4 001EB9E4 05000524 */  addiu      $5, $0, 0x5
/* EBAE8 001EB9E8 50F6060C */  jal        SearchItemIndexNo__14CDngStatusDataFi
/* EBAEC 001EB9EC 00000000 */   nop
/* EBAF0 001EB9F0 06004004 */  bltz       $2, .L001EBA0C
/* EBAF4 001EB9F4 00000000 */   nop
/* EBAF8 001EB9F8 1C8D848F */  lw         $4, -0x72E4($gp)
/* EBAFC 001EB9FC C8000524 */  addiu      $5, $0, 0xC8
/* EBB00 001EBA00 01000624 */  addiu      $6, $0, 0x1
/* EBB04 001EBA04 A060050C */  jal        SetGameFlag__9CSaveDataFii
/* EBB08 001EBA08 00000000 */   nop
.L001EBA0C:
/* EBB0C 001EBA0C 0000BF7B */  lq         $31, 0x0($sp)
/* EBB10 001EBA10 1000BD27 */  addiu      $sp, $sp, 0x10
/* EBB14 001EBA14 0800E003 */  jr         $31
/* EBB18 001EBA18 00000000 */   nop
/* EBB1C 001EBA1C 00000000 */  nop
