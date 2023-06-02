.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel WriteFile__FPcPvi
/* 3F720 0013F620 C0FFBD27 */  addiu      $sp, $sp, -0x40
/* 3F724 0013F624 3000BF7F */  sq         $31, 0x30($sp)
/* 3F728 0013F628 2000B27F */  sq         $18, 0x20($sp)
/* 3F72C 0013F62C 1000B17F */  sq         $17, 0x10($sp)
/* 3F730 0013F630 0000B07F */  sq         $16, 0x0($sp)
/* 3F734 0013F634 2896A070 */  paddub     $18, $5, $0
/* 3F738 0013F638 288EC070 */  paddub     $17, $6, $0
/* 3F73C 0013F63C 02060524 */  addiu      $5, $0, 0x602
/* 3F740 0013F640 865F040C */  jal        sceOpen
/* 3F744 0013F644 00000000 */   nop
/* 3F748 0013F648 28864070 */  paddub     $16, $2, $0
/* 3F74C 0013F64C 04000106 */  bgez       $16, .L0013F660
/* 3F750 0013F650 00000000 */   nop
/* 3F754 0013F654 28160070 */  paddub     $2, $0, $0
/* 3F758 0013F658 0A000010 */  b          .L0013F684
/* 3F75C 0013F65C 00000000 */   nop
.L0013F660:
/* 3F760 0013F660 28260072 */  paddub     $4, $16, $0
/* 3F764 0013F664 282E4072 */  paddub     $5, $18, $0
/* 3F768 0013F668 28362072 */  paddub     $6, $17, $0
/* 3F76C 0013F66C 1861040C */  jal        sceWrite
/* 3F770 0013F670 00000000 */   nop
/* 3F774 0013F674 28260072 */  paddub     $4, $16, $0
/* 3F778 0013F678 F65F040C */  jal        sceClose
/* 3F77C 0013F67C 00000000 */   nop
/* 3F780 0013F680 01000224 */  addiu      $2, $0, 0x1
.L0013F684:
/* 3F784 0013F684 3000BF7B */  lq         $31, 0x30($sp)
/* 3F788 0013F688 2000B27B */  lq         $18, 0x20($sp)
/* 3F78C 0013F68C 1000B17B */  lq         $17, 0x10($sp)
/* 3F790 0013F690 0000B07B */  lq         $16, 0x0($sp)
/* 3F794 0013F694 4000BD27 */  addiu      $sp, $sp, 0x40
/* 3F798 0013F698 0800E003 */  jr         $31
/* 3F79C 0013F69C 00000000 */   nop
