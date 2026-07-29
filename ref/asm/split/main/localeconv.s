.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel localeconv
/* 002718 00102618 2500023C */  lui         $2, %hi(_impure_ptr)
/* 00271C 0010261C F0FFBD27 */  addiu       $29, $29, -0x10
/* 002720 00102620 ECFD448C */  lw          $4, %lo(_impure_ptr)($2)
/* 002724 00102624 0000BFFF */  sd          $31, 0x0($29)
/* 002728 00102628 7609040C */  jal         _localeconv_r
/* 00272C 0010262C 00000000 */   nop
/* 002730 00102630 0000BFDF */  ld          $31, 0x0($29)
/* 002734 00102634 0800E003 */  jr          $31
/* 002738 00102638 1000BD27 */   addiu      $29, $29, 0x10
/* 00273C 0010263C 00000000 */  nop
