.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel dthandler__3stdFv
/* 22A10 00122910 F0FFBD27 */  addiu      $sp, $sp, -0x10
/* 22A14 00122914 0000BF7F */  sq         $31, 0x0($sp)
/* 22A18 00122918 6A00040C */  jal        abort
/* 22A1C 0012291C 00000000 */   nop
/* 22A20 00122920 0000BF7B */  lq         $31, 0x0($sp)
/* 22A24 00122924 0800E003 */  jr         $31
/* 22A28 00122928 1000BD27 */   addiu     $sp, $sp, 0x10
/* 22A2C 0012292C 00000000 */  nop
