.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel _ASQ_CHECK__FP12RS_STACKDATAi
/* 94C70 00194B70 E0FFBD27 */  addiu      $sp, $sp, -0x20
/* 94C74 00194B74 1000BF7F */  sq         $31, 0x10($sp)
/* 94C78 00194B78 0000B07F */  sq         $16, 0x0($sp)
/* 94C7C 00194B7C 08009024 */  addiu      $16, $4, 0x8
/* 94C80 00194B80 D428060C */  jal        GetStackInt__FP12RS_STACKDATA
/* 94C84 00194B84 00000000 */   nop
/* 94C88 00194B88 28264070 */  paddub     $4, $2, $0
/* 94C8C 00194B8C 242C060C */  jal        GetActSeq__Fi
/* 94C90 00194B90 00000000 */   nop
/* 94C94 00194B94 04004014 */  bnez       $2, .L00194BA8
/* 94C98 00194B98 00000000 */   nop
/* 94C9C 00194B9C 28160070 */  paddub     $2, $0, $0
/* 94CA0 00194BA0 0B000010 */  b          .L00194BD0
/* 94CA4 00194BA4 00000000 */   nop
.L00194BA8:
/* 94CA8 00194BA8 28264070 */  paddub     $4, $2, $0
/* 94CAC 00194BAC 0055050C */  jal        CheckEnd__10CActionSeqFv
/* 94CB0 00194BB0 00000000 */   nop
/* 94CB4 00194BB4 28260072 */  paddub     $4, $16, $0
/* 94CB8 00194BB8 2B100200 */  sltu       $2, $0, $2
/* 94CBC 00194BBC 01004238 */  xori       $2, $2, 0x1
/* 94CC0 00194BC0 FF004530 */  andi       $5, $2, 0xFF
/* 94CC4 00194BC4 F828060C */  jal        SetStack__FP12RS_STACKDATAi
/* 94CC8 00194BC8 00000000 */   nop
/* 94CCC 00194BCC 01000224 */  addiu      $2, $0, 0x1
.L00194BD0:
/* 94CD0 00194BD0 1000BF7B */  lq         $31, 0x10($sp)
/* 94CD4 00194BD4 0000B07B */  lq         $16, 0x0($sp)
/* 94CD8 00194BD8 2000BD27 */  addiu      $sp, $sp, 0x20
/* 94CDC 00194BDC 0800E003 */  jr         $31
/* 94CE0 00194BE0 00000000 */   nop
/* 94CE4 00194BE4 00000000 */  nop
/* 94CE8 00194BE8 00000000 */  nop
/* 94CEC 00194BEC 00000000 */  nop
