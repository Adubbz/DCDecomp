.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel _EXIT_CODE__FP12RS_STACKDATAi
/* 08BEA0 0018BDA0 F0FFBD27 */  addiu       $29, $29, -0x10
/* 08BEA4 0018BDA4 0000BF7F */  sq          $31, 0x0($29)
/* 08BEA8 0018BDA8 D428060C */  jal         GetStackInt__FP12RS_STACKDATA
/* 08BEAC 0018BDAC 00000000 */   nop
/* 08BEB0 0018BDB0 D401013C */  lui         $1, %hi(EdEventInfo + 0x44C)
/* 08BEB4 0018BDB4 1CD622AC */  sw          $2, %lo(EdEventInfo + 0x44C)($1)
/* 08BEB8 0018BDB8 01000224 */  addiu       $2, $0, 0x1
/* 08BEBC 0018BDBC 0000BF7B */  lq          $31, 0x0($29)
/* 08BEC0 0018BDC0 1000BD27 */  addiu       $29, $29, 0x10
/* 08BEC4 0018BDC4 0800E003 */  jr          $31
/* 08BEC8 0018BDC8 00000000 */   nop
/* 08BECC 0018BDCC 00000000 */  nop
