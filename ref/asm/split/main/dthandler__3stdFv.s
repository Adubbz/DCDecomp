.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel dthandler__3stdFv
/* 022A10 00122910 F0FFBD27 */  addiu       $29, $29, -0x10
/* 022A14 00122914 0000BF7F */  sq          $31, 0x0($29)
/* 022A18 00122918 6A00040C */  jal         abort
/* 022A1C 0012291C 00000000 */   nop
/* 022A20 00122920 0000BF7B */  lq          $31, 0x0($29)
/* 022A24 00122924 0800E003 */  jr          $31
/* 022A28 00122928 1000BD27 */   addiu      $29, $29, 0x10
/* 022A2C 0012292C 00000000 */  nop
