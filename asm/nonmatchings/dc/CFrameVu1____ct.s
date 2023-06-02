.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel __ct__9CFrameVu1Fv
/* 2A360 0012A260 E0FFBD27 */  addiu      $sp, $sp, -0x20
/* 2A364 0012A264 1000BF7F */  sq         $31, 0x10($sp)
/* 2A368 0012A268 0000B07F */  sq         $16, 0x0($sp)
/* 2A36C 0012A26C 28868070 */  paddub     $16, $4, $0
/* 2A370 0012A270 70A8040C */  jal        __ct__6CFrameFv
/* 2A374 0012A274 00000000 */   nop
/* 2A378 0012A278 2A00023C */  lui        $2, %hi(__vt__9CFrameVu1)
/* 2A37C 0012A27C 50114224 */  addiu      $2, $2, %lo(__vt__9CFrameVu1)
/* 2A380 0012A280 500202AE */  sw         $2, 0x250($16)
/* 2A384 0012A284 28260072 */  paddub     $4, $16, $0
/* 2A388 0012A288 8CA8040C */  jal        Initialize__9CFrameVu1Fv
/* 2A38C 0012A28C 00000000 */   nop
/* 2A390 0012A290 28160072 */  paddub     $2, $16, $0
/* 2A394 0012A294 1000BF7B */  lq         $31, 0x10($sp)
/* 2A398 0012A298 0000B07B */  lq         $16, 0x0($sp)
/* 2A39C 0012A29C 2000BD27 */  addiu      $sp, $sp, 0x20
/* 2A3A0 0012A2A0 0800E003 */  jr         $31
/* 2A3A4 0012A2A4 00000000 */   nop
/* 2A3A8 0012A2A8 00000000 */  nop
/* 2A3AC 0012A2AC 00000000 */  nop
