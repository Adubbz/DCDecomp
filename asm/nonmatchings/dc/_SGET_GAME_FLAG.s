.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel _SGET_GAME_FLAG__FP12RS_STACKDATAi
/* 95090 00194F90 E0FFBD27 */  addiu      $sp, $sp, -0x20
/* 95094 00194F94 1000BF7F */  sq         $31, 0x10($sp)
/* 95098 00194F98 0000B07F */  sq         $16, 0x0($sp)
/* 9509C 00194F9C 02000224 */  addiu      $2, $0, 0x2
/* 950A0 00194FA0 0400A210 */  beq        $5, $2, .L00194FB4
/* 950A4 00194FA4 00000000 */   nop
/* 950A8 00194FA8 28160070 */  paddub     $2, $0, $0
/* 950AC 00194FAC 0D000010 */  b          .L00194FE4
/* 950B0 00194FB0 00000000 */   nop
.L00194FB4:
/* 950B4 00194FB4 08009024 */  addiu      $16, $4, 0x8
/* 950B8 00194FB8 D428060C */  jal        GetStackInt__FP12RS_STACKDATA
/* 950BC 00194FBC 00000000 */   nop
/* 950C0 00194FC0 1C8D848F */  lw         $4, -0x72E4($gp)
/* 950C4 00194FC4 282E4070 */  paddub     $5, $2, $0
/* 950C8 00194FC8 8060050C */  jal        GetGameFlag__9CSaveDataFi
/* 950CC 00194FCC 00000000 */   nop
/* 950D0 00194FD0 28260072 */  paddub     $4, $16, $0
/* 950D4 00194FD4 282E4070 */  paddub     $5, $2, $0
/* 950D8 00194FD8 F828060C */  jal        SetStack__FP12RS_STACKDATAi
/* 950DC 00194FDC 00000000 */   nop
/* 950E0 00194FE0 01000224 */  addiu      $2, $0, 0x1
.L00194FE4:
/* 950E4 00194FE4 1000BF7B */  lq         $31, 0x10($sp)
/* 950E8 00194FE8 0000B07B */  lq         $16, 0x0($sp)
/* 950EC 00194FEC 2000BD27 */  addiu      $sp, $sp, 0x20
/* 950F0 00194FF0 0800E003 */  jr         $31
/* 950F4 00194FF4 00000000 */   nop
/* 950F8 00194FF8 00000000 */  nop
/* 950FC 00194FFC 00000000 */  nop
