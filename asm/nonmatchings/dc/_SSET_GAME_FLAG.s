.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel _SSET_GAME_FLAG__FP12RS_STACKDATAi
/* 95010 00194F10 D0FFBD27 */  addiu      $sp, $sp, -0x30
/* 95014 00194F14 2000BF7F */  sq         $31, 0x20($sp)
/* 95018 00194F18 1000B17F */  sq         $17, 0x10($sp)
/* 9501C 00194F1C 0000B07F */  sq         $16, 0x0($sp)
/* 95020 00194F20 02000224 */  addiu      $2, $0, 0x2
/* 95024 00194F24 0400A210 */  beq        $5, $2, .L00194F38
/* 95028 00194F28 00000000 */   nop
/* 9502C 00194F2C 28160070 */  paddub     $2, $0, $0
/* 95030 00194F30 0E000010 */  b          .L00194F6C
/* 95034 00194F34 00000000 */   nop
.L00194F38:
/* 95038 00194F38 08009124 */  addiu      $17, $4, 0x8
/* 9503C 00194F3C D428060C */  jal        GetStackInt__FP12RS_STACKDATA
/* 95040 00194F40 00000000 */   nop
/* 95044 00194F44 28864070 */  paddub     $16, $2, $0
/* 95048 00194F48 28262072 */  paddub     $4, $17, $0
/* 9504C 00194F4C D428060C */  jal        GetStackInt__FP12RS_STACKDATA
/* 95050 00194F50 00000000 */   nop
/* 95054 00194F54 1C8D848F */  lw         $4, -0x72E4($gp)
/* 95058 00194F58 282E0072 */  paddub     $5, $16, $0
/* 9505C 00194F5C 28364070 */  paddub     $6, $2, $0
/* 95060 00194F60 A060050C */  jal        SetGameFlag__9CSaveDataFii
/* 95064 00194F64 00000000 */   nop
/* 95068 00194F68 01000224 */  addiu      $2, $0, 0x1
.L00194F6C:
/* 9506C 00194F6C 2000BF7B */  lq         $31, 0x20($sp)
/* 95070 00194F70 1000B17B */  lq         $17, 0x10($sp)
/* 95074 00194F74 0000B07B */  lq         $16, 0x0($sp)
/* 95078 00194F78 3000BD27 */  addiu      $sp, $sp, 0x30
/* 9507C 00194F7C 0800E003 */  jr         $31
/* 95080 00194F80 00000000 */   nop
/* 95084 00194F84 00000000 */  nop
/* 95088 00194F88 00000000 */  nop
/* 9508C 00194F8C 00000000 */  nop
