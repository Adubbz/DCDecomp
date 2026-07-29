.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel MyTextureMake_InitAll__6ClsMesFv
/* 04E230 0014E130 F0FFBD27 */  addiu       $29, $29, -0x10
/* 04E234 0014E134 0000BF7F */  sq          $31, 0x0($29)
/* 04E238 0014E138 B017848C */  lw          $4, 0x17B0($4)
/* 04E23C 0014E13C 05008010 */  beqz        $4, .L0014E154
/* 04E240 0014E140 00000000 */   nop
/* 04E244 0014E144 282E0070 */  paddub      $5, $0, $0
/* 04E248 0014E148 00010624 */  addiu       $6, $0, 0x100
/* 04E24C 0014E14C 5A0D040C */  jal         memset
/* 04E250 0014E150 00000000 */   nop
.L0014E154:
/* 04E254 0014E154 0000BF7B */  lq          $31, 0x0($29)
/* 04E258 0014E158 1000BD27 */  addiu       $29, $29, 0x10
/* 04E25C 0014E15C 0800E003 */  jr          $31
/* 04E260 0014E160 00000000 */   nop
/* 04E264 0014E164 00000000 */  nop
/* 04E268 0014E168 00000000 */  nop
/* 04E26C 0014E16C 00000000 */  nop
