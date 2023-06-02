.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel Initialize__9CFrameVu1Fv
/* 2A330 0012A230 E0FFBD27 */  addiu      $sp, $sp, -0x20
/* 2A334 0012A234 1000BF7F */  sq         $31, 0x10($sp)
/* 2A338 0012A238 0000B07F */  sq         $16, 0x0($sp)
/* 2A33C 0012A23C 28868070 */  paddub     $16, $4, $0
/* 2A340 0012A240 5C9F040C */  jal        Initialize__6CFrameFv
/* 2A344 0012A244 00000000 */   nop
/* 2A348 0012A248 600200AE */  sw         $0, 0x260($16)
/* 2A34C 0012A24C 1000BF7B */  lq         $31, 0x10($sp)
/* 2A350 0012A250 0000B07B */  lq         $16, 0x0($sp)
/* 2A354 0012A254 2000BD27 */  addiu      $sp, $sp, 0x20
/* 2A358 0012A258 0800E003 */  jr         $31
/* 2A35C 0012A25C 00000000 */   nop
