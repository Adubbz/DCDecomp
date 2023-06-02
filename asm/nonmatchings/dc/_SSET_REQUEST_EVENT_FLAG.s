.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel _SSET_REQUEST_EVENT_FLAG__FP12RS_STACKDATAi
/* 955D0 001954D0 D0FFBD27 */  addiu      $sp, $sp, -0x30
/* 955D4 001954D4 2000BF7F */  sq         $31, 0x20($sp)
/* 955D8 001954D8 1000B17F */  sq         $17, 0x10($sp)
/* 955DC 001954DC 0000B07F */  sq         $16, 0x0($sp)
/* 955E0 001954E0 08009124 */  addiu      $17, $4, 0x8
/* 955E4 001954E4 D428060C */  jal        GetStackInt__FP12RS_STACKDATA
/* 955E8 001954E8 00000000 */   nop
/* 955EC 001954EC FFFF4524 */  addiu      $5, $2, -0x1
/* 955F0 001954F0 1C8D848F */  lw         $4, -0x72E4($gp)
/* 955F4 001954F4 EC5F050C */  jal        GetGrdData__9CSaveDataFi
/* 955F8 001954F8 00000000 */   nop
/* 955FC 001954FC 28864070 */  paddub     $16, $2, $0
/* 95600 00195500 04000016 */  bnez       $16, .L00195514
/* 95604 00195504 00000000 */   nop
/* 95608 00195508 28160070 */  paddub     $2, $0, $0
/* 9560C 0019550C 06000010 */  b          .L00195528
/* 95610 00195510 00000000 */   nop
.L00195514:
/* 95614 00195514 28262072 */  paddub     $4, $17, $0
/* 95618 00195518 D428060C */  jal        GetStackInt__FP12RS_STACKDATA
/* 9561C 0019551C 00000000 */   nop
/* 95620 00195520 640002AE */  sw         $2, 0x64($16)
/* 95624 00195524 01000224 */  addiu      $2, $0, 0x1
.L00195528:
/* 95628 00195528 2000BF7B */  lq         $31, 0x20($sp)
/* 9562C 0019552C 1000B17B */  lq         $17, 0x10($sp)
/* 95630 00195530 0000B07B */  lq         $16, 0x0($sp)
/* 95634 00195534 3000BD27 */  addiu      $sp, $sp, 0x30
/* 95638 00195538 0800E003 */  jr         $31
/* 9563C 0019553C 00000000 */   nop
