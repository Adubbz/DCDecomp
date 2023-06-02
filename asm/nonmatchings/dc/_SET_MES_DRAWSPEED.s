.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel _SET_MES_DRAWSPEED__FP12RS_STACKDATAi
/* 90000 0018FF00 E0FFBD27 */  addiu      $sp, $sp, -0x20
/* 90004 0018FF04 1000BF7F */  sq         $31, 0x10($sp)
/* 90008 0018FF08 0000B07F */  sq         $16, 0x0($sp)
/* 9000C 0018FF0C 08009024 */  addiu      $16, $4, 0x8
/* 90010 0018FF10 D428060C */  jal        GetStackInt__FP12RS_STACKDATA
/* 90014 0018FF14 00000000 */   nop
/* 90018 0018FF18 28264070 */  paddub     $4, $2, $0
/* 9001C 0018FF1C 643E060C */  jal        GetMes__Fi
/* 90020 0018FF20 00000000 */   nop
/* 90024 0018FF24 281E4070 */  paddub     $3, $2, $0
/* 90028 0018FF28 04006014 */  bnez       $3, .L0018FF3C
/* 9002C 0018FF2C 00000000 */   nop
/* 90030 0018FF30 28160070 */  paddub     $2, $0, $0
/* 90034 0018FF34 06000010 */  b          .L0018FF50
/* 90038 0018FF38 00000000 */   nop
.L0018FF3C:
/* 9003C 0018FF3C 28260072 */  paddub     $4, $16, $0
/* 90040 0018FF40 E828060C */  jal        GetStackFloat__FP12RS_STACKDATA
/* 90044 0018FF44 00000000 */   nop
/* 90048 0018FF48 A40060E4 */  swc1       $f0, 0xA4($3)
/* 9004C 0018FF4C 01000224 */  addiu      $2, $0, 0x1
.L0018FF50:
/* 90050 0018FF50 1000BF7B */  lq         $31, 0x10($sp)
/* 90054 0018FF54 0000B07B */  lq         $16, 0x0($sp)
/* 90058 0018FF58 2000BD27 */  addiu      $sp, $sp, 0x20
/* 9005C 0018FF5C 0800E003 */  jr         $31
/* 90060 0018FF60 00000000 */   nop
/* 90064 0018FF64 00000000 */  nop
/* 90068 0018FF68 00000000 */  nop
/* 9006C 0018FF6C 00000000 */  nop
