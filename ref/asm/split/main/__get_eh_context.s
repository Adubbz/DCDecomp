.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel __get_eh_context
/* 00D748 0010D648 2500033C */  lui         $3, %hi(get_eh_context)
/* 00D74C 0010D64C F0FFBD27 */  addiu       $29, $29, -0x10
/* 00D750 0010D650 8403628C */  lw          $2, %lo(get_eh_context)($3)
/* 00D754 0010D654 0000BFFF */  sd          $31, 0x0($29)
/* 00D758 0010D658 09F84000 */  jalr        $2
/* 00D75C 0010D65C 00000000 */   nop
/* 00D760 0010D660 0000BFDF */  ld          $31, 0x0($29)
/* 00D764 0010D664 0800E003 */  jr          $31
/* 00D768 0010D668 1000BD27 */   addiu      $29, $29, 0x10
/* 00D76C 0010D66C 00000000 */  nop
