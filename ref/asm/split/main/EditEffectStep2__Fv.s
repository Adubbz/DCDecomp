.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel EditEffectStep2__Fv
/* 066EE0 00166DE0 F0FFBD27 */  addiu       $29, $29, -0x10
/* 066EE4 00166DE4 0000BF7F */  sq          $31, 0x0($29)
/* 066EE8 00166DE8 D201023C */  lui         $2, %hi(Fire)
/* 066EEC 00166DEC F08E4424 */  addiu       $4, $2, %lo(Fire)
/* 066EF0 00166DF0 F085050C */  jal         FireCreate__9CFireOmniFv
/* 066EF4 00166DF4 00000000 */   nop
/* 066EF8 00166DF8 0000BF7B */  lq          $31, 0x0($29)
/* 066EFC 00166DFC 1000BD27 */  addiu       $29, $29, 0x10
/* 066F00 00166E00 0800E003 */  jr          $31
/* 066F04 00166E04 00000000 */   nop
/* 066F08 00166E08 00000000 */  nop
/* 066F0C 00166E0C 00000000 */  nop
