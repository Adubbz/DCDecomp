.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel __ct__9CEditAreaFv
/* 70320 00170220 E0FFBD27 */  addiu      $sp, $sp, -0x20
/* 70324 00170224 1000BF7F */  sq         $31, 0x10($sp)
/* 70328 00170228 0000B07F */  sq         $16, 0x0($sp)
/* 7032C 0017022C 28868070 */  paddub     $16, $4, $0
/* 70330 00170230 18C0050C */  jal        Initialize__9CEditAreaFv
/* 70334 00170234 00000000 */   nop
/* 70338 00170238 28160072 */  paddub     $2, $16, $0
/* 7033C 0017023C 1000BF7B */  lq         $31, 0x10($sp)
/* 70340 00170240 0000B07B */  lq         $16, 0x0($sp)
/* 70344 00170244 2000BD27 */  addiu      $sp, $sp, 0x20
/* 70348 00170248 0800E003 */  jr         $31
/* 7034C 0017024C 00000000 */   nop
