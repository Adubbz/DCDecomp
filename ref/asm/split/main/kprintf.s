.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel kprintf
/* 016550 00116450 70FFBD27 */  addiu       $29, $29, -0x90
/* 016554 00116454 5800A5FF */  sd          $5, 0x58($29)
/* 016558 00116458 0000BFFF */  sd          $31, 0x0($29)
/* 01655C 0011645C 5800A527 */  addiu       $5, $29, 0x58
/* 016560 00116460 6000A6FF */  sd          $6, 0x60($29)
/* 016564 00116464 6800A7FF */  sd          $7, 0x68($29)
/* 016568 00116468 7000A8FF */  sd          $8, 0x70($29)
/* 01656C 0011646C 7800A9FF */  sd          $9, 0x78($29)
/* 016570 00116470 8000AAFF */  sd          $10, 0x80($29)
/* 016574 00116474 A257040C */  jal         _printf
/* 016578 00116478 8800ABFF */   sd         $11, 0x88($29)
/* 01657C 0011647C 0000BFDF */  ld          $31, 0x0($29)
/* 016580 00116480 0800E003 */  jr          $31
/* 016584 00116484 9000BD27 */   addiu      $29, $29, 0x90
