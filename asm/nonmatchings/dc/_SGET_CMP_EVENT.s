.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel _SGET_CMP_EVENT__FP12RS_STACKDATAi
/* 907B0 001906B0 E0FFBD27 */  addiu      $sp, $sp, -0x20
/* 907B4 001906B4 1000BF7F */  sq         $31, 0x10($sp)
/* 907B8 001906B8 0000B07F */  sq         $16, 0x0($sp)
/* 907BC 001906BC 08009024 */  addiu      $16, $4, 0x8
/* 907C0 001906C0 D428060C */  jal        GetStackInt__FP12RS_STACKDATA
/* 907C4 001906C4 00000000 */   nop
/* 907C8 001906C8 D201033C */  lui        $3, %hi(EditPartsInfo)
/* 907CC 001906CC F09B6424 */  addiu      $4, $3, %lo(EditPartsInfo)
/* 907D0 001906D0 282E4070 */  paddub     $5, $2, $0
/* 907D4 001906D4 4068060C */  jal        GetCompEvent__14CEditPartsInfoFi
/* 907D8 001906D8 00000000 */   nop
/* 907DC 001906DC 282E4070 */  paddub     $5, $2, $0
/* 907E0 001906E0 28260072 */  paddub     $4, $16, $0
/* 907E4 001906E4 F828060C */  jal        SetStack__FP12RS_STACKDATAi
/* 907E8 001906E8 00000000 */   nop
/* 907EC 001906EC 01000224 */  addiu      $2, $0, 0x1
/* 907F0 001906F0 1000BF7B */  lq         $31, 0x10($sp)
/* 907F4 001906F4 0000B07B */  lq         $16, 0x0($sp)
/* 907F8 001906F8 2000BD27 */  addiu      $sp, $sp, 0x20
/* 907FC 001906FC 0800E003 */  jr         $31
/* 90800 00190700 00000000 */   nop
/* 90804 00190704 00000000 */  nop
/* 90808 00190708 00000000 */  nop
/* 9080C 0019070C 00000000 */  nop
