.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel fiprintf
/* 1C80 00101B80 80FFBD27 */  addiu      $sp, $sp, -0x80
/* 1C84 00101B84 5000A6FF */  sd         $6, 0x50($sp)
/* 1C88 00101B88 0000BFFF */  sd         $31, 0x0($sp)
/* 1C8C 00101B8C 5000A627 */  addiu      $6, $sp, 0x50
/* 1C90 00101B90 5800A7FF */  sd         $7, 0x58($sp)
/* 1C94 00101B94 6000A8FF */  sd         $8, 0x60($sp)
/* 1C98 00101B98 6800A9FF */  sd         $9, 0x68($sp)
/* 1C9C 00101B9C 7000AAFF */  sd         $10, 0x70($sp)
/* 1CA0 00101BA0 B01B040C */  jal        vfiprintf
/* 1CA4 00101BA4 7800ABFF */   sd        $11, 0x78($sp)
/* 1CA8 00101BA8 0000BFDF */  ld         $31, 0x0($sp)
/* 1CAC 00101BAC 0800E003 */  jr         $31
/* 1CB0 00101BB0 8000BD27 */   addiu     $sp, $sp, 0x80
/* 1CB4 00101BB4 00000000 */  nop
