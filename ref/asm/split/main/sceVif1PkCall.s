.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel sceVif1PkCall
/* 020E70 00120D70 C0FFBD27 */  addiu       $29, $29, -0x40
/* 020E74 00120D74 1000B1FF */  sd          $17, 0x10($29)
/* 020E78 00120D78 2D888000 */  daddu       $17, $4, $0
/* 020E7C 00120D7C 2000B2FF */  sd          $18, 0x20($29)
/* 020E80 00120D80 0000B0FF */  sd          $16, 0x0($29)
/* 020E84 00120D84 2D90A000 */  daddu       $18, $5, $0
/* 020E88 00120D88 3000BFFF */  sd          $31, 0x30($29)
/* 020E8C 00120D8C 0A83040C */  jal         sceVif1PkTerminate
/* 020E90 00120D90 2D80C000 */   daddu      $16, $6, $0
/* 020E94 00120D94 0000258E */  lw          $5, 0x0($17)
/* 020E98 00120D98 0050033C */  lui         $3, (0x50000000 >> 16)
/* 020E9C 00120D9C 25800302 */  or          $16, $16, $3
/* 020EA0 00120DA0 FF9F043C */  lui         $4, (0x9FFFFFFF >> 16)
/* 020EA4 00120DA4 0000B0AC */  sw          $16, 0x0($5)
/* 020EA8 00120DA8 FFFF8434 */  ori         $4, $4, (0x9FFFFFFF & 0xFFFF)
/* 020EAC 00120DAC 0400A524 */  addiu       $5, $5, 0x4
/* 020EB0 00120DB0 24904402 */  and         $18, $18, $4
/* 020EB4 00120DB4 0400A324 */  addiu       $3, $5, 0x4
/* 020EB8 00120DB8 080022AE */  sw          $2, 0x8($17)
/* 020EBC 00120DBC 0000B2AC */  sw          $18, 0x0($5)
/* 020EC0 00120DC0 000023AE */  sw          $3, 0x0($17)
/* 020EC4 00120DC4 0C0020AE */  sw          $0, 0xC($17)
/* 020EC8 00120DC8 3000BFDF */  ld          $31, 0x30($29)
/* 020ECC 00120DCC 2000B2DF */  ld          $18, 0x20($29)
/* 020ED0 00120DD0 1000B1DF */  ld          $17, 0x10($29)
/* 020ED4 00120DD4 0000B0DF */  ld          $16, 0x0($29)
/* 020ED8 00120DD8 0800E003 */  jr          $31
/* 020EDC 00120DDC 4000BD27 */   addiu      $29, $29, 0x40
