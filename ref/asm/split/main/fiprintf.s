.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel fiprintf
/* 001C80 00101B80 80FFBD27 */  addiu       $29, $29, -0x80
/* 001C84 00101B84 5000A6FF */  sd          $6, 0x50($29)
/* 001C88 00101B88 0000BFFF */  sd          $31, 0x0($29)
/* 001C8C 00101B8C 5000A627 */  addiu       $6, $29, 0x50
/* 001C90 00101B90 5800A7FF */  sd          $7, 0x58($29)
/* 001C94 00101B94 6000A8FF */  sd          $8, 0x60($29)
/* 001C98 00101B98 6800A9FF */  sd          $9, 0x68($29)
/* 001C9C 00101B9C 7000AAFF */  sd          $10, 0x70($29)
/* 001CA0 00101BA0 B01B040C */  jal         vfiprintf
/* 001CA4 00101BA4 7800ABFF */   sd         $11, 0x78($29)
/* 001CA8 00101BA8 0000BFDF */  ld          $31, 0x0($29)
/* 001CAC 00101BAC 0800E003 */  jr          $31
/* 001CB0 00101BB0 8000BD27 */   addiu      $29, $29, 0x80
/* 001CB4 00101BB4 00000000 */  nop
