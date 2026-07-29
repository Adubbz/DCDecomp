.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel MGSetProjection__Ff
/* 02DA60 0012D960 F0FFBD27 */  addiu       $29, $29, -0x10
/* 02DA64 0012D964 0000BF7F */  sq          $31, 0x0($29)
/* 02DA68 0012D968 C701013C */  lui         $1, %hi(mgRenderInfo + 0x1C8)
/* 02DA6C 0012D96C E8562DC4 */  lwc1        $f13, %lo(mgRenderInfo + 0x1C8)($1)
/* 02DA70 0012D970 C701013C */  lui         $1, %hi(mgRenderInfo + 0x1D8)
/* 02DA74 0012D974 F8562EC4 */  lwc1        $f14, %lo(mgRenderInfo + 0x1D8)($1)
/* 02DA78 0012D978 B8B5040C */  jal         MGSetRenderInfo__Ffff
/* 02DA7C 0012D97C 00000000 */   nop
/* 02DA80 0012D980 0000BF7B */  lq          $31, 0x0($29)
/* 02DA84 0012D984 1000BD27 */  addiu       $29, $29, 0x10
/* 02DA88 0012D988 0800E003 */  jr          $31
/* 02DA8C 0012D98C 00000000 */   nop
