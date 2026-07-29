.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel sceVif1PkEnd
/* 020EE0 00120DE0 D0FFBD27 */  addiu       $29, $29, -0x30
/* 020EE4 00120DE4 1000B1FF */  sd          $17, 0x10($29)
/* 020EE8 00120DE8 2D888000 */  daddu       $17, $4, $0
/* 020EEC 00120DEC 0000B0FF */  sd          $16, 0x0($29)
/* 020EF0 00120DF0 2000BFFF */  sd          $31, 0x20($29)
/* 020EF4 00120DF4 0A83040C */  jal         sceVif1PkTerminate
/* 020EF8 00120DF8 2D80A000 */   daddu      $16, $5, $0
/* 020EFC 00120DFC 0000248E */  lw          $4, 0x0($17)
/* 020F00 00120E00 0070033C */  lui         $3, (0x70000000 >> 16)
/* 020F04 00120E04 25800302 */  or          $16, $16, $3
/* 020F08 00120E08 080022AE */  sw          $2, 0x8($17)
/* 020F0C 00120E0C 000090AC */  sw          $16, 0x0($4)
/* 020F10 00120E10 04008424 */  addiu       $4, $4, 0x4
/* 020F14 00120E14 0C0020AE */  sw          $0, 0xC($17)
/* 020F18 00120E18 04008224 */  addiu       $2, $4, 0x4
/* 020F1C 00120E1C 2000BFDF */  ld          $31, 0x20($29)
/* 020F20 00120E20 000022AE */  sw          $2, 0x0($17)
/* 020F24 00120E24 1000B1DF */  ld          $17, 0x10($29)
/* 020F28 00120E28 0000B0DF */  ld          $16, 0x0($29)
/* 020F2C 00120E2C 000080AC */  sw          $0, 0x0($4)
/* 020F30 00120E30 0800E003 */  jr          $31
/* 020F34 00120E34 3000BD27 */   addiu      $29, $29, 0x30
