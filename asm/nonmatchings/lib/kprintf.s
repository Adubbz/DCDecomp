.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel kprintf
/* 16550 00116450 70FFBD27 */  addiu      $sp, $sp, -0x90
/* 16554 00116454 5800A5FF */  sd         $5, 0x58($sp)
/* 16558 00116458 0000BFFF */  sd         $31, 0x0($sp)
/* 1655C 0011645C 5800A527 */  addiu      $5, $sp, 0x58
/* 16560 00116460 6000A6FF */  sd         $6, 0x60($sp)
/* 16564 00116464 6800A7FF */  sd         $7, 0x68($sp)
/* 16568 00116468 7000A8FF */  sd         $8, 0x70($sp)
/* 1656C 0011646C 7800A9FF */  sd         $9, 0x78($sp)
/* 16570 00116470 8000AAFF */  sd         $10, 0x80($sp)
/* 16574 00116474 A257040C */  jal        _printf
/* 16578 00116478 8800ABFF */   sd        $11, 0x88($sp)
/* 1657C 0011647C 0000BFDF */  ld         $31, 0x0($sp)
/* 16580 00116480 0800E003 */  jr         $31
/* 16584 00116484 9000BD27 */   addiu     $sp, $sp, 0x90
