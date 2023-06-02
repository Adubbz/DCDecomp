.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel _SET_MES_CURSOR__FP12RS_STACKDATAi
/* 90070 0018FF70 D0FFBD27 */  addiu      $sp, $sp, -0x30
/* 90074 0018FF74 2000BF7F */  sq         $31, 0x20($sp)
/* 90078 0018FF78 1000B17F */  sq         $17, 0x10($sp)
/* 9007C 0018FF7C 0000B07F */  sq         $16, 0x0($sp)
/* 90080 0018FF80 08009124 */  addiu      $17, $4, 0x8
/* 90084 0018FF84 D428060C */  jal        GetStackInt__FP12RS_STACKDATA
/* 90088 0018FF88 00000000 */   nop
/* 9008C 0018FF8C 28264070 */  paddub     $4, $2, $0
/* 90090 0018FF90 643E060C */  jal        GetMes__Fi
/* 90094 0018FF94 00000000 */   nop
/* 90098 0018FF98 28864070 */  paddub     $16, $2, $0
/* 9009C 0018FF9C 04000016 */  bnez       $16, .L0018FFB0
/* 900A0 0018FFA0 00000000 */   nop
/* 900A4 0018FFA4 28160070 */  paddub     $2, $0, $0
/* 900A8 0018FFA8 06000010 */  b          .L0018FFC4
/* 900AC 0018FFAC 00000000 */   nop
.L0018FFB0:
/* 900B0 0018FFB0 28262072 */  paddub     $4, $17, $0
/* 900B4 0018FFB4 D428060C */  jal        GetStackInt__FP12RS_STACKDATA
/* 900B8 0018FFB8 00000000 */   nop
/* 900BC 0018FFBC 401702AE */  sw         $2, 0x1740($16)
/* 900C0 0018FFC0 01000224 */  addiu      $2, $0, 0x1
.L0018FFC4:
/* 900C4 0018FFC4 2000BF7B */  lq         $31, 0x20($sp)
/* 900C8 0018FFC8 1000B17B */  lq         $17, 0x10($sp)
/* 900CC 0018FFCC 0000B07B */  lq         $16, 0x0($sp)
/* 900D0 0018FFD0 3000BD27 */  addiu      $sp, $sp, 0x30
/* 900D4 0018FFD4 0800E003 */  jr         $31
/* 900D8 0018FFD8 00000000 */   nop
/* 900DC 0018FFDC 00000000 */  nop
