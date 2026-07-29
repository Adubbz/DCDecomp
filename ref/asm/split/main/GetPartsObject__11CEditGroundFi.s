.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel GetPartsObject__11CEditGroundFi
/* 0A1980 001A1880 30008224 */  addiu       $2, $4, 0x30
/* 0A1984 001A1884 28260070 */  paddub      $4, $0, $0
/* 0A1988 001A1888 0B000010 */  b           .L001A18B8
/* 0A198C 001A188C 00000000 */   nop
.L001A1890:
/* 0A1990 001A1890 E800438C */  lw          $3, 0xE8($2)
/* 0A1994 001A1894 06006004 */  bltz        $3, .L001A18B0
/* 0A1998 001A1898 00000000 */   nop
/* 0A199C 001A189C F000438C */  lw          $3, 0xF0($2)
/* 0A19A0 001A18A0 03006514 */  bne         $3, $5, .L001A18B0
/* 0A19A4 001A18A4 00000000 */   nop
/* 0A19A8 001A18A8 07000010 */  b           .L001A18C8
/* 0A19AC 001A18AC 00000000 */   nop
.L001A18B0:
/* 0A19B0 001A18B0 01008424 */  addiu       $4, $4, 0x1
/* 0A19B4 001A18B4 A0024224 */  addiu       $2, $2, 0x2A0
.L001A18B8:
/* 0A19B8 001A18B8 80008328 */  slti        $3, $4, 0x80
/* 0A19BC 001A18BC F4FF6014 */  bnez        $3, .L001A1890
/* 0A19C0 001A18C0 00000000 */   nop
/* 0A19C4 001A18C4 28160070 */  paddub      $2, $0, $0
.L001A18C8:
/* 0A19C8 001A18C8 0800E003 */  jr          $31
/* 0A19CC 001A18CC 00000000 */   nop
