.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel _SET_DUNGEON_FLOOR__FP12RS_STACKDATAi
/* 8C190 0018C090 F0FFBD27 */  addiu      $sp, $sp, -0x10
/* 8C194 0018C094 0000BF7F */  sq         $31, 0x0($sp)
/* 8C198 0018C098 D428060C */  jal        GetStackInt__FP12RS_STACKDATA
/* 8C19C 0018C09C 00000000 */   nop
/* 8C1A0 0018C0A0 28264070 */  paddub     $4, $2, $0
/* 8C1A4 0018C0A4 48EE060C */  jal        BtSetMapJumpFloor__Fi
/* 8C1A8 0018C0A8 00000000 */   nop
/* 8C1AC 0018C0AC 01000224 */  addiu      $2, $0, 0x1
/* 8C1B0 0018C0B0 0000BF7B */  lq         $31, 0x0($sp)
/* 8C1B4 0018C0B4 1000BD27 */  addiu      $sp, $sp, 0x10
/* 8C1B8 0018C0B8 0800E003 */  jr         $31
/* 8C1BC 0018C0BC 00000000 */   nop
