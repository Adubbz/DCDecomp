.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel _RELEASE_OBJ_OBJ__FP12RS_STACKDATAi
/* 914A0 001913A0 F0FFBD27 */  addiu      $sp, $sp, -0x10
/* 914A4 001913A4 0000BF7F */  sq         $31, 0x0($sp)
/* 914A8 001913A8 D428060C */  jal        GetStackInt__FP12RS_STACKDATA
/* 914AC 001913AC 00000000 */   nop
/* 914B0 001913B0 28264070 */  paddub     $4, $2, $0
/* 914B4 001913B4 0C29060C */  jal        GetObjHandle__Fi
/* 914B8 001913B8 00000000 */   nop
/* 914BC 001913BC 04004014 */  bnez       $2, .L001913D0
/* 914C0 001913C0 00000000 */   nop
/* 914C4 001913C4 28160070 */  paddub     $2, $0, $0
/* 914C8 001913C8 05000010 */  b          .L001913E0
/* 914CC 001913CC 00000000 */   nop
.L001913D0:
/* 914D0 001913D0 28264070 */  paddub     $4, $2, $0
/* 914D4 001913D4 D82B060C */  jal        release_obj_obj__FP10OBJ_HANDLE
/* 914D8 001913D8 00000000 */   nop
/* 914DC 001913DC 01000224 */  addiu      $2, $0, 0x1
.L001913E0:
/* 914E0 001913E0 0000BF7B */  lq         $31, 0x0($sp)
/* 914E4 001913E4 1000BD27 */  addiu      $sp, $sp, 0x10
/* 914E8 001913E8 0800E003 */  jr         $31
/* 914EC 001913EC 00000000 */   nop
