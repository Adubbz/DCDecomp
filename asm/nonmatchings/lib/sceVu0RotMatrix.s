.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel sceVu0RotMatrix
/* 21C40 00121B40 D0FFBD27 */  addiu      $sp, $sp, -0x30
/* 21C44 00121B44 1000B1FF */  sd         $17, 0x10($sp)
/* 21C48 00121B48 0000B0FF */  sd         $16, 0x0($sp)
/* 21C4C 00121B4C 2D88C000 */  daddu      $17, $6, $0
/* 21C50 00121B50 2000BFFF */  sd         $31, 0x20($sp)
/* 21C54 00121B54 2D808000 */  daddu      $16, $4, $0
/* 21C58 00121B58 5286040C */  jal        sceVu0RotMatrixZ
/* 21C5C 00121B5C 08002CC6 */   lwc1      $f12, 0x8($17)
/* 21C60 00121B60 04002CC6 */  lwc1       $f12, 0x4($17)
/* 21C64 00121B64 2D200002 */  daddu      $4, $16, $0
/* 21C68 00121B68 A686040C */  jal        sceVu0RotMatrixY
/* 21C6C 00121B6C 2D280002 */   daddu     $5, $16, $0
/* 21C70 00121B70 2D200002 */  daddu      $4, $16, $0
/* 21C74 00121B74 00002CC6 */  lwc1       $f12, 0x0($17)
/* 21C78 00121B78 2000BFDF */  ld         $31, 0x20($sp)
/* 21C7C 00121B7C 2D288000 */  daddu      $5, $4, $0
/* 21C80 00121B80 1000B1DF */  ld         $17, 0x10($sp)
/* 21C84 00121B84 0000B0DF */  ld         $16, 0x0($sp)
/* 21C88 00121B88 7C860408 */  j          sceVu0RotMatrixX
/* 21C8C 00121B8C 3000BD27 */   addiu     $sp, $sp, 0x30
