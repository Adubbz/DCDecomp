.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel _SET_PROJECTION__FP12RS_STACKDATAi
/* 0922D0 001921D0 F0FFBD27 */  addiu       $29, $29, -0x10
/* 0922D4 001921D4 0000BF7F */  sq          $31, 0x0($29)
/* 0922D8 001921D8 E828060C */  jal         GetStackFloat__FP12RS_STACKDATA
/* 0922DC 001921DC 00000000 */   nop
/* 0922E0 001921E0 D401013C */  lui         $1, %hi(EdEventInfo + 0x3C)
/* 0922E4 001921E4 0CD220E4 */  swc1        $f0, %lo(EdEventInfo + 0x3C)($1)
/* 0922E8 001921E8 01000224 */  addiu       $2, $0, 0x1
/* 0922EC 001921EC 0000BF7B */  lq          $31, 0x0($29)
/* 0922F0 001921F0 1000BD27 */  addiu       $29, $29, 0x10
/* 0922F4 001921F4 0800E003 */  jr          $31
/* 0922F8 001921F8 00000000 */   nop
/* 0922FC 001921FC 00000000 */  nop
