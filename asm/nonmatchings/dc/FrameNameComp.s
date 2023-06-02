.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel FrameNameComp__FPcPc
/* 287E0 001286E0 F0FFBD27 */  addiu      $sp, $sp, -0x10
/* 287E4 001286E4 0000BF7F */  sq         $31, 0x0($sp)
/* 287E8 001286E8 7CA1040C */  jal        StrCmp__FPcPc
/* 287EC 001286EC 00000000 */   nop
/* 287F0 001286F0 0000BF7B */  lq         $31, 0x0($sp)
/* 287F4 001286F4 1000BD27 */  addiu      $sp, $sp, 0x10
/* 287F8 001286F8 0800E003 */  jr         $31
/* 287FC 001286FC 00000000 */   nop
