.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel NextAnimeSeq__10CActionSeqFv
/* 054EE0 00154DE0 E0FFBD27 */  addiu       $29, $29, -0x20
/* 054EE4 00154DE4 1000BF7F */  sq          $31, 0x10($29)
/* 054EE8 00154DE8 0000B07F */  sq          $16, 0x0($29)
/* 054EEC 00154DEC 28868070 */  paddub      $16, $4, $0
/* 054EF0 00154DF0 0853050C */  jal         GetNextSeq__10CActionSeqFv
/* 054EF4 00154DF4 00000000 */   nop
/* 054EF8 00154DF8 04004014 */  bnez        $2, .L00154E0C
/* 054EFC 00154DFC 00000000 */   nop
/* 054F00 00154E00 28160070 */  paddub      $2, $0, $0
/* 054F04 00154E04 0B000010 */  b           .L00154E34
/* 054F08 00154E08 00000000 */   nop
.L00154E0C:
/* 054F0C 00154E0C C000038E */  lw          $3, 0xC0($16)
/* 054F10 00154E10 02006010 */  beqz        $3, .L00154E1C
/* 054F14 00154E14 00000000 */   nop
/* 054F18 00154E18 0C0062AC */  sw          $2, 0xC($3)
.L00154E1C:
/* 054F1C 00154E1C C00002AE */  sw          $2, 0xC0($16)
/* 054F20 00154E20 0C0040AC */  sw          $0, 0xC($2)
/* 054F24 00154E24 BC00038E */  lw          $3, 0xBC($16)
/* 054F28 00154E28 02006014 */  bnez        $3, .L00154E34
/* 054F2C 00154E2C 00000000 */   nop
/* 054F30 00154E30 BC0002AE */  sw          $2, 0xBC($16)
.L00154E34:
/* 054F34 00154E34 1000BF7B */  lq          $31, 0x10($29)
/* 054F38 00154E38 0000B07B */  lq          $16, 0x0($29)
/* 054F3C 00154E3C 2000BD27 */  addiu       $29, $29, 0x20
/* 054F40 00154E40 0800E003 */  jr          $31
/* 054F44 00154E44 00000000 */   nop
/* 054F48 00154E48 00000000 */  nop
/* 054F4C 00154E4C 00000000 */  nop
