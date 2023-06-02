.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel SndSePlay__FiPfff
/* 5A920 0015A820 D0FFBD27 */  addiu      $sp, $sp, -0x30
/* 5A924 0015A824 1000BF7F */  sq         $31, 0x10($sp)
/* 5A928 0015A828 0000B07F */  sq         $16, 0x0($sp)
/* 5A92C 0015A82C 28868070 */  paddub     $16, $4, $0
/* 5A930 0015A830 2836A070 */  paddub     $6, $5, $0
/* 5A934 0015A834 00008044 */  mtc1       $0, $f0
/* 5A938 0015A838 00000000 */  nop
/* 5A93C 0015A83C 34600046 */  c.lt.s     $f12, $f0
/* 5A940 0015A840 00000000 */  nop
/* 5A944 0015A844 03000045 */  bc1f       .L0015A854
/* 5A948 0015A848 00000000 */   nop
/* 5A94C 0015A84C A041023C */  lui        $2, (0x41A00000 >> 16)
/* 5A950 0015A850 00608244 */  mtc1       $2, $f12
.L0015A854:
/* 5A954 0015A854 00008044 */  mtc1       $0, $f0
/* 5A958 0015A858 00000000 */  nop
/* 5A95C 0015A85C 34680046 */  c.lt.s     $f13, $f0
/* 5A960 0015A860 00000000 */  nop
/* 5A964 0015A864 03000045 */  bc1f       .L0015A874
/* 5A968 0015A868 00000000 */   nop
/* 5A96C 0015A86C FA43023C */  lui        $2, (0x43FA0000 >> 16)
/* 5A970 0015A870 00688244 */  mtc1       $2, $f13
.L0015A874:
/* 5A974 0015A874 2800A427 */  addiu      $4, $sp, 0x28
/* 5A978 0015A878 2C00A527 */  addiu      $5, $sp, 0x2C
/* 5A97C 0015A87C 006B050C */  jal        SndGetVolPan__FPfPfPfff
/* 5A980 0015A880 00000000 */   nop
/* 5A984 0015A884 28260072 */  paddub     $4, $16, $0
/* 5A988 0015A888 2800ACC7 */  lwc1       $f12, 0x28($sp)
/* 5A98C 0015A88C 2C00ADC7 */  lwc1       $f13, 0x2C($sp)
/* 5A990 0015A890 282E0070 */  paddub     $5, $0, $0
/* 5A994 0015A894 D869050C */  jal        SndSePlay__Fiffi
/* 5A998 0015A898 00000000 */   nop
/* 5A99C 0015A89C 1000BF7B */  lq         $31, 0x10($sp)
/* 5A9A0 0015A8A0 0000B07B */  lq         $16, 0x0($sp)
/* 5A9A4 0015A8A4 3000BD27 */  addiu      $sp, $sp, 0x30
/* 5A9A8 0015A8A8 0800E003 */  jr         $31
/* 5A9AC 0015A8AC 00000000 */   nop
