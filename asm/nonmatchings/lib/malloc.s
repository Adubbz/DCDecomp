.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel malloc
/* 28F0 001027F0 2D288000 */  daddu      $5, $4, $0
/* 28F4 001027F4 2500023C */  lui        $2, (0x250000 >> 16)
/* 28F8 001027F8 F0FFBD27 */  addiu      $sp, $sp, -0x10
/* 28FC 001027FC ECFD448C */  lw         $4, -0x214($2)
/* 2900 00102800 0000BFFF */  sd         $31, 0x0($sp)
/* 2904 00102804 A00A040C */  jal        _malloc_r
/* 2908 00102808 00000000 */   nop
/* 290C 0010280C 0000BFDF */  ld         $31, 0x0($sp)
/* 2910 00102810 0800E003 */  jr         $31
/* 2914 00102814 1000BD27 */   addiu     $sp, $sp, 0x10
