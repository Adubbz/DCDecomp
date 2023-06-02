.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel Initialize__13CCandleEffectFv
/* 63B30 00163A30 01000324 */  addiu      $3, $0, 0x1
/* 63B34 00163A34 000083AC */  sw         $3, 0x0($4)
/* 63B38 00163A38 040080AC */  sw         $0, 0x4($4)
/* 63B3C 00163A3C 803F033C */  lui        $3, (0x3F800000 >> 16)
/* 63B40 00163A40 240083AC */  sw         $3, 0x24($4)
/* 63B44 00163A44 200083AC */  sw         $3, 0x20($4)
/* 63B48 00163A48 080080AC */  sw         $0, 0x8($4)
/* 63B4C 00163A4C 0800E003 */  jr         $31
/* 63B50 00163A50 00000000 */   nop
/* 63B54 00163A54 00000000 */  nop
/* 63B58 00163A58 00000000 */  nop
/* 63B5C 00163A5C 00000000 */  nop
