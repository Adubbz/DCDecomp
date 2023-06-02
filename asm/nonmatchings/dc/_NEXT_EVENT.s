.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel _NEXT_EVENT__FP12RS_STACKDATAi
/* 8BC50 0018BB50 F0FFBD27 */  addiu      $sp, $sp, -0x10
/* 8BC54 0018BB54 0000BF7F */  sq         $31, 0x0($sp)
/* 8BC58 0018BB58 D428060C */  jal        GetStackInt__FP12RS_STACKDATA
/* 8BC5C 0018BB5C 00000000 */   nop
/* 8BC60 0018BB60 D401013C */  lui        $at, (0x1D40000 >> 16)
/* 8BC64 0018BB64 14D622AC */  sw         $2, -0x29EC($at)
/* 8BC68 0018BB68 01000224 */  addiu      $2, $0, 0x1
/* 8BC6C 0018BB6C 0000BF7B */  lq         $31, 0x0($sp)
/* 8BC70 0018BB70 1000BD27 */  addiu      $sp, $sp, 0x10
/* 8BC74 0018BB74 0800E003 */  jr         $31
/* 8BC78 0018BB78 00000000 */   nop
/* 8BC7C 0018BB7C 00000000 */  nop
