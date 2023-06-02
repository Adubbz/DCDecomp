.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel sceVif1PkOpenDirectCode
/* 20F38 00120E38 D0FFBD27 */  addiu      $sp, $sp, -0x30
/* 20F3C 00120E3C 03000624 */  addiu      $6, $0, 0x3
/* 20F40 00120E40 1000B1FF */  sd         $17, 0x10($sp)
/* 20F44 00120E44 0000B0FF */  sd         $16, 0x0($sp)
/* 20F48 00120E48 2D88A000 */  daddu      $17, $5, $0
/* 20F4C 00120E4C 2D808000 */  daddu      $16, $4, $0
/* 20F50 00120E50 2000BFFF */  sd         $31, 0x20($sp)
/* 20F54 00120E54 E483040C */  jal        sceVif1PkAlign
/* 20F58 00120E58 02000524 */   addiu     $5, $0, 0x2
/* 20F5C 00120E5C 0000058E */  lw         $5, 0x0($16)
/* 20F60 00120E60 00D0023C */  lui        $2, (0xD0000000 >> 16)
/* 20F64 00120E64 0050043C */  lui        $4, (0x50000000 >> 16)
/* 20F68 00120E68 2000BFDF */  ld         $31, 0x20($sp)
/* 20F6C 00120E6C 0400A324 */  addiu      $3, $5, 0x4
/* 20F70 00120E70 0B205100 */  movn       $4, $2, $17
/* 20F74 00120E74 000003AE */  sw         $3, 0x0($16)
/* 20F78 00120E78 0C0005AE */  sw         $5, 0xC($16)
/* 20F7C 00120E7C 1000B1DF */  ld         $17, 0x10($sp)
/* 20F80 00120E80 0000B0DF */  ld         $16, 0x0($sp)
/* 20F84 00120E84 0000A4AC */  sw         $4, 0x0($5)
/* 20F88 00120E88 0800E003 */  jr         $31
/* 20F8C 00120E8C 3000BD27 */   addiu     $sp, $sp, 0x30
