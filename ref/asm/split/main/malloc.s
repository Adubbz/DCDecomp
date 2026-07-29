.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel malloc
/* 0028F0 001027F0 2D288000 */  daddu       $5, $4, $0
/* 0028F4 001027F4 2500023C */  lui         $2, %hi(_impure_ptr)
/* 0028F8 001027F8 F0FFBD27 */  addiu       $29, $29, -0x10
/* 0028FC 001027FC ECFD448C */  lw          $4, %lo(_impure_ptr)($2)
/* 002900 00102800 0000BFFF */  sd          $31, 0x0($29)
/* 002904 00102804 A00A040C */  jal         _malloc_r
/* 002908 00102808 00000000 */   nop
/* 00290C 0010280C 0000BFDF */  ld          $31, 0x0($29)
/* 002910 00102810 0800E003 */  jr          $31
/* 002914 00102814 1000BD27 */   addiu      $29, $29, 0x10
