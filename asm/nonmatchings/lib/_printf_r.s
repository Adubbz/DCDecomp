.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel _printf_r
/* 4758 00104658 80FFBD27 */  addiu      $sp, $sp, -0x80
/* 475C 0010465C 5000A6FF */  sd         $6, 0x50($sp)
/* 4760 00104660 5800A7FF */  sd         $7, 0x58($sp)
/* 4764 00104664 2D30A000 */  daddu      $6, $5, $0
/* 4768 00104668 0000BFFF */  sd         $31, 0x0($sp)
/* 476C 0010466C 5000A727 */  addiu      $7, $sp, 0x50
/* 4770 00104670 6000A8FF */  sd         $8, 0x60($sp)
/* 4774 00104674 6800A9FF */  sd         $9, 0x68($sp)
/* 4778 00104678 7000AAFF */  sd         $10, 0x70($sp)
/* 477C 0010467C 7800ABFF */  sd         $11, 0x78($sp)
/* 4780 00104680 201F040C */  jal        _vfprintf_r
/* 4784 00104684 0800858C */   lw        $5, 0x8($4)
/* 4788 00104688 0000BFDF */  ld         $31, 0x0($sp)
/* 478C 0010468C 0800E003 */  jr         $31
/* 4790 00104690 8000BD27 */   addiu     $sp, $sp, 0x80
/* 4794 00104694 00000000 */  nop
