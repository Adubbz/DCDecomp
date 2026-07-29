.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel sceVif1PkCnt
/* 020D80 00120C80 D0FFBD27 */  addiu       $29, $29, -0x30
/* 020D84 00120C84 1000B1FF */  sd          $17, 0x10($29)
/* 020D88 00120C88 2D888000 */  daddu       $17, $4, $0
/* 020D8C 00120C8C 0000B0FF */  sd          $16, 0x0($29)
/* 020D90 00120C90 2000BFFF */  sd          $31, 0x20($29)
/* 020D94 00120C94 0A83040C */  jal         sceVif1PkTerminate
/* 020D98 00120C98 2D80A000 */   daddu      $16, $5, $0
/* 020D9C 00120C9C 0000248E */  lw          $4, 0x0($17)
/* 020DA0 00120CA0 0010033C */  lui         $3, (0x10000000 >> 16)
/* 020DA4 00120CA4 25800302 */  or          $16, $16, $3
/* 020DA8 00120CA8 080022AE */  sw          $2, 0x8($17)
/* 020DAC 00120CAC 000090AC */  sw          $16, 0x0($4)
/* 020DB0 00120CB0 04008424 */  addiu       $4, $4, 0x4
/* 020DB4 00120CB4 0C0020AE */  sw          $0, 0xC($17)
/* 020DB8 00120CB8 04008224 */  addiu       $2, $4, 0x4
/* 020DBC 00120CBC 2000BFDF */  ld          $31, 0x20($29)
/* 020DC0 00120CC0 000022AE */  sw          $2, 0x0($17)
/* 020DC4 00120CC4 1000B1DF */  ld          $17, 0x10($29)
/* 020DC8 00120CC8 0000B0DF */  ld          $16, 0x0($29)
/* 020DCC 00120CCC 000080AC */  sw          $0, 0x0($4)
/* 020DD0 00120CD0 0800E003 */  jr          $31
/* 020DD4 00120CD4 3000BD27 */   addiu      $29, $29, 0x30
