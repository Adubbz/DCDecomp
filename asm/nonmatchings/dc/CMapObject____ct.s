.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel __ct__10CMapObjectFv
/* 57A70 00157970 E0FFBD27 */  addiu      $sp, $sp, -0x20
/* 57A74 00157974 1000BF7F */  sq         $31, 0x10($sp)
/* 57A78 00157978 0000B07F */  sq         $16, 0x0($sp)
/* 57A7C 0015797C 28868070 */  paddub     $16, $4, $0
/* 57A80 00157980 803F023C */  lui        $2, (0x3F800000 >> 16)
/* 57A84 00157984 00608244 */  mtc1       $2, $f12
/* 57A88 00157988 045C050C */  jal        __ct__7CObjectFf
/* 57A8C 0015798C 00000000 */   nop
/* 57A90 00157990 2A00023C */  lui        $2, %hi(__vt__12CObjectFrame)
/* 57A94 00157994 30154224 */  addiu      $2, $2, %lo(__vt__12CObjectFrame)
/* 57A98 00157998 A00002AE */  sw         $2, 0xA0($16)
/* 57A9C 0015799C 28260072 */  paddub     $4, $16, $0
/* 57AA0 001579A0 282E0070 */  paddub     $5, $0, $0
/* 57AA4 001579A4 185D050C */  jal        Initialize__12CObjectFrameFP9CFrameVu1
/* 57AA8 001579A8 00000000 */   nop
/* 57AAC 001579AC 2A00023C */  lui        $2, %hi(__vt__10CMapObject)
/* 57AB0 001579B0 90144224 */  addiu      $2, $2, %lo(__vt__10CMapObject)
/* 57AB4 001579B4 A00002AE */  sw         $2, 0xA0($16)
/* 57AB8 001579B8 28260072 */  paddub     $4, $16, $0
/* 57ABC 001579BC 445E050C */  jal        Initialize__10CMapObjectFv
/* 57AC0 001579C0 00000000 */   nop
/* 57AC4 001579C4 28160072 */  paddub     $2, $16, $0
/* 57AC8 001579C8 1000BF7B */  lq         $31, 0x10($sp)
/* 57ACC 001579CC 0000B07B */  lq         $16, 0x0($sp)
/* 57AD0 001579D0 2000BD27 */  addiu      $sp, $sp, 0x20
/* 57AD4 001579D4 0800E003 */  jr         $31
/* 57AD8 001579D8 00000000 */   nop
/* 57ADC 001579DC 00000000 */  nop
