.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel PlusAttachmentVolume__FP11ATTACH_LISTP11ATTACH_LISTf
/* 125910 00225810 A0FFBD27 */  addiu      $sp, $sp, -0x60
/* 125914 00225814 5000BF7F */  sq         $31, 0x50($sp)
/* 125918 00225818 4000B37F */  sq         $19, 0x40($sp)
/* 12591C 0022581C 3000B27F */  sq         $18, 0x30($sp)
/* 125920 00225820 2000B17F */  sq         $17, 0x20($sp)
/* 125924 00225824 1000B07F */  sq         $16, 0x10($sp)
/* 125928 00225828 0000B4E7 */  swc1       $f20, 0x0($sp)
/* 12592C 0022582C 28968070 */  paddub     $18, $4, $0
/* 125930 00225830 288EA070 */  paddub     $17, $5, $0
/* 125934 00225834 06650046 */  mov.s      $f20, $f12
/* 125938 00225838 28860070 */  paddub     $16, $0, $0
/* 12593C 0022583C 12000010 */  b          .L00225888
/* 125940 00225840 00000000 */   nop
.L00225844:
/* 125944 00225844 40181000 */  sll        $3, $16, 1
/* 125948 00225848 21107100 */  addu       $2, $3, $17
/* 12594C 0022584C 08004284 */  lh         $2, 0x8($2)
/* 125950 00225850 00008244 */  mtc1       $2, $f0
/* 125954 00225854 00000000 */  nop
/* 125958 00225858 20008046 */  cvt.s.w    $f0, $f0
/* 12595C 0022585C 42001446 */  mul.s      $f1, $f0, $f20
/* 125960 00225860 21987200 */  addu       $19, $3, $18
/* 125964 00225864 08006286 */  lh         $2, 0x8($19)
/* 125968 00225868 00008244 */  mtc1       $2, $f0
/* 12596C 0022586C 00000000 */  nop
/* 125970 00225870 20008046 */  cvt.s.w    $f0, $f0
/* 125974 00225874 00030146 */  add.s      $f12, $f0, $f1
/* 125978 00225878 2C44040C */  jal        fptosi
/* 12597C 0022587C 00000000 */   nop
/* 125980 00225880 080062A6 */  sh         $2, 0x8($19)
/* 125984 00225884 01001026 */  addiu      $16, $16, 0x1
.L00225888:
/* 125988 00225888 0400032A */  slti       $3, $16, 0x4
/* 12598C 0022588C EDFF6014 */  bnez       $3, .L00225844
/* 125990 00225890 00000000 */   nop
/* 125994 00225894 28860070 */  paddub     $16, $0, $0
/* 125998 00225898 11000010 */  b          .L002258E0
/* 12599C 0022589C 00000000 */   nop
.L002258A0:
/* 1259A0 002258A0 21101102 */  addu       $2, $16, $17
/* 1259A4 002258A4 10004280 */  lb         $2, 0x10($2)
/* 1259A8 002258A8 00008244 */  mtc1       $2, $f0
/* 1259AC 002258AC 00000000 */  nop
/* 1259B0 002258B0 20008046 */  cvt.s.w    $f0, $f0
/* 1259B4 002258B4 42001446 */  mul.s      $f1, $f0, $f20
/* 1259B8 002258B8 21981202 */  addu       $19, $16, $18
/* 1259BC 002258BC 10006282 */  lb         $2, 0x10($19)
/* 1259C0 002258C0 00008244 */  mtc1       $2, $f0
/* 1259C4 002258C4 00000000 */  nop
/* 1259C8 002258C8 20008046 */  cvt.s.w    $f0, $f0
/* 1259CC 002258CC 00030146 */  add.s      $f12, $f0, $f1
/* 1259D0 002258D0 2C44040C */  jal        fptosi
/* 1259D4 002258D4 00000000 */   nop
/* 1259D8 002258D8 100062A2 */  sb         $2, 0x10($19)
/* 1259DC 002258DC 01001026 */  addiu      $16, $16, 0x1
.L002258E0:
/* 1259E0 002258E0 0500032A */  slti       $3, $16, 0x5
/* 1259E4 002258E4 EEFF6014 */  bnez       $3, .L002258A0
/* 1259E8 002258E8 00000000 */   nop
/* 1259EC 002258EC 28860070 */  paddub     $16, $0, $0
/* 1259F0 002258F0 11000010 */  b          .L00225938
/* 1259F4 002258F4 00000000 */   nop
.L002258F8:
/* 1259F8 002258F8 21101102 */  addu       $2, $16, $17
/* 1259FC 002258FC 15004280 */  lb         $2, 0x15($2)
/* 125A00 00225900 00008244 */  mtc1       $2, $f0
/* 125A04 00225904 00000000 */  nop
/* 125A08 00225908 20008046 */  cvt.s.w    $f0, $f0
/* 125A0C 0022590C 42001446 */  mul.s      $f1, $f0, $f20
/* 125A10 00225910 21981202 */  addu       $19, $16, $18
/* 125A14 00225914 15006282 */  lb         $2, 0x15($19)
/* 125A18 00225918 00008244 */  mtc1       $2, $f0
/* 125A1C 0022591C 00000000 */  nop
/* 125A20 00225920 20008046 */  cvt.s.w    $f0, $f0
/* 125A24 00225924 00030146 */  add.s      $f12, $f0, $f1
/* 125A28 00225928 2C44040C */  jal        fptosi
/* 125A2C 0022592C 00000000 */   nop
/* 125A30 00225930 150062A2 */  sb         $2, 0x15($19)
/* 125A34 00225934 01001026 */  addiu      $16, $16, 0x1
.L00225938:
/* 125A38 00225938 0A00032A */  slti       $3, $16, 0xA
/* 125A3C 0022593C EEFF6014 */  bnez       $3, .L002258F8
/* 125A40 00225940 00000000 */   nop
/* 125A44 00225944 5000BF7B */  lq         $31, 0x50($sp)
/* 125A48 00225948 4000B37B */  lq         $19, 0x40($sp)
/* 125A4C 0022594C 3000B27B */  lq         $18, 0x30($sp)
/* 125A50 00225950 2000B17B */  lq         $17, 0x20($sp)
/* 125A54 00225954 1000B07B */  lq         $16, 0x10($sp)
/* 125A58 00225958 0000B4C7 */  lwc1       $f20, 0x0($sp)
/* 125A5C 0022595C 6000BD27 */  addiu      $sp, $sp, 0x60
/* 125A60 00225960 0800E003 */  jr         $31
/* 125A64 00225964 00000000 */   nop
/* 125A68 00225968 00000000 */  nop
/* 125A6C 0022596C 00000000 */  nop
