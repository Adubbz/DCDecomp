.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel SetWepToPos__10CStockItemFiP11WEAPON_HAVE
/* 13F810 0023F710 D0FEBD27 */  addiu      $sp, $sp, -0x130
/* 13F814 0023F714 2000BF7F */  sq         $31, 0x20($sp)
/* 13F818 0023F718 1000B17F */  sq         $17, 0x10($sp)
/* 13F81C 0023F71C 0000B07F */  sq         $16, 0x0($sp)
/* 13F820 0023F720 288EC070 */  paddub     $17, $6, $0
/* 13F824 0023F724 40110500 */  sll        $2, $5, 5
/* 13F828 0023F728 23104500 */  subu       $2, $2, $5
/* 13F82C 0023F72C C0100200 */  sll        $2, $2, 3
/* 13F830 0023F730 21108200 */  addu       $2, $4, $2
/* 13F834 0023F734 F0005024 */  addiu      $16, $2, 0xF0
/* 13F838 0023F738 3000A427 */  addiu      $4, $sp, 0x30
/* 13F83C 0023F73C 282E0072 */  paddub     $5, $16, $0
/* 13F840 0023F740 F8000624 */  addiu      $6, $0, 0xF8
/* 13F844 0023F744 EC0C040C */  jal        memcpy
/* 13F848 0023F748 00000000 */   nop
/* 13F84C 0023F74C 28260072 */  paddub     $4, $16, $0
/* 13F850 0023F750 282E2072 */  paddub     $5, $17, $0
/* 13F854 0023F754 F8000624 */  addiu      $6, $0, 0xF8
/* 13F858 0023F758 EC0C040C */  jal        memcpy
/* 13F85C 0023F75C 00000000 */   nop
/* 13F860 0023F760 28262072 */  paddub     $4, $17, $0
/* 13F864 0023F764 3000A527 */  addiu      $5, $sp, 0x30
/* 13F868 0023F768 F8000624 */  addiu      $6, $0, 0xF8
/* 13F86C 0023F76C EC0C040C */  jal        memcpy
/* 13F870 0023F770 00000000 */   nop
/* 13F874 0023F774 2000BF7B */  lq         $31, 0x20($sp)
/* 13F878 0023F778 1000B17B */  lq         $17, 0x10($sp)
/* 13F87C 0023F77C 0000B07B */  lq         $16, 0x0($sp)
/* 13F880 0023F780 3001BD27 */  addiu      $sp, $sp, 0x130
/* 13F884 0023F784 0800E003 */  jr         $31
/* 13F888 0023F788 00000000 */   nop
/* 13F88C 0023F78C 00000000 */  nop
