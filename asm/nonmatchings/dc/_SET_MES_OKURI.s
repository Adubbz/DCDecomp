.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel _SET_MES_OKURI__FP12RS_STACKDATAi
/* 900E0 0018FFE0 D0FFBD27 */  addiu      $sp, $sp, -0x30
/* 900E4 0018FFE4 2000BF7F */  sq         $31, 0x20($sp)
/* 900E8 0018FFE8 1000B17F */  sq         $17, 0x10($sp)
/* 900EC 0018FFEC 0000B07F */  sq         $16, 0x0($sp)
/* 900F0 0018FFF0 08009124 */  addiu      $17, $4, 0x8
/* 900F4 0018FFF4 D428060C */  jal        GetStackInt__FP12RS_STACKDATA
/* 900F8 0018FFF8 00000000 */   nop
/* 900FC 0018FFFC 28264070 */  paddub     $4, $2, $0
/* 90100 00190000 643E060C */  jal        GetMes__Fi
/* 90104 00190004 00000000 */   nop
/* 90108 00190008 28864070 */  paddub     $16, $2, $0
/* 9010C 0019000C 04000016 */  bnez       $16, .L00190020
/* 90110 00190010 00000000 */   nop
/* 90114 00190014 28160070 */  paddub     $2, $0, $0
/* 90118 00190018 06000010 */  b          .L00190034
/* 9011C 0019001C 00000000 */   nop
.L00190020:
/* 90120 00190020 28262072 */  paddub     $4, $17, $0
/* 90124 00190024 D428060C */  jal        GetStackInt__FP12RS_STACKDATA
/* 90128 00190028 00000000 */   nop
/* 9012C 0019002C C41602AE */  sw         $2, 0x16C4($16)
/* 90130 00190030 01000224 */  addiu      $2, $0, 0x1
.L00190034:
/* 90134 00190034 2000BF7B */  lq         $31, 0x20($sp)
/* 90138 00190038 1000B17B */  lq         $17, 0x10($sp)
/* 9013C 0019003C 0000B07B */  lq         $16, 0x0($sp)
/* 90140 00190040 3000BD27 */  addiu      $sp, $sp, 0x30
/* 90144 00190044 0800E003 */  jr         $31
/* 90148 00190048 00000000 */   nop
/* 9014C 0019004C 00000000 */  nop
