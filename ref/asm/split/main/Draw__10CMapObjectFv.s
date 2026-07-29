.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel Draw__10CMapObjectFv
/* 0577C0 001576C0 F0FFBD27 */  addiu       $29, $29, -0x10
/* 0577C4 001576C4 0000BF7F */  sq          $31, 0x0($29)
/* 0577C8 001576C8 C400838C */  lw          $3, 0xC4($4)
/* 0577CC 001576CC 06006010 */  beqz        $3, .L001576E8
/* 0577D0 001576D0 00000000 */   nop
/* 0577D4 001576D4 E800838C */  lw          $3, 0xE8($4)
/* 0577D8 001576D8 03006004 */  bltz        $3, .L001576E8
/* 0577DC 001576DC 00000000 */   nop
/* 0577E0 001576E0 645C050C */  jal         Draw__12CObjectFrameFv
/* 0577E4 001576E4 00000000 */   nop
.L001576E8:
/* 0577E8 001576E8 0000BF7B */  lq          $31, 0x0($29)
/* 0577EC 001576EC 1000BD27 */  addiu       $29, $29, 0x10
/* 0577F0 001576F0 0800E003 */  jr          $31
/* 0577F4 001576F4 00000000 */   nop
/* 0577F8 001576F8 00000000 */  nop
/* 0577FC 001576FC 00000000 */  nop
