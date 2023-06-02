.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel _GET_OBJ_POS__FP12RS_STACKDATAi
/* 91050 00190F50 C0FFBD27 */  addiu      $sp, $sp, -0x40
/* 91054 00190F54 2000BF7F */  sq         $31, 0x20($sp)
/* 91058 00190F58 1000B17F */  sq         $17, 0x10($sp)
/* 9105C 00190F5C 0000B07F */  sq         $16, 0x0($sp)
/* 91060 00190F60 2886A070 */  paddub     $16, $5, $0
/* 91064 00190F64 08009124 */  addiu      $17, $4, 0x8
/* 91068 00190F68 D428060C */  jal        GetStackInt__FP12RS_STACKDATA
/* 9106C 00190F6C 00000000 */   nop
/* 91070 00190F70 28264070 */  paddub     $4, $2, $0
/* 91074 00190F74 0C29060C */  jal        GetObjHandle__Fi
/* 91078 00190F78 00000000 */   nop
/* 9107C 00190F7C 04004014 */  bnez       $2, .L00190F90
/* 91080 00190F80 00000000 */   nop
/* 91084 00190F84 28160070 */  paddub     $2, $0, $0
/* 91088 00190F88 1A000010 */  b          .L00190FF4
/* 9108C 00190F8C 00000000 */   nop
.L00190F90:
/* 91090 00190F90 0400012A */  slti       $at, $16, 0x4
/* 91094 00190F94 04002010 */  beqz       $at, .L00190FA8
/* 91098 00190F98 00000000 */   nop
/* 9109C 00190F9C 28160070 */  paddub     $2, $0, $0
/* 910A0 00190FA0 14000010 */  b          .L00190FF4
/* 910A4 00190FA4 00000000 */   nop
.L00190FA8:
/* 910A8 00190FA8 28264070 */  paddub     $4, $2, $0
/* 910AC 00190FAC 3000A527 */  addiu      $5, $sp, 0x30
/* 910B0 00190FB0 4C2A060C */  jal        get_obj_pos__FP10OBJ_HANDLEPf
/* 910B4 00190FB4 00000000 */   nop
/* 910B8 00190FB8 28262072 */  paddub     $4, $17, $0
/* 910BC 00190FBC 08009124 */  addiu      $17, $4, 0x8
/* 910C0 00190FC0 3000ACC7 */  lwc1       $f12, 0x30($sp)
/* 910C4 00190FC4 0029060C */  jal        SetStack__FP12RS_STACKDATAf
/* 910C8 00190FC8 00000000 */   nop
/* 910CC 00190FCC 28262072 */  paddub     $4, $17, $0
/* 910D0 00190FD0 08009124 */  addiu      $17, $4, 0x8
/* 910D4 00190FD4 3400ACC7 */  lwc1       $f12, 0x34($sp)
/* 910D8 00190FD8 0029060C */  jal        SetStack__FP12RS_STACKDATAf
/* 910DC 00190FDC 00000000 */   nop
/* 910E0 00190FE0 28262072 */  paddub     $4, $17, $0
/* 910E4 00190FE4 3800ACC7 */  lwc1       $f12, 0x38($sp)
/* 910E8 00190FE8 0029060C */  jal        SetStack__FP12RS_STACKDATAf
/* 910EC 00190FEC 00000000 */   nop
/* 910F0 00190FF0 01000224 */  addiu      $2, $0, 0x1
.L00190FF4:
/* 910F4 00190FF4 2000BF7B */  lq         $31, 0x20($sp)
/* 910F8 00190FF8 1000B17B */  lq         $17, 0x10($sp)
/* 910FC 00190FFC 0000B07B */  lq         $16, 0x0($sp)
/* 91100 00191000 4000BD27 */  addiu      $sp, $sp, 0x40
/* 91104 00191004 0800E003 */  jr         $31
/* 91108 00191008 00000000 */   nop
/* 9110C 0019100C 00000000 */  nop
