.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel GetWeaponMsgNo__FP11WEAPON_HAVE
/* 12A8E0 0022A7E0 F0FFBD27 */  addiu      $sp, $sp, -0x10
/* 12A8E4 0022A7E4 0000BF7F */  sq         $31, 0x0($sp)
/* 12A8E8 0022A7E8 04008014 */  bnez       $4, .L0022A7FC
/* 12A8EC 0022A7EC 00000000 */   nop
/* 12A8F0 0022A7F0 28160070 */  paddub     $2, $0, $0
/* 12A8F4 0022A7F4 0C000010 */  b          .L0022A828
/* 12A8F8 0022A7F8 00000000 */   nop
.L0022A7FC:
/* 12A8FC 0022A7FC 00008484 */  lh         $4, 0x0($4)
/* 12A900 0022A800 01018128 */  slti       $at, $4, 0x101
/* 12A904 0022A804 04002010 */  beqz       $at, .L0022A818
/* 12A908 0022A808 00000000 */   nop
/* 12A90C 0022A80C E7030224 */  addiu      $2, $0, 0x3E7
/* 12A910 0022A810 05000010 */  b          .L0022A828
/* 12A914 0022A814 00000000 */   nop
.L0022A818:
/* 12A918 0022A818 7443070C */  jal        GetCommonItemInfo__Fi
/* 12A91C 0022A81C 00000000 */   nop
/* 12A920 0022A820 06004284 */  lh         $2, 0x6($2)
/* 12A924 0022A824 64004224 */  addiu      $2, $2, 0x64
.L0022A828:
/* 12A928 0022A828 0000BF7B */  lq         $31, 0x0($sp)
/* 12A92C 0022A82C 1000BD27 */  addiu      $sp, $sp, 0x10
/* 12A930 0022A830 0800E003 */  jr         $31
/* 12A934 0022A834 00000000 */   nop
/* 12A938 0022A838 00000000 */  nop
/* 12A93C 0022A83C 00000000 */  nop
