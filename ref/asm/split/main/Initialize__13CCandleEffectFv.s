.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel Initialize__13CCandleEffectFv
/* 063B30 00163A30 01000324 */  addiu       $3, $0, 0x1
/* 063B34 00163A34 000083AC */  sw          $3, 0x0($4)
/* 063B38 00163A38 040080AC */  sw          $0, 0x4($4)
/* 063B3C 00163A3C 803F033C */  lui         $3, (0x3F800000 >> 16)
/* 063B40 00163A40 240083AC */  sw          $3, 0x24($4)
/* 063B44 00163A44 200083AC */  sw          $3, 0x20($4)
/* 063B48 00163A48 080080AC */  sw          $0, 0x8($4)
/* 063B4C 00163A4C 0800E003 */  jr          $31
/* 063B50 00163A50 00000000 */   nop
/* 063B54 00163A54 00000000 */  nop
/* 063B58 00163A58 00000000 */  nop
/* 063B5C 00163A5C 00000000 */  nop
