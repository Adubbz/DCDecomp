.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel scePrintf
/* 16588 00116488 50FFBD27 */  addiu      $sp, $sp, -0xB0
/* 1658C 0011648C 1100023C */  lui        $2, %hi(deci2Putchar)
/* 16590 00116490 0000B0FF */  sd         $16, 0x0($sp)
/* 16594 00116494 E05A4224 */  addiu      $2, $2, %lo(deci2Putchar)
/* 16598 00116498 2500103C */  lui        $16, (0x2509F4 >> 16)
/* 1659C 0011649C 1000B1FF */  sd         $17, 0x10($sp)
/* 165A0 001164A0 F409118E */  lw         $17, (0x2509F4 & 0xFFFF)($16)
/* 165A4 001164A4 7800A5FF */  sd         $5, 0x78($sp)
/* 165A8 001164A8 F40902AE */  sw         $2, (0x2509F4 & 0xFFFF)($16)
/* 165AC 001164AC 7800A527 */  addiu      $5, $sp, 0x78
/* 165B0 001164B0 2000BFFF */  sd         $31, 0x20($sp)
/* 165B4 001164B4 8000A6FF */  sd         $6, 0x80($sp)
/* 165B8 001164B8 8800A7FF */  sd         $7, 0x88($sp)
/* 165BC 001164BC 9000A8FF */  sd         $8, 0x90($sp)
/* 165C0 001164C0 9800A9FF */  sd         $9, 0x98($sp)
/* 165C4 001164C4 A000AAFF */  sd         $10, 0xA0($sp)
/* 165C8 001164C8 A257040C */  jal        _printf
/* 165CC 001164CC A800ABFF */   sd        $11, 0xA8($sp)
/* 165D0 001164D0 F40911AE */  sw         $17, (0x2509F4 & 0xFFFF)($16)
/* 165D4 001164D4 2000BFDF */  ld         $31, 0x20($sp)
/* 165D8 001164D8 1000B1DF */  ld         $17, 0x10($sp)
/* 165DC 001164DC 0000B0DF */  ld         $16, 0x0($sp)
/* 165E0 001164E0 0800E003 */  jr         $31
/* 165E4 001164E4 B000BD27 */   addiu     $sp, $sp, 0xB0
