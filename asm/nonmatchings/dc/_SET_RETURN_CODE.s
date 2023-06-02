.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel _SET_RETURN_CODE__FP12RS_STACKDATAi
/* 8BC20 0018BB20 F0FFBD27 */  addiu      $sp, $sp, -0x10
/* 8BC24 0018BB24 0000BF7F */  sq         $31, 0x0($sp)
/* 8BC28 0018BB28 D428060C */  jal        GetStackInt__FP12RS_STACKDATA
/* 8BC2C 0018BB2C 00000000 */   nop
/* 8BC30 0018BB30 D401013C */  lui        $at, (0x1D40000 >> 16)
/* 8BC34 0018BB34 18D622AC */  sw         $2, -0x29E8($at)
/* 8BC38 0018BB38 01000224 */  addiu      $2, $0, 0x1
/* 8BC3C 0018BB3C 0000BF7B */  lq         $31, 0x0($sp)
/* 8BC40 0018BB40 1000BD27 */  addiu      $sp, $sp, 0x10
/* 8BC44 0018BB44 0800E003 */  jr         $31
/* 8BC48 0018BB48 00000000 */   nop
/* 8BC4C 0018BB4C 00000000 */  nop
