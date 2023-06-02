.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel LoopSave__Fv
/* 42D10 00142C10 E0FFBD27 */  addiu      $sp, $sp, -0x20
/* 42D14 00142C14 1000BF7F */  sq         $31, 0x10($sp)
/* 42D18 00142C18 0000B07F */  sq         $16, 0x0($sp)
/* 42D1C 00142C1C B47F080C */  jal        MenuSaveKey__Fv
/* 42D20 00142C20 00000000 */   nop
/* 42D24 00142C24 28864070 */  paddub     $16, $2, $0
/* 42D28 00142C28 28260070 */  paddub     $4, $0, $0
/* 42D2C 00142C2C F480080C */  jal        DrawMenuSave__FPc
/* 42D30 00142C30 00000000 */   nop
/* 42D34 00142C34 28160072 */  paddub     $2, $16, $0
/* 42D38 00142C38 1000BF7B */  lq         $31, 0x10($sp)
/* 42D3C 00142C3C 0000B07B */  lq         $16, 0x0($sp)
/* 42D40 00142C40 2000BD27 */  addiu      $sp, $sp, 0x20
/* 42D44 00142C44 0800E003 */  jr         $31
/* 42D48 00142C48 00000000 */   nop
/* 42D4C 00142C4C 00000000 */  nop
