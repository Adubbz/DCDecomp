.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel sceVu0LightColorMatrix
/* 21E28 00121D28 B0FFBD27 */  addiu      $sp, $sp, -0x50
/* 21E2C 00121D2C 0000B0FF */  sd         $16, 0x0($sp)
/* 21E30 00121D30 2D808000 */  daddu      $16, $4, $0
/* 21E34 00121D34 3000B3FF */  sd         $19, 0x30($sp)
/* 21E38 00121D38 2000B2FF */  sd         $18, 0x20($sp)
/* 21E3C 00121D3C 2D980001 */  daddu      $19, $8, $0
/* 21E40 00121D40 1000B1FF */  sd         $17, 0x10($sp)
/* 21E44 00121D44 2D90E000 */  daddu      $18, $7, $0
/* 21E48 00121D48 4000BFFF */  sd         $31, 0x40($sp)
/* 21E4C 00121D4C 0C86040C */  jal        sceVu0CopyVector
/* 21E50 00121D50 2D88C000 */   daddu     $17, $6, $0
/* 21E54 00121D54 2D282002 */  daddu      $5, $17, $0
/* 21E58 00121D58 0C86040C */  jal        sceVu0CopyVector
/* 21E5C 00121D5C 10000426 */   addiu     $4, $16, 0x10
/* 21E60 00121D60 2D284002 */  daddu      $5, $18, $0
/* 21E64 00121D64 0C86040C */  jal        sceVu0CopyVector
/* 21E68 00121D68 20000426 */   addiu     $4, $16, 0x20
/* 21E6C 00121D6C 30000426 */  addiu      $4, $16, 0x30
/* 21E70 00121D70 2D286002 */  daddu      $5, $19, $0
/* 21E74 00121D74 4000BFDF */  ld         $31, 0x40($sp)
/* 21E78 00121D78 3000B3DF */  ld         $19, 0x30($sp)
/* 21E7C 00121D7C 2000B2DF */  ld         $18, 0x20($sp)
/* 21E80 00121D80 1000B1DF */  ld         $17, 0x10($sp)
/* 21E84 00121D84 0000B0DF */  ld         $16, 0x0($sp)
/* 21E88 00121D88 0C860408 */  j          sceVu0CopyVector
/* 21E8C 00121D8C 5000BD27 */   addiu     $sp, $sp, 0x50
