.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel GetPos__9CEditAreaFP11CVector3_f_iii
/* 6DA20 0016D920 00008644 */  mtc1       $6, $f0
/* 6DA24 0016D924 00000000 */  nop
/* 6DA28 0016D928 60008046 */  cvt.s.w    $f1, $f0
/* 6DA2C 0016D92C 200080C4 */  lwc1       $f0, 0x20($4)
/* 6DA30 0016D930 42080046 */  mul.s      $f1, $f1, $f0
/* 6DA34 0016D934 100080C4 */  lwc1       $f0, 0x10($4)
/* 6DA38 0016D938 00000146 */  add.s      $f0, $f0, $f1
/* 6DA3C 0016D93C 0000A0E4 */  swc1       $f0, 0x0($5)
/* 6DA40 0016D940 00008744 */  mtc1       $7, $f0
/* 6DA44 0016D944 00000000 */  nop
/* 6DA48 0016D948 60008046 */  cvt.s.w    $f1, $f0
/* 6DA4C 0016D94C 240080C4 */  lwc1       $f0, 0x24($4)
/* 6DA50 0016D950 42080046 */  mul.s      $f1, $f1, $f0
/* 6DA54 0016D954 140080C4 */  lwc1       $f0, 0x14($4)
/* 6DA58 0016D958 00000146 */  add.s      $f0, $f0, $f1
/* 6DA5C 0016D95C 0400A0E4 */  swc1       $f0, 0x4($5)
/* 6DA60 0016D960 00008844 */  mtc1       $8, $f0
/* 6DA64 0016D964 00000000 */  nop
/* 6DA68 0016D968 60008046 */  cvt.s.w    $f1, $f0
/* 6DA6C 0016D96C 200080C4 */  lwc1       $f0, 0x20($4)
/* 6DA70 0016D970 42080046 */  mul.s      $f1, $f1, $f0
/* 6DA74 0016D974 180080C4 */  lwc1       $f0, 0x18($4)
/* 6DA78 0016D978 00000146 */  add.s      $f0, $f0, $f1
/* 6DA7C 0016D97C 0800A0E4 */  swc1       $f0, 0x8($5)
/* 6DA80 0016D980 0800E003 */  jr         $31
/* 6DA84 0016D984 00000000 */   nop
/* 6DA88 0016D988 00000000 */  nop
/* 6DA8C 0016D98C 00000000 */  nop
