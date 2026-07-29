.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel fprintf
/* 001CB8 00101BB8 80FFBD27 */  addiu       $29, $29, -0x80
/* 001CBC 00101BBC 5000A6FF */  sd          $6, 0x50($29)
/* 001CC0 00101BC0 0000BFFF */  sd          $31, 0x0($29)
/* 001CC4 00101BC4 5000A627 */  addiu       $6, $29, 0x50
/* 001CC8 00101BC8 5800A7FF */  sd          $7, 0x58($29)
/* 001CCC 00101BCC 6000A8FF */  sd          $8, 0x60($29)
/* 001CD0 00101BD0 6800A9FF */  sd          $9, 0x68($29)
/* 001CD4 00101BD4 7000AAFF */  sd          $10, 0x70($29)
/* 001CD8 00101BD8 021F040C */  jal         vfprintf
/* 001CDC 00101BDC 7800ABFF */   sd         $11, 0x78($29)
/* 001CE0 00101BE0 0000BFDF */  ld          $31, 0x0($29)
/* 001CE4 00101BE4 0800E003 */  jr          $31
/* 001CE8 00101BE8 8000BD27 */   addiu      $29, $29, 0x80
/* 001CEC 00101BEC 00000000 */  nop
