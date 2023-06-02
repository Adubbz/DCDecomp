.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel CheckWeaponOptionStatus__Fi
/* 10F7E0 0020F6E0 02008230 */  andi       $2, $4, 0x2
/* 10F7E4 0020F6E4 06004010 */  beqz       $2, .L0020F700
/* 10F7E8 0020F6E8 00000000 */   nop
/* 10F7EC 0020F6EC 04008230 */  andi       $2, $4, 0x4
/* 10F7F0 0020F6F0 03004010 */  beqz       $2, .L0020F700
/* 10F7F4 0020F6F4 00000000 */   nop
/* 10F7F8 0020F6F8 F9FF0224 */  addiu      $2, $0, -0x7
/* 10F7FC 0020F6FC 24208200 */  and        $4, $4, $2
.L0020F700:
/* 10F800 0020F700 08008230 */  andi       $2, $4, 0x8
/* 10F804 0020F704 06004010 */  beqz       $2, .L0020F720
/* 10F808 0020F708 00000000 */   nop
/* 10F80C 0020F70C 10008230 */  andi       $2, $4, 0x10
/* 10F810 0020F710 03004010 */  beqz       $2, .L0020F720
/* 10F814 0020F714 00000000 */   nop
/* 10F818 0020F718 E7FF0224 */  addiu      $2, $0, -0x19
/* 10F81C 0020F71C 24208200 */  and        $4, $4, $2
.L0020F720:
/* 10F820 0020F720 00018230 */  andi       $2, $4, 0x100
/* 10F824 0020F724 06004010 */  beqz       $2, .L0020F740
/* 10F828 0020F728 00000000 */   nop
/* 10F82C 0020F72C 00028230 */  andi       $2, $4, 0x200
/* 10F830 0020F730 03004010 */  beqz       $2, .L0020F740
/* 10F834 0020F734 00000000 */   nop
/* 10F838 0020F738 FFFC0224 */  addiu      $2, $0, -0x301
/* 10F83C 0020F73C 24208200 */  and        $4, $4, $2
.L0020F740:
/* 10F840 0020F740 00048230 */  andi       $2, $4, 0x400
/* 10F844 0020F744 06004010 */  beqz       $2, .L0020F760
/* 10F848 0020F748 00000000 */   nop
/* 10F84C 0020F74C 00088230 */  andi       $2, $4, 0x800
/* 10F850 0020F750 03004010 */  beqz       $2, .L0020F760
/* 10F854 0020F754 00000000 */   nop
/* 10F858 0020F758 FFF30224 */  addiu      $2, $0, -0xC01
/* 10F85C 0020F75C 24208200 */  and        $4, $4, $2
.L0020F760:
/* 10F860 0020F760 28168070 */  paddub     $2, $4, $0
/* 10F864 0020F764 0800E003 */  jr         $31
/* 10F868 0020F768 00000000 */   nop
/* 10F86C 0020F76C 00000000 */  nop