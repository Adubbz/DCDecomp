.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel _SET_NPC_FLOOR_ID__FP12RS_STACKDATAi
/* 8F120 0018F020 D0FFBD27 */  addiu      $sp, $sp, -0x30
/* 8F124 0018F024 2000BF7F */  sq         $31, 0x20($sp)
/* 8F128 0018F028 1000B17F */  sq         $17, 0x10($sp)
/* 8F12C 0018F02C 0000B07F */  sq         $16, 0x0($sp)
/* 8F130 0018F030 08009124 */  addiu      $17, $4, 0x8
/* 8F134 0018F034 D428060C */  jal        GetStackInt__FP12RS_STACKDATA
/* 8F138 0018F038 00000000 */   nop
/* 8F13C 0018F03C 28264070 */  paddub     $4, $2, $0
/* 8F140 0018F040 842C060C */  jal        GetChara__Fi
/* 8F144 0018F044 00000000 */   nop
/* 8F148 0018F048 28864070 */  paddub     $16, $2, $0
/* 8F14C 0018F04C 04000016 */  bnez       $16, .L0018F060
/* 8F150 0018F050 00000000 */   nop
/* 8F154 0018F054 28160070 */  paddub     $2, $0, $0
/* 8F158 0018F058 09000010 */  b          .L0018F080
/* 8F15C 0018F05C 00000000 */   nop
.L0018F060:
/* 8F160 0018F060 28262072 */  paddub     $4, $17, $0
/* 8F164 0018F064 D428060C */  jal        GetStackInt__FP12RS_STACKDATA
/* 8F168 0018F068 00000000 */   nop
/* 8F16C 0018F06C 28260072 */  paddub     $4, $16, $0
/* 8F170 0018F070 282E4070 */  paddub     $5, $2, $0
/* 8F174 0018F074 84E0040C */  jal        SetFootSoundID__10CCharacterFi
/* 8F178 0018F078 00000000 */   nop
/* 8F17C 0018F07C 01000224 */  addiu      $2, $0, 0x1
.L0018F080:
/* 8F180 0018F080 2000BF7B */  lq         $31, 0x20($sp)
/* 8F184 0018F084 1000B17B */  lq         $17, 0x10($sp)
/* 8F188 0018F088 0000B07B */  lq         $16, 0x0($sp)
/* 8F18C 0018F08C 3000BD27 */  addiu      $sp, $sp, 0x30
/* 8F190 0018F090 0800E003 */  jr         $31
/* 8F194 0018F094 00000000 */   nop
/* 8F198 0018F098 00000000 */  nop
/* 8F19C 0018F09C 00000000 */  nop
