.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel sceVif1PkRef
/* 20DD8 00120CD8 90FFBD27 */  addiu      $sp, $sp, -0x70
/* 20DDC 00120CDC 3000B3FF */  sd         $19, 0x30($sp)
/* 20DE0 00120CE0 2D988000 */  daddu      $19, $4, $0
/* 20DE4 00120CE4 5000B5FF */  sd         $21, 0x50($sp)
/* 20DE8 00120CE8 4000B4FF */  sd         $20, 0x40($sp)
/* 20DEC 00120CEC 2DA80001 */  daddu      $21, $8, $0
/* 20DF0 00120CF0 2000B2FF */  sd         $18, 0x20($sp)
/* 20DF4 00120CF4 2DA0E000 */  daddu      $20, $7, $0
/* 20DF8 00120CF8 1000B1FF */  sd         $17, 0x10($sp)
/* 20DFC 00120CFC 2D90A000 */  daddu      $18, $5, $0
/* 20E00 00120D00 0000B0FF */  sd         $16, 0x0($sp)
/* 20E04 00120D04 2D88C000 */  daddu      $17, $6, $0
/* 20E08 00120D08 6000BFFF */  sd         $31, 0x60($sp)
/* 20E0C 00120D0C 0A83040C */  jal        sceVif1PkTerminate
/* 20E10 00120D10 2D802001 */   daddu     $16, $9, $0
/* 20E14 00120D14 0030043C */  lui        $4, (0x30000000 >> 16)
/* 20E18 00120D18 0000628E */  lw         $2, 0x0($19)
/* 20E1C 00120D1C 25882402 */  or         $17, $17, $4
/* 20E20 00120D20 FF9F033C */  lui        $3, (0x9FFFFFFF >> 16)
/* 20E24 00120D24 25801102 */  or         $16, $16, $17
/* 20E28 00120D28 FFFF6334 */  ori        $3, $3, (0x9FFFFFFF & 0xFFFF)
/* 20E2C 00120D2C 000050AC */  sw         $16, 0x0($2)
/* 20E30 00120D30 24904302 */  and        $18, $18, $3
/* 20E34 00120D34 04004224 */  addiu      $2, $2, 0x4
/* 20E38 00120D38 6000BFDF */  ld         $31, 0x60($sp)
/* 20E3C 00120D3C 0C004324 */  addiu      $3, $2, 0xC
/* 20E40 00120D40 000052AC */  sw         $18, 0x0($2)
/* 20E44 00120D44 000063AE */  sw         $3, 0x0($19)
/* 20E48 00120D48 040054AC */  sw         $20, 0x4($2)
/* 20E4C 00120D4C 080055AC */  sw         $21, 0x8($2)
/* 20E50 00120D50 5000B5DF */  ld         $21, 0x50($sp)
/* 20E54 00120D54 4000B4DF */  ld         $20, 0x40($sp)
/* 20E58 00120D58 3000B3DF */  ld         $19, 0x30($sp)
/* 20E5C 00120D5C 2000B2DF */  ld         $18, 0x20($sp)
/* 20E60 00120D60 1000B1DF */  ld         $17, 0x10($sp)
/* 20E64 00120D64 0000B0DF */  ld         $16, 0x0($sp)
/* 20E68 00120D68 0800E003 */  jr         $31
/* 20E6C 00120D6C 7000BD27 */   addiu     $sp, $sp, 0x70
