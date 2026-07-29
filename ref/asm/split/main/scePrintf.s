.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel scePrintf
/* 016588 00116488 50FFBD27 */  addiu       $29, $29, -0xB0
/* 01658C 0011648C 1100023C */  lui         $2, %hi(deci2Putchar)
/* 016590 00116490 0000B0FF */  sd          $16, 0x0($29)
/* 016594 00116494 E05A4224 */  addiu       $2, $2, %lo(deci2Putchar)
/* 016598 00116498 2500103C */  lui         $16, %hi(_putchar)
/* 01659C 0011649C 1000B1FF */  sd          $17, 0x10($29)
/* 0165A0 001164A0 F409118E */  lw          $17, %lo(_putchar)($16)
/* 0165A4 001164A4 7800A5FF */  sd          $5, 0x78($29)
/* 0165A8 001164A8 F40902AE */  sw          $2, %lo(_putchar)($16)
/* 0165AC 001164AC 7800A527 */  addiu       $5, $29, 0x78
/* 0165B0 001164B0 2000BFFF */  sd          $31, 0x20($29)
/* 0165B4 001164B4 8000A6FF */  sd          $6, 0x80($29)
/* 0165B8 001164B8 8800A7FF */  sd          $7, 0x88($29)
/* 0165BC 001164BC 9000A8FF */  sd          $8, 0x90($29)
/* 0165C0 001164C0 9800A9FF */  sd          $9, 0x98($29)
/* 0165C4 001164C4 A000AAFF */  sd          $10, 0xA0($29)
/* 0165C8 001164C8 A257040C */  jal         _printf
/* 0165CC 001164CC A800ABFF */   sd         $11, 0xA8($29)
/* 0165D0 001164D0 F40911AE */  sw          $17, %lo(_putchar)($16)
/* 0165D4 001164D4 2000BFDF */  ld          $31, 0x20($29)
/* 0165D8 001164D8 1000B1DF */  ld          $17, 0x10($29)
/* 0165DC 001164DC 0000B0DF */  ld          $16, 0x0($29)
/* 0165E0 001164E0 0800E003 */  jr          $31
/* 0165E4 001164E4 B000BD27 */   addiu      $29, $29, 0xB0
